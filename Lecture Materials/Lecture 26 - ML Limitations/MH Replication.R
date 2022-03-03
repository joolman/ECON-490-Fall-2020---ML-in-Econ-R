library(tidyverse)
library(estimatr)
source('C:/Users/johnj/Documents/Data/Applied ML ECON490/lecture data/MH_replication/MH_replication.R')
source('C:/Users/johnj/OneDrive - University of Illinois - Urbana/Documents/UIUC/3rd Year Paper/Segregation/Code - Fall 2020/latex functions.R')

names(new_data) = c('id', 'hgc_mother', 'hgc_father', 'sample',
                    'race', 'sex', 'afqt','occ', 'income', 'region', 'yos', 'age')

new_data = new_data %>% 
  filter(sex == 1 & income > 0) %>%
  na.omit()

fit1 = lm_robust(log(income) ~ yos, new_data)
fit2 = lm_robust(log(income) ~ yos + as.factor(age), new_data)
fit3 = lm_robust(log(income) ~ yos + as.factor(age) +
            hgc_mother + hgc_father + as.factor(race) + as.factor(region), new_data)
fit4 = lm_robust(log(income) ~ yos + as.factor(age) +
            hgc_mother + hgc_father + as.factor(race) + as.factor(region) + afqt, new_data)
fit5 = lm_robust(log(income) ~ yos + as.factor(age) +
            hgc_mother + hgc_father + as.factor(race) + as.factor(region) + afqt + as.factor(trunc(occ/100)), new_data)

fit_list = list(fit1, fit2, fit3, fit4, fit5)
latex_table(fit_list)
