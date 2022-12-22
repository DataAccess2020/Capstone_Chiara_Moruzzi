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

n_sm_under40 <- 20
n_sm_over40 <- 120

total_under40 <- 3797
total_over40 <- 20582

pr_under40 <- n_sm_under40/total_under40
pr_over40 <- n_sm_over40/total_over40


#PROP TEST

pr_test_under <- prop.test(n_sm_under40, total_under40, p = NULL, alternative = c("two.sided", "less", "greater"), conf.level = 0.95, correct = TRUE)
print(pr_test_under)


pr_test_over <- prop.test(n_sm_over40, total_over40, p = NULL, alternative = c("two.sided", "less", "greater"), conf.level = 0.95, correct = TRUE)
print(pr_test_over)



# GRAPH

pr_dat <- tibble(pr_under40,pr_over40)

install.packages("expss") 
install.packages("labelled")


library(expss)
library(labelled)

age <- unlist(c(0, 1))
is.numeric(age)

n_sm <- unlist(c(n_sm_under40, n_sm_over40))
tot_tw <- unlist(c(total_under40, total_over40))

pr_sm <- n_sm/tot_tw

sum_tab <- tibble(age, n_sm, tot_tw, pr_sm)

# set variable labels
var_lab(sum_tab$age) <- "Age of the MPs (2 categories: under and over 40 years old)" 
var_lab(sum_tab$n_sm) <- "Number of tweets about minimum wage" 
var_lab(sum_tab$tot_tw) <- "Total number of tweets"
var_lab(sum_tab$pr_sm) <- "proportion of tweets about minimum wage on total"

print (sum_tab$age)

# set value labels
val_lab(sum_tab$age) <- make_labels("0 under 40
                                    1 over 40")
val_lab(sum_tab$age)

# now that I have a numeric variable I can plot the results grouped by age

ggplot(sum_tab, aes(fill=age,y=pr_sm, x=n_sm)) + 
  geom_bar(position="stack", stat="identity")+
  theme_bw()





















