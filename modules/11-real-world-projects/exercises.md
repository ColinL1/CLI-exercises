# Module 11: Final Projects

**Time:** 90 minutes

Choose ONE project to complete, or do multiple if time allows!

## Project 1: Personal Backup Solution (45 min)

Create a customized backup system for your files.

### Requirements:
- Backup your important directories
- Include configuration options
- Add logging
- Implement backup rotation
- Create a restore script

### Tasks:
1. Modify the backup_system.sh from tutorial
2. Add your own directories to backup
3. Test the backup
4. Create a restore.sh script
5. Schedule it with cron

**Bonus:** Add email notifications when backup completes

## Project 2: Log Analyzer Tool (45 min)

Create a comprehensive log analysis tool.

### Requirements:
- Read log files
- Count different log levels
- Find patterns (errors, IPs, timestamps)
- Generate summary report
- Support multiple log formats

### Sample Structure:
```bash
#!/bin/bash
# log_analyzer.sh

# Features:
# - Count errors, warnings, info
# - Extract top error messages
# - Timeline of events
# - Generate HTML report
```

## Project 3: Development Workflow Automation (45 min)

Create a script that automates your development workflow.

### Requirements:
- Create project structure
- Initialize git
- Setup virtual environment
- Install dependencies
- Create boilerplate files
- Generate documentation

### Example:
```bash
#!/bin/bash
# new_project.sh <name> <type>

# Types: python, web, data, cli
# - Creates appropriate directory structure
# - Sets up environment
# - Initializes git with appropriate .gitignore
# - Creates README and LICENSE
```

## Project 4: System Health Check (30 min)

Create a system health monitoring script.

### Requirements:
- Check CPU, memory, disk
- Monitor running processes
- Check network connectivity
- Generate status report
- Alert on issues

### Features:
- Colorized output
- Summary statistics
- Historical tracking
- Email alerts (optional)

## Project 5: File Organizer (30 min)

Create an intelligent file organizer.

### Requirements:
- Organize files by type/extension
- Handle duplicates
- Rename files with patterns
- Move files based on rules
- Generate organization report

### Example:
```bash
# Organize downloads folder
./organize.sh ~/Downloads

# Results:
# ~/Downloads/Images/
# ~/Downloads/Documents/
# ~/Downloads/Archives/
# ~/Downloads/Videos/
```

## Project 6: Data Processing Suite (60 min)

Create a suite of data processing tools.

### Tools to create:
1. CSV cleaner (remove duplicates, empty lines)
2. Data validator (check formats, ranges)
3. Report generator (statistics, summaries)
4. Data merger (combine multiple files)
5. Format converter (CSV ↔ TSV ↔ JSON)

## Evaluation Criteria

For each project, ensure you have:

- [ ] Clear documentation (comments in code)
- [ ] Error handling
- [ ] User-friendly output
- [ ] Help message
- [ ] Input validation
- [ ] Logging (where appropriate)
- [ ] Clean, readable code

## Submission Checklist

When you're done:

1. Test your script thoroughly
2. Add usage examples in comments
3. Create a README.md
4. Test edge cases
5. Add error handling
6. Make it user-friendly

## Sharing Your Work

Consider:
- Uploading to GitHub
- Sharing with classmates
- Using in your actual workflow
- Expanding for more features

---

**Congratulations!**

You've completed the CLI Zero to Hero course! You now have:
- Solid understanding of the command line
- Navigation and file management skills
- SSH and remote server knowledge
- Environment management expertise
- Bash scripting abilities
- Real-world automation tools

Keep practicing and building more scripts!

[← Real-World Projects](tutorial.md) | [Back to Main](../../README.md)
