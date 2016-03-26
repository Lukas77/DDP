#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$CLThist <- renderPlot({
    
    nosim <- input$inosim #Number of samples
    
    n <- input$iN #Sample size
    smin = 1 #Minimum value
    smax = 100 #Maximum value
    
    mns <- apply(matrix(runif(nosim * n, smin, smax), nosim), 1, mean)

    #Plot histogram
    hist(mns, prob=TRUE, col="lightblue", main = "Sampling distribution", xlab = "Value", xlim = c(smin, smax), ylim = c(0, 0.15))
    
    #Plot the normal curve
    mdvar <- var(mns)
    mdmu <- mean(mns)
    lines(seq(mdmu-3*sqrt(mdvar), mdmu+3*sqrt(mdvar), 0.1),
          dnorm(seq(mdmu-3*sqrt(mdvar),mdmu+3*sqrt(mdvar), 0.1), mean = mdmu, sd = sqrt(mdvar)), col="blue", lwd=2)
    
    #Anotate
    text(75, 0.15, paste("N = ", n))
    text(75, 0.14, paste("Samples = ", nosim))    
  })
  
})
