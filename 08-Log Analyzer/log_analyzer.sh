#!/bin/bash

echo "Enter Path :"
read path

if [ -f "$path" ] ; then
    total_lines=$(wc -l "$path" | awk '{print$1}')
    echo "Enter Search Word :"
    read word
    total_word=$(grep -c "$word" "$path")

else
    echo "No file was found at this path."
    exit
fi

echo "===== Log Report ====="

echo "Total Lines : $total_lines "

echo "Occurrences of '$word' : $total_word "

echo "======================"