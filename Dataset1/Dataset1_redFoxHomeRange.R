# Bayesian Statistics Workshop Hackathon 
# Deakin University, Nov 2022.
# 
# Script to load and explore a dataset to model homerange of red fox
# citation: Elith et al 2020 - https://doi.org/10.17161/bi.v15i2.13384
# 
# 

# Import the data and check the structure
foxdf<-read.csv("Dataset1/fox_data.csv")
str(foxdf)# print data structure
hist(foxdf$HR_mean) # mean home range in km2
hist(foxdf$log_HR_mean) # same but log-transformed for normality

# Create a correlation matrix to identify any predictor variables that may be correlated
source('rquery.cormat.R') # loads a handy correlation matrix function
corrMatrix <- corrmat(foxdf[,11:ncol(foxdf)], type = 'flatten')$r
# identify which pairs of predictors are highly correlated (r > 0.7)
corrMatrix[which(abs(corrMatrix$cor)>0.7),] # feel free to change this 0.7 threshold

