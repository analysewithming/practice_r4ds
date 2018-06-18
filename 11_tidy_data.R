library(tidyverse)

tb2_1 <- table2 %>% 
  filter(type == "cases") %>% 
  select(year, country, cases = count)
tb2_2 <- table2 %>% 
  filter(type == "population") %>%
  select(year, country, population = count)

table4a
table4b

tb4_clean <- gather(table4a, )
