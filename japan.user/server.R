server <- function(input, output) {
  to_a_tag <- function(links){
    sapply(links, function(link){
      ifelse(is.na(link), "", as.character(a(href = link, link)))
    })
  }
  dat.community <- reactive({
    JRSlide %>%  
      select(-Number, -Session, -Community, -Topic) %>% 
      filter(
        Title %in% grep(pattern = (input$searcht.text), ignore.case = TRUE, x = Title, value = TRUE) | Speaker %in% grep(pattern = (input$searcht.text), x = Speaker, value = TRUE)) %>%
        mutate(Slide = to_a_tag(Slide))
      
    # grep(pattern = ("ggplot2"), x = JRSlide$Title, value = TRUE)
    # filter(JRSlide, Title %in% grep(pattern = "ggplot2", x = Title, value = TRUE)) -> tmp
  })
  
  output$view <- renderDataTable({
    dat.community()
  }, options = list(lengthMenu = c(5, 10, 20), pageLength = 5), escape = FALSE)
  
  rect.title <- reactive({
    grep(pattern = input$browse.title, x = JRSlide.browse$Title, value = TRUE)
  })
  output$browse <- renderText({
    rect.title()
  })
  
}