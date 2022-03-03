ggplot(data = data.frame(x = c(-7, 11)), aes(x)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = 2, sd = 2), size = 2) +
  labs(y = "", title = "Normal Distribution ~ N(2, 4)") +
  scale_y_continuous(breaks = NULL) +
  theme(text = element_text(size = 20))
