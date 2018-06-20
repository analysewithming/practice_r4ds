library(tidyverse)
library(nycflights13)

mtcars
head(mtcars)

output <- vector("double", ncol(mtcars))
for(i in seq_along(mtcars)){
  output[[i]] <- mean(mtcars[[i]])
}
output

mtcars %>% map(mean)

summary(mtcars)

output2 <- vector("character", ncol(flights))
for(i in seq_along(flights)){
  output2[[i]] <- typeof(flights[[i]])
}
output2

length(unique(iris[[i]]))

output3 <- vector("integer", ncol(iris))
names(output3) <- names(iris)
for(i in seq_along(iris)){
  output3[[i]] <- length(unique(iris[[i]]))
}
output3

x <- c(-10,0,10,100)
output4 <- vector("list", length(x))
names(output4) <- x


for(i in seq_along(output4)){
  output4[i] <- list(rnorm(10, mean = x[i]))
}

for(i in seq_along(output4)){
  output4[[i]] <- rnorm(10, mean = x[i])
}

output4


# number to draw
n <- 10
# values of the mean
mu <- c(-10, 0, 10, 100)
normals <- vector("list", length(mu))
for (i in seq_along(normals)) {
  normals[[i]] <- rnorm(n, mean = mu[i])
}


out <- ""
for (x in letters) {
  out <- stringr::str_c(out, x)
}
#
str_c(letters, collapse = "")

x <- sample(100)
sd <- 0
for (i in seq_along(x)) {
  sd <- sd + (x[i] - mean(x)) ^ 2
}
sd <- sqrt(sd / (length(x) - 1))
#
sd(x)

x <- runif(100)
out <- vector("numeric", length(x))
out[1] <- x[1]
for (i in 2:length(x)) {
  out[i] <- out[i - 1] + x[i]
}

#
cumsum(x)

nm <- 1:3
names(nm) <- c(NA,1,1)

for(i in names(nm)){
  print(i)
}

tiris <- as.tibble(iris)
tiris

output5 <- vector("double", ncol(iris))
j <- 0

length(iris)

for(i in seq_along(iris)){
  if(typeof(iris) == "double"){
    j <- j + 1;
  }
}

# using apply
## Compute row and column sums for a matrix:
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]
apply(x, 2, mean, trim = .2)
col.sums <- apply(x, 2, sum)
row.sums <- apply(x, 1, sum)
rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))

stopifnot( apply(x, 2, is.vector))

## Sort the columns of a matrix
apply(x, 2, sort)

## keeping named dimnames
names(dimnames(x)) <- c("row", "col")
x3 <- array(x, dim = c(dim(x),3),
            dimnames = c(dimnames(x), list(C = paste0("cop.",1:3))))
identical(x,  apply( x,  2,  identity))
identical(x3, apply(x3, 2:3, identity))

##- function with extra args:
cave <- function(x, c1, c2) c(mean(x[c1]), mean(x[c2]))
apply(x, 1, cave,  c1 = "x1", c2 = c("x1","x2"))

ma <- matrix(c(1:4, 1, 6:8), nrow = 2)
ma
apply(ma, 1, table)  #--> a list of length 2
apply(ma, 1, stats::quantile) # 5 x n matrix with rownames

stopifnot(dim(ma) == dim(apply(ma, 1:2, sum)))

## Example with different lengths for each call
z <- array(1:24, dim = 2:4)
zseq <- apply(z, 1:2, function(x) seq_len(max(x)))
zseq         ## a 2 x 3 matrix
typeof(zseq) ## list
dim(zseq) ## 2 3
zseq[1,]
apply(z, 3, function(x) seq_len(max(x)))
# a list without a dim attribute

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

models <- mtcars %>% 
  split(.$cyl) %>% 
  map(function(df) lm(mpg ~ wt, data = df))

flights %>% map(typeof)
iris %>% map(unique) %>% map(length)

x <- c(-10,0,10,100)

x %>% map(function(x) rnorm(n = 10, mean = x))
x %>% map(~rnorm(n = 10, mean = x))
x %>% map(rnorm, n=10)

mtcars %>% map_lgl(is.factor)
mtcars %>% map(is.factor)

map(1:5, runif)
map(list(1:5), runif)

map(-2:2, rnorm, n=5)
map_dbl(-2:2, rnorm, n=5)

models <- mtcars %>% 
  split(.$cyl) %>% 
  map(function(df) lm(mpg ~ wt, data = df))

x <- mtcars %>% 
  split(.$cyl)

x %>% map(function(df) lm(mpg~wt, data = df))
x %>% map(~lm(mpg~wt, data = .))
x %>% map(lm, mpg~wt)


log(10)
safe_log <- safely(log)
str(safe_log(10))
#> List of 2
#>  $ result: num 2.3
#>  $ error : NULL
str(safe_log("a"))
#> List of 2
#>  $ result: NULL
#>  $ error :List of 2
#>   ..$ message: chr "non-numeric argument to mathematical function"
#>   ..$ call   : language .f(...)
#>   ..- attr(*, "class")= chr [1:3] "simpleError" "error" "condition"


x <- list(1, 10, "a")

log(x)

y <- x %>% map(safely(log))
str(y)
#> List of 3
#>  $ :List of 2
#>   ..$ result: num 0
#>   ..$ error : NULL
#>  $ :List of 2
#>   ..$ result: num 2.3
#>   ..$ error : NULL
#>  $ :List of 2
#>   ..$ result: NULL
#>   ..$ error :List of 2


mu <- list(5, 10, -3)
mu %>% 
  map(rnorm, n = 5) %>% 
  str()
#> List of 3
#>  $ : num [1:5] 5.45 5.5 5.78 6.51 3.18
#>  $ : num [1:5] 10.79 9.03 10.89 10.76 10.65
#>  $ : num [1:5] -3.54 -3.08 -5.01 -3.51 -2.9
#>   .. ..$ message: chr "non-numeric argument to mathematical function"
#>   .. ..$ call   : language .f(...)
#>   .. ..- attr(*, "class")= chr [1:3] "simpleError" "error" "condition"


sigma <- list(1, 5, 10)
seq_along(mu) %>% 
  map(~rnorm(5, mu[[.]], sigma[[.]])) %>% 
  str()
#> List of 3
#>  $ : num [1:5] 4.94 2.57 4.37 4.12 5.29
#>  $ : num [1:5] 11.72 5.32 11.46 10.24 12.22
#>  $ : num [1:5] 3.68 -6.12 22.24 -7.2 10.37

map2(mu, sigma, rnorm, n=5) %>% str()

n <- list(1, 3, 5)
args1 <- list(n, mu, sigma)
args1 %>%
  pmap(rnorm) %>% 
  str()
#> List of 3
#>  $ : num 4.55
#>  $ : num [1:3] 13.4 18.8 13.2
#>  $ : num [1:5] 0.685 10.801 -11.671 21.363 -2.562

pmap(args1, rnorm)


args2 <- list(mean = mu, sd = sigma, m = n)
args2 %>% 
  pmap(rnorm) %>% 
  str()

f <- c("runif", "rnorm", "rpois")
param <- list(
  list(min = -1, max = 1), 
  list(sd = 5), 
  list(lambda = 10)
)

n <- c(1,2,3,4)

invoke_map(f, param, n) %>% str()

x <- list(1, "a", 3)

x %>% 
  walk(print)
#> [1] 1
#> [1] "a"
#> [1] 3
