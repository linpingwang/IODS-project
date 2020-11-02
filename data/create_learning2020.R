# Linping Wang 02-NOV-2020


## loading data
learning2014 <- read.table(
  "http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt",
  sep="\t", header=TRUE)
names(learning2014)
str(learning2014)
head(learning2014)
write.csv(learning2014, "learning2014.csv")



## analysis
install.packages("tidyr")
install.packages("dplyr")
library("tidyr")
library("dplyr")

dataset <- select(learning2014, "gender", "Age", "Attitude","deep", "stra", , "surf",,"Points")
