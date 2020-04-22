##  20 April 2020 ##

Merge using bcftools 
>> bcftools_mergeCommand=merge --threads 10 -m all -Oz -o r143w-merge-joint.vcf.gz r143w-positive-jointcall-chr13-updated2-phased.vcf.gz r143w-negative-jointcall-chr13-updated2-phased.vcf.gz;

Unzip and unpack tools king for checking relatedness
>> tar zxvf ~/path/Linux-king.tar.gz


index vcf files (you need to index vcf files before you can use bcftools) 
>> bcftools index -ft file_name.vcf.gz


Using plink to convert to .bed
>> plink2 --vcf file_name.vcf.gz --make-bed --max-alleles 2 --snps-only just-acgt --double-id --out file_name


Relatedness of samples 
>> king -b file_name.bed --ibdseg


Listing samples in the vcf file 
>> bcftools query -l file_name.vcf.gz


Using bcftools to subset samples from joint call 
>> bcftools view -S samples-ids.txt -Oz -o input_file_name.vcf.gz output_file_name.vcf.gz


using plink 1.9 to covert to ped file 
>> plink1.9 --bfile input_file_name --recode HV-1chr --chr 13 --keep-allele-order --biallelic-only --snps-only just-acgt --double-id --out output_file_name

>> plink1.9 --bfile input_file_name --recode HV-1chr --chr 13 --from-bp 20663294 --to-bp 20863294 --keep-allele-order --biallelic-only --snps-only just-acg
t --double-id --out output_file_name

Sorting uniq for the rs numbers 
>> sort -b --uniq file_name.txt > output_file_name



Using bcftools to view samples with a particular position 
>> bcftools view -S samples-ids.txt -r 13:20763294 file_name.vcf.gz | less -S


Using bcftools to creat haplotype data
>> bcftools view -S samples-ids.txt -r 13:20763294 input_file_name.vcf.gz | bcftools query -H -f '[ %GT]\n' | sed 's/1|1/2/g' | sed 's/1|0/2/g' | sed 's/0|0/1/g' | sed 's/0|1/2/g' | sed '2d' | less -S

>> bcftools view -S samples-ids.txt -r 13:20763294 input_file_name.vcf.gz | bcftools query -H -f '[ %GT]\n' | sed 's/1|1/2/g' | sed 's/1|0/2/g' | sed 's/0|0/1/g' | sed 's/0|1/2/g' | sed '2d' | less -S

>> bcftools view -S samples-ids.txt -R rs-positions_for_haplotypes3.txt input_file_name.vcf.gz | bcftools query -H -f '[ %GT]\n' | sed 's/1|1/2/g' | sed 's/1|0/2/g' | sed 's/0|0/1/g' | sed 's/0|1/2/g' | less -S

>> grep -w -f rs_for_haplotypes3.txt input_file_name.bim | awk '{print $1":"$4}' | tr '\n' ',' | sed 's/,$//g' > rs-positions_for_haplotypes3.txt

>> echo "bcftools view -v snps -k -m2 -M2 -S samples-ids.txt -r \$(cat rs-positions_for_haplotypes3.txt) input_file_name.vcf.gz | bcftools query -H -f '[ %GT]\n' | sed 's/1|1/2/g' | sed 's/1|0/2/g' | sed 's/0|0/1/g' | sed 's/0|1/2/g' | sed '1d' > haps.txt" > gethaps.sh




Editing vcf files (using txt file to select them and look for a location and print genotype at that location 
$(cat smaple_list_to_select.txt); do echo $i $(bcftools view --threads 10 -v snps -r chr13:20763294 "${i}.hard-filtered.gvcf.gz" | bcftools query -f '[ %GT]\n'); done




