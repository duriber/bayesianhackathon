# Bayesian Statistics Workshop Hackathon 
# Deakin University
# Nov 2022.
# 
# Aim: Load and explore a dataset to investigate shorebird roosting behaviour and roosting time standing on one leg for 9 bird species
#
# Citation: Ryeland, Weston and Symonds 2019. https://doi.org/10.1111/jav.02008
# Appendix: http://www.avianbiology.org/appendix/jav-02008
# Data provider and contact details: Matt Symonds matthew.symonds@deakin.edu.au
# Data available on dryad: http://www.avianbiology.org/appendix/jav-02008
# 


# 0. set up ---------------------------------------------------------------
## Load libraries
# install.packages("dplyr")
# install.packages("lme4")
# install.packages("brms")
# library(dplyr) # data cleaning
library(lme4) # frequentist approach for comparison
library(brms)


# 1. Data -----------------------------------------------------------------
df <- read.csv("Dataset4/Roostingdata.csv")

head(df)

hist(df$OL_success)
hist(df$OL_fail)

plot(df$OL_pc, df$AvTemp)
plot(df$OL_pc, df$AvWind)


# 2. model ----------------------------------------------------------------
# the paper describes the bayesian approach they took

# if using OL_success or OL_fail, remember this is a count. so consider poisson
