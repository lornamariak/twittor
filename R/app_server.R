#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  choice <- DataChoice$new()
  r <- reactiveValues()
  callModule(mod_upload_server, "upload_ui_1",choice,r)
  callModule(mod_daily_server, "daily_ui_1",choice,r)
  callModule(mod_top_server, "top_ui_1",choice,r )
}
