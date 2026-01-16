# Module 01: Solutions

## Exercise 1: Getting Your Bearings

```bash
# 2. Find out what directory you're currently in
pwd
# Output: /home/yourusername (or similar)

# 3. List all files in your current directory (including hidden ones)
ls -a
# Shows all files including those starting with '.'

# 4. Find out your username
whoami
# Output: yourusername

# 5. Check what shell you're using
echo $SHELL
# Output: /bin/bash or /bin/zsh (most common)

# 6. Display the current date and time
date
# Output: Mon Jan 13 10:30:45 EST 2026 (or similar)
```

**Answers:**

- Current directory path: Varies by system, typically `/home/username` on Linux or `/Users/username` on macOS
- Hidden files: Most home directories have `.bashrc`, `.bash_history`, `.profile`, etc.
- Shell: Usually `/bin/bash` or `/bin/zsh`

---

## Exercise 2: Exploring Commands

```bash
# 1. Read the manual for ls
man ls
# (Press 'q' to quit)

# 2-3. Look for -R and -t options in the manual

# 4. Quick help
ls --help

# 5. Try the combined options
ls -lt
```

**Answers:**

- **`ls -R`**: Lists directories recursively (shows contents of subdirectories too)
- **`ls -t`**: Sorts by modification time, newest first
- **`ls -lt`**: Long format, sorted by time - combines both options

---

## Exercise 3: Command History

```bash
# 1. Run the commands
pwd
ls
date
whoami
ls -la

# 2. View history
history

# 3. Use up arrow to find and run 'ls -la'
# (Press up arrow multiple times, then Enter)

# 4. Run last command again
!!

# 5. Clear screen
clear
# or Ctrl+L

# Challenge: Run pwd again
!pw
# This runs the most recent command starting with 'pw'
```

**Key points:**

- `!!` repeats the last command
- `!<prefix>` runs the most recent command starting with that prefix
- Arrow keys navigate through history

---

## Exercise 4: Using Tab Completion

```bash
# 1. Type 'who' and press Tab twice
who<Tab><Tab>
# Shows: who, whoami, whois, etc.

# 2. Type 'whoa' and press Tab
whoa<Tab>
# Tab completes to 'whoami' if that's the only match

# 3. Type 'ls ~/D' and press Tab
ls ~/D<Tab>
# Autocompletes to 'Desktop' or 'Documents' if they exist

# 4. Clear the line
# Ctrl+U

# 5. Navigate and delete
# Type any command, then:
# Ctrl+A (beginning), Ctrl+K (delete to end)
```

**Key shortcuts practiced:**

- `Tab`: Autocomplete
- `Ctrl+C`: Cancel
- `Ctrl+L`: Clear screen
- `Ctrl+A`: Jump to start
- `Ctrl+E`: Jump to end
- `Ctrl+U`: Delete before cursor
- `Ctrl+K`: Delete after cursor

---

## Exercise 5: Exploring Your Environment

```bash
# 1. Display home directory
echo $HOME
# Output: /home/yourusername

# 2. Display username
echo $USER
# Output: yourusername

# 3. Display shell
echo $SHELL
# Output: /bin/bash or /bin/zsh

# 4. Display PATH
echo $PATH
# Output: /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:...

# 5. Combine variables in a message
echo "Hello, $USER! Your home is $HOME"
# Output: Hello, john! Your home is /home/john
```

**Answers:**

- **Home directory**: Usually `/home/username` (Linux) or `/Users/username` (macOS)
- **$PATH contents**: Colon-separated list of directories
- **$PATH purpose**: Tells the shell where to look for executable commands

---

## Exercise 6: Combining What You've Learned

```bash
# 1. Clear screen
clear

# 2. Display current directory
pwd
# Output: /home/yourusername

# 3. List all files with details
ls -lah
# -l: long format
# -a: all files (including hidden)
# -h: human-readable sizes

# 4. Check command history count
history | wc -l
# Counts the number of commands in history

# 5. Display personalized message
echo "I am $USER in $(pwd)"
# or
echo "I am $USER in $PWD"
# Output: I am john in /home/john
```

**Alternative for #5:**

```bash
# Save to variables first (optional)
MY_USER=$USER
MY_DIR=$(pwd)
echo "I am $MY_USER in $MY_DIR"
```

---

## Troubleshooting Solutions

### Command not found

```bash
# Wrong: LS (uppercase)
LS
# bash: LS: command not found

# Correct: ls (lowercase)
ls
```

### Stuck in a program

```bash
# If stuck in 'man' or 'less':
q  # quit

# If a command is running too long:
Ctrl+C  # cancel

# If waiting for input:
Ctrl+D  # end input / exit
```

### Terminal frozen

```bash
# Frozen (accidentally pressed Ctrl+S):
Ctrl+Q  # unfreeze
```

---

## Bonus Challenge Solutions

### 1. Command chaining

```bash
date; whoami; pwd
# Runs all three commands in sequence
# Output:
# Mon Jan 13 10:30:45 EST 2026
# john
# /home/john
```

### 2. Counting commands

```bash
history | wc -l
# Example output: 127
# (You've run 127 commands)
```

### 3. Custom prompt

```bash
echo $PS1
# Output varies, something like: \u@\h:\w\$
# \u = username, \h = hostname, \w = working directory
```

### 4. Uptime

```bash
uptime
# Output: 10:30:45 up 5 days, 3:45, 2 users, load average: 0.52, 0.58, 0.59
```

---

## Understanding Check

If you could complete most of these exercises, you understand:

- Basic command syntax
- Getting help (`man`, `--help`)
- Command history navigation
- Tab completion
- Essential keyboard shortcuts
- Environment variables

**Well done!** You're ready for Module 02: Navigation & File System.

---

[← Back to Exercises](../exercises.md) | [Next Module →](../../02-navigation-filesystem/tutorial.md)
