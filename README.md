
## 16 April 2020 ##

### Installing annovar ###


Go to the open bioinformatics site
http://annovar.openbioinformatics.org/en/latest/user-guide/startup/

Register for the annovar software and the link for the download will be sent to your email. 

Download the software to your computer 
you can also use the command "$wget link of the resource" to download the tool. 

Unzip the folder 
$unzip ..
$gunzip ..

Extract the .tar which is an archieve file
$ tar -xvf annovar.latest.tar

cd into the unzipped folder

move the scripts (.pl) in the folder to your bin folder 
$mv "file path and name" ~/bin/

Now, source your .bashrc 
$source /home/sam/.bashrc
enjoy annovar

 
### Installing GATK tools ###
Using anaconda to install gatk

do 
$conda search gatk

look for your version to install

Install with the command below 
n$ conda install -c bioconda gatk=3.8

Download gatk from their website on your pc

unzip the gatk folder and cd into it

the gatk local .jar file with the gatk executable file (highlighted in blue) to your home bin
cp file name ~/bin/s