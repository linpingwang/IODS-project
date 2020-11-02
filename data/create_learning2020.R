# Linping Wang 02-NOV-2020

#####################################################################################################
## loading data
data <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(data)
str(data)
names(data)
library("dplyr")

## Combining variables
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

## select the columns related to deep 
deep_columns <- select(data, one_of(deep_questions))
data$deep <- rowMeans(deep_columns)

## select the columns related to surface
surface_columns <- select(data, one_of(surface_questions))
data$surf <- rowMeans(surface_columns)

## select the columns related to strategic learning
strategic_columns <- select(data, one_of(strategic_questions))
data$stra <- rowMeans(strategic_columns)


################################################################
## Selecting columns
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
learning2014 <- select(data, one_of(keep_columns))

## rename columns
learning2014 <- rename(learning2014, c("age" ="Age", "attitude" = "Attitude", "points"="Points" ))
names(learning2014)

## data export
setwd("C:/LocalData/linwang/OneDrive - University of Helsinki/course/Open data science 2020/IODS-project/data")
write.csv(data, "data.csv")

#####################################################################################################

