library("tidyverse")
library("devtools")
library("glue")
library("dplyr")
library("stringr")
library("ggplot2")
library("knitr")
library("ggrepel")
library("patchwork")
library("janitor")
library("usethis")
library("roxygen2")
library("testthat")

food <- factor(c(2,1,2,1,3,3))

food[1] = 3

levels(food) = c("KFC", "Subway", "Mcdonalds")
str(food)

relevel(food, ref="Mcdonalds")

food <- factor(food, levels = sort(levels(food)))

#ytb
lunch <- list(4,c("fork", "knife"), food)

#add heading names to list
names(lunch) <- c("GuestNumber", "Utensil", "Meal")
