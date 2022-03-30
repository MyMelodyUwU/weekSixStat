cleandat = read.table("clean-survey.txt", header = TRUE)
str(cleandat)

# make columns
mydat = transform(cleandat, sqrtLabour = sqrt(labour.cost))
head(mydat)

# change columns

mydat = transform(cleandat, Ratio = labour.cost/hair.cost)
head(mydat)

# Clean data
cleandat %>% mutate(Ratio = labour.cost/hair.cost) %>%
  select(labour.cost, hair.cost, Ratio)


quantVars = c("hair.cost", "labour.cost", "travel.time")
quantDat = subset(cleandat, select = quantVars)
head(quantDat)
head(quantDat, n = 3)

apply(quantDat, 2, mean)


quantDat %>% summarise(average_hair_cut = mean(hair.cost),
                       average_labour_cost = mean(labour.cost))

# check for missing data
any(is.na(cleandat$hair.cost))

badHaircut = which(is.na(cleandat$hair.cost))
badHaircut

cleandat[badHaircut, ]

head(quantDat, n = 3)

apply(quantDat, 2, mean, na.rm = TRUE) # Option to ignore NAs

# quantDat %>% summarise(average_hair_cut = mean(hair.cost, na.rm = TRUE) average_labour_cost = mean(labour.cost))

boxplot(cleandat$labour.cost,
        main = "Labour cost for hour of time")


max(cleandat$labour.cost)

finalDat = cleandat
# Find the dodgy entrepeneurs
expen = which(finalDat$labour.cost > 1000)
expen

# Create copy of original Labour costs
finalDat$missingLabour = finalDat$labour.cost
# Filter out the expensive labour costs
finalDat$missingLabour[expen] = NA


# Create copy of original Labour costs
finalDat$trimmedLabour = finalDat$labour.cost
# Filter out the expensive labour costs
finalDat$trimmedLabour[expen] = 1000
mean(finalDat$trimmedLabour)

write.table(finalDat, file = "final-survey.txt",
            # Optional house-keeping
            quote = FALSE, row.names = FALSE)




