########################################
#### REGRESSION #########
#######################################

date <- c('3-June', '10-June','17-June', '24-June', '1-Jul', '8-Jul','15-Jul', '22-Jul', '29-Jul')
Takings <- c(3213,2098,2253,1801,801,1934,1720,1514,1071)
Temp <- c(23,21,25,18,13,16,13,17,12)
Temp_sq <- Temp * Temp

reg_data <- data.frame(date,Takings, Temp)

#View(reg.data)


######################################
#install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
library(purrr)

ggplot(reg.data, aes(x=Temp, y=Takings)) + geom_point() + stat_smooth(method = "lm", se= FALSE)

# Scatter Plot
plot(x=reg.data$Temp, y=reg.data$Takings, main = "REGRESSION")

# regression

model <- lm(Takings ~ Temp + Temp_sq -1, data = reg.data)
summary(model)



abline(lm(Takings ~ Temp , data = reg.data), col="blue")
abline(lm(Takings ~ Temp + Temp_sq , data = reg.data), col="red")
abline(lm(Takings ~ Temp + Temp_sq -1 , data = reg.data), col="green")


########################################

# REGRESSION Functoin

lm_equation <-  function(df){
  model <- lm(y ~x, df)
  equation <- substitute(italic(y) == a + b %.% italic(x)* ", "~~italic(r)^2~"="~r2,
                         list(a = format(unname(coef(model)[1]),digits = 2),
                              b = format(unname(coef(model)[2]), digits = 2),
                              r2 = format(unname(coef(model)$r.squared), digits = 3)
                              #pval = format(unname(coef(model)[4]), digits = 3)
                         ) 
  )
  as.character(as.expression(equation));
  
}

new_reg_data <- reg_data[['Temp', 'Takings']]

p <- ggplot(data = reg.data, aes(x=Temp, y=Takings)) +
  geom_smooth(method = "lm", se=FALSE, color="blue", formula = y ~ x) +
  geom_point()  

df <- data.frame(x = c(1:100))
df$y <- 2 + 3 * df$x + rnorm(100, sd = 40)

p1 <- p + geom_text(x = 25, y = 300, label = lm_eqn(df), parse = TRUE)  
p1

############################################################

library(ggplot2)
library(ggpmisc)

df <- data.frame(x = c(1:100))
df$y <- 2 + 3 * df$x + rnorm(100, sd = 40)
my.formula <- y ~ x

p <- ggplot(data = df, aes(x = x, y = y)) +
  geom_smooth(method = "lm", se=FALSE, color="black", formula = my.formula) +
  stat_poly_eq(formula = my.formula,
               eq.with.lhs = "italic(hat(y))~`=`~",
               aes(label = paste(..eq.label.., 
                                 ..rr.label.., 
                                 sep = "~~~")), 
               parse = TRUE) +         
  geom_point()

p

###########################################################













