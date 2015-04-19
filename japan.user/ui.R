# Japan.useR app.
dashboardPage(
  dashboardHeader(title = "Japan useR"), # community materials
  
  dashboardSidebar(
    sidebarSearchForm(textId = "searcht.text", 
                      buttonId = "search.botton",
                      label = "Search..."),
    sidebarMenu(
      menuItem("Materials",   tabName = "dashboard", icon = icon("dashboard")),
      menuItem("[WIP]Events", tabName = "event.map", icon = icon("globe")),
      menuItem("[WIP]Stats",  tabName = "stats",     icon = icon("bar-chart")),
      menuItem("[WIP]Browse", tabName = "browse",    icon = icon("slideshare")),
      menuItem("About",       tabName = "about",     icon = icon("bullhorn")),
      menuItem("Source code", icon = icon("github"), href = "https://github.com/uribo/ShinyApps/japan.user")
    )),
  
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "dashboard",
        column(width = 12,
               tags$div(tags$p("←から発表タイトル、発表者名で検索するか、テーブル本体を操作してください"))),
              fixedPage(
                box(width = 12,
                  dataTableOutput("view")))
              ),
      tabItem(tabName = "browse",
        column(width = 12,
               selectInput("browse.title", "Choose a browsing slide title (Only Slideshare)",
                           choices = levels(JRSlide.browse$Title))),
        column(width = 12, textOutput("browse"))
      ),
      board.about <- tabItem(
        tabName = "about",
        fluidRow(
          column(width = 12,
                 includeMarkdown("README.md"))))


))
)

#         column(width = 12,
#                tags$iframe(src="//www.slideshare.net/slideshow/embed_code/key/BJ8pi7geMiVlhi", 
#                            width="425", height="355", 
#                            frameborder="0", marginwidth="0", marginheight="0", scrolling="no", 
#                            style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;"))
    