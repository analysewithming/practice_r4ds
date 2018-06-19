library(tidyverse)

flights1 <- flights %>% 
  mutate(flight_id = row_number())

View(flights1)

head(Lahman::Batting)
summary(Lahman::Batting)
str(Lahman::Batting)

Lahman::Batting %>% 
  group_by(playerID, yearID, stint) %>% 
  filter(n()>1)


install.packages('babynames')
babynames::babynames %>% 
  group_by(year, sex, name) %>% 
  filter(n()>1)

install.packages('nasaweather')

nasaweather::atmos %>% 
  group_by(lat, long, year, month) %>% 
  filter(n()>1)

install.packages("fueleconomy")

fueleconomy::vehicles %>% 
  group_by(id)

diamonds %>% 
  group_by(x,y,z,price)


flights_delay <- flights %>% 
  group_by(dest) %>% 
  summarize(avg_dep_delay = mean(dep_delay, na.rm = T),
         avg_arr_dealy = mean(arr_delay, na.rm=T)) %>% 
  inner_join(airports, c("dest" = "faa"))

airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()

flights_delay %>% 
  ggplot(aes(lon, lat, color = avg_dep_delay))+
  borders("state")+
  geom_point()+
  coord_quickmap()

flights_location <- flights %>% 
  left_join(airports %>% select(faa, lat, lon), c("dest" = "faa"))

planes_age <- planes %>% 
  mutate(age = 2018 - year) %>% 
  select(tailnum, age)

flights_age <- flights %>% 
  left_join(planes_age, by = "tailnum") %>% 
  group_by(age) %>% 
  summarize(avg_arr_delay = mean(arr_delay, na.rm = T))

fg <- flights_age[1:46,]
cor(fg$age, fg$avg_arr_delay)
cov(fg$age, fg$avg_arr_delay)

fg %>% ggplot(aes(age, avg_arr_delay)) + geom_point()

  ggplot(aes(age, avg_arr_delay)) +
  geom_line()

top10 <- flights %>% 
  count(dest, sort = T) %>% 
  head(10)

flights %>%
  filter(dest %in% top10$dest)

flights %>% 
  semi_join(top10)

flights %>%
  anti_join(planes, by = "tailnum") %>% 
  count(carrier, sort = T) 

flights %>% 
  semi_join(planes, by = "tailnum") %>% 
  count(tailnum, sort = T) %>% 
  filter(n>400)

fueleconomy::vehicles %>%
  semi_join(fueleconomy::common)

fueleconomy::common


