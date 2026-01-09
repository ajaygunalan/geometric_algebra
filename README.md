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
| 2 | [Spanning Oriented Subspaces](src/chap2/) | 3 (+1 solution) |
| 3 | [Linear Algebra](src/chap3/) | 4 (+1 solution) |
| 4 | [Linear Transformations](src/chap4/) | 3 |
| 5 | [Intersection & Union](src/chap5/) | 3 |
| 6 | [Geometric Product](src/chap6/) | 2 (+1 solution) |
| 7 | [Versors](src/chap7/) | 5 (+2 solutions) |
| 8 | [Geometric Differentiation](src/chap8/) | — |

See each chapter's README.md for details.

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

## Dependencies (Ubuntu)
```bash
sudo apt-get install cmake build-essential libfltk1.3-dev freeglut3-dev libgl1-mesa-dev libglu1-mesa-dev
```
