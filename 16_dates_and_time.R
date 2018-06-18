library(tidyverse)
library(lubridate)
library(nycflights13)

# today and now
today()
now()

# get the date from string
ymd("2018 Jan 12")
mdy("Jan, 12, 2018")
mdy("February, 12, 2018") # wrong spelling, month will direct to Dec
dmy("12-01-2018")
ymd(20180112)

# testing the wrong formant
mdy(01991929)

ymd_hms("20180223 13:20:30")
mdy_hm("02232018 13:20")
# single digit of month or day is not working
ymd_hms("2018223 13:20:30")

flights %>% 
  select(year, month, day, hour, minute) %>%
  mutate(dept_time = make_datetime(year, month, day, hour, minute))

make_datetime_100 <- function(year, month, day, time){
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>% 
  select(origin, dest, ends_with("time"), ends_with("delay"))

flights_dt %>% 
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 86400)


flights_dt %>% 
  filter(dep_time < ymd(20130102)) %>% 
  ggplot(aes(dep_time)) + 
  geom_freqpoly(binwidth = 600) # 600 s = 10 minutes

as_datetime(today())
as_date(now())

as_datetime(60*60*10)
as_date(365*11+1)


ymd(c("2010-10-10", "bananas"))
?today

today(tzone = "GMT")
today()

d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014

mdy(d1)
ymd(d2)
dmy(d3)
mdy(d4)
mdy(d5)

year(d6)
day(d6)
mday(d6)
yday(d6)
wday(d6)

month(d6)

# ----
d6 <- now()
dseconds(15)
dminutes(15)
dhours(2)
ddays(1)
dweeks(1)
dyears(1)




