#GRAPH

library(hrbrthemes)
library(viridis)
library(forcats)

ggplot(sum_tab, aes(fill=factor(age),y=pr_sm, x=n_sm)) + 
  geom_bar(position="stack", stat="identity")+
  scale_color_manual(values = c("yellow", "red"), "Age")+
  xlab("Tweets about minimum wage")+
  scale_x_discrete()+
  ylab("Proportion")+
  theme(legend.position = "bottom")+
  scale_fill_manual(
  values = c("gold", "indianred3"),
  name = "Age group",
  labels = c("under 40", "over 40"))







