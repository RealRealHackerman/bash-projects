#!/bin/bash
echo "Enter Path:"
read -r path
ok=0
changed=0
missing=0
new_files=0
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"
create_database(){
    local total
    local processed
    local percentage
    local checksum_file
    local i
    local filled
    local empty
    checksum_file="$1/checksums.sha256"
    if [ -z "$2" ] ; then
        echo "Creating checksum database..."
    else
        echo "Updating checksum database..."
    fi
    total=$(find "$1" -type f ! -path "$checksum_file" | wc -l)
    processed=0
    > "$checksum_file"
    if [[ $total -eq 0 ]]; then
    echo "No files found."
    return
    fi
    while IFS= read -r file; do
        read -r new_hash _ < <(sha256sum "$file")
        echo "$new_hash|$file" >> "$checksum_file"
        ((processed++))
        percentage=$(( processed * 100 / total ))
        filled=$(( percentage * 20 / 100 ))
        empty=$(( 20 - filled ))
        printf "\r["
        for ((i=1; i<=filled; i++)); do
            printf "█"
        done
        for ((i=1; i<=empty; i++)); do
            printf "░"
        done   
        printf "] %d%%" "$percentage"
    done < <(find "$1" -type f ! -path "$checksum_file")
    echo
    echo "Done."
}
check_integrity(){
    ok=0
    changed=0
    missing=0
    new_files=0
    local checksum_file
    declare -A database
    checksum_file="$1/checksums.sha256"
    while IFS='|' read -r hash file; do
        database["$file"]="$hash"
    done < "$checksum_file"
    while IFS= read -r file; do
        if [[ -v database["$file"] ]]; then      
            local old_hash
            local new_hash 
            old_hash="${database["$file"]}"
            read -r new_hash _ < <(sha256sum "$file")
            if [[ "$old_hash" == "$new_hash" ]]; then
                ((ok++))
            else
                ((changed++))
            fi
        else
            ((new_files++))    
        fi
    done < <(find "$1" -type f ! -path "$checksum_file")
    for file in "${!database[@]}"; do
        if [[ ! -f "$file" ]] ; then
            ((missing++))
        fi
    done
}
print_report(){
echo "========== Report =========="
echo -e "${GREEN}OK: $ok${RESET}"
echo -e "${YELLOW}Changed: $changed${RESET}"
echo -e "${RED}Missing: $missing${RESET}"
echo -e "${BLUE}New files: $new_files${RESET}"
}
if [ ! -d "$path" ]; then
    echo "Directory not found."
    exit 1
fi
if [ ! -f "$path/checksums.sha256" ]; then
    create_database "$path"
else
    check_integrity "$path"
    print_report
    if [ "$changed" -ne 0 ] || [ "$missing" -ne 0 ] || [ "$new_files" -ne 0 ]; then

        echo "Update checksum database? (Y/n)"
        read -r q
        if [ "$q" = "y" ] || [ "$q" = "yes" ] || [ "$q" = "" ]; then
            create_database "$path" "$q"
        fi
    else
        echo "Not Changed"
    fi
fi
