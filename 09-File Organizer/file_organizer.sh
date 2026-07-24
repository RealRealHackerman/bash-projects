#!/bin/bash

echo "Enter Path:"
read path
videos=0
images=0
music=0
pdfs=0
archives=0
others=0
total_files=0
moved_files=0
skipped=0
file_organizer(){
    if [ ! -d "$1" ]; then
    echo "Directory not found."
    exit 1
    fi
    while IFS= read -r file; do
    ((total_files++))
        case "$file" in

        *.mp4|*.mkv|*.avi)
            mkdir -p "$1/Videos"
            if mv -n "$file" "$1/Videos"; then
                ((videos++))
                ((moved_files++))
                        else
                ((skipped++))
            fi
            ;;
        *.jpg|*.png|*.jpeg|*.gif)
            mkdir -p "$1/Images"
            if mv -n "$file" "$1/Images"; then
                ((images++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;
        *.mp3)
            mkdir -p "$1/Music"
            if mv -n "$file" "$1/Music"; then
                ((music++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;

        *.pdf)
            mkdir -p "$1/PDF"
            if mv -n "$file" "$1/PDF"; then
                ((pdfs++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;
        *.zip|*.rar)
            mkdir -p "$1/Archive"
            if mv -n "$file" "$1/Archive"; then
                ((archives++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;

        *)
            mkdir -p "$1/Others"
            if mv -n "$file" "$1/Others"; then
                ((others++))
                ((moved_files++))
            else
                ((skipped++))
            fi
            ;;
    esac
    
    done < <(find "$1" \
\( \
    -path "$1/Videos/*" -o \
    -path "$1/Images/*" -o \
    -path "$1/PDF/*" -o \
    -path "$1/Music/*" -o \
    -path "$1/Others/*" -o \
    -path "$1/Archive/*" \
\) -prune -o \
-type f \
-print)
}

file_organizer "$path"

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
echo "==============================="