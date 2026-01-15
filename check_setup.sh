#!/bin/bash
# check_setup.sh - Verify your environment is ready for the CLI course

echo "================================"
echo "CLI Course - Setup Check"
echo "================================"
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}[OK]${NC} $1 is installed"
        return 0
    else
        echo -e "${RED}[MISSING]${NC} $1 is NOT installed"
        return 1
    fi
}

echo "Checking essential commands..."
echo ""

# Essential commands (should be on all Unix systems)
check_command "bash"
check_command "ls"
check_command "cd"
check_command "pwd"
check_command "cat"
check_command "grep"
check_command "sed"
check_command "awk"

echo ""
echo "Checking useful commands..."
echo ""

# Useful but not critical
check_command "nano"
check_command "vim" || check_command "vi"
check_command "less"
check_command "wget" || echo -e "${YELLOW}[WARN]${NC}  wget not found (curl might work instead)"
check_command "curl"
check_command "ssh"
check_command "scp"
check_command "rsync"
check_command "tar"
check_command "gzip"

echo ""
echo "Checking optional tools..."
echo ""

# Optional but helpful
check_command "git" || echo -e "${YELLOW}[WARN]${NC}  git not found (recommended for Module 11)"
check_command "tree" || echo -e "${YELLOW}[WARN]${NC}  tree not found (nice to have, not required)"
check_command "htop" || echo -e "${YELLOW}[WARN]${NC}  htop not found (top will work instead)"

echo ""
echo "Checking environment..."
echo ""

# Check shell
echo "Current shell: $SHELL"
if [[ "$SHELL" == *"bash"* ]] || [[ "$SHELL" == *"zsh"* ]]; then
    echo -e "${GREEN}[OK]${NC} Shell is compatible (bash or zsh)"
else
    echo -e "${YELLOW}[WARN]${NC}  Shell is $SHELL (should still work)"
fi

echo ""

# Check home directory
if [ -d "$HOME" ]; then
    echo -e "${GREEN}[OK]${NC} Home directory exists: $HOME"
else
    echo -e "${RED}[MISSING]${NC} Home directory issue"
fi

# Check if we can create files
TEST_FILE="/tmp/cli-test-$$"
if touch "$TEST_FILE" 2>/dev/null; then
    echo -e "${GREEN}[OK]${NC} Can create files"
    rm "$TEST_FILE"
else
    echo -e "${RED}[MISSING]${NC} Cannot create files (permission issue?)"
fi

# Check if we can execute scripts
if [ -x "$0" ]; then
    echo -e "${GREEN}[OK]${NC} This script is executable"
else
    echo -e "${YELLOW}[WARN]${NC}  This script is not executable (run: chmod +x $0)"
fi

echo ""
echo "System information:"
echo ""

# Show system info
echo "Operating System: $(uname -s)"
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"

echo ""
echo "================================"
echo "Setup Check Complete!"
echo "================================"
echo ""

# Final verdict
echo "Summary:"
echo "--------"
echo "If you see mostly [OK] marks above, you're ready to start!"
echo "The [MISSING] marks for optional tools won't prevent you from learning."
echo ""
echo "Next steps:"
echo "1. Read GETTING_STARTED.md"
echo "2. Start with Module 01"
echo "3. Begin learning!"
echo ""
echo "For help, check:"
echo "- GETTING_STARTED.md for setup assistance"
echo "- README.md for course overview"
echo "- CHEAT_SHEET.md for command reference"
echo ""