### Data Visualization

# Data
# mapping(aesthetics)
# geometric representation
# statistics
# facet
# Coordinate space
# labels
# theme


library(tidyverse)

# Built in Datasets32.0
data()
?BOD

######################
# x - independent variable, y  - dependend variable
ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand)) + 
  # size will make the points more bolder
  geom_point(size = 5) +
  geom_line(color = "red")
#######################

ggplot(BOD, aes(Time, demand)) + 
  geom_point(size = 3) +
  geom_line(color = "green")

######################

View(CO2)
names(CO2)

# > names(CO2)
# [1] "Plant"     "Type"      "Treatment" "conc"      "uptake"

"NOTE: As in below if you are piping the dataset, ggplot already knows it.
So directly you can give your aes x an y"


CO2 %>% 
  ggplot(aes(conc,uptake,
             colour = Treatment)) +
  geom_point()


CO2 %>% 
  ggplot(aes(conc,uptake,
             colour = Treatment)) +
  geom_point(sixe = 3, alpha = 0.5) +
  geom_smooth()

CO2 %>% 
  ggplot(aes(conc,uptake,
             colour = Treatment)) +
  geom_point(sixe = 3, alpha = 0.5) +
  geom_smooth(method = lm, se = FALSE) +
  facet_wrap(~Type) # this will group by based on Type feild


CO2 %>% 
  ggplot(aes(conc,uptake,
             colour = Treatment)) +
  geom_point(sixe = 3, alpha = 0.5) +
  geom_smooth(method = lm, se = FALSE) +
  facet_wrap(~Type) + # this will group by based on Type feild
  labs(title = "Concetration of CO2") +
  theme_bw()

##################################


CO2 %>% ggplot(aes(Treatment, uptake)) + 
  geom_boxplot()

CO2 %>% ggplot(aes(Treatment, uptake)) + 
  geom_boxplot() +
  geom_point()

CO2 %>% ggplot(aes(Treatment, uptake)) + 
  geom_boxplot() +
  geom_point(aes(size = conc,
                 colour = Plant))

CO2 %>% ggplot(aes(Treatment, uptake)) + 
  geom_boxplot() +
  geom_point(alpha = 0.5,
             aes(size = conc,
                 colour = Plant))


CO2 %>% ggplot(aes(Treatment, uptake)) + 
  geom_boxplot() +
  geom_point(alpha = 0.5,
             aes(size = conc,
                 colour = Plant)) + 
  facet_wrap(~Type) + 
  coord_flip() +
  theme_classic() +
  labs(title = "Chilled vs nonChillded")

#########################################


View(mpg)


mpg %>% ggplot(aes(displ, cty)) +
  geom_point() +
  geom_point(aes(color = drv,
                 size = trans),
             alpha =0.5) +
  geom_smooth()

mpg %>% ggplot(aes(displ, cty)) +
  geom_point() +
  geom_point(aes(color = drv,
                 size = trans),
             alpha =0.5) +
  geom_smooth( method = lm) +
  facet_wrap(~year, nrow = 1)


mpg %>% 
  filter(cty < 25) %>% 
  ggplot(aes(displ, cty)) +
  geom_point() +
  geom_point(aes(color = drv,
                 size = trans),
             alpha =0.5) +
  geom_smooth( method = lm) +
  facet_wrap(~year, nrow = 1) +
  labs(x = "Engine Size",
       y= "MPG in the city",
       title = " Fuel Efficiency") +
  theme_bw()


#############################

"Bar Charts and Histograms"

data()
?msleep
View(msleep)
names(msleep) # gives the column names in a dataset


msleep %>% 
  drop_na(vore) %>%  # this is to drop the NAs from vore features
  ggplot(aes(x = vore)) +
  geom_bar(fill = "#97B3C6") + # for bar charts
  theme_bw() +
  labs(x = "Vore",
       y = NULL,
       title = "Number of observations per order")


msleep %>% 
  drop_na() %>%  # this is to drop the NAs from entire dataset
  ggplot(aes(x = vore)) +
  geom_bar(fill = "#C2462B") + # for bar charts # for the hex code htmlcolorcodes.com
  theme_bw() +
  labs(x = "Vore",
       y = NULL, 
       title = "Number of observations per order")

msleep %>% 
  drop_na() %>%  # this is to drop the NAs from entire dataset
  ggplot(aes(x = vore)) +
  geom_bar(fill = "#C2462B") + # for bar charts # for the hex code htmlcolorcodes.com
  coord_flip() +
  theme_bw() +
  labs(x = "Vore",
       y = NULL, 
       title = "Number of observations per order")

# This is a single numeric feature
msleep %>% 
  ggplot(aes(awake)) +
  geom_histogram(bandwidth = 2, fill = "#97B3C6") + # HIstogram   
  theme_bw() +
  labs(x = "Total Sleep",
       y = NULL,
       title ="Histogram of total sleep")


##############################

" Two mumerical variables and One categorical variables"


View(Orange)

names(Orange)

# Tree is a categorical feature and age and circumference are numeric features

Orange %>% 
  filter(Tree != "2") %>% 
  ggplot(aes(age, circumference)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~Tree) +
  theme_bw() +
  labs(title = "Tree age and circumference")




