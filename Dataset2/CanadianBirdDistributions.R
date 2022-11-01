# Bayesian Statistics Workshop Hackathon 
# Deakin University, Nov 2022.
# Script to download and explore a publicly available dataset 
# of 20 Canadian bird species distributions and environmental variables
# that could be potentially useful to model those distributions
# citation: Elith et al 2020 - https://doi.org/10.17161/bi.v15i2.13384
# Raster layers are available from https://osf.io/kwc4v/

library(disdat)

# Downloading presence-absence data from disdat package 

# Canadian bird species [70% species rare species]
CanPA <- disPa(region = "CAN")
str(CanPA) # dataset structure
# how prevalent the species are within the dataset? 
# (N of presences / N sites)
hist(apply(CanPA[5:ncol(CanPA)], 2, mean)) # apply across species columns

# number of presences per species
apply(CanPA[5:ncol(CanPA)], 2, sum)

# Environmental predictors extracted for each site
CanEnv <- disEnv(region = "CAN")
str(CanEnv) # dataset structure

# Create a correlation matrix to identify any predictor variables that may be correlated
source('rquery.cormat.R') # loads a handy correlation matrix function
corrMatrix <- corrmat(CanEnv[,5:ncol(CanEnv)], type = 'flatten')$r
# identify which pairs of predictors are highly correlated (r > 0.7)
corrMatrix[which(abs(corrMatrix$cor)>0.7),] # feel free to change this 0.7 threshold


# Environmental predictors in raster format
library(raster)
listrasterfiles <- list.files('rasters_Can/', 
                              pattern = '.tif', 
                              full.names = TRUE)
Env_stack <- stack(listrasterfiles)
Env_stack # print stack metadata
plot(Env_stack) # or map it

# mapping the sites on top of the first layer of the stack
plot(Env_stack[[1]])
points(SpatialPoints(CanPA[,c('x', 'y')], proj4string= crs(Env_stack)))
