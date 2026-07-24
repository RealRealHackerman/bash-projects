# Log Analyzer

A simple Bash tool for analyzing log files.

## Features

* Check if the log file exists
* Count the total number of lines in the log file
* Search for a specific word
* Count how many times the word appears
* Display a clean log report

## Requirements

* Linux
* Bash
* `grep`
* `wc`
* `awk`

## Usage

Run the script:

```bash
chmod +x log-analyzer.sh
./log-analyzer.sh
```

Enter the path to a log file:

```text
Enter Path:
/var/log/dpkg.log
```

Enter the word to search:

```text
Enter Search Word:
install
```

Example output:

```text
===== Log Report =====
Total Lines : 129
Occurrences of 'install' : 24
======================
```

## Skills Practiced

* File validation
* User input
* Text processing
* Command substitution
* Log analysis
* Bash scripting
