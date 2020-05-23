#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

if (length(args) < 1) {
	   print("",quote=F)
   print("Usage: plot.assoc.R [assoc result file]",quote=F)
      print("",quote=F)
      quit(save="no")
} else {
    d <- args[1]
    dout <- paste0(d,".pdf")
    if(!require(qqman)){
       install.packages("qqman")
    }
    assoc <- read.table(d, h=T)
    pdf(dout)
    manhattan(assoc)
    dev.off()
}
