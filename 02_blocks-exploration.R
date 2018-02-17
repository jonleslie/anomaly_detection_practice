library(tidyverse)
library(data.tree)
library(broom)

# blocks_delim <- read_delim("data/page-blocks.data", delim = "\\s+")
# blocks_delim# 
# ?read_delim 
# f <- file("https://archive.ics.uci.edu/ml/machine-learning-databases/page-blocks/page-blocks.data.Z",
#           open = "r")
# blocks <- read.table(f)

blocks <- read_csv("data/page-blocks.data", col_names = FALSE)[[1]]
blocks_tbl <- tibble(string = blocks)
blocks_tbl
blocks_tbl <- blocks_tbl %>% 
  mutate(string_list = map(string, ~ str_split(.x, "\\s+"))) 
blocks_tbl

blocks_tbl <- blocks_tbl %>% 
  mutate(height = as.integer(map_chr(string_list, ~ .x[[1]][1])),
         length = as.integer(map_chr(string_list, ~ .x[[1]][2])),
         area = as.integer(map_chr(string_list, ~ .x[[1]][3])),
         occen = as.numeric(map_chr(string_list, ~ .x[[1]][4])),
         p_black = as.numeric(map_chr(string_list, ~ .x[[1]][5])),
         p_and = as.numeric(map_chr(string_list, ~ .x[[1]][6])),
         mean_tr = as.numeric(map_chr(string_list, ~ .x[[1]][7])),
         blackpix = as.integer(map_chr(string_list, ~ .x[[1]][8])),
         blackand = as.integer(map_chr(string_list, ~ .x[[1]][9])),
         wb_trans = as.integer(map_chr(string_list, ~ .x[[1]][10])),
         class = as.factor(map_chr(string_list, ~ .x[[1]][11]))) %>% 
  select(height:class)
blocks_tbl
blocks_tbl %>% 
  select(-class) %>% 
  colMeans()
