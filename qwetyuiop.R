
og <- read.csv("original_data.csv", header=TRUE)

mean(og$height)
hi = log(mean(og$height))

bye = mean(log(og$height))
