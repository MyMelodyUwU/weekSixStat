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

dough.dat <- read.table("dough.txt", header=TRUE)

# h0 == all means are equal
# h1 == all means are not equal

boxplot(dough.dat$times ~ dough.dat$recipe)

tapply(dough.dat$times, dough.dat$recipe, sd)

# Equal vairance assumption is not satisifed

# Apply the analysis of variance on it
dough.aov <- aov(dough.dat$times ~ dough.dat$recipe, data = dough.dat)
dough.aov$residuals

anova(dough.aov)

plot(dough.aov)

summary(dough.aov)

hist(dough.aov$residuals)

qqnorm(dough.aov$residuals)


TukeyHSD(dough.aov)

pairwise.t.test(dough.dat$times, dough.dat$recipe, p.adj = "none")

pairwise.t.test(dough.dat$times, dough.dat$recipe, p.adj = "bonf")

kruskal.test(dough.dat$times, dough.dat$recipe)
