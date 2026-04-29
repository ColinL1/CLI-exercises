# Release Notes — v1.0.0

## Command Line: Zero to Hero

**First stable release** of the *Command Line: Zero to Hero* open learning course.

Originally developed for **VTK 2026** (Veldwerk & Techniek Klimaat 2026, University of Konstanz), this course is freely available as an open educational resource for anyone wanting to build CLI and basic bioinformatics skills from scratch.

---

## What's Included

### 11 Progressive Modules (~14 hours of learning)

| Module | Topic | Duration |
|--------|-------|----------|
| 01 | Introduction to the CLI | 30 min |
| 02 | Navigation & File System | 45 min |
| 03 | File Operations | 1 h |
| 04 | Viewing & Editing Text | 1.5 h |
| 05 | File Permissions & Processes | 1 h |
| 06 | SSH & Remote Access | 1.5 h |
| 07 | File Transfer | 1 h |
| 08 | Environment Management with Mamba | 1.5 h |
| 09 | Bash Scripting Basics | 2 h |
| 10 | Advanced Bash & Text Processing | 1.5 h |
| 11 | Real-World Projects | 1.5 h |

### Course Materials per Module
- **Tutorial** (`tutorial.md`) — conceptual explanation with examples
- **Exercises** (`exercises.md`) — 50+ hands-on practice tasks
- **Solutions** (`solutions/solutions.md`) — reference answers

### Additional Resources
- [GETTING_STARTED.md](GETTING_STARTED.md) — setup guide for Linux, macOS, and Windows (WSL2)
- [CHEAT_SHEET.md](CHEAT_SHEET.md) — quick reference for all commands taught
- [COMPLETION.md](COMPLETION.md) — self-assessment checklist and next steps
- `check_setup.sh` — automated environment verification script

---

## Target Audience

- Complete beginners with no prior command-line experience
- Researchers and students in biology/bioinformatics wanting to work on remote HPC clusters
- Anyone wanting to automate tasks and write Bash scripts

---

## How to Use

```bash
# Clone the repository
git clone https://github.com/ColinL1/CLI-exercises.git
cd CLI-exercises

# Verify your environment
bash check_setup.sh

# Start with Module 01
open modules/01-cli-introduction/tutorial.md
```

---

## Citation

If you use this material in a course, workshop, or publication, please cite it using the metadata in [CITATION.cff](CITATION.cff) or via the Zenodo DOI badge above.

---

## License

Released under the [MIT License](LICENSE) © 2026 Luigi Colin, University of Konstanz.
