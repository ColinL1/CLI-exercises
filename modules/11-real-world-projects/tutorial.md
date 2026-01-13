# Module 11: Real-World Projects

**Duration:** 1.5 hours  
**Difficulty:** Advanced

## Project 1: Automated Backup System (30 min)

Create a comprehensive backup solution.

### Requirements:
- Backup specified directories
- Compress backups
- Keep only last N backups
- Log all operations
- Email notifications (optional)

### Solution:

```bash
#!/bin/bash
# backup_system.sh - Automated backup solution

# Configuration
BACKUP_SOURCES=(
    "$HOME/documents"
    "$HOME/projects"
    "$HOME/.config"
)
BACKUP_DEST="$HOME/backups"
KEEP_DAYS=7
LOG_FILE="$BACKUP_DEST/backup.log"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_$DATE.tar.gz"

# Logging function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Create backup directory
mkdir -p "$BACKUP_DEST"

# Start backup
log "=== Backup Started ==="

# Verify sources exist
missing_sources=()
for source in "${BACKUP_SOURCES[@]}"; do
    if [ ! -d "$source" ]; then
        log "WARNING: Source not found: $source"
        missing_sources+=("$source")
    fi
done

# Remove missing sources from array
for remove in "${missing_sources[@]}"; do
    BACKUP_SOURCES=("${BACKUP_SOURCES[@]/$remove}")
done

# Create backup
log "Creating backup: $BACKUP_NAME"
if tar -czf "$BACKUP_DEST/$BACKUP_NAME" "${BACKUP_SOURCES[@]}" 2>> "$LOG_FILE"; then
    BACKUP_SIZE=$(du -h "$BACKUP_DEST/$BACKUP_NAME" | cut -f1)
    log "[OK] Backup successful - Size: $BACKUP_SIZE"
else
    log "[FAIL] Backup failed"
    exit 1
fi

# Rotate old backups
log "Rotating old backups (keeping last $KEEP_DAYS days)"
find "$BACKUP_DEST" -name "backup_*.tar.gz" -mtime +$KEEP_DAYS -type f | while read old_backup; do
    log "Removing old backup: $(basename "$old_backup")"
    rm "$old_backup"
done

# Summary
TOTAL_BACKUPS=$(find "$BACKUP_DEST" -name "backup_*.tar.gz" | wc -l)
TOTAL_SIZE=$(du -sh "$BACKUP_DEST" | cut -f1)

log "=== Backup Complete ==="
log "Total backups: $TOTAL_BACKUPS"
log "Total size: $TOTAL_SIZE"
log ""

# Display summary
cat << EOF

Backup Summary:
---------------
Date: $(date)
Backup file: $BACKUP_NAME
Size: $BACKUP_SIZE
Location: $BACKUP_DEST
Total backups: $TOTAL_BACKUPS
Log: $LOG_FILE

EOF
```

### Usage:

```bash
chmod +x backup_system.sh
./backup_system.sh

# Schedule with cron (daily at 2 AM)
# crontab -e
# 0 2 * * * /path/to/backup_system.sh
```

## Project 2: Data Processing Pipeline (30 min)

Process CSV data, clean it, analyze it, and generate reports.

### Solution:

```bash
#!/bin/bash
# data_pipeline.sh - Process and analyze CSV data

INPUT_FILE=$1
OUTPUT_DIR="./processed_data"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

if [ $# -eq 0 ]; then
    echo "Usage: $0 <input.csv>"
    exit 1
fi

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File not found: $INPUT_FILE"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "=== Data Processing Pipeline ==="
echo "Input: $INPUT_FILE"
echo ""

# Step 1: Clean data (remove empty lines and duplicates)
echo "Step 1: Cleaning data..."
cleaned="$OUTPUT_DIR/cleaned_$TIMESTAMP.csv"
grep -v '^$' "$INPUT_FILE" | sort | uniq > "$cleaned"
echo "[OK] Cleaned: $cleaned"

# Step 2: Extract statistics
echo ""
echo "Step 2: Generating statistics..."
total_lines=$(wc -l < "$cleaned")
echo "Total records: $total_lines"

# Step 3: Split by category (if applicable)
echo ""
echo "Step 3: Categorizing data..."
header=$(head -1 "$cleaned")
tail -n +2 "$cleaned" | awk -F',' '{print $2}' | sort | uniq | while read category; do
    cat_file="$OUTPUT_DIR/category_${category// /_}.csv"
    echo "$header" > "$cat_file"
    tail -n +2 "$cleaned" | grep ",$category," >> "$cat_file"
    count=$(wc -l < "$cat_file")
    echo "  $category: $((count - 1)) records -> $cat_file"
done

# Step 4: Generate summary report
echo ""
echo "Step 4: Generating report..."
report="$OUTPUT_DIR/report_$TIMESTAMP.txt"

{
    echo "Data Processing Report"
    echo "====================="
    echo "Date: $(date)"
    echo "Input file: $INPUT_FILE"
    echo "Total records: $total_lines"
    echo ""
    echo "Files generated:"
    ls -lh "$OUTPUT_DIR" | grep "$TIMESTAMP"
} > "$report"

echo "[OK] Report: $report"
echo ""
echo "=== Processing Complete ==="
```

### Usage:

```bash
# Create sample data
cat > sales.csv << 'EOF'
date,category,amount
2026-01-01,Electronics,1500
2026-01-02,Books,250
2026-01-03,Electronics,2000
2026-01-04,Books,180
2026-01-05,Clothing,450
EOF

chmod +x data_pipeline.sh
./data_pipeline.sh sales.csv
```

## Project 3: System Monitoring Dashboard (30 min)

Monitor system resources and alert on thresholds.

### Solution:

```bash
#!/bin/bash
# monitor.sh - System monitoring with alerts

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=85
DISK_THRESHOLD=90

# Alert function
alert() {
    local level=$1
    local message=$2
    local timestamp=$(date +'%Y-%m-%d %H:%M:%S')
    
    case $level in
        WARNING)
            echo "[$timestamp] WARNING: $message"
            ;;
        CRITICAL)
            echo "[$timestamp] CRITICAL: $message"
            ;;
        INFO)
            echo "[$timestamp] INFO: $message"
            ;;
    esac
}

# Check CPU usage
check_cpu() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    cpu_int=${cpu_usage%.*}
    
    if [ $cpu_int -gt $CPU_THRESHOLD ]; then
        alert "CRITICAL" "CPU usage is ${cpu_int}% (threshold: ${CPU_THRESHOLD}%)"
        return 1
    else
        alert "INFO" "CPU usage: ${cpu_int}%"
        return 0
    fi
}

# Check memory usage
check_memory() {
    memory_usage=$(free | grep Mem | awk '{print ($3/$2) * 100.0}')
    memory_int=${memory_usage%.*}
    
    if [ $memory_int -gt $MEMORY_THRESHOLD ]; then
        alert "CRITICAL" "Memory usage is ${memory_int}% (threshold: ${MEMORY_THRESHOLD}%)"
        return 1
    else
        alert "INFO" "Memory usage: ${memory_int}%"
        return 0
    fi
}

# Check disk usage
check_disk() {
    disk_usage=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')
    
    if [ $disk_usage -gt $DISK_THRESHOLD ]; then
        alert "CRITICAL" "Disk usage is ${disk_usage}% (threshold: ${DISK_THRESHOLD}%)"
        return 1
    else
        alert "INFO" "Disk usage: ${disk_usage}%"
        return 0
    fi
}

# Display dashboard
display_dashboard() {
    clear
    echo "======================================="
    echo "     SYSTEM MONITORING DASHBOARD"
    echo "======================================="
    echo "Time: $(date +'%Y-%m-%d %H:%M:%S')"
    echo "Hostname: $(hostname)"
    echo ""
    
    echo "--- System Load ---"
    uptime
    echo ""
    
    echo "--- CPU ---"
    check_cpu
    echo ""
    
    echo "--- Memory ---"
    check_memory
    free -h | grep -E "Mem|Swap"
    echo ""
    
    echo "--- Disk Usage ---"
    check_disk
    df -h / | grep -v tmpfs
    echo ""
    
    echo "--- Top 5 Processes ---"
    ps aux --sort=-%mem | head -6 | awk '{printf "%-10s %-6s %-6s %s\n", $1, $3, $4, $11}'
    echo ""
    
    echo "======================================="
    echo "Monitoring... (Ctrl+C to exit)"
}

# Main monitoring loop
echo "Starting system monitor..."
echo "Thresholds: CPU=${CPU_THRESHOLD}% | Memory=${MEMORY_THRESHOLD}% | Disk=${DISK_THRESHOLD}%"
echo ""

while true; do
    display_dashboard
    sleep 5
done
```

### Usage:

```bash
chmod +x monitor.sh
./monitor.sh
```

## Project 4: Development Environment Setup (30 min)

Automate setting up a complete development environment.

### Solution:

```bash
#!/bin/bash
# setup_dev_env.sh - Automated development environment setup

PROJECT_NAME=$1
PROJECT_TYPE=${2:-python}  # Default to python

if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <project_name> [type]"
    echo "Types: python, web, data"
    exit 1
fi

echo "=== Setting up $PROJECT_TYPE environment for $PROJECT_NAME ==="

# Create project structure
mkdir -p "$PROJECT_NAME"/{src,tests,docs,data,scripts}
cd "$PROJECT_NAME"

# Initialize git
git init
echo "[OK] Git initialized"

# Create .gitignore
cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
.venv/

# Data
*.csv
*.xlsx
*.db

# IDE
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db
EOF
echo "[OK] .gitignore created"

# Setup based on type
case $PROJECT_TYPE in
    python)
        # Create conda environment
        echo "Creating conda environment..."
        mamba create -y -n "$PROJECT_NAME" python=3.11
        
        # Create environment.yml
        cat > environment.yml << EOF
name: $PROJECT_NAME
channels:
  - conda-forge
dependencies:
  - python=3.11
  - numpy
  - pandas
  - pytest
  - black
  - pip
EOF
        echo "[OK] Conda environment created"
        
        # Create basic files
        touch src/__init__.py
        cat > src/main.py << 'EOF'
#!/usr/bin/env python3
"""Main module for the project."""

def main():
    print("Hello from $PROJECT_NAME!")

if __name__ == "__main__":
    main()
EOF
        
        # Create test file
        cat > tests/test_main.py << 'EOF'
"""Tests for main module."""
import pytest

def test_placeholder():
    assert True
EOF
        echo "[OK] Python files created"
        ;;
        
    web)
        # Setup for web development
        mkdir -p {static,templates}
        cat > app.py << 'EOF'
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
EOF
        
        cat > templates/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>$PROJECT_NAME</title>
</head>
<body>
    <h1>Welcome to $PROJECT_NAME</h1>
</body>
</html>
EOF
        echo "[OK] Web files created"
        ;;
        
    data)
        # Setup for data science
        mkdir -p notebooks
        cat > notebooks/analysis.ipynb << 'EOF'
{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd\n",
    "import numpy as np\n",
    "import matplotlib.pyplot as plt\n",
    "\n",
    "print('Data analysis notebook ready!')"
   ]
  }
 ],
 "metadata": {},
 "nbformat": 4,
 "nbformat_minor": 4
}
EOF
        echo "[OK] Data science files created"
        ;;
esac

# Create README
cat > README.md << EOF
# $PROJECT_NAME

## Description
Add your project description here.

## Setup
\`\`\`bash
# Create environment
mamba env create -f environment.yml

# Activate environment
mamba activate $PROJECT_NAME
\`\`\`

## Usage
Add usage instructions here.

## Testing
\`\`\`bash
pytest tests/
\`\`\`

## License
MIT
EOF
echo "[OK] README created"

# Create Makefile (optional)
cat > Makefile << 'EOF'
.PHONY: help test clean

help:
	@echo "Available commands:"
	@echo "  make test  - Run tests"
	@echo "  make clean - Clean temporary files"

test:
	pytest tests/

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
EOF
echo "[OK] Makefile created"

# Summary
echo ""
echo "=== Setup Complete ==="
echo "Project: $PROJECT_NAME"
echo "Type: $PROJECT_TYPE"
echo "Location: $(pwd)"
echo ""
echo "Next steps:"
echo "  1. cd $PROJECT_NAME"
echo "  2. mamba activate $PROJECT_NAME"
echo "  3. Start coding!"
echo ""
```

### Usage:

```bash
chmod +x setup_dev_env.sh
./setup_dev_env.sh my-project python
./setup_dev_env.sh web-app web
./setup_dev_env.sh analysis data
```

## Putting It All Together

You now have complete, real-world scripts for:
1. **Automated backups** with rotation
2. **Data processing** pipelines
3. **System monitoring** with alerts
4. **Dev environment** automation

### Next Steps:

1. Customize these scripts for your needs
2. Add error handling and validation
3. Schedule with cron for automation
4. Add notifications (email, Slack, etc.)
5. Create your own projects!

---
[← Advanced Bash](../10-advanced-bash/tutorial.md) | [Course Complete!](../../README.md)
