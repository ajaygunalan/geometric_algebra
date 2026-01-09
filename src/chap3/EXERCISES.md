# Chapter 3: Metric Products of Subspaces - Exercises

## Summary Table

| Exercise ID | Name | Type | Status |
|-------------|------|------|--------|
| 3.10.1.1 | Contraction and Duality Computations | Drill | NO_CODE: implement yourself |
| 3.10.1.2 | Angle Between Subspaces | Drill | NO_CODE: implement yourself |
| 3.10.1.3 | Reciprocal Frame in 2D | Drill | NO_CODE: implement yourself |
| 3.10.2.1 | Implicit Definition of Contraction | Structural | NO_CODE: implement yourself |
| 3.10.2.2 | Degenerate Metric and Null Vectors | Structural | NO_CODE: implement yourself |
| 3.10.2.3 | Right Contraction Dualities | Structural | NO_CODE: implement yourself |
| 3.10.2.4 | Geometric Interpretation of Inner Product | Structural | NO_CODE: implement yourself |
| 3.10.2.5 | Contraction with Scalar Semantics | Structural | NO_CODE: implement yourself |
| 3.10.2.6 | Scalar Contraction Semantics | Structural | NO_CODE: implement yourself |
| 3.10.2.7 | Double Duality in 1D | Structural | NO_CODE: implement yourself |
| 3.10.2.8 | Determinant via Subspace Algebra | Structural | NO_CODE: implement yourself |
| 3.10.2.9 | Rotation in a Plane | Structural | NO_CODE: implement yourself |
| 3.10.2.10 | Volume via Cross Product | Structural | NO_CODE: implement yourself |
| 3.10.2.11 | Bac-Cab Formula | Structural | NO_CODE: implement yourself |
| 3.10.2.12 | Cross Product Inner Product Formula | Structural | NO_CODE: implement yourself |
| 3.10.2.13 | Reciprocal Frame Outer Product Sum | Structural | NO_CODE: implement yourself |
| 3.11.1 | Orthonormalization | Programming | HAS_CODE: ex1 |
| 3.11.2 | Implementing the Cross Product | Programming | HAS_CODE: ex2 |
| 3.11.3 | Reciprocal Frames | Programming | HAS_CODE: ex3 |
| 3.11.4 | Color Space Conversion | Programming | HAS_CODE: ex4 |

---

## 3.10.1 Drills

### 3.10.1.1 Contraction and Duality Computations

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Let **a** = **e**_1 + **e**_2 and **b** = **e**_2 + **e**_3 in a 3-D Euclidean space R^{3,0} with orthonormal basis {**e**_1, **e**_2, **e**_3}. Compute the following expressions, giving the results relative to the basis {1, **e**_1, **e**_2, **e**_3, **e**_1 ^ **e**_2, **e**_2 ^ **e**_3, **e**_3 ^ **e**_1, **e**_1 ^ **e**_2 ^ **e**_3}. Show your work.

- (a) **e**_1 |_ **a**
- (b) **e**_1 |_ (**a** ^ **b**)
- (c) (**a** ^ **b**) |_ **e**_1
- (d) (2**a** + **b**) |_ (**a** + **b**)
- (e) **a** |_ (**e**_1 ^ **e**_2 ^ **e**_3)
- (f) **a***
- (g) (**a** ^ **b**)*
- (h) **a** |_ **b***

**Formulas needed:**
- Contraction definition (3.7)-(3.11)
- Vector contraction on blade (3.16): **x** |_ (**a**_1 ^ ... ^ **a**_k) = sum of (-1)^{i-1} **a**_1 ^ ... ^ (**x** . **a**_i) ^ ... ^ **a**_k
- Bivector contraction (3.17): **x** |_ (**a**_1 ^ **a**_2) = (**x** . **a**_1) **a**_2 - (**x** . **a**_2) **a**_1
- Dualization: A* = A |_ I_n^{-1}

**Implementation hints:**
- For orthonormal basis: **e**_i . **e**_j = delta_ij (Kronecker delta)
- I_3 = **e**_1 ^ **e**_2 ^ **e**_3, I_3^{-1} = -I_3 = **e**_3 ^ **e**_2 ^ **e**_1
- Use distributivity of contraction over addition

---

### 3.10.1.2 Angle Between Subspaces

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the cosine of the angle between the following subspaces given on an orthonormal basis of a Euclidean space:

- (a) **e**_1 and alpha **e**_1
- (b) (**e**_1 + **e**_2) ^ **e**_3 and **e**_1 ^ **e**_3
- (c) (cos(phi) **e**_1 + sin(phi) **e**_2) ^ **e**_3 and **e**_2 ^ **e**_3
- (d) **e**_1 ^ **e**_2 and **e**_3 ^ **e**_4

**Formulas needed:**
- Angle formula (3.5): cos(phi) = (A * ~B) / (||A|| ||B||)
- Squared norm (3.4): ||A||^2 = A * ~A
- Scalar product definition (3.2) using determinant of inner products
- Reversion (2.11)-(2.12): ~(A ^ B) = ~B ^ ~A

**Implementation hints:**
- For 2-blades: ||**a** ^ **b**||^2 = ||**a**||^2 ||**b**||^2 - (**a** . **b**)^2
- Part (d) involves 4-D space - the two 2-blades are disjoint (share no common factor)
- Perpendicular subspaces have cosine = 0

---

### 3.10.1.3 Reciprocal Frame in 2D

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Set up and draw the reciprocal frame for vectors **b**_1 and **b**_2 on an orthogonal basis {**e**_1, **e**_2} represented as **b**_1 = **e**_1 and **b**_2 = **e**_1 + **e**_2. Use the reciprocal frame to compute the coordinates of the vector **x** = 3**e**_1 + **e**_2 on the {**b**_1, **b**_2}-basis.

**Formulas needed:**
- Reciprocal basis vector (3.31): **b**^i = (-1)^{i-1}(**b**_1 ^ ... ^ ~**b**_i ^ ... ^ **b**_n) |_ I_n^{-1}
- Mutual orthonormality (3.32): **b**_i . **b**^j = delta_i^j
- Coefficient extraction: x^i = **x** . **b**^i

**Implementation hints:**
- In 2D: **b**^1 = **b**_2 |_ I_2^{-1}, **b**^2 = -**b**_1 |_ I_2^{-1}
- I_2 = **b**_1 ^ **b**_2 (pseudoscalar of the frame)
- Verify that **b**_1 . **b**^1 = 1, **b**_1 . **b**^2 = 0, etc.
- Draw both frames to visualize the geometric relationship

---

## 3.10.2 Structural Exercises

### 3.10.2.1 Implicit Definition of Contraction

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In 2-D Euclidean space R^{2,0} with orthonormal basis {**e**_1, **e**_2}, let us determine the value of the contraction **e**_1 |_ (**e**_1 ^ **e**_2) by means of its implicit definition (3.6) with A = **e**_1 and B = **e**_1 ^ **e**_2. Let X range over the basis of the blades: {1, **e**_1, **e**_2, **e**_1 ^ **e**_2}. This produces four equations, each of which gives you information on the coefficient of the corresponding basis element in the final result. Show that **e**_1 |_ (**e**_1 ^ **e**_2) = 0(1) + 0(**e**_1) + 1(**e**_2) + 0(**e**_1 ^ **e**_2).

**Formulas needed:**
- Implicit definition (3.6): (X ^ A) * B = X * (A |_ B)
- Scalar product definition (3.2)

**Implementation hints:**
- For each basis element X, compute both sides of (3.6)
- X = 1: (1 ^ **e**_1) * (**e**_1 ^ **e**_2) = 1 * (**e**_1 |_ (**e**_1 ^ **e**_2))
- X = **e**_1: (**e**_1 ^ **e**_1) * (**e**_1 ^ **e**_2) = **e**_1 * (**e**_1 |_ (**e**_1 ^ **e**_2))
- Continue for X = **e**_2 and X = **e**_1 ^ **e**_2
- Solve the system to determine all coefficients

---

### 3.10.2.2 Degenerate Metric and Null Vectors

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
(Continued from previous) Change the metric such that **e**_2 . **e**_2 = 0. This is a nondegenerate metric, of which **e**_2 is a null vector (see Appendix A). Show that you cannot now determine the coefficient of **e**_2 in the value of **e**_1 |_ (**e**_1 ^ **e**_2) through the procedure based on (3.6). Then use the explicit definition of the contraction to show that the contraction is still well defined, and equal to **e**_1 |_ (**e**_1 ^ **e**_2) = **e**_2.

**Formulas needed:**
- Implicit definition (3.6): (X ^ A) * B = X * (A |_ B)
- Explicit contraction rules (3.7)-(3.11)
- Vector contraction on bivector (3.17): **x** |_ (**a** ^ **b**) = (**x** . **a**)**b** - (**x** . **b**)**a**

**Implementation hints:**
- With **e**_2 . **e**_2 = 0, some scalar product equations become degenerate
- The implicit definition fails to uniquely determine the result
- Use explicit definition: **e**_1 |_ (**e**_1 ^ **e**_2) = (**e**_1 . **e**_1)**e**_2 - (**e**_1 . **e**_2)**e**_1

---

### 3.10.2.3 Right Contraction Dualities

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Derive the following dualities for the right contraction, corresponding to (3.20) and (3.21) for the usual (left) contraction:

- C _| (B ^ A) = (C _| B) _| A  (universally valid)  (3.33)
- C _| (B _| A) = (C _| B) ^ A  when A in C         (3.34)

Then give the counterpart of (3.24).

**Formulas needed:**
- Relationship between contractions (3.19): B _| A = ~(~A |_ ~B) = (-1)^{a(b+1)} A |_ B
- Left contraction duality (3.20): (A ^ B) |_ C = A |_ (B |_ C)
- Left contraction duality (3.21): (A |_ B) |_ C = A ^ (B |_ C) when A in C
- Duality relationships (3.24)

**Implementation hints:**
- Use (3.19) to convert right contractions to left contractions
- Apply the known left contraction dualities
- Convert back using (3.19)
- The counterpart of (3.24) involves switching the role of wedge and contraction

---

### 3.10.2.4 Geometric Interpretation of Inner Product

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Verify the geometric interpretation of the usual inner product between vectors, in the light of viewing it as a specific example of the contraction. In agreement with Section 3.3, show that **x** . **a** can be interpreted as an element of the 0-dimensional subspace of **a** perpendicular to the subspace **x**.

**Formulas needed:**
- Vector inner product as contraction (3.9): **a** |_ **b** = **a** . **b**
- Contraction geometric properties from Section 3.3:
  - A |_ B is contained in B
  - A |_ B is perpendicular to A

**Implementation hints:**
- The 0-dimensional subspace of **a** is the origin (a scalar)
- A scalar is "perpendicular" to any vector in the sense that it has no directional component
- The inner product **x** . **a** = ||**x**|| ||**a**|| cos(theta) measures the "amount" of **a** in the direction of **x**
- This "amount" is the projection of **a** onto **x**, measured as a scalar

---

### 3.10.2.5 Contraction with Scalar Semantics

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The equation **x** |_ alpha = 0 (in (3.8)) also has a consistent geometric interpretation in the sense of Section 3.3. Since the scalar alpha denotes the point at the origin, **x** |_ alpha has the following semantics: the subspace of vectors perpendicular to **x**, contained in the 0-blade alpha. Give a plausible correctness argument of this statement.

**Formulas needed:**
- Contraction property (3.8): B |_ alpha = 0 if grade(B) > 0
- Geometric interpretation of contraction (Section 3.3)

**Implementation hints:**
- A scalar (0-blade) represents a 0-dimensional subspace (point at origin)
- No nonzero vector can be "contained" in a 0-dimensional subspace
- The only subspace contained in a point that is perpendicular to any vector is the empty subspace
- The empty subspace is represented by the blade 0

---

### 3.10.2.6 Scalar Contraction Semantics

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Similar to the previous two exercises, verify the geometric semantics of (3.7): alpha |_ B = alpha B.

**Formulas needed:**
- Contraction property (3.7): alpha |_ B = alpha B
- Geometric interpretation of contraction (Section 3.3)

**Implementation hints:**
- A scalar alpha represents a 0-dimensional subspace (point at origin)
- Contracting a 0-dimensional subspace onto B should give a subspace of B perpendicular to the 0-blade
- Since the 0-blade has no direction, all of B is "perpendicular" to it
- The result is B itself, scaled by alpha
- This is consistent with the grade reduction: grade(alpha |_ B) = grade(B) - 0 = grade(B)

---

### 3.10.2.7 Double Duality in 1D

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Duality in 1-D Euclidean space should avoid the extra sign involved in double duality, as specified in (3.24). Show this explicitly, by taking the dual of a vector **a** relative to a suitably chosen unit pseudoscalar for the 1-D space and dualizing again.

**Formulas needed:**
- Dualization: A* = A |_ I_n^{-1}
- Double duality: (A*)* = (-1)^{n(n-1)/2} A
- For n=1: (-1)^{1(0)/2} = (-1)^0 = 1

**Implementation hints:**
- In 1-D: I_1 = **e**_1, I_1^{-1} = **e**_1 / ||**e**_1||^2 = **e**_1
- For a vector **a** = alpha **e**_1:
  - **a*** = **a** |_ I_1^{-1} = alpha (**e**_1 |_ **e**_1) = alpha (**e**_1 . **e**_1) = alpha
  - (**a**)** = alpha |_ I_1^{-1} = alpha **e**_1 = **a**
- Double duality returns the original vector (no sign change)

---

### 3.10.2.8 Determinant via Subspace Algebra

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
We have seen in Section 2.4 how in 3-D space a trivector **a** ^ **b** ^ **c** can be written as:

**a** ^ **b** ^ **c** = det([[**a** **b** **c**]]) **e**_1 ^ **e**_2 ^ **e**_3

with [[**a** **b** **c**]] the 3x3 matrix having the three 3-D vectors **a**, **b**, **c** as columns. Express this determinant fully in terms of our subspace algebra.

**Formulas needed:**
- Trivector as pseudoscalar multiple (Section 2.4)
- Scalar product of n-blades (3.2)
- Squared norm (3.4): ||A||^2 = A * ~A
- Contraction onto pseudoscalar

**Implementation hints:**
- det([[**a** **b** **c**]]) = (**a** ^ **b** ^ **c**) / (**e**_1 ^ **e**_2 ^ **e**_3)
- This can be written as: (**a** ^ **b** ^ **c**) * (~I_3) / ||I_3||^2 = (**a** ^ **b** ^ **c**) |_ I_3^{-1}
- Or equivalently: (**a** ^ **b** ^ **c**) * I_3 (since I_3 * I_3 = 1 for orthonormal basis)
- The determinant is the scalar dual of the trivector

---

### 3.10.2.9 Rotation in a Plane

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In a plane with unit pseudoscalar I_2, we can rotate a vector by a right angle using the fact that contraction **x** |_ I_2 is perpendicular to **x**. Therefore, you can construct an orthogonal basis for the plane from any vector in it. Use this capability to give a coordinate-free specification of a rotation of a vector **x** over phi radians in that plane. Make sure you get the rotation direction correctly related to the plane's orientation. (We will do rotations properly in Chapter 7.)

**Formulas needed:**
- Right angle rotation: **x** |_ I_2 is perpendicular to **x**
- General rotation: **x'** = cos(phi) **x** + sin(phi) **x**_perp
- The perpendicular direction depends on I_2's orientation

**Implementation hints:**
- For counterclockwise rotation (positive I_2 orientation):
  - **x**_perp = -**x** |_ I_2^{-1} = **x** |_ I_2 (since I_2^{-1} = -I_2 in 2D)
- The rotated vector: **x'** = cos(phi) **x** + sin(phi) (**x** |_ I_2)
- Verify: when phi = pi/2, **x'** = **x** |_ I_2 (perpendicular to **x**)
- The sign convention must be consistent with I_2's orientation

---

### 3.10.2.10 Volume via Cross Product

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Using the definition of the cross product (3.28), verify that you can compute the volume spanned by three vectors **a**, **b**, and **c** as **a** . (**b** x **c**). What is the corresponding formula using ^ and |_?

**Formulas needed:**
- Cross product (3.28): **a** x **b** = (**a** ^ **b**) |_ I_3^{-1}
- Vector dot product
- Volume as trivector magnitude

**Implementation hints:**
- **a** . (**b** x **c**) = **a** . ((**b** ^ **c**) |_ I_3^{-1})
- Using duality: this equals (**a** ^ **b** ^ **c**) |_ I_3^{-1} = (**a** ^ **b** ^ **c**)*
- The volume is simply the scalar dual of the trivector **a** ^ **b** ^ **c**
- Or equivalently: (**a** ^ **b** ^ **c**) * I_3^{-1} = det([[**a** **b** **c**]])

---

### 3.10.2.11 Bac-Cab Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Derive the notorious bac-cab formula for the cross product (i.e., **a** x (**b** x **c**) = **b**(**a** . **c**) - **c**(**a** . **b**)), directly from its definition (3.28). What is the corresponding formula using ^ and |_, and what is its geometric interpretation?

**Formulas needed:**
- Cross product (3.28): **a** x **b** = (**a** ^ **b**) |_ I_3^{-1}
- Duality relationships (3.24)
- Contraction properties (3.10), (3.11)
- Vector contraction on bivector (3.17)

**Implementation hints:**
- **a** x (**b** x **c**) = (**a** ^ ((**b** ^ **c**) |_ I_3^{-1})) |_ I_3^{-1}
- Using duality: = (**a** |_ ((**b** ^ **c**) |_ I_3^{-1} |_ I_3))
- Since (**b** ^ **c**) |_ I_3^{-1} |_ I_3 = **b** ^ **c**:
- = **a** |_ (**b** ^ **c**) = (**a** . **b**)**c** - (**a** . **c**)**b**
- Wait, this differs by a sign! Check orientation carefully.
- The GA formula: **a** |_ (**b** ^ **c**) = (**a** . **b**)**c** - (**a** . **c**)**b**
- Geometric interpretation: projection and rejection of **a** relative to the plane **b** ^ **c**

---

### 3.10.2.12 Cross Product Inner Product Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The inner product formula for cross products is (**a** x **b**) . (**c** x **d**) = (**a** . **c**)(**b** . **d**) - (**a** . **d**)(**b** . **c**). Derive it from (3.28). What is the corresponding formula using ^ and |_, and what is its geometric interpretation?

**Formulas needed:**
- Cross product (3.28): **a** x **b** = (**a** ^ **b**) |_ I_3^{-1}
- Scalar product of bivectors (3.2)
- Properties of dualization

**Implementation hints:**
- (**a** x **b**) . (**c** x **d**) = ((**a** ^ **b**) |_ I_3^{-1}) . ((**c** ^ **d**) |_ I_3^{-1})
- Since the dual of a bivector in 3D is a vector, this is a vector inner product
- The GA formula is: (**a** ^ **b**) * (**c** ^ **d**) = det(inner product matrix)
- Scalar product of 2-blades: (**a** ^ **b**) * (**c** ^ **d**) = (**a** . **c**)(**b** . **d**) - (**a** . **d**)(**b** . **c**)
- Geometric interpretation: measures the relative "alignment" of two planes

---

### 3.10.2.13 Reciprocal Frame Outer Product Sum

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In a nonorthonormal basis, the outer product **b**^i ^ **b**_i of a vector and its corresponding reciprocal is not generally zero. However, when summed over all basis vectors, all those 2-blades cancel out:

sum_i **b**^i ^ **b**_i = 0  (3.35)

Show this by expressing **b**^i on the usual basis {**b**_j}, and using a symmetry argument on the resulting double summation.

**Formulas needed:**
- Reciprocal basis expansion: **b**^i = sum_j g^{ij} **b**_j, where g^{ij} is the inverse metric tensor
- Outer product antisymmetry: **a** ^ **b** = -**b** ^ **a**
- Metric tensor symmetry: g^{ij} = g^{ji}

**Implementation hints:**
- Write **b**^i = sum_j g^{ij} **b**_j
- Then **b**^i ^ **b**_i = sum_j g^{ij} **b**_j ^ **b**_i
- Summing over i: sum_i sum_j g^{ij} **b**_j ^ **b**_i
- For each pair (i,j), there's a term g^{ij} **b**_j ^ **b**_i and a term g^{ji} **b**_i ^ **b**_j
- Since g^{ij} = g^{ji} and **b**_j ^ **b**_i = -**b**_i ^ **b**_j, these cancel
- The diagonal terms (i=j) are zero: **b**_i ^ **b**_i = 0

---

## 3.11 Programming Examples and Exercises

### 3.11.1 Orthonormalization

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
Use the contraction product and the outer product to orthonormalize a set of three vectors using the Gram-Schmidt process.

**Formulas needed:**
- Unit vector: unit_e(**v**) = **v** / ||**v**||
- Orthogonalization: The second vector is found by computing the bivector of the first two vectors, then contracting the first vector to get the perpendicular component
- Dualization within planes for subsequent vectors

**Implementation hints:**
- ortho[0] = unit_e(nonOrtho[0])
- ortho[1] = unit_e(ortho[0] << (ortho[0] ^ nonOrtho[1]))
- ortho[2] = unit_e((ortho[1] ^ ortho[0]) << (ortho[0] ^ ortho[1] ^ nonOrtho[2]))
- Note: << is the left contraction operator
- What happens when input vectors become dependent? (The unit_e function will fail)

**Code location:** `ex1/chap3ex1.cpp`

**To run:**
```bash
./run_ex.sh 3 1
```

---

### 3.11.2 Implementing the Cross Product

**Type:** Programming
**Status:** HAS_CODE: ex2

**Problem:**
Fill in the `crossProduct()` function such that it computes the cross product according to the method of Section 3.7. The function `dual()` is available to compute the dual of multivectors. If you need the pseudoscalar, use the constant `I3`, or its inverse, `I3i`.

**Formulas needed:**
- Cross product (3.28): **a** x **b** = (**a** ^ **b**) |_ I_3^{-1}
- Or equivalently: **a** x **b** = dual(**a** ^ **b**)

**Implementation hints:**
- The skeleton function is provided:
```cpp
e3ga::vector crossProduct(const e3ga::vector &a, const e3ga::vector &b) {
    // exercise: compute the cross product, return it:
    return _vector(0);
}
```
- Use: `return _vector(dual(a ^ b));` or `return _vector((a ^ b) << I3i);`
- Verify by dragging input vectors and checking orthogonality

**Code location:** `ex2/chap3ex2.cpp`

**To run:**
```bash
./run_ex.sh 3 2
```

---

### 3.11.3 Reciprocal Frames

**Type:** Programming
**Status:** HAS_CODE: ex3

**Problem:**
Explore the construction of reciprocal frames as explained in Section 3.8. The example program allows you to manipulate three vectors and see the reciprocal frame of these three vectors.

**Formulas needed:**
- Pseudoscalar: I = IF[0] ^ IF[1] ^ ... ^ IF[n-1]
- Reciprocal vector (3.31): RF[i] = (-1)^i (IF[0] ^ ... ^ ~IF[i] ^ ... ^ IF[n-1]) << I^{-1}

**Implementation hints:**
- Uses general multivector class `mv` for flexibility
- Computes pseudoscalar iteratively: `I ^= IF[i]`
- Handles sign: `P = (i & 1) ? -1.0f : 1.0f`
- Observations:
  - Longer vectors have shorter reciprocals
  - Reciprocal of a vector is orthogonal to the other vectors in original frame

**Code location:** `ex3/chap3ex3.cpp`

**To run:**
```bash
./run_ex.sh 3 3
```

---

### 3.11.4 Color Space Conversion

**Type:** Programming
**Status:** HAS_CODE: ex4

**Problem:**
Use the reciprocal frame algorithm for color space conversion. Given RGB values of three LEDs (which may not align with the RGB axes), compute a reciprocal frame to transform colors so the LEDs appear as pure R, G, B.

**Formulas needed:**
- Reciprocal frame computation (Section 3.8)
- Color extraction: color_i = **c** << **RF**[i] (contraction with reciprocal vector)

**Implementation hints:**
- Sample LED colors from the image as "color vectors"
- Compute reciprocal frame of these color vectors
- For each pixel, compute coordinates in the reciprocal frame
- Uses dualization to generate color wheel:
  - Get "white" vector: **white** = unit_e(**e**_1 + **e**_2 + **e**_3)
  - Get orthogonal vectors: factorizeBlade(dual(**white**), O)
  - Generate colors: C = **white** + cos(angle) * O[0] + sin(angle) * O[1]

**Code location:** `ex4/chap3ex4.cpp`

**To run:**
```bash
./run_ex.sh 3 4
```

---

## Additional Calculations from Chapter Text

These are mathematical derivations and computations mentioned throughout the chapter that you may want to implement as coding exercises.

### Calculation: Squared Norm of 2-Blade

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that ||**a**_1 ^ **a**_2||^2 = ||**a**_1||^2 ||**a**_2||^2 sin^2(psi), where psi is the angle between **a**_1 and **a**_2.

**Formulas needed:**
- Squared norm (3.4): ||A||^2 = A * ~A
- Scalar product of 2-blades (3.2)
- cos(psi) = (**a**_1 . **a**_2) / (||**a**_1|| ||**a**_2||)

---

### Calculation: Angle Between 2-Blades in 4D

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
In 4-D space, verify that for 2-blades A = **e**_1 ^ **e**_3 and B = (cos(alpha) **e**_1 - sin(alpha) **e**_2) ^ (cos(beta) **e**_3 - sin(beta) **e**_4):
1. A ^ B = -sin(alpha) sin(beta) **e**_1 ^ **e**_2 ^ **e**_3 ^ **e**_4 (so they are disjoint)
2. Their cosine is A * ~B = cos(alpha) cos(beta)

**Formulas needed:**
- Outer product expansion
- Scalar product of 2-blades (3.2)
- Angle formula (3.5)

---

### Calculation: Contraction Example

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify the detailed computation from Section 3.2.2:
(**e**_1 ^ **e**_2) |_ (**e**_1 ^ **e**_3 ^ **e**_2) = **e**_3

**Formulas needed:**
- Contraction property (3.11): (A ^ B) |_ C = A |_ (B |_ C)
- Contraction property (3.10): **a** |_ (B ^ C) = (**a** |_ B) ^ C + (-1)^{grade(B)} B ^ (**a** |_ C)
- Vector inner product (3.9): **a** |_ **b** = **a** . **b**

---

### Calculation: Projection Verification

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
For a vector **x** and 2-blade B in 3-D, with orthonormal coordinates such that B = ||B|| **e**_1 ^ **e**_2 and **x** = ||**x**|| (cos(phi) **e**_1 + sin(phi) **e**_3), verify that:
**x** |_ B = ||**x**|| ||B|| cos(phi) **e**_2

**Formulas needed:**
- Vector contraction on bivector (3.17)
- Inner product of orthonormal basis vectors

---

### Calculation: Dualization in 3D

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
For a vector **a** = a_1**e**_1 + a_2**e**_2 + a_3**e**_3 in R^{3,0} with I_3 = **e**_1 ^ **e**_2 ^ **e**_3, verify:
**a*** = **a** |_ I_3^{-1} = -a_1 **e**_2 ^ **e**_3 - a_2 **e**_3 ^ **e**_1 - a_3 **e**_1 ^ **e**_2

**Formulas needed:**
- Dualization: A* = A |_ I_n^{-1}
- I_3^{-1} = **e**_3 ^ **e**_2 ^ **e**_1 = -I_3
- Vector contraction on trivector (3.16)

---

## Key Formulas Reference

| Concept | Formula | Equation # |
|---------|---------|-----------|
| Angle (vectors) | cos(phi) = (**a** . **b**) / (||**a**|| ||**b**||) | (3.1) |
| Scalar Product | A * B = det(**a**_i . **b**_j) | (3.2) |
| Reversion Symmetry | B * A = A * B = A * ~B | (3.3) |
| Squared Norm | ||A||^2 = A * ~A | (3.4) |
| Angle (blades) | cos(phi) = (A * ~B) / (||A|| ||B||) | (3.5) |
| Implicit Contraction | (X ^ A) * B = X * (A |_ B) | (3.6) |
| Scalar Contraction | alpha |_ B = alpha B | (3.7) |
| Zero Contraction | B |_ alpha = 0 (grade(B) > 0) | (3.8) |
| Vector Inner | **a** |_ **b** = **a** . **b** | (3.9) |
| Contraction Distribution | **a** |_ (B ^ C) = (**a** |_ B) ^ C + (-1)^{grade(B)} B ^ (**a** |_ C) | (3.10) |
| Contraction Associativity | (A ^ B) |_ C = A |_ (B |_ C) | (3.11) |
| Vector on Blade | **x** |_ (**a**_1 ^ ... ^ **a**_k) = sum_i (-1)^{i-1} ... ^ (**x** . **a**_i) ^ ... | (3.16) |
| Vector on Bivector | **x** |_ (**a** ^ **b**) = (**x** . **a**)**b** - (**x** . **b**)**a** | (3.17) |
| Right Contraction | B _| A = (-1)^{a(b+1)} A |_ B | (3.19) |
| Duality 1 | (A ^ B) |_ C = A |_ (B |_ C) | (3.20) |
| Duality 2 | (A |_ B) |_ C = A ^ (B |_ C), A in C | (3.21) |
| Blade Inverse | A_k^{-1} = ~A_k / ||A_k||^2 | (3.22) |
| Projection | P_B[X] = (X |_ B) |_ B^{-1} | (3.26) |
| Cross Product | **a** x **b** = (**a** ^ **b**) |_ I_3^{-1} | (3.28) |
| Reciprocal Basis | **b**^i = (-1)^{i-1}(**b**_1 ^ ... ^ ~**b**_i ^ ...) |_ I_n^{-1} | (3.31) |

---

## Notes

- All exercises use left contraction `|_` (denoted `<<` in code, `\rfloor` in LaTeX)
- The right contraction `_|` (denoted `\lfloor` in LaTeX) is related by (3.19)
- For orthonormal basis in Euclidean space: **e**_i . **e**_j = delta_ij
- I_n = **e**_1 ^ **e**_2 ^ ... ^ **e**_n is the unit pseudoscalar
- I_n^{-1} = ~I_n for Euclidean space (equals (-1)^{n(n-1)/2} I_n)
