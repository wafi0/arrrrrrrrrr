library(nycflights13)
library(dplyr)
flights <- nycflights13::flights

avgDurs <- flights %>%
  filter(dest == "LAX", month == 5, origin == "JFK") %>%
  filter(carrier %in% c("AA", "UA", "DL", "US")) %>%
  select(carrier, air_time) %>%
  group_by(carrier) %>%
  summarise(
    avg_airtime = mean(air_time, na.rm = TRUE)
  )

(avgDurs)

shortest_dist <- flights %>%
  group_by(origin) %>%
  summarize(
    shortest_distance = min(distance, na.rm = TRUE)
  )

(shortest_dist)

shortest_duration <- flights %>%
  group_by(origin) %>%
  summarize(
    shortest_duration = min(air_time, na.rm = TRUE)
  )

(shortest_duration)

most_frequent_leaver <-flights %>%
  drop_na %>%
  group_by(origin, tailnum) %>%
  summarize(count = n()) %>%
  slice(which.max(count))
  
(most_frequent_leaver)

best_date <- flights %>%
  group_by(month, day) %>%
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE)
  ) %>%
  arrange(avg_delay)

(best_date)