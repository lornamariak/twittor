#' how UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_how_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("How to Export your twitter data"),
    includeMarkdown(path = "inst/howto.md")

  )
}

#' how Server Function
#'
#' @noRd
mod_how_server <- function(input, output, session){
  ns <- session$ns

}

## To be copied in the UI
# mod_how_ui("how_ui_1")

## To be copied in the server
# callModule(mod_how_server, "how_ui_1")

