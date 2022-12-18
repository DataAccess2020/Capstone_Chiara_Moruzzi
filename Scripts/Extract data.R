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

#string vector with all under 40 MPs who have twitter
MP_under40_names = c(italian_MP_under40$name) #names
print(MP_under40_names)

MP_under40_t_handle = c(italian_MP_under40$screen_name) #twitter handles
print(MP_under40_t_handle)

MP_under40_followers = c(italian_MP_under40$followers_count) #number of followers
print(MP_under40_followers)

MP_under40_n_tweets = c(italian_MP_under40$statuses_count) #number of tweets
print(MP_under40_n_tweets)

MP_under40_names[24] # ok, now we can iterate with a general function
MP_under40_t_handle[24]

#I create a dataframe containing all the names with the corresponding twitter handles, number of followers 
#and number of tweets of all the under 40 years old MPs who have twitter
DF_MP_under40 <- tibble (MP_under40_names,MP_under40_t_handle, MP_under40_followers, MP_under40_n_tweets)

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

under40_tweets <- for (i in seq_along(italian_MP_under40)){
 under40_tweets = get_timelines(user = italian_MP_under40[[i]],
                                n = Inf,
                                retryonratelimit = T,
                                parse = TRUE,
                                verbose = TRUE,
 Sys.sleep(0.5)) %>% 
  dplyr::filter(created_at >= "2022-07-21" & created_at<="2022-09-24")
}

under40_t_text <- c(under40_tweets$full_text)

# OVER 40 MEMBERS OF PARLIAMENT

italian_MP_over40 = lists_members(
  list_id = "1601572364214583298",
  slug = NULL,
  owner_user = NULL,
  n = 250,
  cursor = "-1",
  token = NULL,
  retryonratelimit = TRUE,
  verbose = TRUE,
  parse = TRUE,
)

#string vector with all over 40 MPs who have twitter
MP_over40_names = c(italian_MP_over40$name) #names
print(MP_over40_names)

MP_over40_t_handle = c(italian_MP_over40$screen_name) #twitter handles
print(MP_over40_t_handle)

MP_over40_followers = c(italian_MP_over40$followers_count) #number of followers
print(MP_over40_followers)

MP_over40_n_tweets = c(italian_MP_over40$statuses_count) #number of tweets
print(MP_over40_n_tweets)

#I create a dataframe containing all the names with the corresponding twitter handles, number of followers 
#and number of tweets of all the under 40 years old MPs who have twitter
DF_MP_over40 <- tibble (MP_over40_names,MP_over40_t_handle, MP_over40_followers, MP_over40_n_tweets)

#TWEETS EXTRACTION

#now I can download all the tweets I need from July to September 2022

over40_tweets <- for (i in seq_along(italian_MP_over40)){
  over40_tweets = get_timelines(user = italian_MP_over40[[i]],
                                 n = Inf,
                                 retryonratelimit = T,
                                 parse = TRUE,
                                 verbose = TRUE) %>% 
    dplyr::filter(created_at >= "2022-07-21" & created_at<="2022-09-24")
}

over40_t_text <- c(over40_tweets$full_text)

## tweets download

unl_t_over <- unlist(over40_t_text)
unl_t_under <- unlist(under40_t_text)

unl_t_under[50] #ok, I can iterate the function


#download_politely_under40 <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
#  
#  require(httr)
#  
#  stopifnot(is.character(from_url))
#  stopifnot(is.character(to_html))
#  stopifnot(is.character(my_email))     
#  
#  tweets_req <-httr::GET(url = unl_t_under[i], 
#                         add_headers(
#                           From = email, 
#                           `User-Agent` = R.Version()$version.string
#                         )
#  )
#  
#  if (httr::http_status(tweets_req)$message == "Success: (200) OK") {
#    bin <- content(tweets_req, as = "raw")
#    writeBin(object = bin, con = to_html)
#  } else {
#    cat("Houston, we have a problem!")
#  }
#}
#
#
#download_politely_over40 <- function(from_url, to_html, my_email, my_agent = R.Version()$version.string) {
#  
#  require(httr)
#  
#  stopifnot(is.character(from_url))
#  stopifnot(is.character(to_html))
#  stopifnot(is.character(my_email)) 
#  
#  tweets_req <-httr::GET(url = unl_t_over[i],
#                           From = email, 
#                           `User-Agent` = R.Version()$version.string
#                         )
#  if (httr::http_status(tweets_req)$message == "Success: (200) OK") {
#    bin <- content(tweets_req, as = "raw")
#    writeBin(object = bin, con = to_html)
#  } else {
#    cat("Houston, we have a problem!")
#  }
#}
#
#
#setwd ("C:\\Users\\chiar\\Desktop\\Università\\DAPS&CO\\DATA_ACCESS\\CAPSTONE\\Capstone_Chiara_Moruzzi")
#dir.create("Tweets MPs over 40")
#
#for (i in seq_along(unl_t_under)) {
#  cat(i, " ")
#  download_politely_under40(from_url = unl_t_under[i], 
#                    to_html = here::here("Tweets MPs over 40"), 
#                    my_email = email)
#  
#  Sys.sleep(0.5)
#}
#





