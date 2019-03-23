library(readr)
df    = read_csv("C:/Users/amrit/Downloads/ExpectancyFertility.csv")
install.packages("caret")
library(ggplot2)
library(lattice)
library(caret)
standardizer = preProcess(df, method = c("scale","center"))

df = predict(standardizer,df)

df    = na.omit(df)
model = kmeans(df,3)

plot(df, col=model$cluster)
#printing out model$cluster gives us what cluster each country belongs to
#check out the centroid using model$centers
#check out for individual country like model$clisyet[24]

source('C:/Users/amrit/Downloads/BabsonAnalytics.R')
elbowChart(df)
