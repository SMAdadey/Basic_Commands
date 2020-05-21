
Obtaining the snps from the excel file (.csv)

```
 head -1 raw.data.csv 
 head -1 raw.data.csv | sed 's/;/\n/g' | head
 head -1 raw.data.csv | sed 's/;/\n/g' | sed '1,2d' | head
 head -1 raw.data.csv | sed 's/;/\n/g' | sed '1,2d' | grep rs | head
 head -1 raw.data.csv | sed 's/;/\n/g' | sed '1,2d' | grep rs | tail
 head -1 raw.data.csv | sed 's/;/\n/g' | sed '1,2d' | grep rs > snps.txt
```


The snp file was used on the snpdb to grab the positions and chromosome numbers and etc 

editing downloaded snps files from snpdb



``` 
 grep -f snps.txt ~/biotools/annovar/humandb/hg19_snp151.txt | head
 grep -w -f snps.txt ~/biotools/annovar/humandb/hg19_snp151.txt | head
 grep -w -f snps.txt ~/biotools/annovar/humandb/hg19_snp151.txt | awk '{print $2,$3,$4,$5,$10,$11}' > snps151.txt 
 for i in $(cat snps.txt); do grep -w $i ~/biotools/annovar/humandb/hg19_snp151.txt | awk '{print $2,$3,$4,$5,$10,$11}'; done > snps151.txt 
```

```
 awk '{print $2,$1,$3}' snps.VEP.txt | head
``` 


```
 awk '{print $2,$1,$3}' snps.VEP.txt | head
 awk '{print $2,$1,"0",$3}' snps.VEP.txt | head
 awk '{print $2,"0",$1,$3}' snps.VEP.txt | head
 awk '{print $2,$1,"0",$3}' snps.VEP.txt | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | sed 's/:/ /g' | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | sed 's/:/ /g' | awk '{print $1,$4,$5,$2,$9}' | hed
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | sed 's/:/ /g' | awk '{print $1,$4,$5,$2,$9}' | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | sed 's/:/ /g' | awk 'OFS="\t" {print $1,$4,$5,$2,$9}' | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | sed 's/:/ /g' | sed '1d' | awk 'OFS="\t" {print $1,$4,$5,$2,$9}' | head
 awk '{print $2,$1,"0",$2,$3}' snps.VEP.txt | sed 's/-/ /g' | sed 's/:/ /g' | sed '1d' | awk 'OFS="\t" {print $1,$4,$5,$2,$9}' > snps.bim
```
