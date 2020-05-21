#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

if (length(args) < 1) {
   print("",quote=F)
   print("Usage: plot.pca.R [evec file]",quote=F)
   print("",quote=F)
   quit(save="no")
} else {
    d <- args[1]
    outpng <- gsub(".eigenvec",".pca.pdf",d)
    f <- read.table(d,h=F,col.names=c("FID","IID","PC1","PC2","PC3","PC4","PC5","PC6","PC7","PC8","PC9","PC10"))
    pheno <- read.table("pheno.txt", h=F, col.names=c("FID","IID","missing","het","sex","pheno","age","Mpop","Fpop"))
    fpheno <- merge(f,pheno[,c(1,9)], by="FID")
    #png(outpng, height=15, width=13, units="px", res=NA)
    pdf(outpng)
    plot(fpheno$PC1, fpheno$PC2, pch=20, col=as.factor(levels(fpheno$Fpop)))
    legend("topright", legend=as.factor(levels(fpheno$Fpop)), col=1:length(as.factor(levels(fpheno$Fpop))), pch=20)
    dev.off()
}
