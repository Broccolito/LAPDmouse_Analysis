
#Not finished yet!

library(shiny)

ui <- fluidPage(
  navbarPage(title = "Interactive Sample Specs Viewer",
             tabPanel("m01",
                      fluidPage(HTML(includeMarkdown("m01_Info.md")))),
             tabPanel("m02",
                        includeMarkdown("www/m02_Info.md")),
             tabPanel("m03",
                        includeMarkdown("www/m03_Info.md")),
             tabPanel("m04",
                        includeMarkdown("www/m04_Info.md")),
             tabPanel("m05",
                        includeMarkdown("www/m05_Info.md")),
             tabPanel("m06",
                        includeMarkdown("www/m06_Info.md")),
             tabPanel("m07",
                        includeMarkdown("www/m07_Info.md")),
             tabPanel("m08",
                        includeMarkdown("www/m08_Info.md")),
             tabPanel("m09",
                        includeMarkdown("www/m09_Info.md")),
             tabPanel("m10",
                        includeMarkdown("www/m10_Info.md")),
             tabPanel("m11",
                        includeMarkdown("www/m11_Info.md")),
             tabPanel("m12",
                        includeMarkdown("www/m12_Info.md")),
             tabPanel("m13",
                        includeMarkdown("www/m13_Info.md")),
             tabPanel("m14",
                        includeMarkdown("www/m14_Info.md")),
             tabPanel("m15",
                        includeMarkdown("www/m15_Info.md")),
             tabPanel("m16",
                        includeMarkdown("www/m16_Info.md")),
             tabPanel("m17",
                        includeMarkdown("www/m17_Info.md")),
             tabPanel("m18",
                        includeMarkdown("www/m18_Info.md"))
             
             )
  
  
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)