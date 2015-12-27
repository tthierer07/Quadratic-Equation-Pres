library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Quadratic Equation"),
        sidebarPanel(
                h3('Input'),
                p('Enter coefficients in the form ax^2 + bx +c to find solution for x'),
                numericInput("a", "a", 0, width = '200px'),
                numericInput("b", "b", 0, width = '200px'),
                numericInput("c", "c", 0, width = '200px'),
                submitButton('Calculate')
        ),
        mainPanel(
                plotOutput('newPlot'),
                h2('You entered'),
                textOutput("oa"),
                h2('Which has solutions of'),
                textOutput("sol")
        )
))