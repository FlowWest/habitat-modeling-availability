library(tidyverse)
library(googlesheets)

sheet <- gs_key("1t_VQILldUIVhHyDUBeid0d4c3skSWbk342b65sE2emI")
modeling_exist <- gs_read(sheet)

fall_run_exist <- modeling_exist %>% 
  select(watershed = Watershed, starts_with("FR")) %>% 
  rename(Spawning = FR_spawn, 
         Fry = FR_fry, 
         Juvenile = FR_juv, 
         Floodplain = FR_floodplain) %>% 
  mutate(Spawning = ifelse(is.na(Spawning), "N/A", as.character(Spawning)), 
         Fry = ifelse(is.na(Fry), "N/A", as.character(Fry)),
         Juvenile = ifelse(is.na(Juvenile), "N/A", as.character(Juvenile)), 
         Floodplain = ifelse(is.na(Floodplain), "N/A", as.character(Floodplain)))

write_rds(fall_run_exist, "data/fall-run-availability.rds")

spring_run_exist <- modeling_exist %>% 
  select(watershed = Watershed, starts_with("SR")) %>% 
  rename(Spawning = SR_spawn, 
         Fry = SR_fry, 
         Juvenile = SR_juv, 
         Floodplain = SR_floodplain) %>% 
  mutate(Spawning = ifelse(is.na(Spawning), "N/A", as.character(Spawning)), 
         Fry = ifelse(is.na(Fry), "N/A", as.character(Fry)),
         Juvenile = ifelse(is.na(Juvenile), "N/A", as.character(Juvenile)), 
         Floodplain = ifelse(is.na(Floodplain), "N/A", as.character(Floodplain)))

write_rds(spring_run_exist, "data/spring-run-availability.rds")


steelhead_exist <- modeling_exist %>% 
  select(watershed = Watershed, starts_with("ST")) %>% 
  rename(Spawning = ST_spawn, 
         Fry = ST_fry, 
         Juvenile = ST_juv, 
         Floodplain = ST_floodplain, 
         Adult = ST_adult) %>% 
  mutate(Spawning = ifelse(is.na(Spawning), "N/A", as.character(Spawning)), 
         Fry = ifelse(is.na(Fry), "N/A", as.character(Fry)),
         Juvenile = ifelse(is.na(Juvenile), "N/A", as.character(Juvenile)), 
         Floodplain = ifelse(is.na(Floodplain), "N/A", as.character(Floodplain)), 
         Adult = ifelse(is.na(Adult), "N/A", as.character(Adult)))

write_rds(steelhead_exist, "data/steelhead-availability.rds")
