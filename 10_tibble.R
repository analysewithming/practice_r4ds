# How can you tell if an object is a tibble? (Hint: try printing mtcars, which is a regular data frame).
mtcars
is.tibble(mtcars)
mt <- as.tibble(mtcars)
is.tibble(mt)

df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]

tb <- tibble(abc = 1, xyz = "a")
tb$x
tb[, "xyz"]
tb[, c("abc", "xyz")]

var <- "mpg"
mt[[var]]
mtcars[[var]]

annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)

View(annoying)

annoying[["1"]]
annoying[[1]]
annoying$"1"

annoying %>% 
  ggplot() + geom_point(aes(x=`1`, y=`2`))

annoying2 <- annoying %>% 
  mutate( `3` = `2` / `1`)

colnames(annoying2) <- c("one", "two", "three") 

?enframe


ef <- enframe(c(1:3, 2:4))
ef <- enframe(c(a=5, b=7))
