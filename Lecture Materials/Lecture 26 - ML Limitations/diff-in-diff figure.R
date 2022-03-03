library(tidyverse)


df = data.frame(x = c(0, 2, 2, 4),
                y = c(1, 1, 3, 3),
                group)

ggplot() +
  geom_segment(aes(x = 0, xend = 2, y = 1, yend = 1, linetype = 'Control'), size = 1.5) +
  geom_segment(aes(x = 2, xend = 4, y = 1.5, yend = 1.5, linetype = 'Control'), size = 1.5) +
  geom_segment(aes(x = 0, xend = 2, y = 2, yend = 2, linetype = 'Treatment'), size = 1.5) +
  geom_segment(aes(x = 2, xend = 4, y = 3, yend = 3, linetype = 'Treatment'), size = 1.5) +
  geom_vline(xintercept = 2, color = 'red', linetype = 'dashed', size = 1) + 
  theme_minimal() + 
  theme(text = element_text(size = 16)) +
  labs(x = 'Time', y = 'Outcome', linetype = 'Group', title = 'Differences-in-Differences')
