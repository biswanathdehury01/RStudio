############# FILTERS in R ###############
library(tidyverse)

data()
View(msleep)
names(msleep)


#1 - based on one satisfying condition


my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(sleep_total > 18)

#2 - based on one non satisfying  condition

my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(!sleep_total > 18)

#3 - based on multiple conditions (and , gives same output)

# Single And criteria
my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total ) %>% 
  filter(order == "Primates" & bodywt > 20) 

# Mutiple And Criteria
my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total ) %>% 
  filter(order == "Primates" , bodywt > 20) 

#4 - based on multiple conditions (OR )

my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total ) %>% 
  filter(order == "Primates" | bodywt > 20) 

# 5 - based on multiple conditions (Multiple OR)

my_data <- msleep %>% 
  select(name, sleep_total ) %>% 
  filter(name == "Cow" |
           name == "Dog" |
           name == "Goat") 

# 6 - based on "in" condition (Same output as above)

my_data <- msleep %>% 
  select(name, sleep_total ) %>% 
  filter(name %in% c("Cow", "Dog", "Goat"))

# 7 - based on "Between" condition 

my_data <- msleep %>% 
  select(name, sleep_total ) %>% 
  filter(between(sleep_total, 16,18))

# 8 - based on "Near" condition
# Anything that is close to 17 and within 0.5 parameter

my_data <- msleep %>% 
  select(name, sleep_total ) %>% 
  filter(near(sleep_total, 17, tol= 0.5))

# 9 - based on "is.na" for filtering missing values

my_data <- msleep %>% 
  select(name, conservation, sleep_total ) %>% 
  filter(is.na(conservation))

# 10 - based on "is.na" for filtering NON missing values

my_data <- msleep %>% 
  select(name, conservation, sleep_total ) %>% 
  filter(!is.na(conservation))

# 11 -  Test Cases
  