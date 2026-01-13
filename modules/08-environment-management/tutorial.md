# Module 08: Environment Management with Mamba/Conda

**Duration:** 1.5 hours  
**Difficulty:** Intermediate

## Why Environment Management?

Different projects need different packages and versions. Environment managers let you:
- Isolate project dependencies
- Avoid version conflicts
- Reproduce environments on other machines
- Test with different package versions

**Example problem without environments:**
- Project A needs Python 3.8 + pandas 1.0
- Project B needs Python 3.11 + pandas 2.0
- Both can't coexist in one environment!

## Conda vs Mamba

- **Conda**: Original environment and package manager
- **Mamba**: Drop-in replacement for conda, but MUCH faster
- **Miniforge**: Minimal installer that includes mamba

**We'll use Mamba** (because it's faster), but commands work the same with conda.

## Installing Miniforge (includes Mamba)

### Linux/macOS:

```bash
# Download installer
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"

# Run installer
bash Miniforge3-$(uname)-$(uname -m).sh

# Follow prompts:
# - Press Enter to review license
# - Type 'yes' to accept
# - Press Enter for default location
# - Type 'yes' to initialize

# Restart your terminal or:
source ~/.bashrc  # or ~/.zshrc
```

### Windows (WSL):

Same as Linux above.

### Verify Installation:

```bash
mamba --version
# Should show version number

which mamba
# Should show path like /home/user/miniforge3/bin/mamba
```

## Basic Mamba/Conda Concepts

### Base Environment

After installation, you're in the `base` environment:
```bash
(base) user@computer:~$
```

**Best practice:** Don't install packages in base! Create separate environments.

### Creating Environments

```bash
# Create environment with specific Python version
mamba create -n myenv python=3.11

# Create with specific packages
mamba create -n dataenv python=3.11 pandas numpy matplotlib

# Create from environment file
mamba env create -f environment.yml
```

### Activating/Deactivating

```bash
# Activate environment
mamba activate myenv
# Prompt changes to: (myenv) user@computer:~$

# Deactivate (return to base)
mamba deactivate

# Deactivate all
conda deactivate
```

### Listing Environments

```bash
# List all environments
mamba env list
# or
conda env list

# Shows:
# base                  *  /home/user/miniforge3
# myenv                    /home/user/miniforge3/envs/myenv
# dataenv                  /home/user/miniforge3/envs/dataenv
```

## Managing Packages

### Installing Packages

```bash
# Activate your environment first
mamba activate myenv

# Install single package
mamba install numpy

# Install specific version
mamba install numpy=1.24.0

# Install multiple packages
mamba install pandas matplotlib scikit-learn

# Install from specific channel
mamba install -c conda-forge package-name

# Install with pip (when not available in conda)
pip install some-package
```

### Listing Packages

```bash
# List all packages in current environment
mamba list

# Search for specific package
mamba list numpy

# Search available package versions
mamba search pandas
```

### Removing Packages

```bash
# Remove package
mamba remove numpy

# Remove multiple packages
mamba remove numpy pandas matplotlib
```

### Updating Packages

```bash
# Update specific package
mamba update numpy

# Update all packages
mamba update --all

# Update mamba itself
mamba update -n base mamba
```

## Working with Environment Files

Environment files let you share and reproduce environments!

### Creating environment.yml

```bash
# Export current environment
mamba env export > environment.yml

# Better: export only explicitly installed packages
mamba env export --from-history > environment.yml
```

### Example environment.yml:

```yaml
name: dataproject
channels:
  - conda-forge
  - defaults
dependencies:
  - python=3.11
  - numpy=1.24
  - pandas=2.0
  - matplotlib
  - scikit-learn
  - pip
  - pip:
    - some-pip-only-package
```

### Creating from environment.yml:

```bash
# Create environment from file
mamba env create -f environment.yml

# Update existing environment from file
mamba env update -f environment.yml
```

## Removing Environments

```bash
# Delete an environment
mamba env remove -n myenv

# or
mamba remove -n myenv --all
```

## Practical Workflow

### Starting a New Project

```bash
# 1. Create project directory
mkdir my-project
cd my-project

# 2. Create environment
mamba create -n my-project python=3.11

# 3. Activate it
mamba activate my-project

# 4. Install packages you need
mamba install pandas numpy matplotlib jupyter

# 5. Export environment
mamba env export --from-history > environment.yml

# 6. Work on your project...

# 7. Deactivate when done
mamba deactivate
```

### Sharing Your Project

```bash
# Share these files:
# - Your code
# - environment.yml

# Someone else can recreate your environment:
mamba env create -f environment.yml
mamba activate my-project
# Now they have the exact same packages!
```

## Common Use Cases

### Data Science Project

```bash
mamba create -n datascience python=3.11 \
  numpy pandas matplotlib seaborn \
  scikit-learn jupyter notebook \
  scipy statsmodels

mamba activate datascience
```

### Web Development

```bash
mamba create -n webapp python=3.11 \
  flask requests sqlalchemy \
  pytest black

mamba activate webapp
pip install flask-login  # If not in conda
```

### Machine Learning

```bash
mamba create -n ml python=3.11 \
  pytorch torchvision torchaudio \
  tensorflow jupyterlab \
  -c pytorch -c conda-forge

mamba activate ml
```

## Troubleshooting

### Environment not activating

```bash
# Reinitialize conda/mamba
conda init bash  # or zsh
# Restart terminal
```

### Solving environment: failed

```bash
# Try mamba (faster solver)
mamba install package-name

# Update mamba
mamba update -n base mamba

# Clear cache
mamba clean --all
```

### Package conflicts

```bash
# Create fresh environment
mamba create -n newenv python=3.11
mamba activate newenv
# Install packages one at a time
```

### Running out of space

```bash
# Clean unused packages and caches
mamba clean --all

# Remove old environments
mamba env list
mamba env remove -n old-env
```

## Best Practices

1. **One environment per project**
   ```bash
   # Good
   project1/ + env: project1
   project2/ + env: project2
   
   # Bad
   one environment for everything
   ```

2. **Use environment.yml for version control**
   ```bash
   git add environment.yml
   git commit -m "Add environment specification"
   ```

3. **Pin important versions**
   ```yaml
   dependencies:
     - python=3.11  # Specific major version
     - pandas=2.0   # Specific major version
     - numpy        # Any version (flexible)
   ```

4. **Activate before installing**
   ```bash
   # Good
   mamba activate myenv
   mamba install package
   
   # Bad (installs in wrong environment)
   mamba install package
   ```

5. **Don't use base for projects**
   ```bash
   # Never do this
   mamba activate base
   mamba install lots-of-packages
   
   # Do this
   mamba create -n myproject python=3.11
   mamba activate myproject
   mamba install packages
   ```

## Quick Reference

```bash
# Installation
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh

# Environments
mamba create -n envname python=3.11
mamba activate envname
mamba deactivate
mamba env list
mamba env remove -n envname

# Packages
mamba install package
mamba install package=1.0.0
mamba list
mamba remove package
mamba update package
mamba search package

# Environment files
mamba env export > environment.yml
mamba env export --from-history > environment.yml
mamba env create -f environment.yml
mamba env update -f environment.yml

# Maintenance
mamba clean --all
mamba update mamba
```

Practice with [exercises](exercises.md)!

---
[← File Transfer](../07-file-transfer/tutorial.md) | [Next: Bash Scripting →](../09-bash-scripting-basics/tutorial.md)
