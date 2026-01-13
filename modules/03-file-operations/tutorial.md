# Module 03: File Operations

**Duration:** 1 hour  
**Difficulty:** Beginner

## Creating Files and Directories

### Creating Files: `touch`

The `touch` command creates an empty file or updates the timestamp of an existing file:

```bash
# Create a single file
touch myfile.txt

# Create multiple files at once
touch file1.txt file2.txt file3.txt

# Create files with spaces (use quotes)
touch "my document.txt"
touch 'another file.txt'

# Update timestamp of existing file
touch existing.txt  # Updates modification time to now
```

**When to use touch:**
- Creating empty files quickly
- Updating file timestamps
- Creating placeholder files for scripts

### Creating Directories: `mkdir`

```bash
# Create a single directory
mkdir mydir

# Create multiple directories
mkdir dir1 dir2 dir3

# Create with spaces (use quotes)
mkdir "My Documents"

# Create nested directories (parent directories too)
mkdir -p projects/python/web-app
mkdir -p data/raw data/processed

# Create with specific permissions
mkdir -m 755 public_folder

# Verbose output
mkdir -v newdir
```

**Important options:**
- `-p` : Create parent directories as needed (most common!)
- `-m` : Set permissions
- `-v` : Verbose (show what's being created)

**Example structure creation:**
```bash
mkdir -p project/{src,tests,docs,data}
# Creates: project/src, project/tests, project/docs, project/data
```

## Copying Files and Directories: `cp`

### Basic Copying

```bash
# Copy a file
cp source.txt destination.txt

# Copy a file to a directory
cp file.txt ~/Documents/

# Copy multiple files to a directory
cp file1.txt file2.txt file3.txt ~/Documents/

# Copy with a different name
cp original.txt copy_of_original.txt

# Copy and preserve timestamps/permissions
cp -p file.txt backup.txt
```

### Copying Directories

```bash
# Copy a directory recursively
cp -r source_dir/ destination_dir/

# Copy directory contents into another directory
cp -r source_dir/* destination_dir/

# Copy with verbose output
cp -rv source_dir/ destination_dir/

# Interactive mode (ask before overwriting)
cp -i file.txt existing_file.txt

# Force overwrite (no questions)
cp -f file.txt existing_file.txt
```

**Important options:**
- `-r` or `-R` : Recursive (for directories)
- `-i` : Interactive (prompt before overwrite)
- `-f` : Force (overwrite without asking)
- `-p` : Preserve file attributes
- `-v` : Verbose (show what's being copied)
- `-u` : Update (copy only if source is newer)

### Advanced Copying

```bash
# Backup before overwriting
cp --backup=numbered file.txt existing.txt

# Copy only if source is newer
cp -u source.txt destination.txt

# Copy and create directory if needed
mkdir -p ~/backups && cp file.txt ~/backups/

# Copy with pattern matching
cp *.txt ~/Documents/
cp data*.csv ~/backup/
```

## Moving and Renaming: `mv`

The `mv` command both moves AND renames files:

### Renaming Files

```bash
# Rename a file
mv oldname.txt newname.txt

# Rename a directory
mv old_dir new_dir
```

### Moving Files

```bash
# Move file to directory
mv file.txt ~/Documents/

# Move multiple files
mv file1.txt file2.txt file3.txt ~/Documents/

# Move and rename at the same time
mv old.txt ~/Documents/new.txt

# Move directory
mv mydir ~/Documents/
```

### Moving with Options

```bash
# Interactive (ask before overwriting)
mv -i file.txt existing.txt

# Force overwrite
mv -f file.txt existing.txt

# Don't overwrite existing files
mv -n file.txt existing.txt

# Verbose
mv -v file.txt ~/Documents/

# Backup before overwriting
mv --backup=numbered file.txt existing.txt

# Update only (move if source is newer)
mv -u source.txt destination.txt
```

**Important options:**
- `-i` : Interactive (ask before overwrite)
- `-f` : Force overwrite
- `-n` : No clobber (don't overwrite)
- `-v` : Verbose
- `-u` : Update only

### Common mv Patterns

```bash
# Organize files by extension
mv *.txt documents/
mv *.jpg photos/
mv *.pdf papers/

# Bulk rename (adding prefix)
for file in *.txt; do
    mv "$file" "backup_$file"
done

# Move everything except one file
mv !(keep.txt) ~/backup/
```

## Deleting Files and Directories: `rm` and `rmdir`

### Warning: Deleted Files Are Gone Forever!

There's no "Recycle Bin" in the CLI. Be careful!

### Deleting Files: `rm`

```bash
# Delete a single file
rm file.txt

# Delete multiple files
rm file1.txt file2.txt file3.txt

# Interactive deletion (asks for confirmation)
rm -i important.txt

# Force deletion (no questions)
rm -f file.txt

# Verbose
rm -v file.txt

# Delete with pattern
rm *.tmp
rm test_*.txt
```

### Deleting Directories: `rmdir` (Empty Only)

```bash
# Remove empty directory
rmdir empty_dir/

# Remove multiple empty directories
rmdir dir1 dir2 dir3

# Remove nested empty directories
rmdir -p parent/child/grandchild
```

**Note:** `rmdir` only works on empty directories!

### Deleting Directories: `rm -r` (With Contents)

```bash
# Delete directory and all contents
rm -r directory/

# Delete with confirmation
rm -ri directory/

# Force delete everything (DANGEROUS!)
rm -rf directory/

# Verbose recursive delete
rm -rv directory/
```

**EXTREME DANGER**
```bash
# NEVER DO THIS:
rm -rf /        # Would delete everything on your system!
rm -rf /*       # Same - catastrophic!
rm -rf ~        # Deletes your entire home directory!

# ALWAYS be sure of what you're deleting
```

**Safe practices:**
1. Always use `ls` first to check what you're deleting
2. Use `-i` for important deletions
3. Double-check before using `rm -rf`
4. Consider using `trash` or `trash-cli` instead for safety

### Safer Alternative: trash-cli

```bash
# Install trash-cli (Ubuntu/Debian)
sudo apt install trash-cli

# Then use:
trash file.txt           # Moves to trash (can restore)
trash-list              # See what's in trash
trash-restore           # Restore from trash
trash-empty             # Empty the trash
```

## Wildcards and Pattern Matching

Wildcards help you work with multiple files at once:

### Basic Wildcards

```bash
# * matches any characters
ls *.txt                    # All files ending in .txt
ls test*                    # All files starting with 'test'
ls *data*                   # All files containing 'data'

# ? matches exactly one character
ls file?.txt                # file1.txt, file2.txt, but not file10.txt
ls test??.py                # test01.py, testAB.py

# [] matches any one character inside brackets
ls file[123].txt            # file1.txt, file2.txt, file3.txt
ls [abc]*.txt               # Files starting with a, b, or c
ls file[0-9].txt            # file0.txt through file9.txt
ls [A-Z]*.doc               # Files starting with uppercase letter

# [!] matches any character NOT in brackets
ls [!a]*.txt                # Files NOT starting with 'a'
```

### Advanced Pattern Matching (Bash Extended Globbing)

```bash
# Enable extended globbing
shopt -s extglob

# !(pattern) - anything except pattern
ls !(*.txt)                 # Everything except .txt files

# ?(pattern) - zero or one occurrence
ls file?(s).txt             # file.txt or files.txt

# *(pattern) - zero or more occurrences
ls file*(s).txt             # file.txt, files.txt, filess.txt

# +(pattern) - one or more occurrences
ls file+(s).txt             # files.txt, filess.txt, but not file.txt

# @(pattern) - exactly one occurrence
ls file@(1|2|3).txt         # file1.txt, file2.txt, file3.txt
```

### Practical Examples

```bash
# Delete all backup files
rm *~ *.bak *.backup

# Copy all images
cp *.{jpg,jpeg,png,gif} ~/Pictures/

# Move all data files
mv data_*.csv ~/datasets/

# List all Python and JavaScript files
ls *.{py,js}

# Delete test files numbered 1-9
rm test[1-9].txt
```

## Viewing File Information: `stat`

```bash
# Detailed file information
stat file.txt

# Shows:
# - Size
# - Permissions
# - Owner
# - Timestamps (access, modify, change)
# - Inode number
```

## Finding Files: Preview of `find`

Quick preview (we'll cover this more later):

```bash
# Find files by name
find . -name "*.txt"

# Find directories
find . -type d

# Find files modified in last day
find . -mtime -1

# Find and delete
find . -name "*.tmp" -delete
```

## Best Practices

### 1. Always Check Before Deleting

```bash
# Good practice:
ls *.log              # Check what will be affected
rm *.log              # Then delete

# Risky:
rm *.log              # Delete without checking
```

### 2. Use -i for Important Operations

```bash
# Safe copying (asks before overwrite)
cp -i important.txt backup.txt

# Safe moving
mv -i critical.doc ~/Documents/

# Safe deleting
rm -i *.txt
```

### 3. Backup Before Bulk Operations

```bash
# Create backup directory
mkdir backup

# Copy before potentially destructive operations
cp -r important_dir backup/

# Then do your work
mv important_dir/files/*.txt processed/
```

### 4. Use Descriptive Names

```bash
# Good:
mkdir project-data-2026
touch analysis-results.txt

# Avoid:
mkdir temp
touch file1.txt
```

### 5. Organize Regularly

```bash
# Create logical structure
mkdir -p ~/projects/{active,archived,templates}
mkdir -p ~/documents/{work,personal}/{2026,2025}

# Move files to appropriate places
mv old-project ~/projects/archived/
```

## Quick Reference

```bash
# Creating
touch file.txt              # Create empty file
mkdir dir                   # Create directory
mkdir -p path/to/dir        # Create nested directories

# Copying
cp file.txt backup.txt      # Copy file
cp -r dir/ backup_dir/      # Copy directory
cp *.txt ~/docs/            # Copy multiple files

# Moving/Renaming
mv old.txt new.txt          # Rename
mv file.txt ~/Documents/    # Move file
mv *.jpg ~/Pictures/        # Move multiple files

# Deleting
rm file.txt                 # Delete file
rm -i file.txt              # Delete with confirmation
rmdir empty_dir/            # Delete empty directory
rm -r dir/                  # Delete directory with contents
rm -rf dir/                 # Force delete (DANGEROUS!)

# Wildcards
*.txt                       # All .txt files
file?.txt                   # file1.txt, file2.txt
file[0-9].txt              # file0.txt through file9.txt
```

## What You've Learned

- Creating files (`touch`) and directories (`mkdir`)
- Copying files and directories (`cp`)
- Moving and renaming (`mv`)
- Deleting safely (`rm`, `rmdir`)
- Using wildcards for pattern matching
- Best practices for file safety

Now practice with the [exercises](exercises.md)!

---
[← Back: Navigation](../02-navigation-filesystem/tutorial.md) | [Next: Text Editing →](../04-text-editing/tutorial.md)
