#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  headerPanel("Central Limit Theorem Demonstration"),
  sidebarPanel(
    h2("Enter the parameters"),
    sliderInput('iN', 'Sample size',value = 40, min = 1, max = 100, step = 1),
    sliderInput('inosim', 'Number of samples',value = 1000, min = 2, max = 1000, step = 10)
  ),
  mainPanel(
    plotOutput('CLThist'),
    p("This application is a simple demostration of the central limit theorem on unifom distributed random data ranging from 1 to 100."),
    p("The user can change the number of simulations and the sample size of the sampling distribution.")
  )
))