# Module 06: SSH & Remote Access

**Duration:** 1.5 hours  
**Difficulty:** Intermediate

## What is SSH?

**SSH (Secure Shell)** is a protocol for securely connecting to remote computers over a network. It's how you:
- Access remote servers
- Manage cloud instances
- Work on HPC clusters
- Deploy applications

## Basic SSH Connection

### Connecting to a Remote Server

```bash
# Basic syntax
ssh username@hostname

# Examples
ssh john@example.com
ssh user@192.168.1.100
ssh admin@server.university.edu

# Specify port (default is 22)
ssh -p 2222 user@example.com

# Verbose output (for debugging)
ssh -v user@example.com
```

### First Connection

The first time you connect to a server, you'll see:
```
The authenticity of host 'example.com (93.184.216.34)' can't be established.
ECDSA key fingerprint is SHA256:xxxxxxxxxxx.
Are you sure you want to continue connecting (yes/no)?
```

Type `yes` and press Enter. This adds the server to your known hosts.

### Exiting SSH

```bash
exit        # Exit the remote session
# or
Ctrl+D      # End the session
```

## SSH Keys (Password-Free Authentication)

SSH keys are more secure and convenient than passwords!

### Generating SSH Keys

```bash
# Generate a new key pair
ssh-keygen -t ed25519 -C "your_email@example.com"

# Or RSA (older, but more compatible)
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# You'll be asked:
# - Where to save (default: ~/.ssh/id_ed25519) - press Enter
# - Passphrase (optional but recommended) - enter or press Enter
```

This creates two files:
- `~/.ssh/id_ed25519` - Private key (NEVER share!)
- `~/.ssh/id_ed25519.pub` - Public key (share this)

### Copying Public Key to Server

```bash
# Easy way (if server allows password login)
ssh-copy-id user@hostname

# Manual way
cat ~/.ssh/id_ed25519.pub | ssh user@hostname "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

# Or copy-paste manually
cat ~/.ssh/id_ed25519.pub
# Then SSH to server and paste into ~/.ssh/authorized_keys
```

### Testing Key Authentication

```bash
ssh user@hostname
# Should connect without asking for password!
```

## SSH Config File

Make your life easier with an SSH config file!

### Creating ~/.ssh/config

```bash
nano ~/.ssh/config
```

Add entries like this:

```
Host myserver
    HostName example.com
    User john
    Port 22
    IdentityFile ~/.ssh/id_ed25519

Host work
    HostName work-server.company.com
    User jdoe
    IdentityFile ~/.ssh/work_key

Host cluster
    HostName hpc.university.edu
    User student123
    Port 2222
    
Host github
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_key
```

Now connect with just:
```bash
ssh myserver
ssh work
ssh cluster
```

Much easier than typing the full command every time!

### Config File Permissions

```bash
chmod 600 ~/.ssh/config
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub
```

## Running Commands on Remote Server

### Execute Single Command

```bash
# Run command and return
ssh user@host 'ls -la'
ssh user@host 'df -h'
ssh user@host 'uptime'

# With output saved locally
ssh user@host 'ls -la' > remote_files.txt
```

### Interactive vs Non-Interactive

```bash
# Interactive (you can type commands)
ssh user@host

# Non-interactive (run and exit)
ssh user@host 'command'
```

## Transferring Files While in SSH

### From Within an SSH Session

While connected to a remote server, you can't directly copy files to your local machine using `scp` in the normal way. Instead:

**Option 1: Open a new terminal** on your local machine and use `scp` (covered in Module 07)

**Option 2: Use `~.` to drop back to local shell temporarily** (advanced)

## SSH Tunneling (Port Forwarding)

Forward ports between local and remote machines:

### Local Port Forwarding

```bash
# Forward local port 8080 to remote port 80
ssh -L 8080:localhost:80 user@remote

# Now access http://localhost:8080 to reach remote's port 80
```

### Example: Access Remote Jupyter Notebook

```bash
# On remote server, start Jupyter on port 8888
jupyter notebook --no-browser --port=8888

# On local machine, forward port
ssh -L 8888:localhost:8888 user@remote

# Open browser to http://localhost:8888
```

## SSH Agent (Manage Keys)

### Start SSH Agent

```bash
# Start agent
eval "$(ssh-agent -s)"

# Add your key
ssh-add ~/.ssh/id_ed25519

# List loaded keys
ssh-add -l

# Remove keys
ssh-add -D
```

### Auto-start SSH Agent

Add to `~/.bashrc` or `~/.zshrc`:

```bash
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
fi
```

## Common SSH Issues

### Permission Denied (publickey)

```bash
# Check:
1. Public key is on server in ~/.ssh/authorized_keys
2. Private key is on local machine
3. Permissions are correct:
   chmod 700 ~/.ssh
   chmod 600 ~/.ssh/id_ed25519
   chmod 644 ~/.ssh/id_ed25519.pub
   chmod 600 ~/.ssh/authorized_keys  # On server
```

### Connection Timeout

```bash
# Check:
1. Server is running and accessible
2. Firewall allows SSH (port 22)
3. Correct hostname/IP
4. Network connectivity: ping hostname
```

### Host Key Verification Failed

```bash
# Server key changed (common after server reinstall)
# Remove old key:
ssh-keygen -R hostname

# Or edit ~/.ssh/known_hosts and remove the line
```

## Security Best Practices

1. **Use SSH keys, not passwords**
2. **Protect your private key:**
   - Never share it
   - Use a passphrase
   - Store securely
3. **Different keys for different purposes:**
   - Work vs personal
   - Different servers
4. **Disable password authentication on servers** (admin task)
5. **Change default SSH port** (admin task)
6. **Use SSH config** for convenience

## Quick Reference

```bash
# Connect
ssh user@hostname
ssh -p PORT user@hostname

# Generate keys
ssh-keygen -t ed25519 -C "email@example.com"

# Copy key to server
ssh-copy-id user@hostname

# Run remote command
ssh user@host 'command'

# Config file location
~/.ssh/config

# Key files
~/.ssh/id_ed25519        # Private key
~/.ssh/id_ed25519.pub    # Public key
~/.ssh/known_hosts       # Server fingerprints
~/.ssh/authorized_keys   # Allowed public keys (on server)
```

## Practice Exercises

Since you may not have a remote server, you can practice SSH locally:

```bash
# SSH to localhost
ssh localhost

# This works if SSH server is running on your machine
```

Or use free SSH practice servers:
- https://www.sdf.org/ (free Unix shell account)
- Your university/work server (if available)

Continue to [exercises](exercises.md) for hands-on practice!

---
[← Permissions](../05-permissions-processes/tutorial.md) | [Next: File Transfer →](../07-file-transfer/tutorial.md)
