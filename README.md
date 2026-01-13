# Command Line: Zero to Hero

A comprehensive 2-day workshop to take you from CLI beginner to confident command-line user. This hands-on course combines tutorials with practical exercises to build real-world skills.

## Learning Objectives

By the end of this course, you will be able to:
- Navigate and manipulate the file system with confidence
- Edit files directly in the terminal
- Connect to remote servers via SSH
- Transfer files between systems
- Create and manage isolated development environments with Mamba
- Write bash scripts to automate repetitive tasks
- Chain commands together using pipes and redirects

## Course Structure

### Day 1: Foundations (6-7 hours)

**Module 01: Introduction to the CLI** (30 min)
- What is the command line and why use it?
- Terminal vs Shell vs Console
- Your first commands

**Module 02: Navigation & File System** (45 min)
- Understanding paths (absolute vs relative)
- Moving around (`pwd`, `cd`, `ls`)
- Understanding the directory tree

**Module 03: File Operations** (1 hour)
- Creating files and directories (`touch`, `mkdir`)
- Copying and moving (`cp`, `mv`)
- Deleting safely (`rm`, `rmdir`)
- Wildcards and patterns

**Module 04: Viewing & Editing Text** (1.5 hours)
- Viewing files (`cat`, `less`, `head`, `tail`)
- Text editors: `nano` for beginners
- Introduction to `vim` (optional)

**Module 05: File Permissions & Processes** (1 hour)
- Understanding Unix permissions
- Changing permissions (`chmod`)
- Viewing and managing processes (`ps`, `top`, `kill`)

**Module 06: SSH & Remote Access** (1.5 hours)
- What is SSH?
- Connecting to remote servers
- SSH keys and authentication
- SSH config files for convenience

**Module 07: File Transfer** (1 hour)
- Downloading files (`wget`, `curl`)
- Copying files to/from remote servers (`scp`, `rsync`)
- Best practices for large file transfers

### Day 2: Intermediate to Advanced (6-7 hours)

**Module 08: Environment Management with Mamba** (1.5 hours)
- Installing Miniforge/Mamba
- Creating and activating environments
- Installing packages
- Managing multiple projects

**Module 09: Bash Scripting Basics** (2 hours)
- Variables and user input
- Conditionals (if/else)
- Loops (for, while)
- Functions
- Making scripts executable

**Module 10: Advanced Bash & Text Processing** (1.5 hours)
- Pipes and redirects (`|`, `>`, `>>`, `<`)
- Text processing (`grep`, `sed`, `awk`)
- Command substitution
- Exit codes and error handling

**Module 11: Real-World Projects** (1.5 hours)
- Automated backup script
- Data processing pipeline
- System monitoring script
- Putting it all together

## Getting Started

### Prerequisites
- A computer with a Unix-like terminal (Linux, macOS, or Windows with WSL)
- No prior command-line experience required!

### Quick Start

1. **Check your setup:**
   ```bash
   ./check_setup.sh
   ```
   This script verifies you have all necessary tools installed.

2. **Read the getting started guide:**
   - [Getting Started Guide](GETTING_STARTED.md) - Complete setup instructions

3. **Start learning:**
   - Begin with [Module 01: CLI Introduction](modules/01-cli-introduction/tutorial.md)

### How to Use This Repository

1. Clone or download this repository
2. Start with Module 01 and work sequentially
3. Each module has:
   - `tutorial.md` - Concepts and examples
   - `exercises.md` - Hands-on practice
   - `solutions/` - Answer keys (try not to peek!)
4. Practice files are in the `practice-files/` directory
5. Take breaks! Learning the CLI can be intense

### Time Commitment
- **Day 1**: 6-7 hours (foundations)
- **Day 2**: 6-7 hours (intermediate to advanced)
- **Total**: ~14 hours of focused learning

## Quick Reference

Each module builds on previous ones. Don't skip ahead unless you're already comfortable with the basics!

```
modules/
├── 01-cli-introduction/
├── 02-navigation-filesystem/
├── 03-file-operations/
├── 04-text-editing/
├── 05-permissions-processes/
├── 06-ssh-remote-access/
├── 07-file-transfer/
├── 08-environment-management/
├── 09-bash-scripting-basics/
├── 10-advanced-bash/
└── 11-real-world-projects/
```

## Tips for Success

1. **Type everything yourself** - Don't copy-paste. Muscle memory matters!
2. **Make mistakes** - They're the best teachers
3. **Use the man pages** - `man <command>` is your friend
4. **Practice daily** - Even 15 minutes makes a difference
5. **Customize your environment** - Make it yours!

## Getting Help

- Each module has common troubleshooting tips
- Use `man <command>` to read documentation
- Use `<command> --help` for quick reference
- Tab completion is your friend (press Tab to autocomplete)

## Additional Resources

- **[Getting Started Guide](GETTING_STARTED.md)** - Setup help and first steps
- **[Command Cheat Sheet](CHEAT_SHEET.md)** - Quick reference for all commands
- **[Completion Guide](COMPLETION.md)** - Next steps after finishing the course

## Repository Structure

```
CLI-exercises/
├── README.md                       # Course overview (you are here)
├── GETTING_STARTED.md              # Setup and getting started guide
├── CHEAT_SHEET.md                  # Quick reference for all commands
├── COMPLETION.md                   # What to do after completing the course
├── LICENSE                         # MIT License
├── .gitignore                      # Git ignore file
└── modules/                        # Course modules
    ├── 01-cli-introduction/
    │   ├── tutorial.md             # Tutorial content
    │   ├── exercises.md            # Hands-on exercises
    │   └── solutions/              # Exercise solutions
    ├── 02-navigation-filesystem/
    ├── 03-file-operations/
    ├── 04-text-editing/
    ├── 05-permissions-processes/
    ├── 06-ssh-remote-access/
    ├── 07-file-transfer/
    ├── 08-environment-management/
    ├── 09-bash-scripting-basics/
    ├── 10-advanced-bash/
    └── 11-real-world-projects/
```

## Learning Path

```
Start Here: Getting Started Guide
    |
Module 01: CLI Introduction (30 min)
    |
Module 02: Navigation (45 min)
    |
Module 03: File Operations (1 hr)
    |
Module 04: Text Editing (1.5 hr)
    |
Module 05: Permissions (1 hr)
    |
Module 06: SSH (1.5 hr)
    |
Module 07: File Transfer (1 hr)
    |
━━━━━ END OF DAY 1 ━━━━━
    |
Module 08: Mamba/Conda (1.5 hr)
    |
Module 09: Bash Scripting (2 hr)
    |
Module 10: Advanced Bash (1.5 hr)
    |
Module 11: Real Projects (1.5 hr)
    |
Finish: Completion Guide
```

## Tips for Success

- **Keep the [Cheat Sheet](CHEAT_SHEET.md) handy** while working through exercises
- **Type everything yourself** - muscle memory is crucial
- **Make mistakes** - they're the best teachers
- **Take breaks** - 10 minutes every hour
- **Practice daily** - even 15 minutes helps

## License

This course is released under the MIT License - see LICENSE file for details.

## Contributing

Found a typo? Have a suggestion? Contributions are welcome!
1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request

## Acknowledgments

Created for students learning command-line interfaces for the first time. Special thanks to all the open-source tools and communities that make this possible.

---

**Ready to start learning?**

Start with the [Getting Started Guide](GETTING_STARTED.md) or jump right into [Module 01: CLI Introduction](modules/01-cli-introduction/tutorial.md).
