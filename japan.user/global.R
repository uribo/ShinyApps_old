# Japan.useR app.
library(shiny)
require(rmarkdown)
library(shinydashboard)
library(dplyr)
library(RCurl)
# install_github("uribo/Japan.useR"); library(Japan.useR)
JRSlide <- read.csv(text = getURL("https://raw.githubusercontent.com/uribo/Japan.useR/master/inst/assets/raw_data/JapanRSlide.csv"), header = TRUE)
JREVent <- read.csv(text = getURL("https://raw.githubusercontent.com/uribo/Japan.useR/master/inst/assets/raw_data/JapanREvent.csv"), header = TRUE)
# data("JRSlide"); data("JREvent")

JRSlide.browse <- JRSlide %>% filter(!is.na(Slide)) %>% droplevels()