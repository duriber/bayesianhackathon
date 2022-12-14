# Bayesian Statistics Workshop Hackathon 
# Deakin University
# Nov 2022.
# 
# Aim: Load and explore a dataset to model homerange of red fox
#
# Citation: Main et al., 2020. https://doi.org/10.1111/ddi.13115
# Data provider and contact details: Tim Doherty timothy.doherty@deakin.edu.au
# 
# 


# 1. Set up ---------------------------------------------------------------
## Import library
# library(dplyr)
# library(tidy)
# library(janitor)
# library(brms)

##  Import the data and check the structure
# Read in
foxdf <- read.csv("Dataset1/fox_data.csv")

# Data exploration
str(foxdf)
hist(foxdf$HR_mean) # mean home range in km2
hist(foxdf$HR_mean, breaks = 20) # try different bin sizes to make it more informative
hist(foxdf$log_HR_mean) # same but log-transformed for normality


# 2.  Analysis ------------------------------------------------------------

## Correlation matrix
# Create a correlation matrix to identify any predictor variables that may be correlated
source('rquery.cormat.R') # loads a handy correlation matrix function

corrMatrix <- corrmat(foxdf[,11:ncol(foxdf)], type = 'flatten')$r

# identify which pairs of predictors are highly correlated (r > 0.7)
corrMatrix[which(abs(corrMatrix$cor)>0.7),] # feel free to change this 0.7 threshold


# 3.  Models --------------------------------------------------------------
# David’s suggestion to get started: Gaussian (log) regression

