#setwd("C:/Users/kejima/Dropbox/David_nonparametric_test")
library(openxlsx)
library(coin)

data = read.csv("p-value-g=5.csv",header=F)[,-1]
#####################  alpha_level=0.1  ############################
alpha_level=0.1
count=1
for(k in c(1,3,5,7,9)){ # ratio of maximum SD (1,3,5,7,9)
    print(k)
    p = apply(data[c((3*count-2):(3*count)),]<alpha_level, sum, MARGIN=1)/(dim(data)[2])
    se = sqrt(p*(1-p)/(dim(data)[2]))
    lc <- p-1.96*se
    uc <- p+1.96*se
    write.table(t(c(k,as.vector(rbind(p, lc, uc)))), append=T, "type-I-error-0.1-g=5.csv", row.names = F, col.names = F, sep=',')
    count=count+1
}
#####################  alpha_level=0.05  ############################
alpha_level=0.05
count=1
for(k in c(1,3,5,7,9)){ # ratio of maximum SD (1,3,5,7,9)
    print(k)
    p = apply(data[c((3*count-2):(3*count)),]<alpha_level, sum, MARGIN=1)/(dim(data)[2])
    se = sqrt(p*(1-p)/(dim(data)[2]))
    lc <- p-1.96*se
    uc <- p+1.96*se
    write.table(t(c(k,as.vector(rbind(p, lc, uc)))), append=T, "type-I-error-0.05-g=5.csv", row.names = F, col.names = F, sep=',')
    count=count+1
}
#####################  alpha_level=0.01  ############################
alpha_level=0.01
count=1
for(k in c(1,3,5,7,9)){ # ratio of maximum SD (1,3,5,7,9)
    print(k)
    p = apply(data[c((3*count-2):(3*count)),]<alpha_level, sum, MARGIN=1)/(dim(data)[2])
    se = sqrt(p*(1-p)/(dim(data)[2]))
    lc <- p-1.96*se
    uc <- p+1.96*se
    write.table(t(c(k,as.vector(rbind(p, lc, uc)))), append=T, "type-I-error-0.01-g=5.csv", row.names = F, col.names = F, sep=',')
    count=count+1
}




data = read.csv("p-value-g=2-samplesize.csv",header=F)
#####################  alpha_level=0.1  ############################
alpha_level=0.1
for(count in 1:3){ # three patterns
    p = apply(data[c((3*count-2):(3*count)),]<alpha_level, sum, MARGIN=1)/(dim(data)[2])
    se = sqrt(p*(1-p)/(dim(data)[2]))
    lc <- p-1.96*se
    uc <- p+1.96*se
    write.table(t(c(count,as.vector(rbind(p, lc, uc)))), append=T, "type-I-error-0.1-g=2-samplesize.csv", row.names = F, col.names = F, sep=',')
}
#####################  alpha_level=0.05  ############################
alpha_level=0.05
for(count in 1:3){ # three patterns
    p = apply(data[c((3*count-2):(3*count)),]<alpha_level, sum, MARGIN=1)/(dim(data)[2])
    se = sqrt(p*(1-p)/(dim(data)[2]))
    lc <- p-1.96*se
    uc <- p+1.96*se
    write.table(t(c(count,as.vector(rbind(p, lc, uc)))), append=T, "type-I-error-0.05-g=2-samplesize.csv", row.names = F, col.names = F, sep=',')
}
#####################  alpha_level=0.01  ############################
alpha_level=0.01
for(count in 1:3){ # three patterns
    p = apply(data[c((3*count-2):(3*count)),]<alpha_level, sum, MARGIN=1)/(dim(data)[2])
    se = sqrt(p*(1-p)/(dim(data)[2]))
    lc <- p-1.96*se
    uc <- p+1.96*se
    write.table(t(c(count,as.vector(rbind(p, lc, uc)))), append=T, "type-I-error-0.01-g=2-samplesize.csv", row.names = F, col.names = F, sep=',')
}