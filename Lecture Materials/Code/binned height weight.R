# Creating the height and weight binned scatter plot.
# Since there are many observations, we need to create a function
#   that creates an arbitrary number of bins specified by the user.


# Loading in packages that make me happy
library(tidyverse)
library(data.table)

# Changing the working directory to where the data is stored. Notice '/' not '\'
setwd('C:/Users/johnj/Documents/Data/nhis')


# Reading in the data
hw = fread('height_weight.csv')
names(hw) = hw %>% names %>% tolower

# Inspecting hw
head(hw) # Seems there are some NAs
tail(hw)
table(hw$year)

## ----------------- ##
## Trimming the data ##
## ----------------- ##

# Let's just work with 2010
hw = hw[hw$year == 2000, ]
head(hw)
tail(hw)
# According to the documentation, we only want actual recorded heights
# which are numbers between 59 and 76
# For weight, we want the range to be in 100 to 300
hw = hw[hw$height >= 59 & hw$height <= 76 & hw$weight >= 100 & hw$weight <= 300, ]

###############################
# --------------------------- #
# Making a binned scatterplot #
# --------------------------- #
###############################
ggplot(hw, aes(x = weight, y = height)) +
  stat_summary_bin(fun = mean, bins = 100) +
  geom_smooth(method = 'lm', se = FALSE, formula = y ~ poly(x, 2)) + 
  labs(x = 'Weight (lbs)', y = 'Height (in)', title = 'Height vs Weight in 100 Bins\nSource: NHIS 2000')



