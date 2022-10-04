library(INTRIGUE)
data_skinhoming<-read.table("data/data_skinhoming.dat",header=T)
n=nrow(data_skinhoming)

rep_grid<-c(0,0.202,0.225,0.243,0.259,0.273)
irre_grid<-c(0.335,0.396,0.463,0.542,0.643,0.785,1.012,1.505)

#est_prop_d_list<-c(hetero(data_skinhoming,rep=rep_grid,irre=irre_grid)$est_prop)
#est_prop_dc_list<-c(hetero(data_skinhoming)$est_prop)

est_prop_d_list<-c()
for (t in 1:100){
 print(t)
 sample_index = sample(n,size=n,replace=TRUE)
 sample = data_skinhoming[sample_index,]

 est_prop_d<-hetero(sample, rep=rep_grid, irre=irre_grid)$est_prop 

 est_prop_d_list<-rbind(est_prop_d_list,est_prop_d)
 #est_prop_dc_list<-rbind(est_prop_dc_list,est_prop_dc)
}

save(est_prop_d_list,file="est_prop_d_list.RData")
#print("finish")

PI_list<-c()
for (i in 1:3){
        est = est_prop_d_list[,i]
        mean <- mean(est)
        est <- est[order(est)]
        estPI<-quantile(est,prob=c(0.025,0.975))
        PI_list<-rbind(PI_list, c(mean,estPI))
}

print(PI_list)

