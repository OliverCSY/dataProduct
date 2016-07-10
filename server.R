library(shiny)
library(caret)
library(gbm)
library(ElemStatLearn)
data(ozone)
ozonePre <- function(temp,radi,wind) {
    data1 <- as.data.frame(list(radiation=radi,
                                temperature=temp,wind=wind))
    gbmPre <- predict(model1, newdata = data1)
    return(gbmPre)
}
model1 <- train(ozone ~ ., data = ozone, method = 'gbm',
                verbose = FALSE)

shinyServer(
    function(input, output) {
        output$otemp <- renderPrint({input$temp})
        output$oradi <- renderPrint({input$radi})
        output$owind <- renderPrint({input$wind})
        output$prediction <- renderPrint({ozonePre(input$temp,
                            input$radi,input$wind)})
    }
)