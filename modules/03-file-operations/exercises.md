# Module 03: Exercises

**Time:** 30 minutes

## Setup

Create a practice area:

```bash
cd ~
mkdir -p file-ops-practice
cd file-ops-practice
```

## Exercise 1: Creating Files and Directories (5 min)

1. Create three empty files: `note1.txt`, `note2.txt`, `note3.txt`
2. Create a directory called `backup`
3. Create a nested directory structure: `projects/2026/january`
4. Create multiple files at once: `data1.csv`, `data2.csv`, `data3.csv`
5. List everything to verify

## Exercise 2: Copying Practice (8 min)

1. Copy `note1.txt` to `note1_backup.txt`
2. Copy all `.txt` files to the `backup` directory
3. Create a directory `docs`, then copy all `.csv` files into it
4. Copy the entire `projects` directory to `projects_backup`
5. Try copying a file that already exists with the `-i` option

## Exercise 3: Moving and Renaming (8 min)

1. Rename `note1.txt` to `first_note.txt`
2. Move `note2.txt` into the `backup` directory
3. Create a directory called `archives`
4. Move all `.csv` files to `archives`
5. Rename the `backup` directory to `old_backups`

## Exercise 4: Wildcards (5 min)

Create test files:
```bash
touch test1.txt test2.txt test10.txt test_a.txt test_b.txt
touch data01.csv data02.csv data99.csv
```

Now:
1. List only files that start with `test` and end with a single digit
2. List all files ending in `.csv`
3. List files named `test1.txt`, `test2.txt`, or `test3.txt` using `[]`
4. Copy all `.txt` files to `old_backups/`

## Exercise 5: Safe Deletion (8 min)

1. List all `.csv` files first
2. Delete one `.csv` file using `rm -i` (interactive mode)
3. Create an empty directory called `empty_test`
4. Remove the empty directory with `rmdir`
5. Create a directory with some files in it:
   ```bash
   mkdir delete_test
   touch delete_test/file1.txt delete_test/file2.txt
   ```
6. Try to delete it with `rmdir` (should fail)
7. Delete it with `rm -r` (recursive)

**Safety Check:** Before using `rm -rf`, always:
- Run `ls` first to see what you're deleting
- Double-check your path
- Consider using `-i` for important files

## Challenge: Organize a Messy Directory

Create a messy directory:
```bash
touch report.pdf data.csv image.jpg notes.txt script.py
touch photo.png analysis.R document.docx code.js
```

Organize into:
```
organized/
├── documents/ (pdf, docx, txt)
├── data/ (csv)
├── images/ (jpg, png)
└── code/ (py, R, js)
```

## Cleanup

```bash
cd ~
rm -rf file-ops-practice
```

[← Tutorial](tutorial.md) | [Solutions →](solutions/solutions.md)
