#setwd("C:/Users/kejima/Dropbox/David_nonparametric_test")
library(openxlsx)
library(coin)
library(rlist)
library(nlme)
set.seed(12102017)
N=10000
for(k in c(1,3,5,7,9)){ # ratio of maximum SD
	n=40
	print(c(k,n))
	#### Parameters ####
	g=5 # number of groups
	n=rep(n,g)
	mu=rep(0,g) # mean of each group
	sigma=c(rep(1,g-1),k) # SD of each group

	#### Simulation ####
	p_Krusal=NULL
	p_ANOVA_eq=NULL
	p_ANOVA_uneq=NULL
	simu=1
	while(simu<=N){
		print(simu)
		#### Generate data from normal distribution ####
		data=NULL
		for(i in 1:g){
			data$val = c(data$val, rnorm(n[i], mean = mu[i], sd = sigma[i]))
			data$grp = c(data$grp, rep(i, n[i]))
		}
		data$grp=factor(data$grp)
		p_Krusal = c(p_Krusal, kruskal.test(val~grp, data=data)$p.value) # Krusal-Wallis test
		p_ANOVA_eq = c(p_ANOVA_eq, oneway.test(val~grp, data=data, var.equal=T)$p.value) # One way ANOVA without Welch's correction
		p_ANOVA_uneq = c(p_ANOVA_uneq, oneway.test(val~grp, data=data, var.equal=F)$p.value) # One way ANOVA with Welch's correction
		simu=simu+1
	}
	write.table(cbind(k,rbind(p_Krusal, p_ANOVA_eq, p_ANOVA_uneq)), append=T, "p-value-g=5.csv", row.names = F, col.names = F, sep=',')
}


