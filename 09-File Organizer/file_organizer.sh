#!/bin/bash

echo "Enter Path:"
read -r path
videos=0
images=0
music=0
pdfs=0
archives=0
others=0
total_files=0
moved_files=0
skipped=0
find_files() {
    find "$1" \
    \( \
        -path "$1/Videos/*" -o \
        -path "$1/Images/*" -o \
        -path "$1/PDF/*" -o \
        -path "$1/Music/*" -o \
        -path "$1/Others/*" -o \
        -path "$1/Archive/*" \
    \) -prune -o \
    -type f -print
}
file_organizer(){
    if [ ! -d "$1" ]; then
    echo "Directory not found."
    exit 1
    fi
    local total processed percentage filled empty i
    total=$(find_files "$1" | wc -l)
    processed=0
    if [[ $total -eq 0 ]]; then
        echo "No files found."
        return
    fi
    
    mkdir -p \
        "$1/Videos" \
        "$1/Images" \
        "$1/Music" \
        "$1/PDF" \
        "$1/Archive" \
        "$1/Others"
        
    while IFS= read -r file; do
    ((total_files++))
        case "$file" in

        *.mp4|*.mkv|*.avi)
            
            if mv -n "$file" "$1/Videos"; then
                ((videos++))
                ((moved_files++))

                        else
                ((skipped++))
            fi
            ;;
        *.jpg|*.png|*.jpeg|*.gif)
            
            if mv -n "$file" "$1/Images"; then
                ((images++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;
        *.mp3)
            
            if mv -n "$file" "$1/Music"; then
                ((music++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;

        *.pdf)
            
            if mv -n "$file" "$1/PDF"; then
                ((pdfs++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;
        *.zip|*.rar)
            
            if mv -n "$file" "$1/Archive"; then
                ((archives++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;

        *)
            
            if mv -n "$file" "$1/Others"; then
                ((others++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;
    esac
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
        printf "] %3d%%" "$percentage"
    done < <(find_files "$1")
    echo
    echo "Done."
}


file_organizer "$path"
if [ "$total_files" -ne 0 ]; then
    success_rate=$(( moved_files * 100 / total_files ))
else
    success_rate=0
fi
echo
echo "===== File Organizer Report ====="
echo "Videos   : $videos"
echo "Images   : $images"
echo "Music    : $music"
echo "PDF      : $pdfs"
echo "Archive  : $archives"
echo "Others   : $others"
echo "Total files : $total_files"
echo "Moved files : $moved_files"
echo "Skipped   : $skipped"
echo "Success rate: ${success_rate}%"
echo "==============================="