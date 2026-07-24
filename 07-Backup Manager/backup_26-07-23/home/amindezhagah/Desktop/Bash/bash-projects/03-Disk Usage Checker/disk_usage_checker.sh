#!/bin/bash
read path
if [ -d "$path" ]
then
    echo "Directory Found"
    disk_usage=$(df -h "$path")
    echo "$disk_usage"
else
    echo "Directory Not Found"
    exit
fi