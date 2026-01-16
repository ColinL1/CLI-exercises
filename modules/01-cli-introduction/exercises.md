# Module 01: Exercises

**Time to complete:** 15-20 minutes

## Instructions

Complete each exercise in order. Type the commands yourself - don't copy and paste! Check your answers in the solutions folder only after attempting each exercise.

---

## Exercise 1: Getting Your Bearings (5 min)

**Objective:** Familiarize yourself with basic information commands.

1. Open your terminal
2. Find out what directory you're currently in
3. List all files in your current directory (including hidden ones)
4. Find out your username
5. Check what shell you're using
6. Display the current date and time

**Questions to answer:**

- What is your current directory path?
- Do you have any hidden files? (They start with `.`)
- What shell are you using?

---

## Exercise 2: Exploring Commands (5 min)

**Objective:** Practice using help and manual pages.

1. Use `man` to read the manual for the `ls` command
2. Find out what the `-R` option does for `ls`
3. Find out what the `-t` option does for `ls`
4. Use `ls --help` to see a quick reference
5. Try running `ls -lt` and observe the output

**Questions:**

- What does `ls -R` do?
- What does `ls -t` do?
- What happens when you combine them: `ls -lt`?

---

## Exercise 3: Command History (3 min)

**Objective:** Learn to use command history efficiently.

1. Run these commands in order:

   ```bash
   pwd
   ls
   date
   whoami
   ls -la
   ```

2. Use the `history` command to see your command history
3. Use the up arrow to navigate to the `ls -la` command and run it again
4. Use `!!` to run the last command again
5. Clear your terminal screen

**Challenge:** Can you run the `pwd` command again using `!pw`?

---

## Exercise 4: Using Tab Completion (5 min)

**Objective:** Master tab completion to work faster and avoid typos.

1. Type `who` and press Tab twice - what suggestions do you see?
2. Type `whoa` and press Tab - what happens?
3. Type `ls ~/D` and press Tab - does it autocomplete?
4. Clear the line with `Ctrl + U`
5. Type a command, use `Ctrl + A` to jump to the beginning, then `Ctrl + K` to delete

**Practice these shortcuts:**

- `Tab` - Autocomplete
- `Ctrl + C` - Cancel command
- `Ctrl + L` - Clear screen
- `Ctrl + A` - Beginning of line
- `Ctrl + E` - End of line
- `Ctrl + U` - Delete to beginning
- `Ctrl + K` - Delete to end

---

## Exercise 5: Exploring Your Environment (5 min)

**Objective:** Learn about environment variables.

1. Display your home directory path using `echo $HOME`
2. Display your username using `echo $USER`
3. Display your shell path using `echo $SHELL`
4. Display where commands are found using `echo $PATH`
5. Try `echo "Hello, $USER! Your home is $HOME"`

**Questions:**

- What is your home directory?
- What does the `$PATH` variable contain?
- What do you think `$PATH` is used for?

---

## Exercise 6: Combining What You've Learned (5 min)

**Objective:** Put multiple concepts together.

1. Clear your screen
2. Display your current directory
3. List all files (including hidden) in long format with human-readable sizes
4. Check your command history and count how many commands you've run so far
5. Display a message: `echo "I am USER in DIRECTORY"` (replace USER and DIRECTORY with actual values using variables)

**Example expected output:**

```text
I am john in /home/john
```

---

## Troubleshooting

### Problem: Command not found

**Solution:** Check for typos. Remember commands are case-sensitive. Use Tab completion.

### Problem: Stuck in a program

**Solution:** Press `Ctrl + C` to exit. If that doesn't work, try `Ctrl + D`.

### Problem: Terminal is frozen

**Solution:** You might have pressed `Ctrl + S` (freezes output). Press `Ctrl + Q` to unfreeze.

### Problem: Too many errors on screen

**Solution:** Run `clear` or press `Ctrl + L` to clean up.

---

## Self-Check Questions

Before moving on, you should be able to:

- [ ] Explain what a terminal, shell, and command are
- [ ] Use `pwd`, `ls`, and `whoami`
- [ ] Navigate command history with arrow keys
- [ ] Use Tab for autocompletion
- [ ] Get help using `man` and `--help`
- [ ] Use basic keyboard shortcuts (`Ctrl + C`, `Ctrl + L`, etc.)
- [ ] Understand what `$HOME`, `$USER`, and `$SHELL` represent

---

## Bonus Challenges

If you finished early and want more practice:

1. **Command chaining:** Run `date; whoami; pwd` (semicolon runs commands in sequence)
2. **Counting commands:** Use `history | wc -l` to count how many commands you've run
3. **Custom prompt:** Research how to view your current prompt setting with `echo $PS1`
4. **Uptime:** Try the `uptime` command to see how long your system has been running

---

## Reflection

Take a moment to think about:

- What was easiest to learn?
- What was most confusing?
- Which keyboard shortcuts will you use most?

---

**Ready for more?** Continue to [Module 02: Navigation & File System](../02-navigation-filesystem/tutorial.md)

[← Back to Tutorial](tutorial.md) | [Solutions →](solutions/solutions.md)
