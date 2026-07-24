#!/bin/bash

read process_name

pid=$(ps -e | grep "$process_name" | awk '{print $1}')

if [ -z "$pid"  ]
then
    echo "Not Found Process"
    

else 
    echo "Found Process"
    echo "PID : $pid"
fi
