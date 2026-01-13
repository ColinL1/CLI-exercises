# Module 02: Exercises

**Time to complete:** 25-30 minutes

## Setup

Before starting, let's create a practice directory structure:

```bash
cd ~
mkdir -p cli-practice/level1/level2/level3
mkdir -p cli-practice/documents/reports
mkdir -p cli-practice/documents/letters
mkdir -p cli-practice/photos/vacation
mkdir -p cli-practice/photos/family
cd cli-practice
```

This creates a structure like:
```
cli-practice/
├── level1/
│   └── level2/
│       └── level3/
├── documents/
│   ├── reports/
│   └── letters/
└── photos/
    ├── vacation/
    └── family/
```

---

## Exercise 1: Basic Navigation (5 min)

**Objective:** Practice moving between directories.

Starting from `~/cli-practice`:

1. Display your current directory
2. List all contents
3. Go into the `documents` directory
4. Display your current directory (confirm you're in documents)
5. Go back to `cli-practice` using `..`
6. Go to your home directory
7. Return to `cli-practice` using an absolute path
8. Go to the `level1/level2/level3` directory in one command

**Challenge:** From `level3`, get back to `cli-practice` in one command using `..`

---

## Exercise 2: Absolute vs Relative Paths (10 min)

**Objective:** Understand the difference between absolute and relative paths.

Starting from `~/cli-practice`:

1. Use `pwd` to see your current absolute path
2. Navigate to `documents/reports` using a **relative** path
3. Display your current directory (should show absolute path)
4. Navigate to `~/cli-practice/photos/vacation` using an **absolute** path
5. Navigate to the `family` directory using a **relative** path (hint: you're in vacation, family is a sibling)
6. Navigate to `documents/letters` using an absolute path
7. Navigate back to `cli-practice` root using `cd ..` commands

**Questions:**
- Write down the absolute path to the `reports` directory
- From `photos/vacation`, what's the relative path to `documents/letters`?

---

## Exercise 3: Using Special Directories (5 min)

**Objective:** Master `.`, `..`, `~`, and `-`

1. From anywhere, go to `cli-practice` using `~`:
   ```bash
   cd ~/cli-practice
   ```

2. Go to `documents`
3. Go to `photos` (use `cd -` to switch back and forth between documents and photos a few times)
4. Copy your current path to the clipboard mentally, navigate to `/tmp`, then return using `cd -`
5. From `photos/vacation`, go to `photos/family` using `..`

**Practice:**
```bash
cd ~/cli-practice/documents
cd ~/cli-practice/photos    # Switch to photos
cd -                        # Back to documents
cd -                        # Back to photos
cd -                        # Back to documents (notice the pattern)
```

---

## Exercise 4: Listing Files and Directories (10 min)

**Objective:** Master `ls` command and its options.

First, create some practice files:
```bash
cd ~/cli-practice
touch file1.txt file2.txt file3.md
touch documents/report.txt documents/notes.md
touch .hidden-file
```

Now practice:

1. List all files in `cli-practice` (basic `ls`)
2. List all files including hidden ones
3. List with long format to see permissions and sizes
4. List with long format, all files, and human-readable sizes
5. List only the `.txt` files
6. List only the `.md` files
7. List files sorted by time (newest first)
8. List contents of `documents` without changing directory
9. List only directories in `cli-practice`

**Advanced:**
```bash
# Create files with different extensions
cd ~/cli-practice/documents
touch report1.pdf report2.pdf data.csv data.xlsx

# Now try:
ls *.pdf           # List only PDF files
ls report*         # List files starting with 'report'
ls *data*          # List files containing 'data'
```

---

## Exercise 5: Understanding ls -l Output (5 min)

**Objective:** Learn to read detailed file listings.

```bash
cd ~/cli-practice
ls -lh
```

For each line of output, identify:

1. Is it a file or directory? (first character)
2. What is the file size?
3. When was it last modified?
4. What is the filename?

**Practice questions:**
- How can you tell the difference between files and directories?
- What does the first character mean if it's `d`? If it's `-`?
- What do the numbers in the size column mean?

---

## Exercise 6: Navigation Scavenger Hunt (10 min)

**Objective:** Combine all navigation skills.

Complete these tasks as efficiently as possible:

1. **Task 1:** Start at home, navigate to `cli-practice/level1/level2/level3` in ONE command

2. **Task 2:** From level3, go to `cli-practice/photos/vacation` in ONE command (use `..`)

3. **Task 3:** From vacation, list the contents of `~/cli-practice/documents/reports` WITHOUT changing directory

4. **Task 4:** Go to your home directory, then to `/tmp`, then back to `cli-practice` using only three commands

5. **Task 5:** From `cli-practice`, create this exact navigation path:
   - Go to `documents`
   - Then to `reports`
   - Back to `documents` (using `..`)
   - Then to `letters`
   - Back to `cli-practice` root (using `cd` with no arguments won't work here - use `..`)

6. **Task 6:** Display the absolute path of `cli-practice/level1/level2/level3` without going there
   (Hint: combine `cd` and `pwd` or just think about it)

---

## Exercise 7: Create Your Own Structure (5 min)

**Objective:** Apply navigation while creating directories.

Create this structure inside `cli-practice`:

```
my-project/
├── src/
│   ├── main/
│   └── test/
├── docs/
└── data/
    ├── raw/
    └── processed/
```

Commands to use (figure out the right order):
```bash
cd ~/cli-practice
mkdir -p my-project/src/main
mkdir -p my-project/src/test
mkdir my-project/docs
mkdir -p my-project/data/raw
mkdir -p my-project/data/processed
```

Now navigate:
1. Into `src/main`
2. To `src/test` using a relative path
3. To `data/raw` from `src/test`
4. Back to `my-project` root
5. List the entire structure using `ls -R`

---

## Troubleshooting

### "No such file or directory"
```bash
# Check where you are:
pwd

# List what's available:
ls

# Make sure you're using the right path
```

### "Not a directory"
```bash
# You tried to cd into a file
# Use ls -l to see what's a file vs directory
ls -l
# Directories have 'd' at the start
```

### Lost in the file system?
```bash
# Go home and start over:
cd ~

# See where you are:
pwd

# See what's around you:
ls -la
```

---

## Self-Check Questions

Before moving on, can you:

- [ ] Explain the difference between absolute and relative paths?
- [ ] Navigate using `cd`, `cd ..`, `cd ~`, and `cd -`?
- [ ] Use `pwd` to find your current location?
- [ ] Use `ls` with various options (`-l`, `-a`, `-h`, `-t`)?
- [ ] Navigate to any directory using either absolute or relative paths?
- [ ] Understand what `.` and `..` mean?
- [ ] Read `ls -l` output?

---

## Cleanup

When you're done, you can remove the practice directory:

```bash
cd ~
rm -rf cli-practice
# We'll learn about rm in the next module
```

---

## Bonus Challenges

1. **Speed test:** Time yourself navigating from home to `~/cli-practice/level1/level2/level3` and back

2. **Wildcard practice:** Create files named `test1.txt`, `test2.txt`, `test3.txt`, `data1.csv`, `data2.csv` and practice listing them with patterns

3. **Tree view:** Install and try the `tree` command:
   ```bash
   tree ~/cli-practice
   ```

4. **Count directories:** How many subdirectories are in `cli-practice`? 
   ```bash
   ls -lR ~/cli-practice | grep ^d | wc -l
   ```

---

**Great work!** You can now navigate the file system with confidence.

[← Back to Tutorial](tutorial.md) | [Solutions →](solutions/solutions.md) | [Next Module →](../03-file-operations/tutorial.md)
