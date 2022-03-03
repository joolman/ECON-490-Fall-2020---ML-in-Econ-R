library(tidyverse)
library(data.table)

setwd('C:/Users/johnj/Documents/Data/Applied ML ECON490/')
list.files()

ahs = fread('lecture data discrete.csv') %>% as_tibble

# Plots

ggplot(ahs, aes(x = baths, y = rent*1)) + 
  stat_bin_2d(bins = 5) +
  geom_smooth(se = FALSE, method = 'lm', color = 'orange', size = 2) +
  labs(x = 'Baths', y = 'Renter Indicator', title = 'LPM Renter vs. Number of Baths') +
  theme(text = element_text(size = 20))

ggplot(ahs, aes(x = log(hinc), y = rent*1)) + 
  stat_bin_2d(bins = 5) +
  geom_smooth(se = FALSE, method = 'lm', color = 'orange', size = 2) +
  labs(x = 'log(Monthly Housing Cost)', y = 'Renter Indicator', title = 'LPM Renter vs. Log Monthly Housing Cost') +
  theme(text = element_text(size = 20))


ggplot(ahs, aes(x = baths, y = rent*1)) + 
  stat_bin_2d(bins = 5) +
  geom_smooth(se = FALSE, method = 'glm', method.args = list(family = 'binomial'), color = 'orange', size = 2) +
  labs(x = 'Baths', y = 'Renter Indicator', title = 'Logistic Renter vs. Number of Baths') +
  theme(text = element_text(size = 20))

( fit = glm(rent ~ baths, ahs, family = 'binomial') )
( yhat = predict(fit, data.frame(baths = 2)) )

# log(p/(1-p)) = yhat
# p/(1-p) = exp(yhat)
# p = (1-p)exp(yhat)
# p = exp(yhat) - p*exp(yhat)
# p(1+exp(yhat)) = exp(yhat)
# p = exp(yhat)/(1+exp(yhat))
exp(yhat)/(1+exp(yhat))
