library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Ozone Prediction"),
    sidebarPanel(
        numericInput('temp','Please input temperature (degree F)', 70,
                     min = 50, max = 100, step = 1),
        numericInput('radi','Please input solar radiation (langley)', 200,
                     min = 0, max = 350, step = 1),
        numericInput('wind','Please input the wind (mph)', 10,
                     min = 0, max = 25, step = 0.1),
        submitButton('submit'),
        h5('This application makes use of dataset ozone from ElemStatLearn package, 
           which contains Ozone data from New York. The algorithm of 
           stochastic gradient boosting is implemented to form our prediction model.'),
        h5('Please type in temperature (degree F), solar radiation (langley) and wind speed (mph). 
        The predicted daily Ozone concontration (ppb) is illustrated.')
    ),
    mainPanel(
        h2('Prediction result'),
        h4('Temperature you entered:'),
        verbatimTextOutput('otemp'),
        h4('Radiation you entered:'),
        verbatimTextOutput('oradi'),
        h4('Wind you entered:'),
        verbatimTextOutput('owind'),
        h4('Prediction of Ozone concentration (ppb):'),
        verbatimTextOutput('prediction')
    )
))