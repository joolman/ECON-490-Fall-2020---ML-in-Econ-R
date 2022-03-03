library(tidyverse)

df = data.frame(x = c(0.5, 1), y = c(1, 0.5))
ggplot(df, aes(x, y)) +
  geom_line(color = 'red', linetype = 'dashed', size = 2) + 
  geom_point(size = 5) + 
  ylim(0, 1.5) + 
  xlim(0, 1.5) +
  theme_minimal() +
  geom_vline(xintercept = 0, size = 1) +
  geom_hline(yintercept = 0, size = 1) +
  theme(text = element_text(size = 20))
