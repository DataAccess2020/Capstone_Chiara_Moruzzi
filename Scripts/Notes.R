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

# TO DO LIST

library(tidyverse) 
library(rvest)
library(stringr)
library(httr)
library(RCurl)


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

# for loop to extract twitter handles and personal data for all the politicians

url_gen <- "https://www.camera.it/leg19/28"
email <- "chiaramoruzzi@gmail.com"
agent <- R.Version()$version.string
user_id <- c(From = email, `User-Agent` = agent)

web_page <- RCurl::getURL(url=url, httpheader= (user_id))
all_link = XML::getHTMLLinks(web_page, externalOnly = T)

all_link

# EXTRACT PAGES WITH MP DIVIDED BY LETTER

#pages_AZ = str_extract(all_link, pattern = "^https://documenti.camera.it.*&lettera=")
#print (pages_AZ)
#NON FUNZIONA

# CREO LA MIA FUNZIONE DOWNLOAD POLITELY

download_politely <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
  
  require(httr)
  
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))    
  
  MP_req <-httr::GET(url = url[i],   
                     add_headers(
                       From = email, 
                       `User-Agent` = R.Version()$version.string
                     )
  )
  
  if (httr::http_status(MP_req)$message == "Success: (200) OK") {
    bin <- content(MP_req, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("Houston, we have a problem!")
  }
}

#FOR LOOP

dir.create("MP personal pages")

page <- "https://www.camera.it/leg19/28"
prova_AZ = all_link[[i]] %>%                # the main page, categories of the website and images)
  str_subset(page)
prova_AZ %>% 
  str_extract(all_link[[i]])


url_A <- "https://www.camera.it/leg19/29?tipoAttivita=&tipoVisAtt=&tipoPersona=&shadow_deputato="

#links_AZ <- str_c(url_A <- "https://www.camera.it/leg19/28?lettera=")
#links_AZ


for (i in seq_along(url_A[[i]])) {
  download_politely(from_url = url_A[[i]], 
                    to_html = here::here("MP personal pages", str_c("deputato=",i,".html")), 
                    my_email = email)
  
  Sys.sleep(0.5)  # We use a sys.sleep of 0.5 seconds to avoid being banned from the server
}

#DOWNLOAD POLITELY FUNCTION


download_politely <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
  
  require(httr)
  
  stopifnot(is.character(from_url))
  stopifnot(is.character(to_html))
  stopifnot(is.character(my_email))     # Only character strings are allowed
  
  tweets_req <-httr::GET(url = italian_MP_over40[i],   # GET function for all the pages
                        add_headers(
                          From = email, 
                          `User-Agent` = R.Version()$version.string
                        )
  )
  
  if (httr::http_status(tweets_req)$message == "Success: (200) OK") {
    bin <- content(tweets_req, as = "raw")
    writeBin(object = bin, con = to_html)
  } else {
    cat("Houston, we have a problem!")
  }
}







