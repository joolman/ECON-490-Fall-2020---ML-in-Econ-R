# In this script I am going to construct a height vs weight figure
#    and regression summary statistics


# Packagages that make me happy
library(tidyverse)
library(data.table)

setwd("C:/Users/johnj/Documents/Data/nhis")
list.files()

#########################
## ------------------- ##
## Loading in the data ##
## ------------------- ##
#########################
hw = fread('height_weight.csv') %>% as_tibble
names(hw) = hw %>% names %>% tolower

str(hw)
summary(hw)

hw = hw %>% 
  filter(year == 2010,
         height < 95 & height > 0)

male = hw %>%
  filter(sex == 1,
         weight > 126 & weight < 299) %>%
  mutate(Gender = 'Male')
female = hw %>%
  filter(sex == 2, 
         weight > 100 & weight < 274) %>%
  mutate(Gender = 'Female')

both = bind_rows(male, female)

###############################
# --------------------------- #
# Making a binned scatterplot #
# --------------------------- #
###############################
ggplot(both, aes(x = weight, y = height, col = Gender)) +
  stat_summary_bin(fun = mean, bins = 100) +
  labs(x = 'Weight (lbs)', y = 'Height (in)', title = 'Height vs Weight in 100 Bins\nSource: NHIS 2010') +
  theme(text = element_text(size = 20))

ggplot(male, aes(x = weight, y = height)) +
  scale_color_discrete(guide = 'none') +
  stat_summary_bin(fun = mean, bins = 100) +
  geom_smooth(method = 'lm', se = FALSE) +
  labs(x = 'Weight (lbs)', y = 'Height (in)', title = 'Height vs Weight in 100 Bins\nSource: NHIS 2010') +
  theme(text = element_text(size = 20))

ggplot(male, aes(x = weight, y = height)) +
  scale_color_discrete(guide = 'none') +
  stat_summary_bin(fun = mean, bins = 8) +
  geom_smooth(method = 'lm', se = FALSE) +
  labs(x = 'Weight (lbs)', y = 'Height (in)', title = 'Male Height vs Weight\nSource: NHIS 2010') +
  theme(text = element_text(size = 20)) +
  ylim(60, 84)

ggplot(male, aes(x = weight, y = height)) +
  scale_color_discrete(guide = 'none') +
  stat_summary_bin(fun = mean, bins = 8) +
  labs(x = 'Weight (lbs)', y = 'Height (in)', title = 'Male Height vs Weight\nSource: NHIS 2010') +
  theme(text = element_text(size = 20))



df = tibble(x = seq(-2, 8)) %>%
  mutate(y = .5*x + 3) %>%
  ggplot(aes(x,y)) +
  geom_line() +
  labs(x = '', y = '') +
  theme_classic() +
  theme(axis.ticks = element_blank(), axis.text = element_blank(), text = element_text(size = 20))
