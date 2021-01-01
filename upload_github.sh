
#!/usr/bin/env bash

##Uploading data to github
##today

file=$1
msg=$2

if [ $# == 2 ]; then
        for i in $1; do git add $i; git commit -m $2; git push -u origin master; done
else
        echo " "
        echo "File to upload, message about changes made"
        echo "./upload_github.sh <input file> <message about changes made>"
        echo " "
fi


