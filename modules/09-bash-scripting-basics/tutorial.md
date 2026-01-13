# Module 09: Bash Scripting Basics

**Duration:** 2 hours  
**Difficulty:** Intermediate

## Why Bash Scripting?

Automate repetitive tasks:
- Backup files regularly
- Process multiple files
- Set up development environments
- Run complex workflows
- Schedule tasks

## Your First Script

### Creating a Script

```bash
nano hello.sh
```

Add:
```bash
#!/bin/bash
echo "Hello, World!"
```

Save and exit.

### Making it Executable

```bash
chmod +x hello.sh
```

### Running the Script

```bash
./hello.sh
# Output: Hello, World!
```

### The Shebang

```bash
#!/bin/bash
```

This tells the system to use bash to interpret the script.

## Variables

### Creating and Using Variables

```bash
#!/bin/bash

# Assign variables (NO SPACES around =)
name="John"
age=25
greeting="Hello"

# Use variables (with $)
echo "$greeting, $name!"
echo "You are $age years old"

# Command output in variable
current_dir=$(pwd)
today=$(date +%Y-%m-%d)
echo "Today is $today"
echo "Current directory: $current_dir"
```

**Rules:**
- No spaces around `=`
- Use `$variable` to access value
- Quote variables: `"$variable"` (best practice)

### Special Variables

```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"
echo "Exit status of last command: $?"
echo "Process ID: $$"
```

Run with: `./script.sh arg1 arg2`

## User Input

### Reading Input

```bash
#!/bin/bash

echo "What is your name?"
read name
echo "Hello, $name!"

# Read with prompt
read -p "Enter your age: " age
echo "You are $age years old"

# Read password (hidden)
read -sp "Enter password: " password
echo  # Newline after hidden input
echo "Password received"
```

## Conditionals

### If-Then-Else

```bash
#!/bin/bash

read -p "Enter a number: " num

if [ $num -gt 10 ]; then
    echo "Greater than 10"
elif [ $num -eq 10 ]; then
    echo "Equal to 10"
else
    echo "Less than 10"
fi
```

### Comparison Operators

**Numbers:**
```bash
-eq    # Equal
-ne    # Not equal
-lt    # Less than
-le    # Less than or equal
-gt    # Greater than
-ge    # Greater than or equal
```

**Strings:**
```bash
=      # Equal
!=     # Not equal
-z     # Empty string
-n     # Not empty string
```

**Files:**
```bash
-f     # File exists
-d     # Directory exists
-e     # Exists (file or directory)
-r     # Readable
-w     # Writable
-x     # Executable
```

### Examples

```bash
#!/bin/bash

# Check if file exists
if [ -f "data.txt" ]; then
    echo "File exists"
else
    echo "File not found"
fi

# Check if directory exists
if [ -d "backup" ]; then
    echo "Backup directory exists"
else
    mkdir backup
    echo "Created backup directory"
fi

# String comparison
name="Alice"
if [ "$name" = "Alice" ]; then
    echo "Hello Alice!"
fi

# Multiple conditions (AND)
if [ -f "file.txt" ] && [ -r "file.txt" ]; then
    echo "File exists and is readable"
fi

# Multiple conditions (OR)
if [ "$name" = "Alice" ] || [ "$name" = "Bob" ]; then
    echo "Hello $name!"
fi
```

## Loops

### For Loops

```bash
#!/bin/bash

# Loop over list
for fruit in apple banana cherry; do
    echo "I like $fruit"
done

# Loop over files
for file in *.txt; do
    echo "Processing $file"
done

# C-style loop
for ((i=1; i<=5; i++)); do
    echo "Iteration $i"
done

# Loop over command output
for user in $(cat users.txt); do
    echo "User: $user"
done
```

### While Loops

```bash
#!/bin/bash

# Count to 5
counter=1
while [ $counter -le 5 ]; do
    echo "Count: $counter"
    ((counter++))
done

# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < file.txt
```

### Until Loops

```bash
#!/bin/bash

counter=1
until [ $counter -gt 5 ]; do
    echo "Count: $counter"
    ((counter++))
done
```

## Functions

### Defining and Calling Functions

```bash
#!/bin/bash

# Define function
greet() {
    echo "Hello, $1!"
}

# Call function
greet "Alice"
greet "Bob"
```

### Functions with Return Values

```bash
#!/bin/bash

add() {
    local result=$(($1 + $2))
    echo $result
}

sum=$(add 5 3)
echo "Sum: $sum"
```

### Function with Local Variables

```bash
#!/bin/bash

calculate() {
    local a=$1
    local b=$2
    local sum=$((a + b))
    local product=$((a * b))
    
    echo "Sum: $sum"
    echo "Product: $product"
}

calculate 4 5
```

## Arrays

```bash
#!/bin/bash

# Create array
fruits=("apple" "banana" "cherry")

# Access elements
echo "${fruits[0]}"  # apple
echo "${fruits[1]}"  # banana

# All elements
echo "${fruits[@]}"

# Array length
echo "${#fruits[@]}"

# Loop through array
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done

# Add element
fruits+=("date")
```

## Practical Examples

### Backup Script

```bash
#!/bin/bash

# Backup important files
SOURCE_DIR="$HOME/documents"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_$DATE.tar.gz"

echo "Starting backup..."

# Create backup directory if needed
mkdir -p "$BACKUP_DIR"

# Create compressed archive
tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

echo "Backup completed: $BACKUP_FILE"
echo "Location: $BACKUP_DIR/$BACKUP_FILE"
```

### File Organizer

```bash
#!/bin/bash

# Organize files by extension

for file in *; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        
        # Create directory for extension
        mkdir -p "$extension"
        
        # Move file
        mv "$file" "$extension/"
        echo "Moved $file to $extension/"
    fi
done
```

### Batch Rename

```bash
#!/bin/bash

# Add prefix to all files
prefix="old_"

for file in *.txt; do
    if [ -f "$file" ]; then
        mv "$file" "${prefix}${file}"
        echo "Renamed: $file -> ${prefix}${file}"
    fi
done
```

### System Info Script

```bash
#!/bin/bash

echo "=== System Information ==="
echo ""
echo "Hostname: $(hostname)"
echo "OS: $(uname -s)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "User: $(whoami)"
echo "Current Directory: $(pwd)"
echo "Disk Usage:"
df -h / | tail -1
echo "Memory Usage:"
free -h | grep Mem
```

## Error Handling

### Exit on Error

```bash
#!/bin/bash

# Exit if any command fails
set -e

# Exit if undefined variable is used
set -u

# Your commands here
mkdir backup
cp important.txt backup/
echo "Backup completed"
```

### Check Command Success

```bash
#!/bin/bash

mkdir backup

if [ $? -eq 0 ]; then
    echo "Directory created successfully"
else
    echo "Failed to create directory"
    exit 1
fi
```

### Try-Catch Style

```bash
#!/bin/bash

if cp source.txt dest.txt; then
    echo "Copy successful"
else
    echo "Copy failed"
    exit 1
fi
```

## Best Practices

1. **Always quote variables:**
   ```bash
   echo "$variable"    # Good
   echo $variable      # Can break with spaces
   ```

2. **Use meaningful names:**
   ```bash
   backup_dir="/backup"  # Good
   x="/backup"           # Bad
   ```

3. **Comment your code:**
   ```bash
   # Create backup directory if it doesn't exist
   mkdir -p "$backup_dir"
   ```

4. **Check if files exist:**
   ```bash
   if [ -f "file.txt" ]; then
       cat file.txt
   fi
   ```

5. **Use functions for reusable code:**
   ```bash
   log_message() {
       echo "[$(date +%Y-%m-%d\ %H:%M:%S)] $1"
   }
   
   log_message "Starting backup"
   ```

## Quick Reference

```bash
#!/bin/bash                 # Shebang

# Variables
name="value"
result=$(command)

# Input
read -p "Prompt: " var

# Conditionals
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi

# Loops
for item in list; do
    commands
done

while [ condition ]; do
    commands
done

# Functions
function_name() {
    commands
    echo $1    # First argument
}

# Comparisons
[ $a -eq $b ]    # Numbers equal
[ $a -lt $b ]    # Less than
[ "$a" = "$b" ]  # Strings equal
[ -f file ]      # File exists
[ -d dir ]       # Directory exists
```

Practice with [exercises](exercises.md)!

---
[← Environment Management](../08-environment-management/tutorial.md) | [Next: Advanced Bash →](../10-advanced-bash/tutorial.md)
