library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Body Mass Index (BMI) Calculator"),
  
  sidebarPanel(
    helpText("Lets calculate your BMI: "),
    radioButtons("unitSystem","Please select a system of measurements",
                 c("Metric" = "metric","Imperical" = "imperical")),
    uiOutput("ui1"),
    uiOutput("ui2"),
    uiOutput("ui3")
  ),
  
  mainPanel(
    h3('Notes:'),
    p('1. The BMI formula is taken from Wikipedia: http://en.wikipedia.org/wiki/Body_mass_index'),
    p('2. The category levels are taken from https://www.nhlbi.nih.gov/guidelines/obesity/bmi_tbl.pdf'),
    h3(' '),
    uiOutput("bmiCalc")
  )    
))