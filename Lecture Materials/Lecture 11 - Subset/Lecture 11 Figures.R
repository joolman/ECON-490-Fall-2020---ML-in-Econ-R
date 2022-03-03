total = 0
n = 8

for(k in 0:10){
  print(choose(n, k))
  total = total + choose(n, k)
}
total 
2^n



library(tidyverse)

best = function(x){2^x}
step = function(x){1 + (x*(x+1))/2}

df = 
  bind_rows(
    tibble(Parameters = c(c(1:5), c(1:10), c(1:20)),
           p = c(rep('5 parameters', 5), rep('10 parameters', 10), rep('20 parameters', 20)),
           Method = 'Best Subset',
           Models = sapply(Parameters, best)),
    tibble(Parameters = c(c(1:5), c(1:10), c(1:20)),
           p = c(rep('5 parameters', 5), rep('10 parameters', 10), rep('20 parameters', 20)),
           Method = 'Stepwise',
           Models = sapply(Parameters, step))
  )

df$p = factor(df$p, levels = c('5 parameters', '10 parameters', '20 parameters'))

ggplot(df, aes(x = Parameters, y = Models, color = Method)) +
  geom_point() +
  geom_line() +
  facet_grid(scales = 'free', rows = vars(p), shrink = T) +
  theme(text = element_text(size = 16))

tail(df, 16)  
             