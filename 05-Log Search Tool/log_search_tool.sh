#!/bin/bash
echo "Enter File Name:"
read file_name

if [ -f "$file_name" ]
then
    echo "Enter Word:"
    read word
    inside_file=$(cat "$file_name" | grep "$word")
    if [ -z "$inside_file" ]
    then
        echo "Word Not Found"
    else
        echo "Word Found"
    fi
else
    echo "File Not exist"
fi