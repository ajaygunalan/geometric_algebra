# Chapter 3: Linear Algebra

## Programming Examples

| # | Command | Type | Description |
|---|---------|------|-------------|
| 1 | `./run_ex.sh 3 1` | Demo | Gram-Schmidt orthonormalization visualization |
| 2 | `./run_ex.sh 3 2` | Exercise | Implement cross product using duality |
| 2s | `./run_ex.sh 3 2s` | Solution | Cross product implementation using dual(a ^ b) |
| 3 | `./run_ex.sh 3 3` | Demo | Reciprocal frame computation and visualization |
| 4 | `./run_ex.sh 3 4` | Demo | Color space conversion using reciprocal frames |

## ex1: Orthonormalization

Demonstrates Gram-Schmidt orthonormalization using GA operations. Drag the left-side vectors to see how the orthonormal frame (right side) updates in real-time.

## ex2: Cross Product

Incomplete exercise to implement the cross product `a x b` using geometric algebra. The cross product equals the dual of the outer product: `dual(a ^ b)`.

## solutions/ex2: Cross Product Solution

Complete implementation showing `crossProduct(a, b) = _vector(dual(a ^ b))`.

## ex3: Reciprocal Frame

Demonstrates reciprocal frame computation using the library's `reciprocalFrame()` function. The reciprocal vectors satisfy the biorthogonality condition: `e_i . e^j = delta_ij`.

## ex4: Color Space Conversion

Applies reciprocal frames to color space conversion. Sample colors from the image to redefine the RGB basis, then watch how the image is remapped using the reciprocal frame.
