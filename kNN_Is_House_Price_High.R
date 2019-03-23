library(readr)    #import the readr package
df <- read_csv("C:/Users/amrit/OneDrive/Desktop/BostonHousing(1).csv")    #Read the file and save it to dataframe df


#Block comment is Ctrl_Shift+C
df$CHAS=NULL
df$ISHIGHVAL=as.factor(df$I)
df$RAD=NULL
df$MEDV=NULL

n             = nrow(df)                    #No of observations
training_size = round(n*0.6)                #training size is 60% of total observations
training_rows = sample(n, training_size)    #simple random sample
training      = df[training_rows,]          #create new df
testing       = df[-training_rows,]         

source('C:/Users/amrit/Downloads/BabsonAnalytics.R')      #Load Clustering Functions
predictions = kNN(ISHIGHVAL ~ ., training, testing, k = 3)
observations = test$ISHIGHVAL
table(predictions, observations)
error_rate = 1- sum(observations == predictions)/nrow(test)
error_bench = benchmarkErrorRate(training$ISHIGHVAL, testing$ISHIGHVAL)


