# Module 08: Exercises

**Time:** 45 minutes

## Prerequisites

Install Miniforge if you haven't already (see tutorial).

## Exercise 1: Create Your First Environment (10 min)

1. Create an environment for data analysis:
   ```bash
   mamba create -n data-analysis python=3.11
   ```

2. Activate it:
   ```bash
   mamba activate data-analysis
   ```

3. Verify Python version:
   ```bash
   python --version
   ```

4. List environments:
   ```bash
   mamba env list
   ```

5. Deactivate:
   ```bash
   mamba deactivate
   ```

## Exercise 2: Install and Manage Packages (15 min)

1. Activate your environment:
   ```bash
   mamba activate data-analysis
   ```

2. Install packages:
   ```bash
   mamba install numpy pandas matplotlib
   ```

3. List installed packages:
   ```bash
   mamba list
   ```

4. Test installation:
   ```bash
   python -c "import pandas; print(pandas.__version__)"
   ```

5. Install additional package:
   ```bash
   mamba install jupyter
   ```

6. List packages again and see the difference

## Exercise 3: Environment Files (10 min)

1. Export your environment:
   ```bash
   mamba env export --from-history > my-env.yml
   ```

2. View the file:
   ```bash
   cat my-env.yml
   ```

3. Create environment from file:
   ```bash
   mamba deactivate
   mamba env create -f my-env.yml -n data-analysis-copy
   ```

4. Verify:
   ```bash
   mamba env list
   ```

## Exercise 4: Multiple Environments (15 min)

1. Create a web development environment:
   ```bash
   mamba create -n webdev python=3.11 flask requests
   ```

2. Create a machine learning environment:
   ```bash
   mamba create -n ml python=3.10 scikit-learn numpy pandas
   ```

3. List all your environments:
   ```bash
   mamba env list
   ```

4. Switch between them:
   ```bash
   mamba activate webdev
   python --version
   mamba list | grep flask
   
   mamba activate ml
   python --version
   mamba list | grep scikit
   ```

5. Remove an environment:
   ```bash
   mamba deactivate
   mamba env remove -n data-analysis-copy
   ```

## Exercise 5: Real Project Setup (10 min)

1. Create a project directory:
   ```bash
   mkdir ~/my-data-project
   cd ~/my-data-project
   ```

2. Create environment file:
   ```bash
   cat > environment.yml << 'EOF'
   name: my-data-project
   channels:
     - conda-forge
   dependencies:
     - python=3.11
     - pandas
     - numpy
     - matplotlib
     - seaborn
     - jupyter
     - scikit-learn
   EOF
   ```

3. Create environment from file:
   ```bash
   mamba env create -f environment.yml
   ```

4. Activate and verify:
   ```bash
   mamba activate my-data-project
   mamba list
   ```

5. Create a simple Python script:
   ```bash
   cat > analyze.py << 'EOF'
   import pandas as pd
   import numpy as np

   data = pd.DataFrame({
       'A': np.random.randn(10),
       'B': np.random.randn(10)
   })

   print(data.describe())
   EOF
   ```

6. Run it:
   ```bash
   python analyze.py
   ```

## Cleanup (Optional)

Remove practice environments:
```bash
mamba deactivate
mamba env remove -n data-analysis
mamba env remove -n webdev
mamba env remove -n ml
```

## Challenge

Create an environment for your actual work/research:
1. Think about what packages you need
2. Create an environment.yml file
3. Install the environment
4. Export it for backup
5. Test that everything works

[← Tutorial](tutorial.md) | [Solutions →](solutions/solutions.md) | [Next Module →](../09-bash-scripting-basics/tutorial.md)
