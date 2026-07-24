#!/bin/bash
echo "Enter Username :"
read username
password="hello"
attempts=0
max_attempts=3
login() {
    while [ "$attempts" -lt "$max_attempts" ]
    do
        echo "Enter Password :"
        
        read input_password

        if [ "$2" = "$input_password" ]
        then
            echo "Welcome $1"
            return
        fi
        echo "Wrong Password"
        attempts=$((attempts+1))
            
    done
    echo "Access Denied"
    exit
}

login "$username" "$password"

echo "Program Finished"