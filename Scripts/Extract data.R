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

# UNDER 40 MEMBERS OF PARLIAMENT

#string vector with all under
MP_under40_names = c(italian_MP_under40$name) #names
print(MP_under40_names)

MP_under40_t_handle = c(italian_MP_under40$screen_name) #twitter handles
print(MP_under40_t_handle)

MP_under40_followers = c(italian_MP_under40$followers_count) #numebr of followers
print(MP_under40_followers)

MP_under40_tweets = c(italian_MP_under40$statuses_count) #number of tweets
print(MP_under40_tweets)

MP_under40_names[24] # ok, now we can iterate with a general function
MP_under40_t_handle[24]

#I create a dataframe containing all the names with the corresponding twitter handles, number of followers 
#and number of tweets of all the under 40 years old MPs who have twitter
DF_MP_under40 <- tibble (MP_under40_names,MP_under40_t_handle, MP_under40_followers, MP_under40_tweets)

#TWEETS EXTRACTION

#first try

#extracts two tweets per account in the list

prova <- get_timelines(
  user = MP_under40_t_handle,
  n = 2,
  parse = TRUE,
  verbose = TRUE
)


#now I can download all the tweets I need from July to September 2022

get_timelines(
  user = NULL,
  n = 100,
  since_id = NULL,
  max_id = NULL,
  home = FALSE,
  parse = TRUE,
  check = TRUE,
  retryonratelimit = TRUE,
  verbose = TRUE,
  token = NULL,
  ...
)








