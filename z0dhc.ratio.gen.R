z0dhc.ratio.gen<-function(LAI=0.5,    
                          sim.N=500,
                          cor.default=(-0.6),
                          z0hc.sd.default=0.01,
                          mdl.default="R94"){
  
  ### This function generates a number of pairs values for z0/h and d/h, based on the input LAI, and selected model 
  ##   [Input]
  ##    LAI:                leaf area index (m2 m-2), default as 0.5 (i.e., used for leaf-less period, or for cropland/grasslands)
  ##    sim.N:              Number of pairs generated, default as 500. If specify sim.N=1, exact model predicted values will return
  ##    cor.default:        prescribed correlation between z0/h and d/h in the model simulation, default as -0.6
  ##    z0hc.sd.default:    prescribed standard deviation for z0/h, default as 0.01
  ##    mdl.default:        Selected model for z0/h and d/h, needs to be either one of "R94" (default), "SD00", "CM88", or "FIXED"

  require(MASS)
  
  #LAI=c(50:500)/50
  
  FAI<-LAI/2
  FAI2<-FAI
  ## frontal area index ~0.5*LAI
  
  ########################################################################################
  ##  Model specification 
  
  ## Raupach 1994
  a1<-15
  a2<-5.86
  b2<-10.9
  c2<-1.12
  d2<-1.33
  a3<-0.0537
  b3<-10.9
  c3<-0.874
  d3<-0.510
  f2<-0.00368
  z0primehc<-0.00086
    
  dhc1<-1-(1-exp(-sqrt(a1*FAI)))/sqrt(a1*FAI)
  z0hc1<-ifelse(FAI<=0.152,
                a2*exp(-b2*FAI^c2)*FAI^d2+z0primehc,
                a3/(FAI^d3)*(1-exp(-b3*FAI^c3))+f2)

  ## Schaudt & Dickinson 2000
  fd<-1-0.3991*exp(-0.1779*LAI)
  fz<-ifelse(LAI>=0.8775,1.6771*exp(-0.1717*LAI)+1,0.3299*LAI^1.5+2.1713)
  
  dhc2<-1-(1-exp(-sqrt(a1*FAI2)))/sqrt(a1*FAI2)
  z0hc2<-ifelse(FAI2<=0.152,
                a2*exp(-b2*FAI2^c2)*FAI2^d2+z0primehc,
                a3/(FAI2^d3)*(1-exp(-b3*FAI2^c3))+f2)
  
  dhc2<-dhc2*fd
  z0hc2<-z0hc2*fz
  
  ## Chounhury & Monteith 1988
  Cd<-0.2
  
  dhc3<-1.1*log(1+(Cd*LAI)^0.25)
  z0hc3<-ifelse(Cd*LAI<=0.2,
                z0primehc+0.3*sqrt(Cd*LAI),
                0.3*(1-dhc3))
  
  ## Fixed / Classical model, also used in Sakai 2001 (US-Ha1), Su 2004 (US-MMF,US-UMB) 
  
  dhc4<-ifelse(LAI<1,0.60,0.75)  ## lea-off vs leaf-on
  z0hc4<-ifelse(LAI<1,0.10,0.05)
  
  ### model selection
  
  if(mdl.default=="R94"){
    
    z0d.scal<-4.22
    z0hc<-z0hc1
    dhc<-dhc1
    
  }else{
    if(mdl.default=="SD00"){
      
      z0d.scal<-2.272   
      z0hc<-z0hc2
      dhc<-dhc2
      
    }else{ 
      if(mdl.default=="CM88"){
        
        z0d.scal<-3.718
        z0hc<-z0hc3
        dhc<-dhc3  
        
      }else{  #FIXED
        
        z0d.scal<-3.846  ## Shaw 1982
        z0hc<-z0hc4
        dhc<-dhc4  
        
      }
    }
  }
  
  ## scaling factor for dhc.sd vs z0hc.sd, based on the linear relation bwt z0hc & dhc
  dhc.sd.default<-z0hc.sd.default*z0d.scal  
  
  ## prepare z0/hc ,d/hc ratio from a multivariate normal dist
  if(sim.N==1){  ## return the model value
    z0dhc.ratio<-data.frame(z0hc=z0hc,
                            dhc=dhc)
  }else{
    z0dhc.ratio<-as.data.frame(mvrnorm(n=sim.N,c(z0hc,dhc),
                                       matrix(c(z0hc.sd.default^2,
                                                cor.default*z0hc.sd.default*dhc.sd.default,
                                                cor.default*z0hc.sd.default*dhc.sd.default,
                                                dhc.sd.default^2),2,2)))
    ## set out-of-bound ones to means
    if(length(which(z0dhc.ratio[,1]>=1)||which(z0dhc.ratio[,1]<=0))>0){
      z0dhc.ratio[which(z0dhc.ratio[,1]>=1)|which(z0dhc.ratio[,1]<=0),1]<-z0hc
      z0dhc.ratio[which(z0dhc.ratio[,1]>=1)|which(z0dhc.ratio[,1]<=0),2]<-dhc
    }
    if(length(which(z0dhc.ratio[,2]>=1)||which(z0dhc.ratio[,2]<=0))>0){
      z0dhc.ratio[which(z0dhc.ratio[,2]>=1)|which(z0dhc.ratio[,2]<=0),1]<-z0hc
      z0dhc.ratio[which(z0dhc.ratio[,2]>=1)|which(z0dhc.ratio[,2]<=0),2]<-dhc
    }
  }
  return(z0dhc.ratio)
}



 