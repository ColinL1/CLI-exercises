# Getting Started with CLI Zero to Hero

Welcome! This guide will help you get started with the CLI learning course.

## Prerequisites

- A computer with terminal access:
  - **Linux**: You're all set! Use your default terminal
  - **macOS**: Use Terminal.app (in Applications > Utilities) or iTerm2
  - **Windows**: Install WSL2 (Windows Subsystem for Linux)

### Windows Users: Installing WSL2

1. Open PowerShell as Administrator and run:
   ```powershell
   wsl --install
   ```

2. Restart your computer

3. Open "Ubuntu" from Start menu

4. Create a username and password

5. You're ready to go!

## Course Structure

This course is designed for ~12-14 hours of learning.

### Day 1: Foundations (6-7 hours)
- Module 01: CLI Introduction (30 min)
- Module 02: Navigation & File System (45 min)
- Module 03: File Operations (1 hour)
- Module 04: Viewing & Editing Text (1.5 hours)
- Module 05: File Permissions & Processes (1 hour)
- Module 06: SSH & Remote Access (1.5 hours)
- Module 07: File Transfer (1 hour)

### Day 2: Advanced Skills (6-7 hours)
- Module 08: Environment Management (1.5 hours)
- Module 09: Bash Scripting Basics (2 hours)
- Module 10: Advanced Bash (1.5 hours)
- Module 11: Real-World Projects (1.5 hours)

## How to Use This Repository

1. **Start with the main README.md** to understand the course overview

2. **Work through modules sequentially**
   - Read the `tutorial.md` for concepts
   - Complete the `exercises.md` for hands-on practice
   - Check `solutions/` only after attempting exercises

3. **Type everything yourself**
   - Don't copy-paste commands
   - Muscle memory is important
   - Learn from mistakes

4. **Practice, practice, practice**
   - Repeat exercises
   - Try variations
   - Experiment safely

## Starting Your First Module

Open your terminal and run:

```bash
# Clone or download this repository
cd /path/to/CLI-exercises

# Read the course overview
cat README.md

# Start Module 01
cd modules/01-cli-introduction
cat tutorial.md
```

Or view the files in your text editor/VS Code.

## Tips for Success

### 1. Set up a dedicated practice area

```bash
mkdir -p ~/cli-learning
cd ~/cli-learning
```

Do all your exercises here to keep things organized.

### 2. Keep a learning journal

```bash
nano learning-notes.md
```

Write down:
- Commands you learn
- Mistakes you make
- "Aha!" moments
- Questions to explore

### 3. Use cheat sheets

Keep command references handy:
- Each module has a "Quick Reference" section
- Create your own cheat sheet as you learn

### 4. Take breaks

This is intense! Schedule breaks:
- 5-10 minutes every hour
- Don't rush - understanding > speed

### 5. Ask questions

If you get stuck:
- Read error messages carefully
- Check the troubleshooting sections
- Review previous modules
- Search online with specific error messages

## Common First-Day Questions

**Q: I'm on Windows. Do I need Linux?**
A: You need a Unix-like environment. WSL2 (Windows Subsystem for Linux) works perfectly!

**Q: Can I skip modules if I already know some CLI?**
A: You can, but we recommend at least skimming each module. You might learn new tricks!

<!-- **Q: How much time per day should I dedicate?**
A: The course is designed for 2 full days (6-7 hours each). You can spread it over more days if needed. -->

**Q: I don't have a remote server. Can I still learn SSH?**
A: Yes! You can practice SSH with localhost, and we provide alternatives in the exercises.

**Q: Do I need to install anything?**
A: Most tools come with your system. The only major installation is Miniforge/Mamba in Module 08, which we guide you through.

## Troubleshooting Setup Issues

### Terminal doesn't open
- **macOS**: Try Command + Space, type "Terminal"
- **Linux**: Try Ctrl + Alt + T
- **Windows**: Make sure WSL2 is installed

### Permission denied errors
- You might need to use `chmod +x script.sh` to make scripts executable
- Never run random scripts with `sudo` unless you understand them

### Command not found
- Check spelling (case matters!)
- Some commands might need installation
- Use Tab completion to avoid typos

## Your First Commands

Try these right now to make sure everything works:

```bash
# Where am I?
pwd

# What's here?
ls

# Who am I?
whoami

# What time is it?
date

# Get help
man ls
```

If these work, you're ready to start!

## Course Pacing

### Too Fast?
- Take more time on exercises
- Repeat modules
- Create your own practice problems
- Take a break and come back

### Too Slow?
- Skip to exercises directly
- Do bonus challenges
- Create more complex variations
- Help others learn

## Ready?

Start your CLI journey:

Begin with [Module 01: Introduction to the CLI](modules/01-cli-introduction/tutorial.md)

Remember: everyone was a beginner once. Be patient with yourself, and work through the course systematically.

---

## Quick Links

- [Main README](README.md) - Course overview
- [Module 01](modules/01-cli-introduction/tutorial.md) - Start here!
- [Module 02](modules/02-navigation-filesystem/tutorial.md) - Navigation
- [Module 08](modules/08-environment-management/tutorial.md) - Mamba/Conda
- [Module 09](modules/09-bash-scripting-basics/tutorial.md) - Bash scripting
- [Module 11](modules/11-real-world-projects/tutorial.md) - Final projects

## Need Help?

- Check the troubleshooting section in each module
- Review the "Common Mistakes" sections
- Read error messages carefully
- Google is your friend: search for "bash [your question]"

Happy learning!
