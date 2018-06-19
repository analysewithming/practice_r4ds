library(tidyverse)
library(magrittr)

assign('x', 10)

env <- environment()
"x" %>% assign(14, envir = env)


head(mtcars)

mtcars %$% cor(disp, mpg)

summary(mtcars)
mean(mtcars$disp, trim = 0.01)

x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

x <- (1:10)
