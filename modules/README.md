 # Course Modules

This course contains progressive modules. Each module builds on previous ones, so start from Module 01 and work your way through.

## All Modules

### Foundations

| Module | Topic | Duration | Difficulty |
|--------|-------|----------|------------|
| [01](01-cli-introduction/) | CLI Introduction | 30 min | Beginner |
| [02](02-navigation-filesystem/) | Navigation & File System | 45 min | Beginner |
| [03](03-file-operations/) | File Operations | 1 hour | Easy |
| [04](04-text-editing/) | Viewing & Editing Text | 1.5 hours | Easy |
| [05](05-permissions-processes/) | Permissions & Processes | 1 hour | Intermediate |
| [06](06-ssh-remote-access/) | SSH & Remote Access | 1.5 hours | Intermediate |
| [07](07-file-transfer/) | File Transfer | 1 hour | Intermediate |

**Day 1 Total**: ~6-7 hours

---

### Advanced Skills

| Module | Topic | Duration | Difficulty |
|--------|-------|----------|------------|
| [08](08-environment-management/) | Environment Management (Mamba) | 1.5 hours | Intermediate |
| [09](09-bash-scripting-basics/) | Bash Scripting Basics | 2 hours | Intermediate-Advanced |
| [10](10-advanced-bash/) | Advanced Bash & Text Processing | 1.5 hours | Advanced |
| [11](11-real-world-projects/) | Real-World Projects | 1.5 hours | Advanced |

**Day 2 Total**: ~6-7 hours

---

## How to Use Each Module

Each module contains:

```
module-name/
├── tutorial.md         # Learning content and examples
├── exercises.md        # Hands-on practice
└── solutions/          # Answer keys (try not to peek!)
    └── solutions.md
```

### Recommended Workflow

1. **Read** the `tutorial.md` carefully
2. **Try** the examples as you go
3. **Complete** the `exercises.md`
4. **Check** solutions only after attempting
5. **Practice** until comfortable
6. **Move on** to next module

## Pacing Yourself

### If You're Moving Too Fast
- Slow down and practice more
- Do the bonus challenges
- Create your own variations
- Help explain concepts to others

### If You're Moving Too Slow
- Focus on the essentials
- Skip bonus challenges for now
- Come back to review later
- Don't worry about memorizing everything

## Module Dependencies

```
01 (CLI Intro)
  ↓
02 (Navigation) ← Required for all others
  ↓
03 (File Operations) ← Required for scripts
  ↓
04 (Text Editing) ← Helpful for scripts
  ↓
05 (Permissions) ← Important for scripts
  ↓
06 (SSH) ← Standalone, can skip if no remote access needed
  ↓
07 (File Transfer) ← Requires SSH knowledge
  ↓
08 (Mamba) ← Standalone, crucial for Python work
  ↓
09 (Bash Basics) ← Foundation for automation
  ↓
10 (Advanced Bash) ← Builds on module 09
  ↓
11 (Projects) ← Uses everything!
```

## Progress Tracker

Track your progress:

- [ ] Module 01: CLI Introduction
- [ ] Module 02: Navigation & File System
- [ ] Module 03: File Operations
- [ ] Module 04: Viewing & Editing Text
- [ ] Module 05: File Permissions & Processes
- [ ] Module 06: SSH & Remote Access
- [ ] Module 07: File Transfer
- [ ] Module 08: Environment Management
- [ ] Module 09: Bash Scripting Basics
- [ ] Module 10: Advanced Bash
- [ ] Module 11: Real-World Projects

## Tips for Each Module

### Module 01
- Take it slow, understand the fundamentals
- Practice the keyboard shortcuts
- Get comfortable with `man` pages

### Module 02
- Draw the file tree structure on paper
- Practice both absolute and relative paths
- Use Tab completion constantly

### Module 03
- Always check with `ls` before deleting
- Use `-i` flag when learning
- Practice with wildcards extensively

### Module 04
- Master `nano` before trying `vim`
- Learn to love `less` for viewing files
- Practice `head` and `tail` for logs

### Module 05
- Understand the permission numbers
- Practice on test files first
- Learn to read `ls -l` output fluently

### Module 06
- Set up SSH keys early
- Create an SSH config file
- Practice with localhost if no remote server

### Module 07
- Start with small files when learning
- Use `rsync` for important transfers
- Always verify transfers completed

### Module 08
- Install Miniforge before starting
- Create a test environment to experiment
- Use environment.yml for all projects

### Module 09
- Type every script yourself
- Start simple, add complexity gradually
- Test scripts frequently as you write

### Module 10
- Master pipes and redirects
- Practice regex with `grep`
- Build pipelines incrementally

### Module 11
- Choose projects that interest you
- Customize the examples for your needs
- Share your projects!

## Getting Help

If you get stuck:

1. **Check the troubleshooting section** in the module
2. **Review previous modules** for foundational concepts
3. **Read error messages carefully** - they often tell you what's wrong
4. **Search online** with specific error messages
5. **Take a break** and come back with fresh eyes

## After Completing All Modules

1. Review the [Cheat Sheet](../CHEAT_SHEET.md)
2. Read the [Completion Guide](../COMPLETION.md)
3. Build your own projects
4. Help others learn
5. Keep practicing!

## Notes Space

Use this space for your own notes:

```
My CLI Journey Notes:
- Favorite commands discovered:
- Hardest concepts:
- Most useful tricks:
- Projects I want to build:
```

---

**Ready to start?** [Module 01: CLI Introduction](01-cli-introduction/tutorial.md)

**Back to main** [Course README](../README.md)
