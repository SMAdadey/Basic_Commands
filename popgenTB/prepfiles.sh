#!/usr/bin/env bash
sed -i 's/;/\t/g' raw.data.tsv 
cut -f3-33 raw.data.tsv | sed '1d' | sed 's/\t/ /g' | sed 's/-9/00/g' > ped.template.txt 
#cut -f1-2,34- raw.data.tsv | awk 'OFS="\t" {print  $1,$2,"0","0",$5,$15,$3,$8,$11}' | sed '1d' > pheno.txt
cut -f1-2,34- raw.data.tsv > pheno.txt
awk 'OFS="\t" {print  $1,$2,"0","0",$5,$15}' pheno.txt | sed '1d' > fam.template.txt
paste fam.template.txt ped.template.txt | sed 's/\t/ /g' > raw.data.ped
awk 'OFS="\t" {print $1,$2,"0",$3}' map.template.csv | sed '1d' > raw.data.map

grep -wv M.africanum raw.data.tsv | sed '1d' | awk '{print $1,$2}' > mtb.control.sample.ids
grep -wv M.tuberculois raw.data.tsv | sed '1d' | awk '{print $1,$2}' > afr.control.sample.ids
plink --file raw.data --make-bed --out raw.data --maf 0.01 --mind 0.10 --geno 0.10 --hwe 1e-06

plink --bfile raw.data --indep-pairwise 20 5 0.1 --out pruned
plink2 --bfile raw.data --pca 10 --out pca --extract pruned.prune.in
sed -i '1d' pca.eigenvec
sed -i '1d' pheno.txt
sed -i 's/Female/female/g' pheno.txt
sed -i 's/Male/male/g' pheno.txt

./plot.pca.R pca.eigenvec 14
