# Module 07: File Transfer

**Duration:** 1 hour  
**Difficulty:** Intermediate

## Downloading Files

### wget - Download Files

```bash
# Download a file
wget https://example.com/file.zip

# Download with custom name
wget -O myfile.zip https://example.com/file.zip

# Download in background
wget -b https://example.com/largefile.zip

# Resume interrupted download
wget -c https://example.com/file.zip

# Download multiple files
wget https://example.com/file1.zip https://example.com/file2.zip

# Download all files from a text list
wget -i urls.txt

# Limit download speed (KB/s)
wget --limit-rate=200k https://example.com/file.zip

# Download recursively (entire website)
wget -r -np -k https://example.com/docs/
```

### curl - Transfer Data

```bash
# Download file (must use -O)
curl -O https://example.com/file.zip

# Download with custom name
curl -o myfile.zip https://example.com/file.zip

# Follow redirects
curl -L https://example.com/file.zip

# Resume download
curl -C - -O https://example.com/file.zip

# Download with progress bar
curl -# -O https://example.com/file.zip

# Download multiple files
curl -O https://example.com/file1.zip -O https://example.com/file2.zip

# Download and pipe to command
curl https://example.com/install.sh | bash

# Send data (POST request)
curl -X POST -d "param1=value1" https://api.example.com/endpoint

# With headers
curl -H "Authorization: Bearer TOKEN" https://api.example.com/data
```

### wget vs curl

**Use wget when:**
- Downloading files
- Downloading recursively
- Simpler syntax for basic downloads

**Use curl when:**
- Working with APIs
- Need more protocol support
- Pipe output directly
- More complex HTTP operations

## Transferring Files to/from Remote Servers

### scp - Secure Copy

**Upload (Local → Remote):**
```bash
# Copy file to remote
scp file.txt user@remote:~/

# Copy to specific directory
scp file.txt user@remote:/home/user/documents/

# Copy multiple files
scp file1.txt file2.txt user@remote:~/

# Copy entire directory
scp -r mydir/ user@remote:~/

# Copy with different port
scp -P 2222 file.txt user@remote:~/

# Verbose output
scp -v file.txt user@remote:~/

# Preserve timestamps and permissions
scp -p file.txt user@remote:~/
```

**Download (Remote → Local):**
```bash
# Copy file from remote
scp user@remote:~/file.txt ./

# Copy from specific path
scp user@remote:/var/log/app.log ./

# Copy directory
scp -r user@remote:~/project ./

# Copy multiple files
scp user@remote:'~/file1.txt ~/file2.txt' ./

# Copy with pattern
scp user@remote:'~/data/*.csv' ./data/
```

**Between Two Remote Servers:**
```bash
scp user1@server1:~/file.txt user2@server2:~/
```

### rsync - Smart Synchronization

rsync is more powerful than scp - it only transfers differences!

**Basic rsync:**
```bash
# Sync directory to remote
rsync -av source/ user@remote:~/destination/

# Sync from remote to local
rsync -av user@remote:~/source/ ./destination/

# Dry run (see what would be transferred)
rsync -avn source/ user@remote:~/destination/

# Show progress
rsync -av --progress source/ user@remote:~/destination/
```

**Important rsync Options:**
```bash
-a  # Archive mode (preserves permissions, timestamps, etc.)
-v  # Verbose
-z  # Compress during transfer
-P  # Show progress and keep partial files
-n  # Dry run (don't actually transfer)
-h  # Human-readable output
--delete  # Delete files in destination that don't exist in source
--exclude  # Exclude files/patterns
```

**Practical rsync Examples:**
```bash
# Backup with compression
rsync -avz ~/documents/ user@remote:~/backup/documents/

# Sync with progress and exclusions
rsync -avP --exclude='*.tmp' --exclude='.git' ~/project/ user@remote:~/project/

# Mirror (sync and delete extras)
rsync -av --delete ~/source/ user@remote:~/destination/

# Resume interrupted transfer
rsync -avP ~/large-dataset/ user@remote:~/data/

# Sync over SSH with custom port
rsync -av -e 'ssh -p 2222' ~/files/ user@remote:~/files/
```

### SFTP - Interactive File Transfer

```bash
# Connect to server
sftp user@remote

# SFTP commands:
ls              # List remote files
lls             # List local files
cd remotedir    # Change remote directory
lcd localdir    # Change local directory
pwd             # Remote working directory
lpwd            # Local working directory

# Upload
put localfile.txt
put -r localdir/

# Download
get remotefile.txt
get -r remotedir/

# Exit
exit
```

## Practical Examples

### Example 1: Download and Extract

```bash
# Download tar.gz file
wget https://example.com/software.tar.gz

# Extract it
tar -xzf software.tar.gz

# Or in one command
curl -L https://example.com/software.tar.gz | tar -xz
```

### Example 2: Backup to Remote Server

```bash
# Create backup and transfer
tar -czf backup.tar.gz ~/important-data/
scp backup.tar.gz user@backup-server:~/backups/

# Or in one command with rsync
rsync -avz ~/important-data/ user@backup-server:~/backups/
```

### Example 3: Download from Google Drive

```bash
# Using gdown (install first: pip install gdown)
gdown https://drive.google.com/uc?id=FILE_ID

# Using wget with specific format
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILE_ID' -O filename.zip
```

### Example 4: Sync Website to Server

```bash
# Sync local website to server
rsync -avz --delete \
  --exclude='.git' \
  --exclude='node_modules' \
  ~/mywebsite/ \
  user@webserver:/var/www/html/
```

## Best Practices

### 1. Use rsync for Large Transfers

```bash
# rsync can resume if connection drops
rsync -avzP large-dataset/ user@remote:~/data/
```

### 2. Compress When Transferring

```bash
# scp doesn't compress by default
scp -C file.txt user@remote:~/    # -C enables compression

# rsync with compression
rsync -avz files/ user@remote:~/  # -z compresses
```

### 3. Verify Transfers

```bash
# Check file size matches
ls -lh localfile.txt
ssh user@remote 'ls -lh remotefile.txt'

# Compare checksums
md5sum localfile.txt
ssh user@remote 'md5sum remotefile.txt'
```

### 4. Use Bandwidth Limits

```bash
# rsync with bandwidth limit (KB/s)
rsync -avz --bwlimit=1000 files/ user@remote:~/

# wget with rate limit
wget --limit-rate=500k https://example.com/file.zip
```

### 5. Test Before Destructive Operations

```bash
# Dry run before syncing
rsync -avn --delete source/ destination/

# Review what will be deleted before proceeding
```

## Quick Reference

```bash
# Download
wget https://example.com/file.zip
curl -O https://example.com/file.zip
curl -L -o file.zip https://example.com/file.zip

# Upload to remote
scp file.txt user@host:~/
rsync -avz file.txt user@host:~/

# Download from remote
scp user@host:~/file.txt ./
rsync -avz user@host:~/file.txt ./

# Sync directories
rsync -avz source/ user@host:~/dest/      # Upload
rsync -avz user@host:~/source/ ./dest/    # Download

# Common rsync options
-a    # Archive (preserve all)
-v    # Verbose
-z    # Compress
-P    # Progress + partial
-n    # Dry run
--delete  # Mirror (delete extras)
```

Practice with [exercises](exercises.md)!

---
[← SSH](../06-ssh-remote-access/tutorial.md) | [Next: Environment Management →](../08-environment-management/tutorial.md)
