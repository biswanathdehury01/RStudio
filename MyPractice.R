
a <- c(1,2,3,4,5)
b <- c(2,3,NA,5,6)
c <- c(3,4,5,NA,7)
table <- data.frame(a,b,c)


table <- table %>% mutate(Type = "Mango")
View(table)

table[is.na(table$b)] <- 0
table[is.na(table$c)] <- 0

