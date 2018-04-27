ha estimater
================
Housen Chu
April 26, 2018

This method is modified from Pennypacker & Baldocchi 2015 BLM, which estimate ha (aerodynamic canopy height) from WS, USTAR, assumeing z0/ha and d/ha are known (default as 0.1 & 0.6)

### Input arguments

-   **data.in**: 4 columns R data.frame of WS (m/s), USTAR (m/s), MO\_LENGTH (m), zm (m), at t consective time steps
-   **zmax**: maximum zm (measurement height of WS) in the data.in, this is used for the first guess of z in z/L, and for setting the acceptable upper bound for calculated ha
-   **d.hr**: N of time steps per day, default as 48 for half-hourly files, use 24 for hourly files
-   **coef1**: z0/ha, default as 0.1
-   **coef2**: d/ha, default as 0.6
-   **lamda**: roughness sublayer enhancing factor (1-1.25, Massman 1997, 2017), default as 1 (i.e., no RS correction)
-   **zL.cut**: cutoff z/L for near-neutral stability, i.e., zL.cut &gt; near-neutral &gt; -zL.cut, default as 0.1
-   **zm.cut**: remove ha estimates that are higher than 1.1\*zm, or not, default as yes

### Description

Starting from the logarithmic wind profile: k\*WS/USTAR = ln((zm-d)/z0) + ln(lamda) where

-   **WS**: wind speed m/s
-   **USTAR**: friction velocity m/s
-   **k**: von karman constant, 0.4
-   **zm**: measurement height, m
-   **z0**: roughness length m
-   **L**: Obukhoc length m
-   **lamda**: roughness sublayer enhancing factor

Assume z0=coef1*ha; d=coef2*ha, where ha is the theoretical canopy height (aerodynamic canopy height, m), then, for any given coef1 & coef2, we can calculated ha from the equation: ha &lt;- lamda*zm/(lamda*coef2+coef1*exp(k*WS/USTAR))

### Output

-   **ha**: estimated aerodynamic canopy height
-   **z**: (= zm - d) sensor height above displacement height
-   **z0**: roughness length, based on ha \* coef1
-   **d**: zero-plane displacement height, based on ha \* coef2
-   **N**: Number of available data for calculation
-   **Nin**: Number of supposed data length in input

``` r
hc_ddb2<-function(data.in,         
                  zmax,
                  d.hr=48,
                  coef1=0.1,
                  coef2=0.6,
                  lamda=1,
                  zL.cut=0.1,
                  zm.cut=T)
  {
  
  na.mean<-function(x) {ifelse(!is.nan(mean(x,na.rm=T)),mean(x,na.rm=T),NA)}
  na.median<-function(x) {ifelse(!is.nan(median(x,na.rm=T)),median(x,na.rm=T),NA)}
  
  k<-0.4 # von karman constant

  Nin<-nrow(data.in)
  
  # check data availability and filtering by stability range
  data.t<-data.in
  data.t[!is.na(data.t$MO_LENGTH)&zmax/data.t$MO_LENGTH<(-1),c("WS","USTAR")]<-NA  # set a wider range of zL for pre-run
  data.t[!is.na(data.t$MO_LENGTH)&zmax/data.t$MO_LENGTH>(1),c("WS","USTAR")]<-NA  
  
  # dont run if insufficient data, < 7 % of supposed N
  if(nrow(na.omit(data.t[,c("WS","USTAR","MO_LENGTH")]))<0.07*Nin){
    
    N<-nrow(na.omit(data.t[,c("WS","USTAR","MO_LENGTH")]))
    ha<-NA
    z<-NA
    z0<-NA
    d<-NA
    d.unc<-NA
    ha.unc<-NA
    z.unc<-NA
    z0.unc<-NA
    
  }else{
    
    # 1st run, to calculate the supposed z (=zm-d) for filtering out non-near neutral conditions
    y<-data.t$zm*lamda/(coef2*lamda+coef1*exp(k*data.t$WS/data.t$USTAR));  # y: hold calculated ha for each (half)hour 
    
    if(zm.cut){
      y[y>1.1*zmax]<-NA  # set y to missing if exceeding zmax  
    }
    
    y2<-apply(matrix(y,nrow=d.hr),2,na.median)  # y2: hold calculated ha for each day
    
    ha<-na.median(y2)  # obtain best estimate from daily-estimates
    z<-ifelse(is.nan(ha),NA,na.mean(data.t$zm)-coef2*ha)
    
    rm(list=c("y","y2"))
    
    if(!is.na(z)){
      
      # 2nd run, used z (=zm-d) from 1st run to filter out non-neutral conditions 
      data.t[!is.na(data.t$MO_LENGTH)&z/data.t$MO_LENGTH<(-zL.cut),c("WS","USTAR")]<-NA  # a narrower range of zL for 2nd run
      data.t[!is.na(data.t$MO_LENGTH)&z/data.t$MO_LENGTH>(zL.cut),c("WS","USTAR")]<-NA  

      N<-nrow(na.omit(data.t[,c("WS","USTAR","MO_LENGTH")]))
      
      y<-data.t$zm*lamda/(coef2*lamda+coef1*exp(k*data.t$WS/data.t$USTAR));  # y: hold calculated ha for each (half)hour 
      
      if(zm.cut){
        y[y>1.1*zmax]<-NA   # set y to missing if exceeding zmax
      }
      
      y2<-apply(matrix(y,nrow=d.hr),2,na.median)  # y2: hold calculated ha for each day
      
      ha<-na.median(y2)  # best estimate from daily-estimates
      ha.unc<-abs(ha-y2[ceiling(length(y2)/2)])   # uncertainty of ha, based on the deviation between best estimates ha, and the daily-estimates  
      
      z<-na.mean(data.t$zm)-coef2*ha
      z0<-coef1*ha
      z.unc<-coef2*ha.unc
      z0.unc<-coef1*ha.unc
      
      d<-ifelse(is.nan(z),NA,na.mean(data.t$zm)-z);
      d.unc<-z.unc
      
      rm(list=c("y","y2"))
      
    }else{
      
      N<-nrow(na.omit(data.t[,c("WS","USTAR","MO_LENGTH")]))
      ha<-NA
      ha.unc<-NA
      d<-NA
      d.unc<-NA
      z<-NA
      z0<-NA
      z.unc<-NA
      z0.unc<-NA
      
    }
  }
  return(list(ha,ha.unc,z,z.unc,z0,z0.unc,d,d.unc,N,Nin))
}
```
