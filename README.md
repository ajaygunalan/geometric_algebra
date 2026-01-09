# Geometric Algebra Project

Learning project based on "Geometric Algebra for Computer Science" (GA4CS).

## Quick Start

**Run an example:**
```bash
./run_ex.sh 2 1    # Chapter 2, Example 1
```

**Run GAViewer:**
```bash
./gaviewer         # Then: File -> Load .g directory -> figures/
```

**Build from source:**
```bash
cd build && cmake ../src && make -j$(nproc)
```

## Dependencies (Ubuntu)
```bash
sudo apt-get install cmake build-essential libfltk1.3-dev freeglut3-dev libgl1-mesa-dev libglu1-mesa-dev
```
