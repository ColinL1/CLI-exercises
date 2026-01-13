# Module 07: Exercises

**Time:** 40 minutes

## Exercise 1: Downloading Files (10 min)

1. Download a sample file with wget:
   ```bash
   mkdir ~/transfer-practice
   cd ~/transfer-practice
   wget https://www.gutenberg.org/files/1342/1342-0.txt -O pride-prejudice.txt
   ```

2. Download with curl:
   ```bash
   curl -O https://www.gutenberg.org/files/84/84-0.txt
   mv 84-0.txt frankenstein.txt
   ```

3. Download and pipe to word count:
   ```bash
   curl -s https://www.gutenberg.org/files/11/11-0.txt | wc -l
   ```

## Exercise 2: SCP Practice (15 min)

Practice with localhost (if SSH is available):

1. Create test files:
   ```bash
   echo "Test file 1" > test1.txt
   echo "Test file 2" > test2.txt
   mkdir testdir
   echo "Nested file" > testdir/nested.txt
   ```

2. Copy to /tmp (simulating remote):
   ```bash
   scp test1.txt localhost:/tmp/
   scp -r testdir localhost:/tmp/
   ```

3. Copy back:
   ```bash
   scp localhost:/tmp/test1.txt ./test1_copy.txt
   scp -r localhost:/tmp/testdir ./testdir_copy/
   ```

4. Verify:
   ```bash
   diff test1.txt test1_copy.txt
   diff -r testdir testdir_copy
   ```

## Exercise 3: rsync Practice (15 min)

1. Create source directory:
   ```bash
   mkdir source dest
   echo "File 1" > source/file1.txt
   echo "File 2" > source/file2.txt
   echo "File 3" > source/file3.txt
   ```

2. Sync to destination:
   ```bash
   rsync -av source/ dest/
   ```

3. Modify source and sync again:
   ```bash
   echo "File 4" > source/file4.txt
   rm source/file1.txt
   rsync -av --delete source/ dest/
   ```

4. Check destination:
   ```bash
   ls dest/
   # Should have file2.txt, file3.txt, file4.txt
   # file1.txt should be deleted
   ```

5. Try dry run:
   ```bash
   echo "File 5" > source/file5.txt
   rsync -avn source/ dest/  # Shows what would change
   ```

## Exercise 4: Download and Process (10 min)

1. Download a CSV file:
   ```bash
   curl -O https://people.sc.fsu.edu/~jburkardt/data/csv/airtravel.csv
   ```

2. View first few lines:
   ```bash
   head airtravel.csv
   ```

3. Count lines:
   ```bash
   wc -l airtravel.csv
   ```

4. Process with awk:
   ```bash
   awk -F',' '{print $1}' airtravel.csv | head
   ```

## Cleanup

```bash
cd ~
rm -rf transfer-practice
```

## Real-World Scenario

If you have access to a remote server:

```bash
# Backup your important files
rsync -avz ~/Documents/important/ user@server:~/backups/

# Download datasets
wget https://data.example.com/dataset.csv

# Transfer analysis results back
scp results.pdf user@server:~/shared/
```

[← Tutorial](tutorial.md) | [Next Module →](../08-environment-management/tutorial.md)
