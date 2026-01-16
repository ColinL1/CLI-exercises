# Module 06: Exercises

**Time:** 45 minutes

## Exercise 1: SSH Key Generation (10 min)

1. Check if you already have SSH keys:

   ```bash
   ls -la ~/.ssh
   ```

2. Generate a new key pair (use a different name to not overwrite existing keys):

   ```bash
   ssh-keygen -t ed25519 -f ~/.ssh/training_key -C "training@example.com"
   ```

3. View your public key:

   ```bash
   cat ~/.ssh/training_key.pub
   ```

4. Set correct permissions:

   ```bash
   chmod 600 ~/.ssh/training_key
   chmod 644 ~/.ssh/training_key.pub
   ```

## Exercise 2: SSH Config File (15 min)

Create or edit `~/.ssh/config`:

```bash
nano ~/.ssh/config
```

Add a localhost entry:

```text
Host local
    HostName localhost
    User YOUR_USERNAME
    IdentityFile ~/.ssh/training_key

Host github
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
```

Save and set permissions:

```bash
chmod 600 ~/.ssh/config
```

## Exercise 3: Test SSH to Localhost (10 min)

If you have SSH server running:

```bash
# Test connection
ssh local

# Run a command remotely (even though it's local)
ssh local 'pwd'
ssh local 'ls -la ~'
ssh local 'echo "Running on $(hostname)"'

# Exit
exit
```

## Exercise 4: SSH Config Practice (10 min)

Update your config with useful settings:

```bash
nano ~/.ssh/config
```

Add:

```text
Host *
    ServerAliveInterval 60
    ServerAliveCountMax 3
    Compression yes

Host myserver
    HostName example.com
    User yourusername
    Port 22
    IdentityFile ~/.ssh/id_ed25519
    ForwardAgent yes
```

## Understanding SSH Config Options:

- `ServerAliveInterval`: Keeps connection alive
- `Compression`: Compresses data
- `ForwardAgent`: Forwards SSH agent (for key forwarding)
- `Port`: SSH port (default 22)

## Bonus: GitHub SSH Setup (10 min)

If you use GitHub:

1. Copy your public key:

   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

2. Add to GitHub:
   - Go to GitHub → Settings → SSH and GPG keys
   - Click "New SSH key"
   - Paste your public key
   - Save

3. Test connection:

   ```bash
   ssh -T git@github.com
   ```

---

**Note:** If you don't have a remote server to practice with, the localhost exercises are still valuable for understanding SSH concepts!

[← Tutorial](tutorial.md) | [Solutions →](solutions/solutions.md) |[Next Module →](../07-file-transfer/tutorial.md)
