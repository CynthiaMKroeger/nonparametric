#setwd("C:/Users/kejima/Dropbox/David_nonparametric_test")
library(openxlsx)
library(coin)
library(rlist)
library(nlme)
set.seed(12102017)
N=10000

#### Parameters ####
n=c(20,40) # 2 group with differnt sample size
k=2 # maximum SD
mu=rep(0,2) # mean of each group
sigma=c(1,k) # SD of each group

#### Simulation ####
p_Krusal=NULL
p_ANOVA_eq=NULL
p_ANOVA_uneq=NULL
simu=1
while(simu<=N){
	print(simu)
	#### Generate data from normal distribution ####
	data=NULL
	for(i in 1:2){
		data$val = c(data$val, rnorm(n[i], mean = mu[i], sd = sigma[i]))
		data$grp = c(data$grp, rep(i, n[i]))
	}
	data$grp=factor(data$grp)
	p_Krusal = c(p_Krusal, kruskal.test(val~grp, data=data)$p.value) # Krusal-Wallis test
	p_ANOVA_eq = c(p_ANOVA_eq, oneway.test(val~grp, data=data, var.equal=T)$p.value) # One way ANOVA without Welch's correction
	p_ANOVA_uneq = c(p_ANOVA_uneq, oneway.test(val~grp, data=data, var.equal=F)$p.value) # One way ANOVA with Welch's correction
	simu=simu+1
}
write.table(rbind(p_Krusal, p_ANOVA_eq, p_ANOVA_uneq), append=T, "p-value-g=2-samplesize.csv", row.names = F, col.names = F, sep=',')



#### Parameters ####
n=c(30,30) # 2 group with differnt sample size
k=2 # maximum SD
mu=rep(0,2) # mean of each group
sigma=c(1,k) # SD of each group

#### Simulation ####
p_Krusal=NULL
p_ANOVA_eq=NULL
p_ANOVA_uneq=NULL
simu=1
while(simu<=N){
	print(simu)
	#### Generate data from normal distribution ####
	data=NULL
	for(i in 1:2){
		data$val = c(data$val, rnorm(n[i], mean = mu[i], sd = sigma[i]))
		data$grp = c(data$grp, rep(i, n[i]))
	}
	data$grp=factor(data$grp)
	p_Krusal = c(p_Krusal, kruskal.test(val~grp, data=data)$p.value) # Krusal-Wallis test
	p_ANOVA_eq = c(p_ANOVA_eq, oneway.test(val~grp, data=data, var.equal=T)$p.value) # One way ANOVA without Welch's correction
	p_ANOVA_uneq = c(p_ANOVA_uneq, oneway.test(val~grp, data=data, var.equal=F)$p.value) # One way ANOVA with Welch's correction
	simu=simu+1
}
write.table(rbind(p_Krusal, p_ANOVA_eq, p_ANOVA_uneq), append=T, "p-value-g=2-samplesize.csv", row.names = F, col.names = F, sep=',')




#### Parameters ####
n=c(40,20) # 5 group with differnt sample size
k=2 # maximum SD
mu=rep(0,2) # mean of each group
sigma=c(1,k) # SD of each group

#### Simulation ####
p_Krusal=NULL
p_ANOVA_eq=NULL
p_ANOVA_uneq=NULL
simu=1
while(simu<=N){
	print(simu)
	#### Generate data from normal distribution ####
	data=NULL
	for(i in 1:2){
		data$val = c(data$val, rnorm(n[i], mean = mu[i], sd = sigma[i]))
		data$grp = c(data$grp, rep(i, n[i]))
	}
	data$grp=factor(data$grp)
	p_Krusal = c(p_Krusal, kruskal.test(val~grp, data=data)$p.value) # Krusal-Wallis test
	p_ANOVA_eq = c(p_ANOVA_eq, oneway.test(val~grp, data=data, var.equal=T)$p.value) # One way ANOVA without Welch's correction
	p_ANOVA_uneq = c(p_ANOVA_uneq, oneway.test(val~grp, data=data, var.equal=F)$p.value) # One way ANOVA with Welch's correction
	simu=simu+1
}
write.table(rbind(p_Krusal, p_ANOVA_eq, p_ANOVA_uneq), append=T, "p-value-g=2-samplesize.csv", row.names = F, col.names = F, sep=',')




