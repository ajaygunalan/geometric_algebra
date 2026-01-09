# Chapter 6: The Fundamental Product of Geometric Algebra

## Programming Examples

| # | Command | Type | Description |
|---|---------|------|-------------|
| 1 | `./run_ex.sh 6 1` | Exercise | Implement outer product and left contraction from geometric product |
| 1s | `./run_ex.sh 6 1s` | Solution | Solution for ex1 |
| 2 | `./run_ex.sh 6 2` | Example | Interactive Gram-Schmidt orthogonalization visualization |

## ex1: Subspace Products [EXERCISE]
Implement four functions that compute outer product and left contraction using only the geometric product:

- `outerProduct_1a(vector, mv)`: Outer product of vector with multivector using grade involution formula
- `leftContraction_1a(vector, mv)`: Left contraction of vector into multivector using grade involution formula
- `outerProduct_1b(mv, mv)`: General outer product using grade extraction from geometric product
- `leftContraction_1b(mv, mv)`: General left contraction using grade extraction from geometric product

The test harness runs 100,000 random tests comparing your implementations against the library functions.

## ex1s: Subspace Products [SOLUTION]
Demonstrates the solutions:

- **1a formulas**: Uses `0.5 * (a*B + gradeInvolution(B)*a)` for outer product and `0.5 * (a*B - gradeInvolution(B)*a)` for left contraction
- **1b approach**: Loops over grade combinations, extracting grade-(i+j) from geometric product for outer product and grade-(j-i) for left contraction

## ex2: Gram-Schmidt Orthogonalization [EXAMPLE]
Interactive 3D visualization of Gram-Schmidt orthogonalization using geometric algebra.

**Features:**
- Left panel: Three draggable non-orthogonal vectors (red, green, blue)
- Right panel: Resulting orthogonal vectors computed via GA
- Mouse interaction: Drag vectors to modify, orbit scene to rotate view

**GA Algorithm:** Uses the formula `vOut[i] = (vIn[i] ^ B) * inverse(B)` where B is the blade formed by wedging all previous vectors. Throws an error if input vectors are linearly dependent.
