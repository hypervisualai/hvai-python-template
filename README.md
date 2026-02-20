# hvai-python-template

[한국어 README](README.ko.md)

A GitHub template repository for unifying Python development environments across the HVAI team.
All developers start from this template to ensure identical Python versions and package versions.

---

## Overview

| Item | Value |
|------|-------|
| **Python** | 3.10 |
| **PyTorch** | 2.9.1+cpu |
| **Platform** | Ubuntu 22.04+ / macOS / WSL2 |

---

## How to Use This Template

### Option 1: GitHub Template (Recommended for new projects)

1. Click the **"Use this template"** button at the top of this repository
2. Select **"Create a new repository"**
3. Choose the **Owner**:
   - **`hypervisualai`** — for team/company projects (shared access, company-owned)
   - **Your personal account** — for personal or experimental projects
4. Set **Visibility**:
   - > ⚠️ **Use `Private` unless the project is intended for public release.**
   - `Private` — visible only to team members (recommended for internal projects)
   - `Public` — visible to everyone on the internet
5. Enter your new repository name and click **"Create repository"**
5. Clone your new repository and run setup:

```bash
# Replace "my-project" with the repository name you entered in step 3
git clone git@github.com:hypervisualai/my-project.git
cd my-project
bash setup_env.sh
```

### Option 2: Clone directly (for quick testing)

```bash
git clone git@github.com:hypervisualai/hvai-python-template.git my-project
cd my-project
bash setup_env.sh
```

---

## Quick Start

```bash
# 1. Run the setup script (only needed once)
bash setup_env.sh

# 2. Activate the virtual environment
source .venv/bin/activate

# 3. Verify
python -c "import torch; print(torch.__version__)"
```

Or without activating:

```bash
./.venv/bin/python your_script.py
```

---

## Installed Packages

| Package | Version | Purpose |
|---------|---------|---------|
| **torch** | 2.9.1+cpu | PyTorch (CPU only) |
| **torchvision** | 0.24.1+cpu | Vision utilities |
| **torchaudio** | 2.9.1+cpu | Audio utilities |
| numpy | 2.2.6 | Numerical computing |
| scipy | 1.15.3 | Scientific computing |
| opencv-python | 4.13.0.90 | Image processing |
| matplotlib | 3.10.8 | Visualization |
| pytest | 9.0.2 | Testing |
| expecttest | 0.3.0 | Test assertions |

---

## Adding Packages

1. Add the package to `requirements.txt`:

```
your-package==1.2.3
```

2. Install it:

```bash
./.venv/bin/pip install -r requirements.txt
```

3. Commit `requirements.txt` so all team members get the same version:

```bash
git add requirements.txt
git commit -m "Add your-package"
```

---

## Prerequisites

### Ubuntu 22.04+ / WSL2

```bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.10 python3.10-venv python3.10-dev
```

### macOS

```bash
brew install python@3.10
```

---

## Project Structure

```
your-project/
├── .venv/              ← Virtual environment (git ignored)
├── .gitignore
├── .python-version     ← Python version pin
├── requirements.txt    ← Pinned package versions
├── setup_env.sh        ← One-time setup script
└── your code...
```
