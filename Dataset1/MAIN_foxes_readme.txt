-------------------
GENERAL INFORMATION
-------------------

Title of Dataset: Human impact overrides bioclimatic drivers of red fox home range size globally

Principal Investigator: Michael Main, Edith Cowan University, m.main@ecu.edu.au

Date of data collection: Database compiled in 2018/19.

Geographic location of data collection: Global.

--------------------
DATA & FILE OVERVIEW
-------------------- 
fox_data.csv: Dataset comprised of study details, home range estimates and predictor variables.

fox_code.R: R code for conducting the statistical analyses.

--------------------------
DATA-SPECIFIC INFORMATION 
--------------------------
fox_data.csv

Number of variables: 25

Number of cases/rows: 70

Variable list:

'Row_number': Numeric identifier for each record.

'Study_ID': Identifier for each study.

'First_author': Surname of first author of the study.

'Continent': Continent within which the data were collected.

'Location': City/town/region and country within which the data were collected.

'Latitude': Central latitude of study location (decimal degrees).

'Longitude': Central longitude of study location (decimal degrees).

'HR_mean': Mean home range size from the study (km2).

'log_HR_mean': Natural log of HR_mean.

'HFI_year': Reference year that Human Footprint Index variables were used from (1993 or 2009).

'Built_areas': Mean score of built-up areas within a 10-km radius of the study location (see https://www.nature.com/articles/sdata201667 for further information about Built_areas, Cropland, HFI, Lights, Nav_waterways, Pasture, Human_popn, Railways and Roads).

'Cropland': Mean score of cropland area within a 10-km radius of the study location.

'HFI': Mean Human Footprint Index within a 10-km radius of the study location.

'Lights': Mean score of night-time lights within a 10-km radius of the study location.

'NDVI_mean': Mean monthly Normalised Difference Vegetation Index (NDVI) within a 10-km radius of the study location.

'NDVI_seas': Seasonality of NDVI (standard deviation of monthly means) within a 10-km radius of study location.

'Nav_waterways': Mean score of navigable waterways within a 10-km radius of the study location.

'Pasture': Mean score of pasture area within a 10-km radius of the study location.

'Human_popn': Mean score of human population density within a 10-km radius of the study location.

'Railways': Mean score of railways within a 10-km radius of the study location.

'Roads': Mean score of roads within a 10-km radius of the study location.

'Temp_mean': Mean annual temperature within a 10-km radius of the study location.

'Temp_seas': Mean temperature seasonality within a 10-km radius of the study location.

'Precip_man': Mean annual precipitation within a 10-km radius of the study location.

'Precip_seas': Mean precipitation seasonality within a 10-km radius of the study location.
