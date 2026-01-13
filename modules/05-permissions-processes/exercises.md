# Module 05: Exercises

**Time:** 30 minutes

## Exercise 1: Understanding Permissions

```bash
mkdir perm-practice
cd perm-practice
touch file1.txt
ls -l file1.txt
```

1. What are the current permissions?
2. Change permissions to 755
3. Change permissions to 644
4. Remove write permission for group: `chmod g-w file1.txt`
5. Add execute for user: `chmod u+x file1.txt`

## Exercise 2: Making Scripts Executable

```bash
cat > hello.sh << 'EOF'
#!/bin/bash
echo "Hello from a script!"
EOF

# Try to run it
./hello.sh      # Should fail (permission denied)

# Make it executable
chmod +x hello.sh

# Run it again
./hello.sh      # Should work!
```

## Exercise 3: Process Management

1. Run a long process in background:
   ```bash
   sleep 60 &
   ```
2. List jobs: `jobs`
3. Find its process ID: `ps aux | grep sleep`
4. Kill it: `kill <PID>`

## Exercise 4: Using top

1. Run `top`
2. Observe CPU and memory usage
3. Press `q` to quit

[← Tutorial](tutorial.md) | [Next Module →](../06-ssh-remote-access/tutorial.md)
