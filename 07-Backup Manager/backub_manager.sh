#!/bin/bash

echo "Enter Path To Backup:"
read path
echo "Enter Backup Directory:"
read path_backup_directory
backup(){
    if [ -d "$2" ]
    then
        if [ -d "$1" ]
        then
            directory_name=$(basename "$1")
            date=$(date +"%y"-"%m"-"%d")
            tar -czf "$2"/"$directory_name"_"$date".tar.gz "$1"
            exit_status=$?
            if [ "$exit_status" -eq 0 ]
            then
                echo "Backup Created Successfully"
            else
                echo "Backup Failed"
            fi
        else
            echo "Directory Not Found"
            exit
        fi
    else
        echo "Path Backup Directory Not Found"
    fi
}
backup "$path" "$path_backup_directory" "$directory_name"