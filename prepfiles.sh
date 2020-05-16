** Preparing .csv to ped and bim files for plink **

sed -i 's/;/\t/g' raw.data.tsv 
cut -f3-33 raw.data.tsv | sed '1d' | sed 's/\t/ /g' | sed 's/-9/00/g' > ped.template.txt 
cut -f1-2,34- raw.data.tsv > pheno.txt
awk 'OFS="\t" {print  $1,$2,"0","0",$5,$13}' pheno.txt | sed '1d' > fam.template.txt
paste fam.template.txt ped.template.txt | sed 's/\t/ /g' > raw.data.ped
awk 'OFS="\t" {print $1,$2,"0",$3}' map.template.csv | sed '1d' > raw.data.map
