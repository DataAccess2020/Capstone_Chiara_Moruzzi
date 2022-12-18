## TWEETS ANALYSIS


#UNDER 40
under40_sm <- str_detect(under40_t_text, pattern = "salario")

tweets="salario"
under40_sm = under40_t_text %>% 
  str_subset(tweets)

under40_sm %>% 
  str_extract(under40_t_text)

print(under40_sm) #20 out of 3797


#OVER 40

over40_sm <- str_detect(over40_t_text, pattern = "salario")

tweets="salario"
over40_sm = over40_t_text %>% 
  str_subset(tweets)

over40_sm %>% 
  str_extract(over40_t_text)

print(over40_sm) #120 out of 20582







