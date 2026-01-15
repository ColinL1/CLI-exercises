# CLI Command Cheat Sheet

Quick reference for all the commands taught in this course.

## Navigation & File System

```bash
pwd                     # Print working directory
cd <dir>                # Change directory
cd                      # Go to home directory
cd ~                    # Go to home directory
cd ..                   # Go up one level
cd -                    # Go to previous directory
ls                      # List files
ls -l                   # Long format
ls -a                   # Include hidden files
ls -lh                  # Human-readable sizes
ls -lt                  # Sort by time
```

## File Operations

```bash
touch file.txt          # Create empty file
mkdir dir               # Create directory
mkdir -p path/to/dir    # Create nested directories

cp file1 file2          # Copy file
cp -r dir1 dir2         # Copy directory recursively
mv old new              # Move/rename
rm file                 # Delete file
rm -r dir               # Delete directory
rm -i file              # Interactive delete
rmdir emptydir          # Remove empty directory

find . -name "*.txt"    # Find files by name
find . -type d          # Find directories
find . -mtime -1        # Modified in last day
```

## Viewing & Editing

```bash
cat file                # Display file
less file               # View file (paginated)
head file               # First 10 lines
tail file               # Last 10 lines
tail -f file            # Follow file updates
wc -l file              # Count lines

nano file               # Edit with nano
vim file                # Edit with vim

grep "pattern" file     # Search in file
grep -r "pattern" dir/  # Recursive search
grep -i "pattern" file  # Case-insensitive
grep -v "pattern" file  # Invert match
```

## File Permissions

```bash
chmod 755 file          # rwxr-xr-x
chmod 644 file          # rw-r--r--
chmod +x file           # Add execute permission
chmod u+x file          # Add execute for user
chmod g-w file          # Remove write for group

chown user:group file   # Change owner
```

## Process Management

```bash
ps                      # Show processes
ps aux                  # All processes
top                     # Real-time processes
htop                    # Better top (if installed)

kill PID                # Kill process
kill -9 PID             # Force kill
killall name            # Kill by name
pkill name              # Kill by pattern

command &               # Run in background
jobs                    # List background jobs
fg                      # Bring to foreground
Ctrl+Z                  # Suspend current process
bg                      # Resume in background
```

## SSH & Remote Access

```bash
ssh user@host           # Connect to remote
ssh -p 2222 user@host   # Use specific port
ssh user@host 'command' # Run remote command

ssh-keygen -t ed25519   # Generate SSH key
ssh-copy-id user@host   # Copy key to server

# SSH config (~/.ssh/config)
Host alias
    HostName hostname
    User username
    Port 22
    IdentityFile ~/.ssh/key
```

## File Transfer

```bash
# Download
wget URL                # Download file
wget -O name URL        # Save with name
curl -O URL             # Download with curl
curl -L URL             # Follow redirects

# Upload/Download (SSH)
scp file user@host:~    # Upload
scp user@host:file .    # Download
scp -r dir user@host:~  # Upload directory

# Sync
rsync -avz src/ dest/   # Sync directories
rsync -avP src/ dest/   # With progress
rsync -av --delete      # Mirror (delete extras)
```

## Text Processing

```bash
# Pipes and redirects
command > file          # Redirect output (overwrite)
command >> file         # Redirect output (append)
command 2> file         # Redirect errors
command &> file         # Redirect both
command1 | command2     # Pipe output

# Text tools
grep pattern file       # Search
sed 's/old/new/g' file  # Replace
awk '{print $1}' file   # Print column
cut -d',' -f1 file      # Cut field
sort file               # Sort lines
uniq file               # Remove duplicates
wc -l file              # Count lines
```

## Mamba/Conda

```bash
# Install (Miniforge)
# Download and run installer script

# Environments
mamba create -n env python=3.11
mamba activate env
mamba deactivate
mamba env list
mamba env remove -n env

# Packages
mamba install package
mamba install package=1.0
mamba list
mamba remove package
mamba update package

# Environment files
mamba env export > environment.yml
mamba env create -f environment.yml
```

## Bash Scripting

```bash
#!/bin/bash              # Shebang

# Variables
var="value"
result=$(command)
echo $var
echo "$var"              # Safer (quoted)

# User input
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

for ((i=1; i<=10; i++)); do
    commands
done

while [ condition ]; do
    commands
done

# Functions
function_name() {
    echo "Hello $1"
    return 0
}

# Comparisons
[ $a -eq $b ]           # Equal (numbers)
[ $a -lt $b ]           # Less than
[ $a -gt $b ]           # Greater than
[ "$a" = "$b" ]         # Equal (strings)
[ -f file ]             # File exists
[ -d dir ]              # Directory exists
[ -e path ]             # Exists
```

## Keyboard Shortcuts

```bash
Tab                     # Autocomplete
Ctrl+C                  # Cancel command
Ctrl+D                  # Exit/EOF
Ctrl+L                  # Clear screen
Ctrl+A                  # Beginning of line
Ctrl+E                  # End of line
Ctrl+U                  # Delete to beginning
Ctrl+K                  # Delete to end
Ctrl+R                  # Search history
Ctrl+Z                  # Suspend process
↑/↓                     # Navigate history
!!                      # Last command
!n                      # Command number n
!string                 # Last command starting with string
```

## Environment Variables

```bash
echo $HOME              # Home directory
echo $USER              # Username
echo $PATH              # Command search path
echo $PWD               # Current directory
echo $OLDPWD            # Previous directory
echo $SHELL             # Current shell

export VAR=value        # Set environment variable
```

## Useful Combinations

```bash
# Find and delete
find . -name "*.tmp" -delete

# Count files
ls -1 | wc -l

# Disk usage of directories
du -sh */

# Find large files
find . -type f -size +100M -exec ls -lh {} \;

# Process memory usage
ps aux --sort=-%mem | head -10

# Archive and compress
tar -czf archive.tar.gz directory/
tar -xzf archive.tar.gz

# Check command existence
command -v python
which python

# Run previous command with sudo
sudo !!

# Edit last command
fc
```

## Special Characters

```bash
.                       # Current directory
..                      # Parent directory
~                       # Home directory
-                       # Previous directory
*                       # Wildcard (any characters)
?                       # Wildcard (one character)
[]                      # Character class
|                       # Pipe
>                       # Redirect output
<                       # Redirect input
&                       # Background process
;                       # Command separator
&&                      # AND (run if previous succeeded)
||                      # OR (run if previous failed)
$                       # Variable prefix
#                       # Comment
\                       # Escape character
"                       # Weak quotes (expand variables)
'                       # Strong quotes (literal)
`                       # Command substitution (old)
$()                     # Command substitution (new)
```

## Help & Documentation

```bash
man command             # Manual page
command --help          # Quick help
info command            # Info page
whatis command          # Brief description
apropos keyword         # Search man pages
type command            # Command type/location
```

## Tips

1. **Use Tab completion** - Saves time and prevents typos
2. **Quote variables** - Always use `"$var"` not `$var`
3. **Check before deleting** - Use `ls` before `rm`
4. **Use `-i` for safety** - Interactive mode for rm, cp, mv
5. **Read error messages** - They usually tell you what's wrong
6. **Test in a safe directory** - Practice in ~/practice or similar
7. **One task at a time** - Master basics before complex combinations
8. **Keep learning** - There's always more to discover!

---

Print this out or keep it handy while learning!

[Back to Main README](README.md)
