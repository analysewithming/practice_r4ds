library(tidyverse)

tb2_1 <- table2 %>% 
  filter(type == "cases") %>% 
  select(year, country, cases = count)
tb2_2 <- table2 %>% 
  filter(type == "population") %>%
  select(year, country, population = count)

table4a
table4b

tb4_1 <- table4a %>% 
  gather(`1999`, `2000`, key = "Year", value = "cases")

tb4_2 <- table4b %>% 
  gather(`1999`, `2000`, key = "Year", value = "populations")

table4_clean <- left_join(tb4_1, tb4_2)

table2 %>% spread(type, count)

# --- ex 
stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`)

table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")

people <- tribble(
  ~name,             ~key,    ~value, ~obs,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45, 1,
  "Phillip Woods",   "height",   186, 1,
  "Phillip Woods",   "age",       50, 2,
  "Jessica Cordero", "age",       37, 1,
  "Jessica Cordero", "height",   156, 1
)

people %>% spread(key, value)  

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)

preg %>% gather(male, female, key = "sex", value = "num")

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"), extra="merge")

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"))

tidyr::who

who1 <- who %>% gather(new_sp_m014:newrel_f65, key = key, value = value)
who1$key <- str_replace(who1$key, pattern = "newrel", replacement = "new_rel")
who1 <- who1 %>% separate(key, into = c("new", "type", "sexage"), sep="_")
who1 <- who1 %>% separate(sexage, into = c("sex", "age"), sep=1)
