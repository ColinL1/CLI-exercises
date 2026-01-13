# Module 10: Exercises

**Time:** 45 minutes

## Exercise 1: Text Processing (15 min)

Create a sample log file:
```bash
cat > server.log << 'EOF'
2026-01-13 10:00:01 INFO Server started
2026-01-13 10:00:15 ERROR Connection failed
2026-01-13 10:00:30 INFO Request received
2026-01-13 10:01:00 ERROR Timeout
2026-01-13 10:01:15 WARNING Low memory
2026-01-13 10:02:00 ERROR Database error
2026-01-13 10:02:30 INFO Request completed
2026-01-13 10:03:00 INFO Server running
EOF
```

Tasks:
1. Count total errors: `grep -c ERROR server.log`
2. Extract only error messages: `grep ERROR server.log`
3. Get timestamps of errors: `grep ERROR server.log | awk '{print $1, $2}'`
4. Count each log level: `awk '{print $3}' server.log | sort | uniq -c`
5. Get errors and warnings: `grep -E "ERROR|WARNING" server.log`

## Exercise 2: Data Pipeline (15 min)

Create CSV data:
```bash
cat > data.csv << 'EOF'
name,age,score
Alice,25,85
Bob,30,92
Charlie,22,78
David,28,95
Eve,26,88
EOF
```

Create a pipeline:
```bash
# Extract names and scores, find top scorers
tail -n +2 data.csv | awk -F',' '{print $1, $3}' | sort -k2 -rn
```

Tasks:
1. Calculate average score
2. Find people over 25
3. Sort by name
4. Count total entries

## Exercise 3: Automated Report (20 min)

Create a system report script:

```bash
nano generate_report.sh
```

```bash
#!/bin/bash

REPORT="system_report_$(date +%Y%m%d).txt"

{
    echo "System Report - $(date)"
    echo "================================"
    echo ""
    
    echo "Disk Usage:"
    df -h | grep -v tmpfs
    echo ""
    
    echo "Top 5 Processes by Memory:"
    ps aux --sort=-%mem | head -6
    echo ""
    
    echo "Recent Logins:"
    last | head -10
    echo ""
    
} > "$REPORT"

echo "Report generated: $REPORT"
```

## Exercise 4: Log Analyzer (15 min)

```bash
nano analyze_log.sh
```

```bash
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile=$1

echo "=== Log Analysis ==="
echo "File: $logfile"
echo ""

echo "Total lines: $(wc -l < "$logfile")"
echo "Errors: $(grep -c ERROR "$logfile")"
echo "Warnings: $(grep -c WARNING "$logfile")"
echo "Info: $(grep -c INFO "$logfile")"
echo ""

echo "Error breakdown:"
grep ERROR "$logfile" | cut -d' ' -f4- | sort | uniq -c | sort -rn
```

Test it: `./analyze_log.sh server.log`

[← Tutorial](tutorial.md) | [Next Module →](../11-real-world-projects/tutorial.md)
