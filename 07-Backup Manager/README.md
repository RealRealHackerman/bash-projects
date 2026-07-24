# Backup Manager

A simple Bash tool for creating compressed backups of directories.

## Features

* Create a compressed `.tar.gz` backup of a directory
* Verify that the source directory exists
* Verify that the backup destination exists
* Automatically include the current date in the backup filename
* Display success or failure messages after backup creation

## Requirements

* Linux
* Bash
* `tar`

## Usage

Run the script:

```bash
chmod +x backup.sh
./backup.sh
```

Enter:

1. Source directory path
2. Backup destination directory

Example:

```text
Enter Path To Backup:
/home/amindezhagah/Documents

Enter Backup Directory:
/home/amindezhagah/Backups
```

Example output:

```text
Backup Created Successfully
```

Example backup file:

```text
Documents_26-07-23.tar.gz
```
