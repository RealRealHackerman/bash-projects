# File Organizer

A simple Bash script that organizes files into folders based on their extensions.

## Features

- Organizes files into:
  - Videos
  - Images
  - Music
  - PDF
  - Archive
  - Others
- Progress bar
- Final report
- Calculates success rate
- Skips existing files using `mv -n`

## Supported Extensions

### Videos
- mp4
- mkv
- avi

### Images
- jpg
- jpeg
- png
- gif

### Music
- mp3

### PDF
- pdf

### Archives
- zip
- rar

Everything else is moved to **Others**.

## Usage

```bash
chmod +x file-organizer.sh
./file-organizer.sh
```

Enter the directory path when prompted.

Example:

```
Enter Path:
/home/user/Downloads
```

## Example Output

```
[████████████████████] 100%

Done.

===== File Organizer Report =====
Videos      : 4
Images      : 12
Music       : 5
PDF         : 3
Archive     : 2
Others      : 1
Total files : 27
Moved files : 27
Skipped     : 0
Success rate: 100%
```

## Requirements

- Bash
- GNU coreutils
- find
- sha256sum
