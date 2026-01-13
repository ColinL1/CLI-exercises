# Module 09: Exercises

**Time:** 60 minutes

## Exercise 1: Hello Script (10 min)

1. Create a script that greets the user:
   ```bash
   nano greet.sh
   ```

   Add:
   ```bash
   #!/bin/bash
   read -p "What is your name? " name
   echo "Hello, $name! Welcome to bash scripting."
   echo "Today is $(date +%A, %B %d, %Y)"
   ```

2. Make it executable and run:
   ```bash
   chmod +x greet.sh
   ./greet.sh
   ```

## Exercise 2: Calculator (15 min)

Create a simple calculator:

```bash
nano calculator.sh
```

```bash
#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2

sum=$((num1 + num2))
diff=$((num1 - num2))
prod=$((num1 * num2))

echo "Sum: $sum"
echo "Difference: $diff"
echo "Product: $prod"

if [ $num2 -ne 0 ]; then
    quot=$((num1 / num2))
    echo "Quotient: $quot"
else
    echo "Cannot divide by zero"
fi
```

Test it!

## Exercise 3: File Checker (10 min)

Create a script that checks if a file exists:

```bash
nano filecheck.sh
```

```bash
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

if [ -f "$filename" ]; then
    echo "File exists!"
    echo "Size: $(du -h "$filename" | cut -f1)"
    echo "Last modified: $(stat -c %y "$filename")"
else
    echo "File does not exist."
    read -p "Create it? (y/n): " answer
    if [ "$answer" = "y" ]; then
        touch "$filename"
        echo "File created!"
    fi
fi
```

## Exercise 4: Batch File Creator (10 min)

Create multiple files in a loop:

```bash
nano create_files.sh
```

```bash
#!/bin/bash

read -p "How many files to create? " count
read -p "Prefix name: " prefix

for ((i=1; i<=count; i++)); do
    filename="${prefix}_${i}.txt"
    echo "This is file number $i" > "$filename"
    echo "Created: $filename"
done

echo "Total files created: $count"
```

## Exercise 5: Backup Script (15 min)

Create a backup script:

```bash
nano backup.sh
```

```bash
#!/bin/bash

# Configuration
SOURCE="$HOME/documents"
BACKUP_DIR="$HOME/backup"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_$DATE.tar.gz"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Check if source exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory does not exist: $SOURCE"
    exit 1
fi

# Create backup
echo "Creating backup of $SOURCE..."
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[OK] Backup successful!"
    echo "  File: $BACKUP_NAME"
    echo "  Location: $BACKUP_DIR"
    echo "  Size: $(du -h "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)"
else
    echo "[FAIL] Backup failed!"
    exit 1
fi

# Keep only last 5 backups
echo "Cleaning old backups..."
cd "$BACKUP_DIR"
ls -t backup_*.tar.gz | tail -n +6 | xargs -r rm
echo "Done!"
```

## Exercise 6: System Report (15 min)

Create a system information script:

```bash
nano sysinfo.sh
```

```bash
#!/bin/bash

echo "================================"
echo "   SYSTEM INFORMATION REPORT"
echo "================================"
echo ""

echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Username: $(whoami)"
echo ""

echo "--- System ---"
echo "OS: $(uname -s)"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo ""

echo "--- Disk Usage ---"
df -h / | grep -v Filesystem
echo ""

echo "--- Memory Usage ---"
free -h | grep -E "Mem|Swap"
echo ""

echo "--- Top 5 Processes (by memory) ---"
ps aux --sort=-%mem | head -6
echo ""

echo "================================"
echo "Report generated: $(date +%Y-%m-%d\ %H:%M:%S)"
```

## Challenge: Menu-Driven Script (30 min)

Create an interactive menu:

```bash
nano menu.sh
```

```bash
#!/bin/bash

show_menu() {
    echo ""
    echo "=== Main Menu ==="
    echo "1) Show date and time"
    echo "2) List files"
    echo "3) Show disk usage"
    echo "4) Show current directory"
    echo "5) Create a file"
    echo "6) Exit"
    echo ""
}

while true; do
    show_menu
    read -p "Choose an option: " choice
    
    case $choice in
        1)
            echo "Current date and time: $(date)"
            ;;
        2)
            echo "Files in current directory:"
            ls -lh
            ;;
        3)
            echo "Disk usage:"
            df -h
            ;;
        4)
            echo "Current directory: $(pwd)"
            ;;
        5)
            read -p "Enter filename: " filename
            touch "$filename"
            echo "Created: $filename"
            ;;
        6)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option! Please try again."
            ;;
    esac
    
    read -p "Press Enter to continue..."
done
```

## Testing Your Scripts

For each script:
1. Make it executable
2. Run it multiple times with different inputs
3. Try edge cases (empty input, special characters, etc.)
4. Check error messages

## Cleanup

```bash
rm -f greet.sh calculator.sh filecheck.sh create_files.sh backup.sh sysinfo.sh menu.sh
rm -f test_*.txt
```

[← Tutorial](tutorial.md) | [Next Module →](../10-advanced-bash/tutorial.md)
