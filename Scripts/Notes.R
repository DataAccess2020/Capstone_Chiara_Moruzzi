## NOTE

# Now I need to keep only the birth date in the "dati biografici section"

#str_aiello <- unlist(dat_aiello)

# dob_aiello <- str_extract(str_aiello, pattern "\\d\\d a+ \\d\\d\\d\\d")

#dati_biografici = parsed_page %>%
#  
#  html_element(css = ".datibiografici") %>%
#  
#  html_text() %>%
#  
#  stringr::str_replace_all(pattern = "\\s", replacement = " ")
#
#pers_data_aiello <-read_html(url) %>% 
#  html_elements(css = ".datibiografici") %>% 
#  html_text(trim = TRUE)
#
#print(pers_data_aiello)
#
#dob_aiello <- str_locate(pers_data_aiello, pattern = "\\d\\d a.+ \\d\\d\\d\\d")

#siccome non riesco a separare il testo in "dati biografici", separo tutti i politici 
#in base all'anno di nascita (under 40 = nati dal 1983 in poi) (over 40 = nati prima del 1983)