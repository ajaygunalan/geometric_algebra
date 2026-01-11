# Geometric Algebra Project

Learning project based on "Geometric Algebra for Computer Science" (GA4CS).

## Quick Start

```bash
./run_ex.sh 2 1    # Chapter 2, Example 1
./run_ex.sh 3 2s   # Chapter 3, Example 2 solution
```

## Chapters

| Ch | Title | Examples |
|----|-------|----------|
| 1 | Introduction | 1 |
| 2 | Spanning Oriented Subspaces | 3 (+1 solution) |
| 3 | Linear Algebra | 4 (+1 solution) |
| 4 | Linear Transformations | 3 |
| 5 | Intersection & Union | 3 |
| 6 | Geometric Product | 2 (+1 solution) |
| 7 | Versors | 5 (+2 solutions) |
| 10 | Vector Space Model | 3 |
| 11 | Homogeneous Model | 4 (+1 solution) |
| 12 | Transformations (Homogeneous) | 3 |
| 13 | Conformal Model | 4 (+1 solution) |
| 14 | Conformal Primitives | 4 (+1 solution) |
| 15 | Conformal Constructions | 3 |
| 16 | Conformal Transformations | 4 |

**Total: 47 examples + 7 solutions = 54 executables**

Run `./run_ex.sh` to see all examples with descriptions.

**Run GAViewer:**
```bash
./gaviewer         # Then: File -> Load .g directory -> figures/
```

## GAViewer Figures

After loading the `figures/` directory in GAViewer, use these commands in the terminal:

**List all chapters:**
```
fig()
```

**List figures for a chapter:**
```
fig(2)           # List all Chapter 2 figures
```

**Load a figure:**
```
fig(2,14)        # Load Chapter 2, Figure 14
```

### Multi-Part Figures

Some figures have multiple parts (a, b, c). These are **sequential stages**, not separate files.

| Prompt | Action |
|--------|--------|
| `FIG(2,14)a >>` | Press **Enter** to advance to next part |
| `FIG(2,14)c >>` | Press **Enter** again to continue |

Example with Figure 2.14 (Sampling vector field and summing trivectors):
- Part (a): Yellow cube with red sample points
- Part (b): Cube with blue vectors emanating from points
- Part (c): White sphere with vectors and red triangle

**Tip:** The window title shows all parts (e.g., `FIG(2,14)abc`) indicating it's a multi-stage figure.

### Figure Types

Not all book figures are interactive. When you run `fig(chapter)`, you'll see:
- Interactive figures: `FIG(2,3): Bivector representations`
- Code/screenshots: `FIG(2,9): [code]` - these show "ERROR: not an interactive figure"

**Build from source:**
```bash
cd build && cmake ../src && make -j$(nproc)
```

## Dependencies (Ubuntu 24.04)

### Install all dependencies
```bash
# Core dependencies (required for all examples)
sudo apt-get install -y \
    build-essential cmake pkg-config \
    libgl1-mesa-dev libglu1-mesa-dev \
    freeglut3-dev libfltk1.3-dev libantlr-dev

# OpenCV (optional - for 4 examples: 10-3, 11-2, 12-2, 14-4)
sudo apt-get install -y libopencv-dev
```

### Package details
| Package | Purpose |
|---------|---------|
| build-essential | C++ compiler (g++) |
| cmake | Build system |
| pkg-config | Dependency detection |
| libgl1-mesa-dev | OpenGL development files |
| libglu1-mesa-dev | OpenGL Utility Library |
| freeglut3-dev | GLUT (windowing/input) |
| libfltk1.3-dev | FLTK GUI toolkit |
| libantlr-dev | ANTLR 2.x C++ runtime (for parsers) |
| libopencv-dev | Computer vision (optional) |
