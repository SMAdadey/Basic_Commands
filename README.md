
## 16 April 2020 ##

### Installing annovar ###


[Go to the open bioinformatics site](http://annovar.openbioinformatics.org/en/latest/user-guide/startup/)

Register for the annovar software and the link for the download will be sent to your email. 
Download the software to your computer 
you can also use the command "

```
wget link of the resource" to download the tool. 
```


Unzip the folder 


```
unzip ..
gunzip ..
```


Extract the .tar which is an archieve file

```
tar -xvf annovar.latest.tar
```


```
cd into the unzipped folder
```


move the scripts (.pl) in the folder to your bin folder 

```
mv "file path and name" ~/bin/
```


Now, source your .bashrc 

```
source /home/sam/.bashrc
```

enjoy annovar

 

## 18 April 2020 ##
### Uploading to git hub ###

The first thing to do after creating the repository online is to clone it to your HD

```
git clone link
```


check status with 

```
git status
```


Addding online, use 

```
git add 
```


Commit will send to the intermediate cloud 

```
git commit -m "message"
```


you need to push now to the microsoft cloud 


```
git push -u origin master 
```



online command 

```
for i in README.md; do git add $i; git commit -m "first commit"; git push -u origin master; done
```


## Editing vcf files (using txt file to select them and look for a location and print genotype at that location ##

```
for i in $(cat 2n3per_family.txt); do echo $i $(bcftools view --threads 10 -v snps -r chr13:20763294 "${i}.hard-filtered.gvcf.gz" | bcftools query -f '[ %GT]\n'); done
```

```
bcftools view -v snps -r chr13:20763294 all_samples_gh_20200422_joint_call.gvcf.gz | bcftools query -H -f '[ %GT]\n' | less -S
```

### Installing GATK tools ###
Using anaconda to install gatk

do 

```
conda search gatk
```


look for your version to install

Install with the command below 

```
 conda install -c bioconda gatk=3.8
```


Download gatk from their website on your pc

unzip the gatk folder and cd into it

the gatk local .jar file with the gatk executable file (highlighted in blue) to your home bin

```
cp file name ~/bin/s
```
