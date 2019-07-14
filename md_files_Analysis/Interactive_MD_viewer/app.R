library(shiny)
library(shinydashboard)

ui = dashboardPage(
  skin = "black",
  header = dashboardHeader(
    title = "LAPD Sample Specs"
  ),
  sidebar = dashboardSidebar(
    sidebarMenu(
      menuItem("m1", tabName = "m1"),
      menuItem("m2", tabName = "m2"),
      menuItem("m3", tabName = "m3"),
      menuItem("m4", tabName = "m4"),
      menuItem("m5", tabName = "m5"),
      menuItem("m6", tabName = "m6"),
      menuItem("m7", tabName = "m7"),
      menuItem("m8", tabName = "m8"),
      menuItem("m9", tabName = "m9"),
      menuItem("m10", tabName = "m10"),
      menuItem("m11", tabName = "m11"),
      menuItem("m12", tabName = "m12"),
      menuItem("m13", tabName = "m13"),
      menuItem("m14", tabName = "m14"),
      menuItem("m15", tabName = "m15"),
      menuItem("m16", tabName = "m16"),
      menuItem("m17", tabName = "m17"),
      menuItem("m18", tabName = "m18"),
      menuItem("m19", tabName = "m19"),
      menuItem("m20", tabName = "m20"),
      menuItem("m21", tabName = "m21"),
      menuItem("m22", tabName = "m22"),
      menuItem("m23", tabName = "m23"),
      menuItem("m24", tabName = "m24"),
      menuItem("m25", tabName = "m25"),
      menuItem("m26", tabName = "m26"),
      menuItem("m27", tabName = "m27"),
      menuItem("m28", tabName = "m28"),
      menuItem("m29", tabName = "m29"),
      menuItem("m30", tabName = "m30"),
      menuItem("m31", tabName = "m31"),
      menuItem("m32", tabName = "m32"),
      menuItem("m33", tabName = "m33"),
      menuItem("m34", tabName = "m34")
    )
  ),
  body = dashboardBody(
    tabItems(
      tabItem("m1", includeHTML("www/m01_Info.html")),
      tabItem("m2", includeHTML("www/m02_Info.html")),
      tabItem("m3", includeHTML("www/m03_Info.html")),
      tabItem("m4", includeHTML("www/m04_Info.html")),
      tabItem("m5", includeHTML("www/m05_Info.html")),
      tabItem("m6", includeHTML("www/m06_Info.html")),
      tabItem("m7", includeHTML("www/m07_Info.html")),
      tabItem("m8", includeHTML("www/m08_Info.html")),
      tabItem("m9", includeHTML("www/m09_Info.html")),
      tabItem("m10", includeHTML("www/m10_Info.html")),
      tabItem("m11", includeHTML("www/m11_Info.html")),
      tabItem("m12", includeHTML("www/m12_Info.html")),
      tabItem("m13", includeHTML("www/m13_Info.html")),
      tabItem("m14", includeHTML("www/m14_Info.html")),
      tabItem("m15", includeHTML("www/m15_Info.html")),
      tabItem("m16", includeHTML("www/m16_Info.html")),
      tabItem("m17", includeHTML("www/m17_Info.html")),
      tabItem("m18", includeHTML("www/m18_Info.html")),
      tabItem("m19", includeHTML("www/m19_Info.html")),
      tabItem("m20", includeHTML("www/m20_Info.html")),
      tabItem("m21", includeHTML("www/m21_Info.html")),
      tabItem("m22", includeHTML("www/m22_Info.html")),
      tabItem("m23", includeHTML("www/m23_Info.html")),
      tabItem("m24", includeHTML("www/m24_Info.html")),
      tabItem("m25", includeHTML("www/m25_Info.html")),
      tabItem("m26", includeHTML("www/m26_Info.html")),
      tabItem("m27", includeHTML("www/m27_Info.html")),
      tabItem("m28", includeHTML("www/m28_Info.html")),
      tabItem("m29", includeHTML("www/m29_Info.html")),
      tabItem("m30", includeHTML("www/m30_Info.html")),
      tabItem("m31", includeHTML("www/m31_Info.html")),
      tabItem("m32", includeHTML("www/m32_Info.html")),
      tabItem("m33", includeHTML("www/m33_Info.html")),
      tabItem("m34", includeHTML("www/m34_Info.html"))
    )
  ))

server = function(input, output, session) {
  
}

shinyApp(ui, server)