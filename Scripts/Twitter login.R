library(rtweet)
library(twitteR)
library(tidyverse)


#authentication 
aut <- rtweet_app()
auth_save(aut, "chiaramoruzzi")

auth_as("chiaramoruzzi")

aut_token <- rtweet_app(token)

auth_setup_default()


#list download

italian_MP_under40 = lists_members(
  list_id = "1601560531244093440",
  slug = NULL,
  owner_user = NULL,
  n = 48,
  cursor = "-1",
  token = NULL,
  retryonratelimit = TRUE,
  verbose = TRUE,
  parse = TRUE,
)


#string vector with all under
MP_under40_names = c(italian_MP_under40$name)
print(MP_under40_names)

MP_under40_t_handle = c(italian_MP_under40$screen_name)
print(MP_under40_t_handle)

MP_under40_names[24] # ok, now we can iterate with a general function
MP_under40_t_handle[24]

#I create a dataframe containing all the names with the corresponding twitter handles of all the under 40 years old MPs who have twitter
DF_MP_under40 <- tibble (MP_under40_names,MP_under40_t_handle)










auth_save(aut_token, "Login")

auth_as('Login')

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

provachr = c("BettaPiccolotti")

prova = get_timelines(
  user = 295961054,
  n = 2,
  parse = TRUE,
  verbose = TRUE
)

lookup_users(
  user= "BettaPiccolotti",
  retryonratelimit = NULL ,
  parse = TRUE,
  verbose = TRUE,
  token = token
)


# get the usres'list

auth_as('Login')

library(tidyverse)
library(dplyr)
library(rtweet)

auth_setup_default()

italian_MP_under40 = lists_members(
  list_id = "1601560531244093440",
  slug = NULL,
  owner_user = NULL,
  n = 48,
  cursor = "-1",
  token = NULL,
  retryonratelimit = TRUE,
  verbose = TRUE,
  parse = TRUE,
)

# Create a string character with screen names of the list

list_MP_under40 = c(italian_MP_under40$screen_name)

list_MP_under40[24] # ok, now we can iterate with a general function

# Create a generale function








