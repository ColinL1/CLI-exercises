# Module 04: Exercises

**Time:** 45 minutes

## Exercise 1: Viewing Files (10 min)

Setup:
```bash
cd ~
mkdir text-practice
cd text-practice
curl -o sample.txt https://www.gutenberg.org/files/1342/1342-0.txt 2>/dev/null || cat > sample.txt << 'EOF'
Line 1: First line of our sample file
Line 2: Second line with some data
Line 3: Third line
Line 4: Fourth line
Line 5: Fifth line
EOF
```

Tasks:
1. Display the entire file with `cat`
2. View the file with `less` (practice navigation, search for a word)
3. Show first 3 lines with `head`
4. Show last 3 lines with `tail`
5. Count lines, words, and characters with `wc`

## Exercise 2: Nano Basics (15 min)

1. Create a new file called `mynotes.txt` with nano
2. Type the following:
   ```
   My Notes
   ========
   
   Todo today:
   - Learn CLI
   - Practice text editing
   - Complete exercises
   ```
3. Save and exit
4. Reopen the file and add another item to the list
5. Save and exit again
6. Display the file with `cat` to verify

## Exercise 3: Quick Text Creation (10 min)

1. Create a file using echo:
   ```bash
   echo "# My Project" > README.md
   ```
2. Append to it:
   ```bash
   echo "" >> README.md
   echo "This is my first CLI project" >> README.md
   ```
3. Create a multi-line file using heredoc:
   ```bash
   cat > todo.txt << EOF
   Tasks:
   1. Complete Module 4
   2. Practice vim basics
   3. Move to Module 5
   EOF
   ```
4. View both files with `cat`

## Exercise 4: Vim Survival (15 min)

Practice these steps:

1. Open a new file: `vim practice.txt`
2. Press `i` to enter insert mode
3. Type: `Learning Vim is challenging but powerful`
4. Press `ESC` to return to normal mode
5. Press `:wq` and Enter to save and quit

6. Reopen the file: `vim practice.txt`
7. Navigate with `hjkl` keys
8. Press `o` to insert a new line below
9. Type: `Second line added`
10. Press `ESC`, then `:wq` to save and quit

11. Open again and practice:
    - `dd` to delete a line
    - `u` to undo
    - `yy` to copy a line
    - `p` to paste
    - `:q!` to quit without saving

## Exercise 5: Text Processing (10 min)

Create a data file:
```bash
cat > data.txt << EOF
apple,red,5
banana,yellow,3
cherry,red,8
date,brown,2
elderberry,purple,6
EOF
```

Tasks:
1. View the file
2. Use `grep` to find all red fruits: `grep "red" data.txt`
3. Use `awk` to print only fruit names: `awk -F',' '{print $1}' data.txt`
4. Count the lines: `wc -l data.txt`
5. Replace "red" with "crimson" using sed: `sed 's/red/crimson/g' data.txt`

## Bonus: Create a Quick Script

```bash
nano greet.sh
```

Add:
```bash
#!/bin/bash
echo "Hello, $USER!"
echo "Current directory: $(pwd)"
echo "Today is: $(date +%A)"
```

Save, make executable, and run:
```bash
chmod +x greet.sh
./greet.sh
```

## Cleanup

```bash
cd ~
rm -rf text-practice
```

[← Tutorial](tutorial.md) | [Solutions →](solutions/solutions.md) | [Next Module →](../05-permissions-processes/tutorial.md)
