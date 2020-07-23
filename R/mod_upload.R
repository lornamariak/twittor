#' upload UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_upload_ui <- function(id){
  ns <- NS(id)
  tagList(
    sidebarPanel( class = "sidebar",
      tags$div(fileInput(ns("data"), "Upload a file")),
      tags$div(
        h2("About"),
        p("Upload a csv exported from analytics.twitter.com > Tweets > Export data > By tweet."),
        p("See the 'How to' panel for more information about how to export this dataset."),
        p("You can upload multiple csv, but it needs to be done one by one.")
      ),
      tags$div(
        h2("Use demo dataset"),
        checkboxInput(ns("sampledata"), "Use the demo data"),
        p(class ="note","!Note that if you have uploaded a dataset before, it will be removed from this app!")
      ),
      tags$div(
        h2("Clear dataset"),
        p("Click on this button to remove the uploaded dataset from the app"),
        actionButton(ns("clear"), "Reset")
      )
    ),
    mainPanel(

       uiOutput(ns("summary"))

    )

  )
}

#' upload Server Function
#'
#' @noRd
mod_upload_server <- function(input, output, session, choice, r){
  ns <- session$ns
  observe({
    if (input$sampledata == TRUE){
      choice$selected()
   r$tweets <- my_dataset
    }else{
      choice$notselected()
     r$tweets <- input$data
    }
  }

  )


#summarize the dataset
  output$summary <- renderUI({
    req(r$tweets)
    summarize(r$tweets)
  }

  )

}

## To be copied in the UI
# mod_upload_ui("upload_ui_1")

## To be copied in the server
# callModule(mod_upload_server, "upload_ui_1")

