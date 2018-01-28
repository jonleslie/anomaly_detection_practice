library(tidyverse)
library(data.tree)
library(broom)

blocks <- read_delim("data/page-blocks.data")


f <- file("https://archive.ics.uci.edu/ml/machine-learning-databases/page-blocks/page-blocks.data.Z",
          open = "r")
blocks <- read.table(f)

blocks <- read_csv("data/page-blocks.data", col_names = FALSE)[[1]]
# FromListSimple(blocks)

blocks_split <- str_split(blocks, "\\s+")
new_df2 <- tibble(height = sapply(blocks_split, function(x) {as.integer(x[1])}),
                  length = sapply(blocks_split, function(x) {as.integer(x[2])}),
                  area = sapply(blocks_split, function(x) {as.integer(x[3])}),
                  eccen = sapply(blocks_split, function(x) {as.numeric(x[4])}),
                  p_black = sapply(blocks_split, function(x) {as.numeric(x[5])}),
                  p_and = sapply(blocks_split, function(x) {as.numeric(x[6])}),
                  mean_tr = sapply(blocks_split, function(x) {as.numeric(x[7])}),
                  blackpix = sapply(blocks_split, function(x) {as.integer(x[8])}),
                  blackand = sapply(blocks_split, function(x) {as.integer(x[9])}),
                  wb_trans = sapply(blocks_split, function(x) {as.integer(x[10])}),
                  class = sapply(blocks_split, function(x) {as.factor(x[11])}))
head(new_df2)
head(blocks)
str(new_df2$height)
colMeans(new_df2[1:10])
summary(new_df2$class)

x <- map(blocks_split, str_split("\\s+"))
x <- walk(blocks_split, str_split("\\s+"))
problems(x)


# browseVignettes(package = "broom")
# tidy(blocks_split)
# glance(blocks_split[1])

blocks_split %>%
  unlist() %>% 
  head()

head(blocks_split)
FromListSimple(blocks_split)
str(blocks_split)

modify_depth(blocks_split, 1, as_tibble) %>% 
  pmap(., rbind) %>% 
  head() %>% 
  str()

parser
parse_integer(c("1", "2", "3")) %>% str()
parse_integer(blocks_split[1])

blocks %>% 
  str_split("\\s+") %>% 
  tibble() %>% str()
library(skimr)
skim(chickwts)
skim(blocks)



blocks_split[1] %>% str()
x <- parse_integer(c("1x", "blah", "3"))
problems(x)

?unnest
unnest(blocks_split)
skimr

new_df <- as_tibble(matrix(nrow = length(blocks),
                           ncol = 11))
for(i in 1:length(blocks)) {
  temp <- str_split(blocks[i], "\\s+")[[1]] 
  new_df[i,] <- temp
}
head(new_df)

Parsers <- str_split("blocks", "\\s+")



blocks[1]
test <- str_split(blocks[1], "\\s+")[[1]]
test


blocks <- blocks[[1]] %>% 
  tibble()


typeof(blocks)
test2 <- blocks[[1]][1:10]
str_split(test2[1], "\\s+")

str(blocks)
spec(blocks)

blocks <- read_tsv("data/page-blocks.data", col_names = FALSE)
blocks

blocks <- read_delim("data/page-blocks.data", delim = "\\s+", col_names = F)

blocks <- read_csv2("data/page-blocks.data", col_names = FALSE)
blocks

typeof(blocks)
length(blocks)

#library(scales)

list.files("data/", pattern = "*.data", full.names = TRUE) %>% 
  map_df(read_tsv, col_names = FALSE)

test <- readLines("data/page-blocks.data", n = 10)
test
test[1]
test[1][1]
length(test[1])


