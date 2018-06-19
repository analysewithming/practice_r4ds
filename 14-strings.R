library(tidyverse)
library(stringr)

str_c("A", "B", "C")
str_c("A", "B", "C", sep = ",")

x <- c("A", "B", "C")
str_c(x, "a", collapse = ",")

y <- c("Apple", "Banana", "Pear")
str_sub(y, 1, 3)
str_sub(y, -3,-1)

paste("A", "B", NA)
paste0("A", "B", NA)

midstr <- function(string){
  len <- str_length(string)
  if(len %% 2 == 0) {
    str_sub(string, len/2, len/2+1)
  } else {
    str_sub(string, ceiling(len / 2), ceiling(len / 2))
  }
}

3 %% 2
ceiling(1.5)

midstr("abcdef")
