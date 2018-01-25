library(tidyverse)

df <- read_csv("data/creditcard.csv", col_types = cols(Time = col_double()))
spec(df)
df %>% 
  select(Time) %>% 
  range()
