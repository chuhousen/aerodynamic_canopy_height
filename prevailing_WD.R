prevailing_WD<-function(data.in2,   ## data.frame contains at least one WD_1 or WD_# columns
                        sector.n)   ## the number of sectors used to determine the prevailing WD
  {
  
  ## This function locate the prevailing wind sector for the input data.frame (data.in2)
  ##   Any data row (time step) has any missing value is first omitted
  ##   sector.n is used to group data into discrete WD sectors, 
  ##     e.g., sector.n = 8 each WD group covers 45 deg sector, starting from 0 (337.5-22.5), 45 (22.5-67.5).....
  ##   return the central WD of the prevailing wind sector
  
  ## take WD name as WD_1 or WD_x
  col_WD<-which(substr(names(data.in2),start=1,stop=2)=="WD")[1]
  
  ## screen out-bound WD,   
  data.in2[!is.na(data.in2[,col_WD])&data.in2[,col_WD]<0,col_WD]<-NA
  data.in2[!is.na(data.in2[,col_WD])&data.in2[,col_WD]>360,col_WD]<-NA
  data.in2[!is.na(data.in2[,col_WD])&data.in2[,col_WD]==360,col_WD]<-0
  
  data.in2[!is.na(data.in2[,col_WD])&data.in2[,col_WD]<0,col_WD]<-NA
  data.in2[!is.na(data.in2[,col_WD])&data.in2[,col_WD]>360,col_WD]<-NA
  data.in2[!is.na(data.in2[,col_WD])&data.in2[,col_WD]==360,col_WD]<-0
  
  wd.i<-360/sector.n
  wd.break<-seq(wd.i/2,360+wd.i/2,by=wd.i)
  wd.mean<-seq(0,360,by=wd.i)[-1]
  
  data.wrk<-na.omit(data.in2)
  
  if(nrow(data.wrk)>0.07*nrow(data.in2)){
    WD.hist<-hist(data.wrk[,col_WD]+wd.i/2,breaks=wd.break,plot=F)
    wd.pre<-wd.mean[which(WD.hist$counts==max(WD.hist$counts,na.rm=T))[1]]
  }else{
    wd.pre<-NA    
  }
  
  return(wd.pre)
}