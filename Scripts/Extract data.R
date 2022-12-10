# TO DO LIST

library(tidyverse) 
library(rvest)
library(stringr)


url <- "https://www.camera.it/leg19/29?tipoAttivita=&tipoVisAtt=&tipoPersona=&shadow_deputato=307394&idLegislatura=19"

parsed_page <- read_html(url)


# First try: twitter handle and personal data for one MP
dat_aiello <- tibble(
  
  twitter_handle = parsed_page %>%
    
    html_element(css = ".twitter a") %>%
    
    html_attr(name = "href"),
  
  dati_biografici = parsed_page %>%
    
    html_element(css = ".datibiografici") %>%
    
    html_text() %>%
    
    stringr::str_replace_all(pattern = "\\s", replacement = " ")
  
)










