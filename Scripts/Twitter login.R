library(rtweet)
library(twitteR)

aut <- rtweet_app()
auth_save(aut, "chiaramoruzzi")


auth_as("chiaramoruzzi")

token <- create_token(
app <- "26260108",
consumer_key <- 'zEoYJO30Mj6nbQVvobqTeN08n',
consumer_secret <- 'jNuX7ogU4KMvJtM35f6QdRfn033vQvnsMvzwfLNsOf5OZeo0fW',
access_token <- '4764428692-DZ4wXeY08fLSTITp9XJ33Nf6aQ1kpSRAr3EfX1P',
access_secret <- 'xKMuMfqwHitoSL0Pu8fmQlHdN5riTFBcDN2kxfWnH4gIo')

aut_token <- rtweet_app(token)
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

prova








