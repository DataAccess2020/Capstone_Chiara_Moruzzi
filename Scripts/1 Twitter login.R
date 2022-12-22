library(rtweet)
library(stringr)
library(tidyverse)
library(dplyr)

options(scipen=999) #removes scientific notation

#authentication to Twitter API as default
aut <- rtweet_app()
auth_save(aut, "chiaramoruzzi")

auth_as("chiaramoruzzi")

aut_token <- rtweet_app(token)

auth_setup_default()