library(shiny)

Calculate_BMI <- function(height, remainder, weight, unitSystem){
  unitSystem <- tolower(unitSystem)
  
  if (unitSystem == "imperical"){
    height <- (height * 12 ) + remainder
    bmi <- (weight / (height ^ 2)) * 703
  } 
  
  else if (unitSystem == "metric") {
    height <- height + (remainder / 100)
    bmi <- weight / (height ^ 2)
  }
  
  bmi <- round(bmi,1)
}

Category <- function(bmi){
  if (bmi <= 18.9){category = "Underweight"}
  
  else if (bmi > 18.9 & bmi <= 24.9){category = "Normal"}
  
  else if (bmi > 24.9 & bmi <= 29.9){category = "Overweight"}
  
  else if (bmi > 29.9 & bmi <= 39.9){category = "Obese"}
  
  else if (bmi > 39.9){category = "Extremely Obesed"}
  
  category
}

shinyServer(
  
  function(input,output){
    
    output$bmiCalc <- renderUI({
      height <- input$height
      remainder <- input$remainder
      weight <- input$weight
      unitSys <- input$unitSystem
      
      bmi <- Calculate_BMI(height,remainder,weight,unitSys)
      category <- Category(bmi)
      
      h4(paste("Your height is:", height, "-" ,remainder, "and your weight is: ", weight, ". Your BMI is: ", bmi, " ", "and your bmi category is: ", category)) 
      
  })
    
    
    output$ui1 <- renderUI({
      
      switch(input$unitSystem,
             "metric" = numericInput("height", "Meters (m)",value = 1, step=1),
             "imperical" = numericInput("height", "Feet (ft)",value = 1,step=1)
      )
    }) 
    
    output$ui2 <- renderUI({
      
      switch(input$unitSystem,
             "metric" = numericInput("remainder", "Centimeters (cm)",value = 1),
             "imperical" = numericInput("remainder", "Inches (in)",value = 1)
      )
    }) 
    
    
    output$ui3 <- renderUI({
      
      switch(input$unitSystem,
             "metric" = numericInput("weight", "Kilograms (kg)",value = 1,step=0.1),
             "imperical" = numericInput("weight", "Pounds (lbs)",value = 1,step=0.1)
      )
    }) 
    
  }
  
)
