# Module 10: Advanced Bash & Text Processing

**Duration:** 1.5 hours  
**Difficulty:** Advanced

## Pipes and Redirects

### Understanding Streams

- **stdin (0)**: Standard input
- **stdout (1)**: Standard output
- **stderr (2)**: Standard error

### Redirects

```bash
# Output redirect (overwrite)
ls > files.txt

# Output redirect (append)
ls >> files.txt

# Error redirect
command 2> errors.txt

# Both output and errors
command > output.txt 2> errors.txt

# Redirect both to same file
command > all.txt 2>&1
command &> all.txt  # Shorter syntax

# Discard output
command > /dev/null

# Discard errors
command 2> /dev/null

# Input redirect
command < input.txt

# Here document
command << EOF
line 1
line 2
EOF
```

### Pipes

```bash
# Send output of one command to another
ls -l | grep ".txt"

# Chain multiple commands
cat file.txt | grep "error" | wc -l

# Complex pipeline
ps aux | grep python | awk '{print $2}' | xargs kill
```

## Text Processing Tools

### grep - Search Text

```bash
# Basic search
grep "pattern" file.txt

# Case-insensitive
grep -i "pattern" file.txt

# Recursive search
grep -r "pattern" directory/

# Show line numbers
grep -n "pattern" file.txt

# Invert match (show non-matching)
grep -v "pattern" file.txt

# Count matches
grep -c "pattern" file.txt

# Show context
grep -A 3 "pattern" file.txt    # 3 lines after
grep -B 3 "pattern" file.txt    # 3 lines before
grep -C 3 "pattern" file.txt    # 3 lines before and after

# Regular expressions
grep -E "pattern1|pattern2" file.txt
grep -E "^start" file.txt       # Line starts with
grep -E "end$" file.txt         # Line ends with
```

### sed - Stream Editor

```bash
# Replace text
sed 's/old/new/' file.txt         # First occurrence per line
sed 's/old/new/g' file.txt        # All occurrences

# Edit in place
sed -i 's/old/new/g' file.txt

# Delete lines
sed '/pattern/d' file.txt
sed '1d' file.txt                 # Delete first line
sed '1,5d' file.txt               # Delete lines 1-5

# Print specific lines
sed -n '5p' file.txt              # Print line 5
sed -n '10,20p' file.txt          # Print lines 10-20

# Multiple operations
sed -e 's/old/new/g' -e 's/foo/bar/g' file.txt
```

### awk - Pattern Scanning and Processing

```bash
# Print columns
awk '{print $1}' file.txt         # First column
awk '{print $1, $3}' file.txt     # First and third
awk '{print $NF}' file.txt        # Last column

# Custom delimiter
awk -F',' '{print $1}' file.csv

# Conditional printing
awk '$3 > 100' file.txt           # Rows where column 3 > 100
awk '$1 == "ERROR"' log.txt       # Rows where column 1 is ERROR

# Calculations
awk '{sum += $1} END {print sum}' numbers.txt
awk '{print $1, $2, $1+$2}' file.txt

# Pattern matching
awk '/error/ {print $0}' log.txt

# Complex example
awk 'BEGIN {FS=","; OFS="\t"} {print $1, $2}' file.csv
```

### cut - Extract Columns

```bash
# Extract characters
cut -c1-5 file.txt               # Characters 1-5

# Extract fields
cut -f1,3 -d',' file.csv         # Fields 1 and 3, comma-delimited
cut -f2- -d':' /etc/passwd       # Field 2 onwards
```

### sort - Sort Lines

```bash
# Basic sort
sort file.txt

# Numeric sort
sort -n numbers.txt

# Reverse sort
sort -r file.txt

# Sort by column
sort -k2 file.txt                # Sort by 2nd column

# Unique lines only
sort -u file.txt

# Case-insensitive
sort -f file.txt
```

### uniq - Remove Duplicates

```bash
# Remove adjacent duplicates (requires sorted input)
sort file.txt | uniq

# Count occurrences
sort file.txt | uniq -c

# Show only duplicates
sort file.txt | uniq -d

# Show only unique lines
sort file.txt | uniq -u
```

## Command Substitution

```bash
# Backticks (old style)
echo `date`

# $() syntax (preferred)
echo $(date)

# In variables
current_date=$(date +%Y-%m-%d)
file_count=$(ls | wc -l)

# Nested
echo "You have $(ls *.txt | wc -l) text files"
```

## Process Substitution

```bash
# Compare output of two commands
diff <(ls dir1) <(ls dir2)

# Use command output as file
while read line; do
    echo "Line: $line"
done < <(ls -l)
```

## Practical Examples

### Log Analysis

```bash
# Count error types
grep ERROR app.log | cut -d':' -f2 | sort | uniq -c | sort -rn

# Find top 10 IP addresses
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -10

# Extract timestamps of errors
grep ERROR app.log | awk '{print $1, $2}'

# Count errors per hour
grep ERROR app.log | cut -d':' -f1 | sort | uniq -c
```

### Data Processing

```bash
# CSV: Extract specific columns
cut -d',' -f1,3 data.csv > subset.csv

# CSV: Calculate average
awk -F',' '{sum+=$3; count++} END {print sum/count}' data.csv

# CSV: Filter rows
awk -F',' '$3 > 100' data.csv > filtered.csv

# Convert to TSV
sed 's/,/\t/g' data.csv > data.tsv
```

### File Operations

```bash
# Find and replace in multiple files
find . -name "*.txt" -exec sed -i 's/old/new/g' {} \;

# Batch rename
for file in *.txt; do
    mv "$file" "${file%.txt}.md"
done

# Find large files
find . -type f -size +100M -exec ls -lh {} \;

# Delete old files
find . -type f -mtime +30 -delete
```

## Advanced Scripting Patterns

### Argument Parsing

```bash
#!/bin/bash

while getopts "f:o:v" opt; do
    case $opt in
        f) input_file="$OPTARG" ;;
        o) output_file="$OPTARG" ;;
        v) verbose=true ;;
        \?) echo "Invalid option"; exit 1 ;;
    esac
done

echo "Input: $input_file"
echo "Output: $output_file"
[ "$verbose" = true ] && echo "Verbose mode on"
```

Usage: `./script.sh -f input.txt -o output.txt -v`

### Error Handling

```bash
#!/bin/bash

set -euo pipefail  # Exit on error, undefined variables, pipe failures

# Trap errors
trap 'echo "Error on line $LINENO"' ERR

# Cleanup on exit
cleanup() {
    rm -f /tmp/tempfile
}
trap cleanup EXIT

# Your code here
```

### Logging Function

```bash
#!/bin/bash

LOG_FILE="script.log"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Script started"
log "Processing files..."
log "Script completed"
```

### Progress Bar

```bash
#!/bin/bash

show_progress() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local filled=$((current * width / total))
    
    printf "\rProgress: ["
    printf "%${filled}s" | tr ' ' '='
    printf "%$((width - filled))s" | tr ' ' ' '
    printf "] %d%%" $percentage
}

total=100
for ((i=1; i<=total; i++)); do
    show_progress $i $total
    sleep 0.1
done
echo ""
```

## Real-World Script Examples

### Automated Backup with Rotation

```bash
#!/bin/bash

BACKUP_DIR="/backup"
SOURCE="/data"
DAYS_TO_KEEP=7
DATE=$(date +%Y%m%d)

# Create backup
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE"

# Remove old backups
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$DAYS_TO_KEEP -delete

echo "Backup completed: backup_$DATE.tar.gz"
```

### Website Monitor

```bash
#!/bin/bash

URL="https://example.com"
TIMEOUT=10

if curl -s -f -m $TIMEOUT "$URL" > /dev/null; then
    echo "[OK] $URL is up"
else
    echo "[DOWN] $URL is down"
    # Send alert here
fi
```

### Data Processing Pipeline

```bash
#!/bin/bash

# Download, process, and analyze data
curl -s https://api.example.com/data.json \
  | jq '.results[]' \
  | grep -v "null" \
  | sort \
  | uniq -c \
  | sort -rn \
  | head -10 \
  > top10.txt

echo "Analysis complete"
```

## Quick Reference

```bash
# Redirects
>     # Redirect output (overwrite)
>>    # Redirect output (append)
2>    # Redirect errors
&>    # Redirect both
<     # Input redirect
|     # Pipe

# Text processing
grep "pattern" file          # Search
sed 's/old/new/g' file      # Replace
awk '{print $1}' file       # Extract columns
cut -d',' -f1 file          # Cut columns
sort file                   # Sort
uniq file                   # Remove duplicates

# Command substitution
$(command)                  # Capture output
<(command)                  # Process substitution
```

Practice with [exercises](exercises.md)!

---
[← Bash Scripting Basics](../09-bash-scripting-basics/tutorial.md) | [Next: Real-World Projects →](../11-real-world-projects/tutorial.md)
