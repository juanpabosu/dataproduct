#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
data("galton")

estHeight<-function(parent_height) {
        fit<-lm(child ~ parent, data=galton)
        pHeight<-data.frame(parent=c(parent_height))
        return(floor(as.numeric(predict(fit, pHeight))))
}

calculateBMI <- function(weight, height) {
        
        return((weight / (height * height)) * 703)
}

bmiToLabel <- function(bmi) {
        # Underweight = <18.5
        # Normal weight = 18.5-24.9 
        # Overweight = 25-29.9 
        # Obesity = BMI of 30 or greater
        if(bmi < 18.5) {
                return("Underweight")
        }
        else if(bmi < 25) {
                return("Normal weight")
        }
        else if(bmi < 30) {
                return("Overweight")
        }
        else {
                return("Obese")
        }
}

genderLabel <- function(gender) {

        if(gender=="M") {
                return("Male")
        }
        else {
                return("Female")
        }
}

shinyServer(
        function(input, output) {
                output$name <- renderPrint({input$nickname})
                output$sex <- renderPrint({genderLabel(input$gender)})
                output$yourheight<-renderPrint(estHeight(input$height))
                output$bmi <- renderPrint({calculateBMI(input$weight, estHeight(input$height))})
                output$label <- renderPrint({bmiToLabel(calculateBMI(input$weight, estHeight(input$height)))})
                
        }
)