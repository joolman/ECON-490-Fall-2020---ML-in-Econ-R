library(tidyverse)
library(lubridate)

cps = read.csv('C:/Users/johnj/Documents/Data/Applied ML ECON490/workshop data/Workshop Data.csv')

urate = cps %>%
  group_by(date, statefip) %>%
  mutate(urate = sum( (empstat %in% c(21, 22))*wtfinl )/
           sum( (empstat %in% c(10, 12, 21, 22)*wtfinl) )*100) %>%
  ungroup %>%
  select(date, urate, statefip) %>%
  distinct

ggplot(urate, aes(x = date, y = urate)) +
  geom_boxplot(aes(fill = date)) +
  geom_jitter() +
  theme(text = element_text(size = 20),
        axis.text.x = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  labs(x = 'Date', y = 'Unemployment Rate', title = 'Fixed Effects Intuition')
