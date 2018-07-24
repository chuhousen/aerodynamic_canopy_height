This /data directory contains results of aerodynamic canopy heights (ha), interannual trend analyses of forest sites, and the comparisons of ha and actual canopy heights (hc) at the cropland/grasslnad sites. Three subfolders contains results using each of the three z0/h-d/h models, i.e., the Classical model (FIXED), Raupach [1994] (R94), and Schaudt and Dickinson [2000] (SD00). As discussed in the paper, we suggest use the SD00 model for forest sites, and R94 model for cropland/grassland sites. Details about using different models can be found in the paper.

#### This two files caontain the best available estimates of ha and empirically corrected hc  
* /SD00/2018-02-03-SD00-UNC-forest-fullfoliate-3month.csv  
* /R94/2018-02-03-R94-UNC-shortvege-7day-hc.csv

----
### Full list of files contained in each subfolder  
#### 2018-02-03-model-UNC-forest-fullfoliate-3month.csv  
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
* ha.mdl.q025: 2.5% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q250: 25% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q500: 50% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q750: 75% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q975: 97.5% percentile estimated aerodynamic canopy height based on the model specified (m)
* hc.hat.q025: 2.5% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat.q250: 25% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat.q500: 50% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat.q750: 75% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat.q975: 97.5% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)

#### 2018-02-03-model-UNC-forest-leafless-3month.csv
Annual estimates of aerodynamic canopy heights for all forest sites, using the 3-month leafless period data. This file has the same variable names as the above one, except the emipircally predicted canopy height. 
  
#### 2018-02-03-model-UNC-forest-fullfoliate-3month-trend.csv
Results of trend analyses on annual aerodynamic canopy heights at long-term all forest sites, based on 3-month full-foliated period data
* SITE_ID: 6 digit AmeriFlux/Fluxnet Site ID	
* slope: sen's slope (m yr-1) 
* slope.u: upper bound of the 95% confidence interval of the sen's slope (m yr-1)
* slope.l: lower bound of the 95% confidence interval of the sen's slope (m yr-1)
* intpt: intercept, corresponding to the original mean (m)
* pvalue: p value  

#### 2018-02-03-model-UNC-forest-leafless-3month-trend.csv
Results of trend analyses on annual aerodynamic canopy heights at long-term all forest sites, based on 3-month full-foliated period data. This file has the same variable names as the above one. 

#### 2018-02-03-model-UNC-shortvege-7day-hc-site-crop-comparison.csv
Results of the linear comparison between physical and aerodynamic canopy heights. All years with the same crop/vegetation types for a sites are grouped and analyzed together.    
* case: 6 digit AmeriFlux/Fluxnet Site ID	+ crop/vegetation type planted
* site: 6 digit AmeriFlux/Fluxnet Site ID	
* crop: crop/vegetation type planted
* incpt: intercept of the linear regression (m)
* incpt.025: lower bound of the 95% confidence interval of the intercept (m)
* incpt.975: upper bound of the 95% confidence interval of the intercept (m)
* slope: slope of the linear regression
* slope.025: lower bound of the 95% confidence interval of the slope
* slope.975: upper bound of the 95% confidence interval of the slope
* rng.l: lower bound of canopy heights (m)
* rng.u: upper bound of canopy heights (m)
* rsqur: R2 the coefficient of determination
* n: sample number
* crop2: agregated crop/vegetation types
  
#### 2018-02-03-model-UNC-shortvege-7day-hc-site-year-comparison.csv
Results of the linear comparison between physical and aerodynamic canopy heights, separated by each individual year. This file has almost identical variable names as the above one, except an additional column:
* year: the year of comparison   

#### 2018-02-03-model-UNC-shortvege-7day-hc.csv
Weekly estimates of aerodynamic canopy heights for all cropland/grassland sites. 
* SITE_ID: 6 digit AmeriFlux/Fluxnet Site ID	
* YEAR: year of estimate
* DOY: day of the year, the middle day of the 7-day window
* VEG_CROP: crop/vegetation type	
* EC_HEIGHT: measurement height of eddy covariance system (m)
* WD: selected wind direction 
* N.sample: Number of data points used
* ha.mdl.q025: 2.5% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q250: 25% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q500: 50% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q750: 75% percentile estimated aerodynamic canopy height based on the model specified (m)
* ha.mdl.q975: 97.5% percentile estimated aerodynamic canopy height based on the model specified (m)
* hc.hat1.q025: 2.5% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat1.q250: 25% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat1.q500: 50% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat1.q750: 75% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat1.q975: 97.5% percentile predicted canopy height based aerodynamic canopy height and vegetation-specific ha-hc empirical model (m)
* hc.hat2.q025: 2.5% percentile predicted canopy height based aerodynamic canopy height and site-specific ha-hc empirical model (m)
* hc.hat2.q250: 25% percentile predicted canopy height based aerodynamic canopy height and site-specific ha-hc empirical model (m)
* hc.hat2.q500: 50% percentile predicted canopy height based aerodynamic canopy height and site-specific ha-hc empirical model (m)
* hc.hat2.q750: 75% percentile predicted canopy height based aerodynamic canopy height and site-specific ha-hc empirical model (m)
* hc.hat2.q975: 97.5% percentile predicted canopy height based aerodynamic canopy height and site-specific ha-hc empirical model (m)

