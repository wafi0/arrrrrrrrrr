#install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)

data <-
  palmerpenguins::penguins %>%
  count(island, species) %>%
  pivot_wider(names_from = species, values_from = n)

(data)

data %>%
  rowwise() %>%
  mutate(Total = sum(Adelie, Gentoo, Chinstrap, na.rm = TRUE)) %>%
  ungroup() %>%
  bind_rows(
    .,
    summarise(.,
      island = "Total",
      Adelie = sum(Adelie),
      Gentoo = sum(Gentoo, na.rm = TRUE),
      Chinstrap = sum(Chinstrap, na.rm = TRUE),
      Total = sum(Total)
    )
  )

# Alternatively
palmerpenguins::penguins %>%
  select(island, species) %>%
  table() # uses base R(but no row/col sumaries)

# and so on...

