#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
        pageWithSidebar(
                headerPanel("Body Mass Index Calculator"),
                sidebarPanel(
                        
                        helpText( a("Instructions", href="https://juanpaboxu.shinyapps.io/bmi-index/", target="_blank")),
                        
                        textInput(inputId="nickname", label = "Nickname", value="your nickname"),
                        selectInput(inputId = "gender",
                                    label = "Sex",
                                    choices = c("F", "M"),
                                    selected = "F"),
                        numericInput('weight', 'Your Weight (pounds)', 150, min = 0, max = 1000, step = 1),
                        numericInput('height', 'Your estimate parents height (inches)', 66, min = 12, max = 108, step = 1),
                        submitButton('Calculate')
                        
                        
                ),
          
                mainPanel(
                        h3('Results'),
                        h4('Your Name and Gender is...'),
                        verbatimTextOutput("name"),
                        verbatimTextOutput("sex"),
                        h4('Your estimate Height is...'),
                        verbatimTextOutput("yourheight"),
                        h4('Your BMI based on your estimate parents height is...'),
                        verbatimTextOutput("bmi"),
                        verbatimTextOutput("label"),
                        helpText( a("Click here for more info about BMI", href="http://apps.who.int/bmi/index.jsp?introPage=intro_3.html", target="_blank"))
                        
                        
                )
        )
)
