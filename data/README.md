This /data directory contains results of aerodynamic canopy heights, interannual trend analyses of forest sites, and the comparisons of aerodynamic and physical canopy heights at the cropland/grasslnad sites. Three subfolders contains results using each of the three z0/h-d/h models, i.e., the Classical model (FIXED), Raupach [1994] (R94), and Schaudt and Dickinson [2000] (SD00). Each subfolder has the following files:   

####2018-02-03-<model>-UNC-forest-fullfoliate-3month.csv  
Annual estimates of aerodynamic canopy heights for all forest sites, using the 3-month full-foliated period data. 
* SITE_ID: 6 digit AmeriFlux/Fluxnet Site ID	
* YEAR: year of estimate
* IGBP: plant funtional type	
* EC_HEIGHT: measurement height of eddy covariance system (m)
* HEIGHTC: physical canopy height (m) 
* HEIGHTC_UPPER: upper range of physical canopy height (m)
* HEIGHTC_LOWER: lower range of physical canopy height (m)
* WD: selected wind direction 
* N.sample: Number of data points used
* ha.mdl.q025: 2.5% percentile estimated aerodynamic canopy height based on the model specified 
* ha.mdl.q250: 25% percentile estimated aerodynamic canopy height based on the model specified
* ha.mdl.q500: 50% percentile estimated aerodynamic canopy height based on the model specified
* ha.mdl.q750: 75% percentile estimated aerodynamic canopy height based on the model specified
* ha.mdl.q975: 97.5% percentile estimated aerodynamic canopy height based on the model specified

####2018-02-03-<model>-UNC-forest-leafless-3month.csv
Annual estimates of aerodynamic canopy heights for all forest sites, using the 3-month leafless period data. This file has the same variable names as the above one. 
  
####2018-02-03-<model>-UNC-forest-fullfoliate-3month-trend.csv
Results of trend analyses on annual aerodynamic canopy heights at long-term all forest sites, based on 3-month full-foliated period data
* SITE_ID: 6 digit AmeriFlux/Fluxnet Site ID	
* slope: sen's slope (m yr-1) 
* slope.u: upper bound of the 95% confidence interval of the sen's slope (m yr-1)
* slope.l: lower bound of the 95% confidence interval of the sen's slope (m yr-1)
* intpt: intercept, corresponding to the original mean (m)
* pvalue: p value  

####2018-02-03-<model>-UNC-forest-leafless-3month-trend.csv
Results of trend analyses on annual aerodynamic canopy heights at long-term all forest sites, based on 3-month full-foliated period data. This file has the same variable names as the above one. 

####2018-02-03-<model>-UNC-shortvege-7day-hc-site-crop-comparison.csv
Results of the linear comparison between physical and aerodynamic canopy heights. All years with the same crop/vegetation types for a sites are grouped and analyzed together.    
* case: 6 digit AmeriFlux/Fluxnet Site ID	+ crop/vegetation type planted
* site: 6 digit AmeriFlux/Fluxnet Site ID	
* crop: crop/vegetation type planted
* incpt: intercept of the linear regression
* incpt.025: lower bound of the 95% confidence interval of the intercept
* incpt.975: upper bound of the 95% confidence interval of the intercept
* slope: slope of the linear regression
* slope.025: lower bound of the 95% confidence interval of the slope
* slope.975: upper bound of the 95% confidence interval of the slope
* rng.l: lower bound of canopy heights
* rng.u: upper bound of canopy heights
* rsqur: R2 the coefficient of determination
* n: sample number
* crop2: agregated crop/vegetation types
  
####2018-02-03-<model>-UNC-shortvege-7day-hc-site-year-comparison.csv
Results of the linear comparison between physical and aerodynamic canopy heights, separated by each individual year. This file has almost identical variable names as the above one, except an additional column:
* year: the year of comparison   

####2018-02-03-<model>-UNC-shortvege-7day-hc.csv
Weekly estimates of aerodynamic canopy heights for all cropland/grassland sites. 
* SITE_ID: 6 digit AmeriFlux/Fluxnet Site ID	
* YEAR: year of estimate
* DOY: day of the year, the middle day of the 7-day window
* VEG_CROP: crop/vegetation type	
* EC_HEIGHT: measurement height of eddy covariance system (m)
* WD: selected wind direction 
* N.sample: Number of data points used
* ha.mdl.q025: 2.5% percentile estimated aerodynamic canopy height based on the model specified 
* ha.mdl.q250: 25% percentile estimated aerodynamic canopy height based on the model specified
* ha.mdl.q500: 50% percentile estimated aerodynamic canopy height based on the model specified
* ha.mdl.q750: 75% percentile estimated aerodynamic canopy height based on the model specified
* ha.mdl.q975: 97.5% percentile estimated aerodynamic canopy height based on the model specified
