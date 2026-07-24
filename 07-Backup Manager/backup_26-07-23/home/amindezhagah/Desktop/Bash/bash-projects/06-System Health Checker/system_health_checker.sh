#!/bin/bash

echo "Enter Username :"
read uname
echo "Enter Process Name :"
read process

echo "===== System Health ====="

disk=$(df -h / | sed -n '2p' | awk '{print$5}' | sed 's/%//')

if [ $disk -le 50 ]
then
    echo "Disk : good ($disk)"
elif [ $disk -le 81 ]
then
    echo "Disk : OK ($disk)"
elif [ $disk -ge 80 ]
then
    echo "Disk : warning ($disk)"

fi
process_exist=$(ps -e | grep "$process")
process0=$(ps -e | grep bash )

if [ -z "$process_exist" ]
then
    echo "$process : Not Running"
else
    echo "$process : Running"
fi

if [ -z "$process0" ]
then
    echo "bash : Not Running"
else
    echo "bash : Running"
fi

user_exist=$(cat /etc/passwd | grep "$uname")

if [ -z "$user_exist" ]
then
    echo "User $uname : Not Exists"
else
    echo "User $uname : Exists"
fi

echo "========================="