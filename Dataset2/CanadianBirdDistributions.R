# Bayesian Statistics Workshop Hackathon 
# Deakin University
# Nov 2022.
#
# Aim: download and explore a publicly available dataset of
# 20 Canadian bird species distributions and environmental variables
# that could be potentially useful to model those distributions.
# 
# Citation: Elith et al., 2020 - https://doi.org/10.17161/bi.v15i2.13384
#
# Raster layers are available from https://osf.io/kwc4v/

# 1. Set up ---------------------------------------------------------------
## Import library
# install.packages("disdat")
# install.packages("raster")
# install.packages("corrplot")
# install.packages("terra") # only do this if youre going to change the code from raster package to terra (the new update of the raster package)
library(disdat)
library(raster)
library(corrplot)
# library(terra) # only do this if youre going to change the code from raster package to terra (the new update of the raster package)

# 1. Data ---------------------------------------------------------------------------------------------------------------------------------------

## 1.1 Presence-absence data from disdat package  -------------------------------------------------------------------------------------
CanPA <- disPa(region = "CAN") # Canadian bird species [70% species rare species]

## Data exploration ---
str(CanPA) # dataset structure

# how prevalent the species are within the dataset? 
# (N of presences / N sites)
hist(apply(CanPA[5:ncol(CanPA)], 2, mean)) # apply across species columns ( 2 means columns)
hist(apply(CanPA[5:ncol(CanPA)], 2, mean), breaks = 12) # try different bin sizes

# number of presences per species
apply(CanPA[5:ncol(CanPA)], 2, sum)


## Correlation matrix ---
# Create a correlation matrix to identify any predictor variables that may be correlated
source('rquery.cormat.R') # loads a handy correlation matrix function
corrMatrix <- corrmat(CanEnv[,5:ncol(CanEnv)], type = 'flatten')$r
# identify which pairs of predictors are highly correlated (r > 0.7)
corrMatrix[which(abs(corrMatrix$cor)>0.7),] # feel free to change this 0.7 threshold

## 1.2 Environmental predictors extracted for each site  -------------------------------------------------------------------------------------
# download from the package
CanEnv <- disEnv(region = "CAN") 

## Data exploration
str(CanEnv)

## 1.3 Environmental predictors in raster format ---------------------------------------------------------------------------------------------------------------------------
listrasterfiles <- list.files('rasters_Can/', 
                              pattern = '.tif', 
                              full.names = TRUE)
Env_stack <- stack(listrasterfiles)

## Data exploration ---
Env_stack # print stack metadata
plot(Env_stack) # or map it

##  Plot the sites on top of the first layer of the stack ---
plot(Env_stack[[1]]) # remember to use 2 square brackets when selecting layers from a raster
points(SpatialPoints(CanPA[,c('x', 'y')], proj4string = crs(Env_stack)))



# 2. Models ---------------------------------------------------------------


