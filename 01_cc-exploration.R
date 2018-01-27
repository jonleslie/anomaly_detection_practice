# https://www.kaggle.com/dalpozz/creditcardfraud
# https://archive.ics.uci.edu/ml/datasets/internet+advertisements
# https://archive.ics.uci.edu/ml/datasets/Page+Blocks+Classification

library(tidyverse)
library(data.tree)

df <- read_csv("data/creditcard.csv", col_types = cols(Time = col_double()))
spec(df)
df %>% 
  select(Time) %>% 
  range()

