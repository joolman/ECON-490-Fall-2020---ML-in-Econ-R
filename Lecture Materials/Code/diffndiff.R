library(tidyverse)
library(foreign)
eitc = read.dta('C:/Users/johnj/Downloads/eitc.dta')

head(eitc)

eitc = eitc %>%
  mutate(post93 = year >= 1994,
         anykids = children >= 1)

ggplot(eitc, aes(year, work, color = anykids)) +
  stat_summary(geom = 'line') +
  geom_vline(xintercept = 1994) +
  theme_minimal()

lm(work ~ post93*anykids, data = eitc) %>% summary

glm(work ~ post93*anykids, data = eitc, family = binomial) %>% summary

exp(0.188)

# 1.2 = (1-a)/a
# a*1.2 = 1-a
# a*0.2 = 1
# a = 1/0.2

1/(exp(0.188) - 1)



agg = eitc

library(estimatr)
lm_robust(work ~ post93*anykids, data = eitc, clusters = anykids)
