library(tidyverse)

ahs = read.csv('C:/Users/johnj/Documents/Data/Applied ML ECON490/Lecture Data/lecture data continuous.csv')

names(ahs)

sfit = lm(log(value) ~ log(cost), data = ahs) %>% summary

beta = coef(sfit)

ggplot(data = data.frame(x = c(0.70, 0.84)), aes(x)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = beta[2,1], sd = beta[2,2]), size = 2) +
  labs(y = "", title = "Coefficient Guess") +
  scale_y_continuous(breaks = NULL) +
  theme(text = element_text(size = 20))



set.seed(490)
n = dim(ahs)[1]

select = sample(1:n, n, replace = TRUE)

b = 1000
beta = matrix(rep(NaN,b), ncol = 1)
for(i in 1:b){
  fit = lm(log(value) ~ log(cost), data = ahs, subset = sample(1:n, n, replace = TRUE))
  beta[i, ] = coef(fit)[2]
}

beta = as.data.frame(beta)

ggplot(beta, aes(x = V1)) +
  geom_histogram(bins = 20) +
  theme(text = element_text(size = 20)) +
  geom_vline(xintercept = coef(sfit)[2,1], color = 'orange', size = 2) +
  labs(x = '', y = '') +
  scale_y_continuous(breaks = NULL)

