library(shiny)
library(DT)
library(tidyverse)
library(cvpiaData)

watersheds <- cvpiaData::watershed_ordering$watershed

fall_run <- read_rds("data/fall-run-availability.rds")
spring_run <- read_rds("data/spring-run-availability.rds")
steelhead <- read_rds("data/steelhead-availability.rds")
