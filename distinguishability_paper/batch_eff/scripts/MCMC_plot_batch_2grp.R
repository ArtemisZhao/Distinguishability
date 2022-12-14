library(ggplot2)
library(lattice)

library(reshape2)

args = commandArgs(trailingOnly=TRUE)
filename = args[1]
bb = args[2]
#bb = 2
d = read.table(filename)

d = data.frame(d)
names(d)<-c("V1", "rep_pval")

pdf(file = paste0("plots/batch_2grp_",bb,".pdf"),width=4.5,height=4)
ggplot(data=d,aes(x=rep_pval))+
  geom_histogram(color="white",fill="#6186ad",bins=10,boundary=0,alpha=0.8)+
  scale_x_continuous(limits = c(0, 1))+
  theme_bw()+
  theme(plot.title = element_text(size=12,hjust = 0.5))+
  xlab(expression(p["prior"]~Distinguishability~Criterion))+
  ylim(0,6000)
dev.off()


############ comparison between two criteria
#prp_dc_list = c()
prp_d_list=c()
for (bb in c(seq(0,2,0.5),4)){
  dd<-read.table(file=paste0("output/batch_2grp_bb_sd_",bb,".prp.out"))
  #ddc<-read.table(file=paste0("~/Desktop/rep_new/PRP/PRP_paper/batch_eff/output/batch_2grp_bb_sd_",bb,".prp.out"))
  dd = data.frame(dd)
  #ddc = data.frame(ddc)
  names(dd)<-c("V1", "rep_pval")
  #names(ddc)<-c("V1", "rep_pval")
  prp_d_list<-c(prp_d_list,length(which(dd$rep_pval<0.05))/nrow(dd))
  #prp_dc_list<-c(prp_dc_list,length(which(ddc$rep_pval<0.05))/nrow(ddc))
}



data_plot2<-data.frame(eta=c(seq(0,2,0.5),4), prior_prp_d=prp_d_list)
#data_plot2_long <- melt(data_plot2,id="eta")
#names(data_plot2_long)<-c("eta","criterion","sensitivity")
pdf(file="plots/sensitivity_batch_2grp_d.pdf",height=4, width =4.5)
ggplot(data=data_plot2,aes(x=eta,y=prior_prp_d))+
  geom_line(color="#6186ad",size=0.8)+
  geom_point(color="#6186ad")+
  theme(legend.text.align = 0)+
  theme_bw()+
  xlab("batch effect magnitude")+
  ylab("sensitivity")+
  ylim(0,1)
 #scale_color_discrete(labels=c("DC", "Distinguishability"))
  #scale_x_continuous(breaks = seq(0, 2, by = 0.5))
dev.off()

