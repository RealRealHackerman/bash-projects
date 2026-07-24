# File Organizer

A Bash script that automatically organizes files into folders based on their file extension.

## Features

* Organizes files recursively
* Automatically creates destination folders
* Supports:

  * Videos
  * Images
  * Music
  * PDF files
  * Archives
  * Others
* Prevents overwriting existing files using `mv -n`
* Displays a summary report after execution

## Supported Extensions

| Category | Extensions                      |
| -------- | ------------------------------- |
| Videos   | `.mp4`, `.mkv`, `.avi`          |
| Images   | `.jpg`, `.jpeg`, `.png`, `.gif` |
| Music    | `.mp3`                          |
| PDF      | `.pdf`                          |
| Archives | `.zip`, `.rar`                  |
| Others   | Any unsupported file            |

## Usage

Run the script:

```bash
chmod +x file_organizer.sh
./file_organizer.sh
```

Enter the directory path when prompted.

Example:

```text
Enter Path:
/home/user/Downloads
```

## Example Output

```text
===== File Organizer Report =====
Videos      : 10
Images      : 3
Music       : 155
PDF         : 1
Archive     : 4
Others      : 13
Total files : 186
Moved files : 182
Skipped     : 4
===============================
```

## Concepts Practiced

* Bash Functions
* `case`
* `find`
* Process Substitution
* `while read`
* `mkdir -p`
* `mv -n`
* Arithmetic Operations
* File Management
