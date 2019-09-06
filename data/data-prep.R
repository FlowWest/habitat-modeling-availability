library(tidyverse)
library(googlesheets)
library(rvest)

sheet <- gs_key("1t_VQILldUIVhHyDUBeid0d4c3skSWbk342b65sE2emI")
modeling_exist <- gs_read(sheet)

fall_run_exist <- modeling_exist %>% 
  select(watershed = Watershed, starts_with("FR"), 
         used_rear_approx = UseRearRegionApprox, 
         used_spawn_approx = UseSpawnRegionApprox, 
         used_floodplain_approx = UseFloodplainRegionApprox, 
         Region) %>% 
  rename(Spawning = FR_spawn, 
         Fry = FR_fry, 
         Juvenile = FR_juv, 
         Floodplain = FR_floodplain) %>% 
  transmute(
    watershed, 
    Region,
    Spawning = case_when(
      is.na(Spawning) ~ "N/A", 
      # used_spawn_approx ~ paste0(as.character(Spawning), "*"), 
      TRUE ~ as.character(Spawning)
    ), 
    Fry = case_when(
      is.na(Fry) ~ "N/A", 
      TRUE ~ as.character(Fry)
    ), 
    Juvenile = case_when(
      is.na(Juvenile) ~ "N/A", 
      # used_rear_approx ~ paste0(as.character(Juvenile), "*"), 
      TRUE ~ as.character(Juvenile)
    ), 
    Floodplain = case_when(
      is.na(Floodplain) ~ "N/A", 
      # used_floodplain_approx ~ paste0(as.character(Floodplain), "*"), 
      TRUE ~ as.character(Floodplain)
    )
  )

write_rds(fall_run_exist, "data/fall-run-availability.rds")

spring_run_exist <- modeling_exist %>% 
  select(watershed = Watershed, starts_with("SR"),
         used_rear_approx = UseRearRegionApprox, 
         used_spawn_approx = UseSpawnRegionApprox, 
         used_floodplain_approx = UseFloodplainRegionApprox, 
         Region) %>% 
  rename(Spawning = SR_spawn, 
         Fry = SR_fry, 
         Juvenile = SR_juv, 
         Floodplain = SR_floodplain)  %>% 
  transmute(
    watershed,
    Region,
    Spawning = case_when(
      is.na(Spawning) ~ "N/A", 
      # used_spawn_approx ~ paste0(as.character(Spawning), "*"), 
      TRUE ~ as.character(Spawning)
    ), 
    Fry = case_when(
      is.na(Fry) ~ "N/A", 
      TRUE ~ as.character(Fry)
    ), 
    Juvenile = case_when(
      is.na(Juvenile) ~ "N/A", 
      # used_rear_approx ~ paste0(as.character(Juvenile), "*"), 
      TRUE ~ as.character(Juvenile)
    ), 
    Floodplain = case_when(
      is.na(Floodplain) ~ "N/A", 
      # used_floodplain_approx ~ paste0(as.character(Floodplain), "*"), 
      TRUE ~ as.character(Floodplain)
    )
  )

write_rds(spring_run_exist, "data/spring-run-availability.rds")


steelhead_exist <- modeling_exist %>% 
  select(watershed = Watershed, starts_with("ST"),
         used_rear_approx = UseRearRegionApprox, 
         used_spawn_approx = UseSpawnRegionApprox, 
         used_floodplain_approx = UseFloodplainRegionApprox, 
         Region) %>% 
  rename(Spawning = ST_spawn, 
         Fry = ST_fry, 
         Juvenile = ST_juv, 
         Floodplain = ST_floodplain, 
         Adult = ST_adult)  %>% 
  transmute(
    watershed,
    Region,
    Spawning = case_when(
      is.na(Spawning) ~ "N/A", 
      # used_spawn_approx ~ paste0(as.character(Spawning), "*"), 
      TRUE ~ as.character(Spawning)
    ), 
    Fry = case_when(
      is.na(Fry) ~ "N/A", 
      TRUE ~ as.character(Fry)
    ), 
    Juvenile = case_when(
      is.na(Juvenile) ~ "N/A", 
      # used_rear_approx ~ paste0(as.character(Juvenile), "*"), 
      TRUE ~ as.character(Juvenile)
    ), 
    Floodplain = case_when(
      is.na(Floodplain) ~ "N/A", 
      # used_floodplain_approx ~ paste0(as.character(Floodplain), "*"), 
      TRUE ~ as.character(Floodplain)
    ), 
    Adult = case_when(
      is.na(Adult) ~ "N/A", 
      TRUE ~ as.character(Adult)
    )
  )

write_rds(steelhead_exist, "data/steelhead-availability.rds")




# docs links -------------
url <- "http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/index.html"

watershed_docs <- read_html(url) %>% 
  html_nodes("ul") %>% 
  html_nodes("li") %>% 
  html_nodes("a") %>%
  html_text() %>% 
  tools::toTitleCase()

watershed_docs_link <- read_html(url) %>% 
  html_nodes("ul") %>% 
  html_nodes("li") %>% 
  html_nodes("a") %>%
  html_attr("href") %>% 
  paste0("http://cvpia-habitat-docs-markdown.s3-website-us-west-2.amazonaws.com/", .)


docs_lookup <- tibble(
  watershed = watershed_docs, 
  href = watershed_docs_link
)

write_rds(docs_lookup, "data/docs-lookup.rds")
  
# regions lookup 

regions_lookup <- fall_run_exist %>% 
  distinct(watershed, Region)

write_rds(regions_lookup, "data/regions-lookup.rds")  

  
  
  
  
  
  
  
  



