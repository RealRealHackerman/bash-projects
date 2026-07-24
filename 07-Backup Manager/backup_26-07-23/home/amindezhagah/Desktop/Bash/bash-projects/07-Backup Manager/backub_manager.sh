#!/bin/bash
read path
if [ -d "$path" ]
then
    date=$(date +"%y"-"%m"-"%d")
    tar -czf backup_"$date".tar.gz "$path"
    echo "Backup Created Successfully"
else
    echo "Directory Not Found"
    exit
fi