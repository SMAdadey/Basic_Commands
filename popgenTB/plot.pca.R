#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

if (length(args) < 2) {
   print("",quote=F)
   print("Usage: plot.pca.R [evec file] [pheno column to plot with]",quote=F)
   print("",quote=F)
   quit(save="no")
} else {
    d <- args[1]
    c <- args[2]
    #phecol <- as.numeric(c) 
    outpng <- gsub(".eigenvec",".pca.pdf",d)
    f <- read.table(d,h=F,col.names=c("FID","IID","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10"))
    pheno <- read.table("pheno.txt", h=F, col.names=c("FID","IID","Age","SexA","SexB","MEth1","MEth2","MPop","FEth1","FEth2","FPop","Wt_Kg","Ht_M","specie","Pheno","PhenoA","PhenoB"))
    fpheno <- merge(f,pheno, by="FID")
    fpheno$AgeCAT <- as.factor(ifelse(fpheno$Age < 16, "Child", 
			    ifelse(fpheno$Age >= 16 & fpheno$Age < 30, "YoungAdult", 
				   ifelse(fpheno$Age >= 30 & fpheno$Age < 60, "Adult", 
					  ifelse(fpheno$Age >= 60, "Aged", "NA")))))

    print(summary(glm(as.factor(pheno$Pheno)~pheno[,3]+pheno[,5]+pheno[,7]+pheno[,10]+pheno[,12]+pheno[,13],family = "binomial")))
    print(summary(glm(as.factor(fpheno[,13])~fpheno[,3]+fpheno[,4]+fpheno[,5]+fpheno[,6]+fpheno[,7]+fpheno[,8]+fpheno[,9]+fpheno[,10]+fpheno[,11]+fpheno[,12],family = "binomial")))
    #png(outpng, height=15, width=13, units="px", res=NA)
    #print(fpheno)
    pdf(outpng)
    plot(fpheno$PC1, fpheno$PC2, pch=20, col=as.factor(levels(as.factor(fpheno$FEth1))), xlab="PC1", ylab="PC2")
    legend("topright", legend=as.factor(levels(as.factor(fpheno$FEth1))), col=1:length(as.factor(levels(as.factor(fpheno$FEth1)))), pch=20)
    dev.off()
}
