library(rtweet)
library(stringr)
library(tidyverse)


#authentication 
aut <- rtweet_app()
auth_save(aut, "chiaramoruzzi")

auth_as("chiaramoruzzi")

aut_token <- rtweet_app(token)

auth_setup_default()