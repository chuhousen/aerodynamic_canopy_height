## Basic functions

na.mean<-function(x) {ifelse(!is.nan(mean(x,na.rm=T)),mean(x,na.rm=T),NA)}
na.median<-function(x) {ifelse(!is.nan(median(x,na.rm=T)),median(x,na.rm=T),NA)}
ma.na<-function(x) {filter(x,rep(1/filter.wd,filter.wd),sides=2,circular=T)}
r.sd<-function(x){(as.numeric(quantile(x,probs=c(0.75),na.rm=T))-as.numeric(quantile(x,probs=c(0.25),na.rm=T)))/1.349}

q250<-function(x){as.numeric(quantile(x,probs=c(0.25),na.rm=T))}
q750<-function(x){as.numeric(quantile(x,probs=c(0.75),na.rm=T))}
q025<-function(x){as.numeric(quantile(x,probs=c(0.025),na.rm=T))}
q975<-function(x){as.numeric(quantile(x,probs=c(0.975),na.rm=T))}