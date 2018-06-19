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

str_wrap()

thanks_path <- file.path(R.home("doc"), "THANKS")
thanks <- str_c(readLines(thanks_path), collapse = "\n")
thanks <- word(thanks, 1, 3, fixed("\n\n"))
cat(str_wrap(thanks))
cat(str_wrap(thanks), "\n")
cat(str_wrap(thanks, width = 40), "\n")
cat(str_wrap(thanks, width = 60, indent = 2), "\n")
cat(str_wrap(thanks, width = 60, exdent = 2), "\n")
cat(str_wrap(thanks, width = 0, exdent = 2), "\n")

str_trim()

str_trim("  String with trailing and leading white space\t")
str_trim("\n\nString with trailing and leading white space\n\n")

str_squish("  String with trailing,  middle, and leading white space\t")
str_squish("\n\nString with excess,  trailing and leading white   space\n\n")
