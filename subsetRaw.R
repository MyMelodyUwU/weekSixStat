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

# Read command, what type of sepeator of different bits

rawdata = read.delim("Raw_file.txt", sep = "\t", header = TRUE)

# look at structure what type / what variables are there

str(rawdata)

# Tidying the data using baser

head(rawdata)

# Construct only the sammler data set and take the subset
# THings that satisfy the conditions and save into a new object

mydata = subset(rawdata, Q03_tv == 1)


head(mydata)

# interest in some variables only
wantedCols = c("Q01_gender", "Q02_hair.cost", "Q03_tv")
genderTVhairdat = subset(rawdata, select = wantedCols)
str(genderTVhairdat)
head(genderTVhairdat)

mydata = subset(rawdata, Q01_gender == 1 & Q02_hair.cost > 20)
head(mydata)

#select all the variables

rawdata %>% filter(Q01_gender == 1 & Q02_hair.cost > 20) %>%
  select(Q01_gender, Q02_hair.cost)

# pick all columns from 10 -> 21 and column 24

relevantCols = c(10:21, 24)
relevantdata = rawdata[, relevantCols]
head(relevantdata)

#
substr(colnames(rawdata),1,2)

relevantCols = c("Q01_gender", "Q02_hair.cost", "Q03_tv")
relevantdata = rawdata[, relevantCols]
head(relevantdata)

# extract values check if q is true or calse
relevantCols = substr(colnames(rawdata), 1, 1) == "Q"
relevantCols


relevantdata = rawdata[, relevantCols]
colnames(relevantdata)

colnames(genderTVhairdat)

newnames = c("Gender", "Hair Cost", "TV")
colnames(genderTVhairdat) = newnames
colnames(genderTVhairdat)

head(genderTVhairdat)

colnames(genderTVhairdat)

# Change the column names

colnames(genderTVhairdat)[1] = "Sex"
colnames(genderTVhairdat)

genderTVhairdat = rawdata %>%
  select("Q01_gender", "Q02_hair.cost", "Q03_tv") %>%
  rename("Sex" = "Q01_gender",
         "hair_cost" = "Q02_hair.cost",
         "TV" = "Q03_tv")

str(genderTVhairdat)

str(1:10)

# Manual recoding
gender = genderTVhairdat$Sex
gender

gender[gender == 1] = "Male"
gender[gender == 2] = "Female"
gender

oldValues = 1:2
newValues = c("Male", "Female")
gender = genderTVhairdat$Sex
gender

gender = newValues[match(gender, oldValues)]
gender

oldValues = 1:2
newValues = factor(c("Male", "Female"))
gender = genderTVhairdat$Sex
gender

gender = newValues[match(gender, oldValues)]
gender

genderTVhairdat %>%
  mutate(Sex = recode(Sex, `1` = "Male", `2` = "Female"))
