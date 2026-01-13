# Module 04: Viewing & Editing Text Files

**Duration:** 1.5 hours  
**Difficulty:** Beginner to Intermediate

## Viewing Files

### `cat` - Concatenate and Display

```bash
# Display file contents
cat file.txt

# Display multiple files
cat file1.txt file2.txt

# Display with line numbers
cat -n file.txt

# Show non-printing characters
cat -A file.txt

# Combine files into a new file
cat file1.txt file2.txt > combined.txt
```

### `less` - View Large Files (Recommended)

```bash
# View a file
less largefile.txt
```

**Navigation in less:**
- `Space` or `f` - Next page
- `b` - Previous page
- `g` - Go to beginning
- `G` - Go to end
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next search result
- `N` - Previous search result
- `q` - Quit

### `head` and `tail` - View Start/End

```bash
# First 10 lines (default)
head file.txt

# First 20 lines
head -n 20 file.txt
head -20 file.txt

# Last 10 lines
tail file.txt

# Last 20 lines
tail -n 20 file.txt

# Follow file updates (great for logs)
tail -f /var/log/syslog

# Last 50 lines and follow
tail -n 50 -f logfile.txt
```

### `wc` - Word Count

```bash
# Count lines, words, and bytes
wc file.txt

# Count only lines
wc -l file.txt

# Count only words
wc -w file.txt

# Count only characters
wc -m file.txt
```

## Text Editors

### Nano - Beginner-Friendly Editor

**Starting Nano:**
```bash
# Create or edit a file
nano myfile.txt

# Open at specific line
nano +25 file.txt

# Open read-only
nano -v file.txt
```

**Basic Nano Commands:**
- `Ctrl + O` - Save (WriteOut)
- `Ctrl + X` - Exit
- `Ctrl + K` - Cut line
- `Ctrl + U` - Paste (Uncut)
- `Ctrl + W` - Search
- `Ctrl + \` - Replace
- `Ctrl + G` - Help
- `Alt + U` - Undo
- `Alt + E` - Redo

**Nano Workflow:**
1. Open file: `nano notes.txt`
2. Type your content
3. Save: `Ctrl + O`, press Enter
4. Exit: `Ctrl + X`

### Vim - Powerful but Steep Learning Curve

**Vim has modes:**
- **Normal mode** - Navigate and execute commands (default)
- **Insert mode** - Type text
- **Visual mode** - Select text
- **Command mode** - Execute commands

**Starting Vim:**
```bash
vim file.txt
```

**Basic Vim Survival:**
```bash
# Start vim
vim myfile.txt

# Enter insert mode (then you can type)
i

# Exit insert mode (back to normal mode)
ESC

# Save and quit (from normal mode)
:wq

# Quit without saving
:q!

# Save without quitting
:w
```

**Essential Vim Commands:**

*In Normal Mode:*
- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - New line below
- `O` - New line above
- `x` - Delete character
- `dd` - Delete line
- `yy` - Copy (yank) line
- `p` - Paste
- `u` - Undo
- `Ctrl + r` - Redo
- `/pattern` - Search
- `n` - Next search result
- `:wq` - Save and quit
- `:q!` - Quit without saving

**Vim Quick Reference:**
```
hjkl        # Navigate (left, down, up, right)
w           # Next word
b           # Previous word
0           # Beginning of line
$           # End of line
gg          # First line
G           # Last line
:set number # Show line numbers
```

## Creating and Editing Text

### Using Echo and Redirection

```bash
# Create file with content
echo "Hello World" > file.txt

# Append to file
echo "Second line" >> file.txt

# Create multi-line file
cat > multiline.txt << EOF
Line 1
Line 2
Line 3
EOF
```

### Using Here Documents

```bash
cat << 'EOF' > script.sh
#!/bin/bash
echo "This is a script"
echo "With multiple lines"
EOF
```

## Quick File Editing

### sed - Stream Editor

```bash
# Replace first occurrence per line
sed 's/old/new/' file.txt

# Replace all occurrences
sed 's/old/new/g' file.txt

# Edit file in place
sed -i 's/old/new/g' file.txt

# Delete lines matching pattern
sed '/pattern/d' file.txt

# Print only matching lines
sed -n '/pattern/p' file.txt
```

### awk - Text Processing

```bash
# Print specific columns
awk '{print $1}' file.txt        # First column
awk '{print $1, $3}' file.txt    # First and third columns

# With custom delimiter
awk -F',' '{print $1}' file.csv

# Conditional printing
awk '$3 > 100' data.txt          # Lines where column 3 > 100

# Sum a column
awk '{sum+=$1} END {print sum}' numbers.txt
```

## Practical Examples

### View Log Files

```bash
# View last 100 lines
tail -n 100 /var/log/syslog

# Follow log in real-time
tail -f /var/log/syslog

# Search for errors
grep ERROR logfile.txt

# Count error occurrences
grep -c ERROR logfile.txt
```

### Edit Configuration Files

```bash
# Edit with nano (easiest)
nano ~/.bashrc

# Edit with vim
vim ~/.bashrc

# Backup before editing
cp ~/.bashrc ~/.bashrc.backup
nano ~/.bashrc
```

### Create Quick Scripts

```bash
# Create a simple script
cat > hello.sh << 'EOF'
#!/bin/bash
echo "Hello, $(whoami)!"
echo "Today is $(date)"
EOF

# Make it executable
chmod +x hello.sh

# Run it
./hello.sh
```

## Best Practices

1. **Always backup before editing important files**
   ```bash
   cp config.txt config.txt.backup
   ```

2. **Use appropriate editor:**
   - `nano` for beginners
   - `vim` for power users
   - `cat` / `echo` for simple edits

3. **Check syntax after editing configs:**
   ```bash
   bash -n script.sh  # Check bash script syntax
   python -m py_compile script.py  # Check Python syntax
   ```

4. **Use version control for important files:**
   ```bash
   git add config.txt
   git commit -m "Update configuration"
   ```

## Quick Reference

```bash
# Viewing
cat file.txt              # Display file
less file.txt             # View large file (paginated)
head file.txt             # First 10 lines
tail file.txt             # Last 10 lines
tail -f file.txt          # Follow file updates

# Editing
nano file.txt             # Edit with nano
vim file.txt              # Edit with vim
echo "text" > file.txt    # Create/overwrite with text
echo "text" >> file.txt   # Append text

# Analysis
wc -l file.txt            # Count lines
grep "pattern" file.txt   # Search for pattern
sed 's/old/new/g' file.txt  # Replace text
```

Now practice with [exercises](exercises.md)!

---
[← File Operations](../03-file-operations/tutorial.md) | [Next: Permissions & Processes →](../05-permissions-processes/tutorial.md)
