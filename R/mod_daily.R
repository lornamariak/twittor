#' daily UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_daily_ui <- function(id){
  ns <- NS(id)
  tagList(
  tags$div(
    h2("Analyctics by day"),
    selectInput(ns("metric"), "Metric" , c("Impressions", "Engagement","Retweets", "Likes"))
  ),
      plotOutput(ns("metricplot"))

  )
}

#' daily Server Function
#'
#' @noRd
mod_daily_server <- function(input, output, session, choice, r){
  ns <- session$ns
  observe({


  m<- input$metric
  if (m == "Impressions"){
    updateSelectInput(session, "metric", selected = "Impressions")
    output$metricplot  <- renderPlot({
      req(r$tweets)
      choice$impress(r$tweets)
    })
  }else if (m == "Engagement"){
    updateSelectInput(session, "metric", selected = "Engagement")
    output$metricplot  <- renderPlot({
      req(r$tweets)
      choice$engage(r$tweets)
    })
  } else if (m == "Retweets"){
    updateSelectInput(session, "metric", selected = "Retweets")
    output$metricplot  <- renderPlot({
      req(r$tweets)
      choice$retweet(r$tweets)
    })
  }else {
    updateSelectInput(session, "metric", selected = "Likes")
    output$metricplot  <- renderPlot({
      req(r$tweets)
      choice$like(r$tweets)
    })
  }

  })


}

## To be copied in the UI
# mod_daily_ui("daily_ui_1")

## To be copied in the server
# callModule(mod_daily_server, "daily_ui_1")

