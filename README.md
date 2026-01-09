# Geometric Algebra Project

## Directory Structure
- **`docs/`**: Full book PDF, documentation, and `gasandbox_api.md` (API reference).
- **`docs/chapters/`**: Split PDF chapters for focused reading.
- **`tools/`**: Contains `gaviewer` executable.
- **`src/`**: Contains the **GA Sandbox** C++ source code and libraries.
- **`build/`**: Contains the compiled C++ executables (CMake out-of-source build).
- **`figures/`**: Contains the `.g` script files for use with GAViewer. **(Covers Chapters 1-23)**
- **`run_ex.sh`**: Helper script to run C++ examples from the root.

## Building

### Dependencies (Ubuntu)
```bash
sudo apt-get install cmake build-essential
sudo apt-get install libfltk1.3-dev freeglut3-dev libgl1-mesa-dev libglu1-mesa-dev
# Optional:
sudo apt-get install libopencv-dev  # For some chapter 10-14 examples
```

### Build
```bash
cd build
cmake ../src
make -j$(nproc)
```

## How to Run

### 1. Interactive Visuals (GAViewer)
To explore figures from the book:
1. Run GAViewer:
   ```bash
   ./gaviewer
   ```
2. Load the scripts: **File -> Load .g directory** -> Select `figures`.
3. In the console, type `FIG(1)` to see Chapter 1 figures, or `FIG(1, 1)` to load a specific one.

### 2. C++ Programming Examples
To run the compiled C++ examples directly from the root:
```bash
./run_ex.sh <chapter> <example>
```
**Example:** Run Chapter 1, Example 1:
```bash
./run_ex.sh 1 1
```

## Programming Exercises

Each chapter has an `EXERCISES.md` file in `src/chap{N}/` containing ALL exercises from the book.

### Exercise Types
| Type | Description |
|------|-------------|
| **Drill** | Computational practice (formulas, calculations) |
| **Structural** | Proofs and derivations (code to verify) |
| **Programming** | Interactive visualizations |
| **Calculation** | Math from chapter text (code instead of pen/paper) |

### Exercise Counts by Chapter

| Chapter | Drills | Structural | Programming | Calculations | Total |
|---------|--------|------------|-------------|--------------|-------|
| 2 | 5 | 9 | 3 | 4 | **21** |
| 3 | 3 | 13 | 4 | 5 | **25** |
| 4 | 0 | 17 | 3 | 5 | **25** |
| 5 | 8 | 7 | 3 | 1 | **19** |
| 6 | 2 | 10 | 3 | 3 | **18** |
| 7 | 7 | 14 | 8 | 0 | **29** |
| 8 | 4 | 6 | 0 | 5 | **15** |
| **Total** | **29** | **76** | **24** | **23** | **152** |

### Workflow
1. Open `src/chap{N}/EXERCISES.md` to see all problems
2. Each exercise shows: Problem, Formulas needed, Implementation hints
3. Status indicates if code exists (`HAS_CODE: exN`) or needs implementation (`NO_CODE`)
4. Run existing demos: `./run_ex.sh <chapter> <example>`
5. Solutions: `src/chap{N}/solutions/`

### C++ Examples with Existing Code

| Chapter | Examples | Notes |
|---------|----------|-------|
| 2 | ex1, ex2, ex3 | ex2 has TODO stub |
| 3 | ex1, ex2, ex3, ex4 | ex2 has TODO stub |
| 4 | ex1, ex2, ex3 | All complete |
| 5 | ex1, ex2, ex3 | All complete |
| 6 | ex1, ex2 | ex1 has solution |
| 7 | ex1-ex5 | ex4, ex5 have solutions |
| 8 | (none) | Theory chapter |
