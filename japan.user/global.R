# Japan.useR app.
library(shiny); library(shinydashboard)
library(dplyr)
library(leaflet)
library(Japan.useR)
data("JRSlide"); data("JREvent")

JRSlide.browse <- JRSlide %>% filter(!is.na(Slide)) %>% droplevels()
