library(shiny)

ui <- fluidPage(
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html"),
  includeHTML("m01_plot/index.html")
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)