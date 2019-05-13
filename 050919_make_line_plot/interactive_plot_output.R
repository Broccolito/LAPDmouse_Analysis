if (interactive()) {
  ui <- fluidPage(
    titlePanel("Interactive Ratio plot"),
    sidebarLayout(
      sidebarPanel(checkboxInput("m1_plot", "m1", FALSE),
                   checkboxInput("m2_plot", "m2", FALSE),
                   checkboxInput("m3_plot", "m3", FALSE),
                   checkboxInput("m4_plot", "m4", FALSE),
                   checkboxInput("m5_plot", "m5", FALSE),
                   checkboxInput("m6_plot", "m6", FALSE),
                   checkboxInput("m7_plot", "m7", FALSE),
                   checkboxInput("m8_plot", "m8", FALSE),
                   checkboxInput("m9_plot", "m9", FALSE),
                   checkboxInput("m10_plot", "m10", FALSE),
                   checkboxInput("m11_plot", "m11", FALSE),
                   checkboxInput("m12_plot", "m12", FALSE),
                   checkboxInput("m13_plot", "m13", FALSE),
                   checkboxInput("m14_plot", "m14", FALSE),
                   checkboxInput("m15_plot", "m15", FALSE),
                   checkboxInput("m16_plot", "m16", FALSE),
                   checkboxInput("m17_plot", "m17", FALSE),
                   checkboxInput("m18_plot", "m18", FALSE),
                   width = 2),
      mainPanel(tableOutput("selected"))
    )
  )
  server <- function(input, output) {
    output$selected <- renderTable({
      data.frame(m1 = input$m1_plot,
                 m2 = input$m2_plot,
                 m3 = input$m3_plot,
                 m4 = input$m4_plot,
                 m5 = input$m5_plot,
                 m6 = input$m6_plot,
                 m7 = input$m7_plot,
                 m8 = input$m8_plot,
                 m9 = input$m9_plot,
                 m10 = input$m10_plot,
                 m11 = input$m11_plot,
                 m12 = input$m12_plot,
                 m13 = input$m13_plot,
                 m14 = input$m14_plot,
                 m15 = input$m15_plot,
                 m16 = input$m16_plot,
                 m17 = input$m17_plot,
                 m18 = input$m18_plot)
    })
  }
  shinyApp(ui, server)
}
