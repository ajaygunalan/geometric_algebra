# Chapter 7: Orthogonal Transformations as Versors

## Programming Examples

| # | Command | Type | Description |
|---|---------|------|-------------|
| 1 | `./run_ex.sh 7 1` | Demo | Interactive reflection of vectors in a plane orthogonal to a vector |
| 2 | `./run_ex.sh 7 2` | Demo | Shows that two reflections compose to form a rotation |
| 3 | `./run_ex.sh 7 3` | Demo | Converts rotors to matrices and back, verifies correctness |
| 4 | `./run_ex.sh 7 4` | Exercise | Implement classic quaternion-based rotor/matrix conversion |
| 4s | `./run_ex.sh 7 4s` | Solution | Solution with classic quaternion formulas implemented |
| 5 | `./run_ex.sh 7 5` | Demo | Interactive Julia set fractal using GA vector multiplication |
| 5s | `./run_ex.sh 7 5s` | Solution | Fractal with higher-order polynomial (n=3) iteration |

## ex1: Reflecting in Vectors

Demonstrates reflection of vectors in a plane. A vector x is reflected in the plane orthogonal to vector a using the formula `a * x * inverse(a)` (line reflection). Green input vectors are reflected to produce blue output vectors. The reflection plane is perpendicular to the red vector.

Interactive controls:
- Drag red vector to change reflection plane
- Drag green vectors to change input
- Menu switches between single vector and bivector modes

## ex2: Two Reflections == One Rotation

Shows how composing two reflections produces a rotation. The green input vector is first reflected in one red vector's orthogonal plane, then in the other. The result (blue) is equivalent to a single rotation by twice the angle between the red vectors.

Key insight: The rotor `R = v2 * v1` (product of two unit vectors) represents a rotation. The rotation angle is twice the angle between v1 and v2.

## ex3: Rotor to Matrix Conversion

Non-interactive console program that validates the geometric approach to rotor/matrix conversion:
- `rotorToMatrixGeo()`: Computes matrix by applying rotor to basis vectors
- `matrixToRotorGeo()`: Reconstructs rotor from matrix column vectors

Runs 10 million random rotors through conversion roundtrip, checking for numerical errors.

## ex4: Classic Rotor/Matrix Conversion [EXERCISE]

Implement the classic quaternion-based formulas for rotor/matrix conversion:
- `rotorToMatrixClassic()`: Use quaternion component formulas to build rotation matrix
- `matrixToRotorClassic()`: Extract quaternion from rotation matrix (handle edge cases)

The framework times and compares both classic and geometric approaches, reporting accuracy and performance.

## ex4s: Classic Rotor/Matrix Conversion [SOLUTION]

Complete implementation of classic conversion:
- `rotorToMatrixClassic()`: Uses standard quaternion-to-matrix formula with components qw, qx, qy, qz
- `matrixToRotorClassic()`: Uses numerically stable extraction with case analysis based on diagonal elements

Demonstrates that classic formulas are faster but geometric approach is more intuitive.

## ex5: Fractals

Interactive Julia set fractal renderer using GA. Uses the iteration `x = x * e * x + c` where e is a fixed unit vector (e1). The vector x is initialized from pixel coordinates, and the iteration count or escape magnitude determines pixel intensity.

Interactive controls:
- Left mouse: Pan view
- Middle mouse: Modify constant c
- Right mouse: Zoom
- Keys 1-9: Set iteration count (10-90)

## ex5s: Fractals [SOLUTION]

Extended fractal with higher-order polynomial iterations. Instead of n=2 (`x*e*x`), uses n=3 (`x*e*x*e*x`) or higher. Shows how geometric algebra naturally expresses complex polynomial iteration through repeated geometric products.
