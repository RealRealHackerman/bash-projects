# File Integrity Checker (Bash)

## Overview

A simple Bash-based file integrity checker that creates and maintains a SHA-256 checksum database for a directory. It can detect:

* Modified files
* Missing files
* Newly added files

The checksum database is stored as:

```
checksums.sha256
```

Each line contains:

```
<sha256_hash>|<absolute_file_path>
```

---

## Features

* Create a checksum database for any directory.
* Verify file integrity using SHA-256.
* Detect:

  * Modified files
  * Missing files
  * New files
* Colorized report.
* Progress bar while creating or updating the database.
* Option to update the checksum database after changes are detected.

---

## Requirements

* Bash
* GNU Coreutils (`sha256sum`)
* `find`
* `awk`

---

## Usage

Run the script:

```bash
chmod +x integrity_checker.sh
./integrity_checker.sh
```

Enter the directory path when prompted.

---

## First Run

If no checksum database exists, the script will create one automatically.

Example:

```
Enter Path:
/home/user/Documents

Creating checksum database...
[████████████████████] 100%
Done.
```

---

## Integrity Check

If a checksum database already exists, the script compares every file with its stored hash and prints a report.

Example:

```
========== Report ==========
OK: 120
Changed: 2
Missing: 1
New files: 4
```

---

## Updating the Database

If changes are detected, the script asks whether the checksum database should be updated.

Example:

```
Update checksum database? (Y/n)
```

Selecting **Y** recreates the checksum database using the current file state.

---

## How It Works

1. Scan all files in the selected directory.
2. Calculate each file's SHA-256 hash.
3. Store hashes inside `checksums.sha256`.
4. Load the database into an associative array.
5. Compare current hashes with stored hashes.
6. Detect:

   * Modified files
   * Deleted files
   * Newly added files
7. Print a summary report.

---

## Limitations

* Uses absolute file paths.
* Symbolic links are not handled specially.
* File permissions and ownership are not checked.
* Only file contents are verified.

---

## Technologies Used

* Bash
* SHA-256
* Associative Arrays (`declare -A`)
* Process Substitution
* ANSI Escape Codes
* GNU Coreutils

---

## License

This project is released under the MIT License.

