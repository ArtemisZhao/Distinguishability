library(ggplot2)

data_skinhoming<-read.table("data/data_skinhoming.RData")
res<-hetero(datadata_skinhoming)
res_d<-hetero(data_skinhoming, rep=c(0.000,0.202,0.225,0.243,0.259,0.273), 
            irre=c(0.335,0.396, 0.463, 0.542, 0.643, 0.785, 1.012, 1.505))

probability<-rep(0,23561)
for (i in 1:23561){
  if (res$ind_prob[i,2]>0.90){probability[i] = 1}
  if (res$ind_prob[i,3]>0.90){probability[i] = 2}
}

probability_d<-rep(0,23561)
for (i in 1:23561){
  if (res_d$ind_prob[i,2]>0.90){probability_d[i] = 1}
  if (res_d$ind_prob[i,3]>0.90){probability_d[i] = 2}
}

data_dc<-data.frame(cbind(data_skinhoming,probability))
data_d<-data.frame(cbind(data_skinhoming,probability_d))

colnames(data_dc)<-c("betacd4","se1","betacd8","se2","prob")
colnames(data_d)<-c("betacd4","se1","betacd8","se2","prob")

data_dc$zcd4 =data_dc$betacd4/data_dc$se1 
data_dc$zcd8 =data_dc$betacd8/data_dc$se2 

data_d$zcd4 =data_d$betacd4/data_d$se1 
data_d$zcd8 =data_d$betacd8/data_d$se2 
data_d$prob<-factor(data_d$prob,levels=c(0,1,2))

theme_set(theme_bw() + theme(legend.position = 'bottom'))
pdf(file="plots/biplot_dc.pdf",width=6,height=6)
ggplot(data=data_dc,aes(x=zcd4,y=zcd8,color=prob))+
  geom_point(size=1.2)+
  geom_point(aes(x=-50,y=-50,color="extra"))+
  xlab(expression(z[skinhoming]~"in"~CD4))+
  ylab(expression(z[skinhoming]~"in"~CD8))+
  xlim(-35,35)+
  ylim(-35,35)+
  scale_color_manual(name=" ",labels=c("other","gene w/ irreplicable prob. > 0.90",
                                       "gene w/ replicable prob. > 0.90"),
                       values=c('black','blue','red'))
dev.off()

pdf(file="plots/biplot_d.pdf",width=6,height=6)
ggplot(data=data_d,aes(x=zcd4,y=zcd8,color=prob))+
  geom_point(size=1.2)+
  geom_point(aes(x=-50,y=-50,color="extra"))+
  xlab(expression(z[skinhoming]~"in"~CD4))+
  ylab(expression(z[skinhoming]~"in"~CD8))+
  xlim(-35,35)+
  ylim(-35,35)+
  scale_color_manual(name=" ",labels=c("other","gene w/ irreplicable prob. > 0.90",
                                       "gene w/ replicable prob. > 0.90"),
                     values=c('black','blue','red'))
dev.off()


