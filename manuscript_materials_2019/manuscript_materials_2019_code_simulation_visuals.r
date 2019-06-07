#setwd("C:/Users/kejima/Dropbox/David_nonparametric_test")
library(openxlsx)
library(coin)

tiff("Figure6.tif", res = 1000, width = 5.7, height = 2, units = 'in')
data = read.csv("type-I-error-0.1-g=5.csv",header=F)[,-1];Y=c(0.0,0.2)
par(mgp=c(1.5,0.5,0), mai=c(0.3,0.3,0.2,0.1), ps=10)
layout(matrix(c(1:3), 1, 3, byrow = T))
mu <- data[,c(1,4,7)]
lc <- data[,c(2,5,8)]
uc <- data[,c(3,6,9)]
plot(4, 0.01, xlim=c(0.5,9), ylim=Y, main='Significance level = 0.1', xlab="", ylab="Probability of rejecting null hypothesis", type='n',pch=1,axes=F)
axis(1, pos = 0, at = seq(1,9,2), labels=seq(1,9,2), adj = 0) # x axis
axis(2, pos = 0.5, at = seq(min(Y),max(Y),0.02), adj = 0, las = 2) # y axis
par(new=T)
A=plot(c(1,3,5,7,9), mu[c(1:5),1], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=15,axes=F) # Kruskal-Wallis
par(new=T)
B=plot(c(1,3,5,7,9), mu[c(1:5),2], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=16,axes=F) # ANOVA without Welch's correction
par(new=T)
C=plot(c(1,3,5,7,9), mu[c(1:5),3], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=17,axes=F) # ANOVA with Welch's correction
arrows(c(1,3,5,7,9), lc[c(1:5),1], c(1,3,5,7,9), uc[c(1:5),1], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),1], c(1,3,5,7,9), lc[c(1:5),1], angle = 90, length = 0.02)
arrows(c(1,3,5,7,9), lc[c(1:5),2], c(1,3,5,7,9), uc[c(1:5),2], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),2], c(1,3,5,7,9), lc[c(1:5),2], angle = 90, length = 0.02)
arrows(c(1,3,5,7,9), lc[c(1:5),3], c(1,3,5,7,9), uc[c(1:5),3], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),3], c(1,3,5,7,9), lc[c(1:5),3], angle = 90, length = 0.02)
abline(h=0.1, lty=2);
mtext('Degree of heteroscedasticity', side=1, line=1, cex=0.7)


data = read.csv("type-I-error-0.05-g=5.csv",header=F)[,-1];Y=c(0.0,0.2)
mu <- data[,c(1,4,7)]
lc <- data[,c(2,5,8)]
uc <- data[,c(3,6,9)]
plot(4, 0.01, xlim=c(0.5,9), ylim=Y, main='Significance level = 0.05', xlab="", ylab="Probability of rejecting null hypothesis", type='n',pch=1,axes=F)
axis(1, pos = 0, at = seq(1,9,2), labels=seq(1,9,2), adj = 0) # x axis
axis(2, pos = 0.5, at = seq(min(Y),max(Y),0.02), adj = 0, las = 2) # y axis
par(new=T)
A=plot(c(1,3,5,7,9), mu[c(1:5),1], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=15,axes=F) # Kruskal-Wallis
par(new=T)
B=plot(c(1,3,5,7,9), mu[c(1:5),2], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=16,axes=F) # ANOVA without Welch's correction
par(new=T)
C=plot(c(1,3,5,7,9), mu[c(1:5),3], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=17,axes=F) # ANOVA with Welch's correction
arrows(c(1,3,5,7,9), lc[c(1:5),1], c(1,3,5,7,9), uc[c(1:5),1], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),1], c(1,3,5,7,9), lc[c(1:5),1], angle = 90, length = 0.02)
arrows(c(1,3,5,7,9), lc[c(1:5),2], c(1,3,5,7,9), uc[c(1:5),2], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),2], c(1,3,5,7,9), lc[c(1:5),2], angle = 90, length = 0.02)
arrows(c(1,3,5,7,9), lc[c(1:5),3], c(1,3,5,7,9), uc[c(1:5),3], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),3], c(1,3,5,7,9), lc[c(1:5),3], angle = 90, length = 0.02)
abline(h=0.05, lty=2);
mtext('Degree of heteroscedasticity', side=1, line=1, cex=0.7)

data = read.csv("type-I-error-0.01-g=5.csv",header=F)[,-1];Y=c(0.0,0.2)
mu <- data[,c(1,4,7)]
lc <- data[,c(2,5,8)]
uc <- data[,c(3,6,9)]
plot(4, 0.01, xlim=c(0.5,9), ylim=Y, main='Significance level = 0.01', xlab="", ylab="Probability of rejecting null hypothesis", type='n',pch=1,axes=F)
axis(1, pos = 0, at = seq(1,9,2), labels=seq(1,9,2), adj = 0) # x axis
axis(2, pos = 0.5, at = seq(min(Y),max(Y),0.02), adj = 0, las = 2) # y axis
par(new=T)
A=plot(c(1,3,5,7,9), mu[c(1:5),1], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=15,axes=F) # Kruskal-Wallis
par(new=T)
B=plot(c(1,3,5,7,9), mu[c(1:5),2], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=16,axes=F) # ANOVA without Welch's correction
par(new=T)
C=plot(c(1,3,5,7,9), mu[c(1:5),3], xlim=c(0.5,9), ylim=Y, xlab="", ylab="", type='o',pch=17,axes=F) # ANOVA with Welch's correction
arrows(c(1,3,5,7,9), lc[c(1:5),1], c(1,3,5,7,9), uc[c(1:5),1], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),1], c(1,3,5,7,9), lc[c(1:5),1], angle = 90, length = 0.02)
arrows(c(1,3,5,7,9), lc[c(1:5),2], c(1,3,5,7,9), uc[c(1:5),2], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),2], c(1,3,5,7,9), lc[c(1:5),2], angle = 90, length = 0.02)
arrows(c(1,3,5,7,9), lc[c(1:5),3], c(1,3,5,7,9), uc[c(1:5),3], angle = 90, length = 0.02);arrows(c(1,3,5,7,9), uc[c(1:5),3], c(1,3,5,7,9), lc[c(1:5),3], angle = 90, length = 0.02)
abline(h=0.01, lty=2);
legend("topright", c("Kruskal-Wallis","Fisher's ANOVA","Welch's ANOVA"), lty = 1, pch=c(15,16,17), ncol=1, box.lty=0)
mtext('Degree of heteroscedasticity', side=1, line=1, cex=0.7)
dev.off()









tiff("Figure7.tif", res = 1000, width = 5.7, height = 3, units = 'in')
par(mgp=c(2.0,0.8,0), mai=c(0.4,0.6,0.2,0.2), ps=8)
data = read.csv("type-I-error-0.05-g=2-samplesize.csv",header=F)[,-1];Y=c(0.0,0.12)
mu <- data[,c(1,4,7)]
lc <- data[,c(2,5,8)]
uc <- data[,c(3,6,9)]
barplot(as.matrix(mu),beside=T,names.arg=c("Kruskal-Wallis","Fisher's ANOVA","Welch's ANOVA"),col=gray.colors(3)[c(1,2,3)],axes=F, ylim=Y, xlab="", ylab="Probability of rejecting null hypothesis ")
axis(1, pos = 0.01, at = c(1:12)+0.5, labels=rep(c("20:40","30:30","40:20",""),3), adj = 0, tick = TRUE, lwd = 0) # x axis
axis(2, pos = 0.5, at = seq(min(Y),max(Y),0.02), adj = 0, las = 2) # y axis
arrows(c(1:3)+0.5, lc[1:3,1], c(1:3)+0.5, uc[1:3,1], angle = 90, length = 0.02);arrows(c(1:3)+0.5, uc[1:3,1], c(1:3)+0.5, lc[1:3,1], angle = 90, length = 0.02)
arrows(c(1:3)+4.5, lc[1:3,2], c(1:3)+4.5, uc[1:3,2], angle = 90, length = 0.02);arrows(c(1:3)+4.5, uc[1:3,2], c(1:3)+4.5, lc[1:3,2], angle = 90, length = 0.02)
arrows(c(1:3)+8.5, lc[1:3,3], c(1:3)+8.5, uc[1:3,3], angle = 90, length = 0.02);arrows(c(1:3)+8.5, uc[1:3,3], c(1:3)+8.5, lc[1:3,3], angle = 90, length = 0.02)
abline(h=0.05, lty=2);
dev.off()