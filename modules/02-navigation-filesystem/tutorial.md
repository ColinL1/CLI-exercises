# Module 02: Navigation & File System

**Duration:** 45 minutes  
**Difficulty:** Beginner

## Understanding the File System

Think of your computer's file system as a tree structure, with folders (directories) branching out from a root.

### Linux/macOS File System Structure

```
/                           (root - the top of everything)
├── home/                   (user home directories)
│   ├── alice/
│   ├── bob/
│   └── you/
│       ├── Documents/
│       ├── Downloads/
│       ├── Pictures/
│       └── projects/
├── usr/                    (user programs)
│   ├── bin/               (executable programs)
│   └── local/
├── etc/                    (configuration files)
├── var/                    (variable data, logs)
└── tmp/                    (temporary files)
```

### Windows (WSL) File System

If you're using Windows Subsystem for Linux (WSL), you'll see:
- `/mnt/c/` - Your C: drive
- `/home/username/` - Your Linux home directory

## Paths: Absolute vs Relative

### Absolute Paths
Start from the root `/` and give the complete location:

```bash
/home/username/Documents/report.txt
/usr/bin/python3
/etc/ssh/sshd_config
```

**Rule**: If it starts with `/`, it's absolute.

### Relative Paths
Start from your current location:

```bash
Documents/report.txt        # Relative to current directory
./report.txt                # Current directory
../Downloads/file.pdf       # Parent directory, then Downloads
../../shared/data.csv       # Up two levels, then into shared
```

**Special symbols:**
- `.` = current directory
- `..` = parent directory (one level up)
- `~` = your home directory
- `-` = previous directory

## Essential Navigation Commands

### `pwd` - Print Working Directory

Shows your current location:

```bash
pwd
# Output: /home/username/projects
```

Think of it as "You are here" on a map.

### `cd` - Change Directory

Move to a different directory:

```bash
# Go to Documents
cd Documents

# Go to home directory (multiple ways)
cd
cd ~
cd $HOME

# Go to root
cd /

# Go up one level
cd ..

# Go up two levels
cd ../..

# Go to previous directory
cd -

# Absolute path
cd /usr/local/bin

# Relative path
cd ../../Documents/projects
```

**Pro tip:** `cd` with no arguments takes you home!

### `ls` - List Contents

See what's in a directory:

```bash
# Basic list
ls

# Long format (permissions, size, date)
ls -l

# Include hidden files
ls -a

# Long format + hidden + human-readable sizes
ls -lah

# Sort by modification time
ls -lt

# Sort by size
ls -lS

# Reverse order
ls -lr

# List a specific directory
ls /usr/bin

# List with one item per line
ls -1
```

**Common combinations:**
```bash
ls -la      # Most common: long format, all files
ls -lah     # Same, but human-readable sizes
ls -lrt     # Long format, reverse order by time (oldest first)
ls -laR     # Recursive (shows all subdirectories)
```

### Reading `ls -l` Output

```bash
$ ls -l
drwxr-xr-x  3 user group  4096 Jan 13 10:30 Documents
-rw-r--r--  1 user group  1234 Jan 12 15:45 notes.txt
lrwxrwxrwx  1 user group    11 Jan 10 09:00 link -> target.txt
```

Let's break this down:

```
-rw-r--r--  1  user  group  1234  Jan 12 15:45  notes.txt
│          │   │     │      │     │             └─ filename
│          │   │     │      │     └─ modification date/time
│          │   │     │      └─ size in bytes
│          │   │     └─ group owner
│          │   └─ user owner
│          └─ number of hard links
└─ permissions
```

**First character (file type):**
- `-` = regular file
- `d` = directory
- `l` = symbolic link
- `b` = block device
- `c` = character device

**Next 9 characters (permissions):** `rwxr-xr-x`
- First 3: owner permissions (read, write, execute)
- Next 3: group permissions
- Last 3: other users' permissions

(We'll cover permissions in detail in Module 05)

## Useful File Listing Tricks

### Wildcards and Patterns

```bash
# All .txt files
ls *.txt

# All files starting with 'data'
ls data*

# All .jpg and .png files
ls *.jpg *.png

# All files with exactly 4 characters
ls ????

# All Python files in subdirectories
ls */*.py

# Character ranges
ls [a-c]*       # Files starting with a, b, or c
ls file[0-9].txt  # file0.txt through file9.txt
```

### Sorting and Filtering

```bash
# Largest files first
ls -lhS

# Newest files first
ls -lt

# Oldest files first
ls -ltr

# Only directories
ls -ld */

# Count files
ls | wc -l

# Find files modified in the last day
ls -lt | head -10
```

## Tips for Efficient Navigation

### 1. Use Tab Completion

```bash
cd Doc<Tab>      # Completes to Documents/
cd ~/proj<Tab>   # Completes to ~/projects/
```

If there are multiple matches, press Tab twice to see options.

### 2. Use `cd -` for Quick Switching

```bash
cd ~/Documents
cd ~/Downloads
cd -              # Back to Documents
cd -              # Back to Downloads
```

### 3. Use Pushd/Popd for Directory Stack

```bash
pushd ~/Documents     # Save current dir and go to Documents
pushd ~/Downloads     # Save and go to Downloads
popd                  # Return to Documents
popd                  # Return to original directory
dirs                  # Show directory stack
```

### 4. Set Quick Aliases (Preview for later)

Add these to your `~/.bashrc` or `~/.zshrc`:

```bash
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
```

## Common Gotchas for Beginners

### 1. Spaces in Directory Names

```bash
# Won't work:
cd My Documents

# Solutions:
cd "My Documents"
cd My\ Documents
cd My*Documents    # If unique
```

**Best practice:** Avoid spaces in directory names! Use:
- `my_documents`
- `my-documents`
- `MyDocuments`

### 2. Case Sensitivity

```bash
cd documents   # If directory is named 'Documents'
cd Documents   # Exact match required
```

### 3. Hidden Files

Files starting with `.` are hidden:

```bash
ls           # Won't show .bashrc
ls -a        # Shows .bashrc
```

### 4. Confusing Relative and Absolute Paths

```bash
pwd
# /home/user/projects

cd data        # Looks for /home/user/projects/data
cd /data       # Looks for /data (from root)
```

## The Special `.` and `..` Directories

Every directory contains these:

```bash
ls -la
# .    (current directory)
# ..   (parent directory)

# Examples:
cd .          # Stay in current directory (no change)
cd ..         # Go up one level
cp file.txt .  # Copy file to current directory
```

## Understanding Your Home Directory

```bash
# These all do the same thing:
cd
cd ~
cd $HOME
cd /home/username  # (if username is your name)

# Quick access to subdirectories:
cd ~/Documents
cd ~/Downloads
cd ~/.config       # Hidden config directory
```

## Practice Scenario: Finding Your Way

Let's say you're here:
```
/home/alice/projects/python/web-app
```

**Exercise paths:**

```bash
# To home
cd ~                    # → /home/alice

# To projects
cd ~/projects           # → /home/alice/projects

# Up one level
cd ..                   # → /home/alice/projects/python

# Up two levels
cd ../..                # → /home/alice/projects

# To sibling directory
cd ../data-science      # → /home/alice/projects/data-science

# To completely different location
cd /var/log             # → /var/log
```

## Exploring the System

### Common Interesting Directories

```bash
# Your home
cd ~
ls -la

# System binaries (where commands live)
cd /usr/bin
ls | head -20

# Configuration files
cd /etc
ls

# Temporary files
cd /tmp
ls

# Log files (may need sudo to view some)
cd /var/log
ls
```

## Quick Reference

```bash
pwd                    # Where am I?
cd <directory>         # Go to directory
cd                     # Go to home
cd ~                   # Go to home
cd ..                  # Go up one level
cd -                   # Go to previous directory
ls                     # List files
ls -la                 # List all files with details
ls -lh                 # List with human-readable sizes
ls -lt                 # List sorted by time
ls *.txt               # List .txt files
```

## Visual Path Examples

```
Current: /home/user/documents/reports
         └──┬──┘ └─┬─┘ └────┬────┘ └──┬──┘
           root  home  user home  current
                       directory  directory

Absolute path: /home/user/documents/reports/2026/january/report.pdf
                └────────────────────────────────────────────────┘
                Complete path from root

Relative path: 2026/january/report.pdf
               └──────────────────────┘
               From current directory

Parent: ../presentations/slides.pdf
        └┬┘└──────────────────────┘
      up one     then into
      level   presentations
```

## Command Combinations to Try

```bash
# Where am I and what's here?
pwd && ls -la

# Go somewhere and list
cd ~/Documents && ls

# Navigate and show path
cd /etc && pwd

# List current directory from anywhere
ls .

# List parent directory
ls ..

# List home directory from anywhere
ls ~
```

## Next Steps

You now understand:
- The file system structure
- Absolute vs relative paths
- How to navigate with `cd`
- How to list files with `ls` and its options
- Special directories (`.`, `..`, `~`, `-`)
- Reading `ls -l` output

Time for [hands-on practice](exercises.md)!

---
[← Back: CLI Introduction](../01-cli-introduction/tutorial.md) | [Next: File Operations →](../03-file-operations/tutorial.md)
