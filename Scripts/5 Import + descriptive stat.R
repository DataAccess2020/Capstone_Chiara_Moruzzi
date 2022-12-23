# IMPORT LEG. XIX DATASET

library(tidyverse)
library(rio)
setwd ("C:\\Users\\chiar\\Desktop\\Università\\DAPS&CO\\DATA_ACCESS\\CAPSTONE\\Capstone_Chiara_Moruzzi\\Data")
dep_XIX_leg <- import("dep_XIX_leg.dta")

dep_XIX_leg %>%
  ggplot( aes(x=y_birth)) +
  geom_density(fill="yellowgreen")+
  scale_x_continuous(breaks = seq(1940,2000, by = 5))+
  theme_bw()


# now I create a variable for age
dep_XIX_leg$age <- 2022 - dep_XIX_leg$y_birth

sum_age <- summary(dep_XIX_leg$age)
print (sum_age)

dep_XIX_leg %>%
  ggplot( aes(x=age)) +
  geom_density(fill="cadetblue1")+
  scale_x_continuous(breaks = seq(1,100, by = 5))+
  theme_bw()





