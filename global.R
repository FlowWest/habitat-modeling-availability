library(shiny)
library(DT)
library(tidyverse)
library(cvpiaData)

watersheds <- c(cvpiaData::watershed_ordering$watershed, "Upper Mid Sac Region")
docs_lookup <- read_rds("data/docs-lookup.rds")
regions_lookup <- read_rds("data/regions-lookup.rds")

fall_run <- read_rds("data/fall-run-availability.rds") %>% 
  left_join(docs_lookup) %>% 
  mutate(href = case_when(
    str_detect(watershed, "Sacramento|Sac") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/sacramento_river.html",
    str_detect(watershed, "Bypass") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/bypasses.html",
    TRUE ~ href
  ))

late_fall_run <- read_rds("data/late-fall-run-availability.rds") %>% 
  left_join(docs_lookup) %>% 
  mutate(href = case_when(
    str_detect(watershed, "Sacramento|Sac") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/sacramento_river.html",
    str_detect(watershed, "Bypass") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/bypasses.html",
    TRUE ~ href
  ))

spring_run <- read_rds("data/spring-run-availability.rds") %>% 
  left_join(docs_lookup) %>% 
  mutate(href = case_when(
    str_detect(watershed, "Sacramento|Sac") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/sacramento_river.html",
    str_detect(watershed, "Bypass") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/bypasses.html",
    TRUE ~ href
  ))
steelhead <- read_rds("data/steelhead-availability.rds") %>% 
  left_join(docs_lookup) %>% 
  mutate(href = case_when(
    str_detect(watershed, "Sacramento|Sac") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/sacramento_river.html",
    str_detect(watershed, "Bypass") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/bypasses.html",
    TRUE ~ href
  ))

winter_run <- read_rds("data/winter-run-availability.rds") %>% 
  left_join(docs_lookup) %>% 
  mutate(href = case_when(
    str_detect(watershed, "Sacramento|Sac") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/sacramento_river.html",
    str_detect(watershed, "Bypass") ~ "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/watershed/bypasses.html",
    TRUE ~ href
  ))


createLink <- function(url, text) {
  sprintf('<a href="%s" target="_blank">%s</a>', url, text)
}
