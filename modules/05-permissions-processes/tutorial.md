# Module 05: File Permissions & Processes

**Duration:** 1 hour  
**Difficulty:** Intermediate

## Understanding File Permissions

### Reading Permissions

```bash
$ ls -l file.txt
-rw-r--r-- 1 user group 1234 Jan 13 10:30 file.txt
 │││││││││
 │└┴┴┴┴┴┴┴┴─ Permissions (9 characters)
 └─ File type
```

**Permission breakdown:**
```
-  rw-  r--  r--
│   │    │    │
│   │    │    └─ Others (all other users)
│   │    └────── Group (users in the file's group)
│   └─────────── Owner (user who owns the file)
└─────────────── File type (- = file, d = directory, l = link)
```

**Each permission set has three characters:**
- `r` (read) = 4
- `w` (write) = 2  
- `x` (execute) = 1
- `-` (no permission) = 0

### chmod - Change Permissions

**Symbolic mode:**
```bash
chmod u+x file.sh        # Add execute for user
chmod g+w file.txt       # Add write for group
chmod o-r file.txt       # Remove read for others
chmod a+r file.txt       # Add read for all
chmod u+x,g+x script.sh  # Multiple changes
```

**Numeric mode:**
```bash
chmod 755 script.sh      # rwxr-xr-x
chmod 644 file.txt       # rw-r--r--
chmod 600 private.txt    # rw-------
chmod 777 public.sh      # rwxrwxrwx (usually not recommended!)
```

**Common permission patterns:**
```bash
755  # rwxr-xr-x - Executable scripts, directories
644  # rw-r--r-- - Regular files
600  # rw------- - Private files (SSH keys)
700  # rwx------ - Private directories
```

### chown - Change Ownership

```bash
# Change owner
sudo chown newuser file.txt

# Change owner and group
sudo chown user:group file.txt

# Recursive change
sudo chown -R user:group directory/
```

## Process Management

### Viewing Processes

```bash
# Current user's processes
ps

# All processes
ps aux

# Tree view
ps auxf
pstree

# Real-time view
top      # Press q to quit
htop     # Better version (if installed)

# Find specific process
ps aux | grep python
pgrep python
```

### Managing Processes

```bash
# Run in background
command &

# Bring to foreground
fg

# Send to background
Ctrl+Z  # Suspend
bg      # Continue in background

# List background jobs
jobs

# Kill process by PID
kill 1234
kill -9 1234   # Force kill

# Kill by name
killall python
pkill -f "python script.py"
```

### Process Priority

```bash
# Run with lower priority
nice -n 10 command

# Change priority of running process
renice -n 5 -p 1234
```

Quick exercises in [exercises.md](exercises.md).

---
[← Text Editing](../04-text-editing/tutorial.md) | [Next: SSH →](../06-ssh-remote-access/tutorial.md)
