#!/bin/bash

echo "Enter Username:"
read uname

user_exist=$(cat /etc/passwd | grep "$uname")

if [ -z "$user_exist" ]
then
    echo "User Not Found"
else
    echo "User Found"
fi