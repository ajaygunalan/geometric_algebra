# Chapter 4: Linear Transformations of Subspaces - Exercises

## Summary Table

| Exercise | Type | Status | Topic |
|----------|------|--------|-------|
| 4.8.1 | Structural | NO_CODE: implement yourself | Point mirroring and orientation |
| 4.8.2 | Structural | NO_CODE: implement yourself | Determinant in 2-D space |
| 4.8.3 | Structural | NO_CODE: implement yourself | Determinant on subspace limitation |
| 4.8.4 | Structural | NO_CODE: implement yourself | Eigenvectors and eigen-2-blade |
| 4.8.5 | Structural | NO_CODE: implement yourself | Design linear map with eigenvector |
| 4.8.6 | Structural | NO_CODE: implement yourself | Scalar product transformation |
| 4.8.7 | Structural | NO_CODE: implement yourself | Metric mapping |
| 4.8.8 | Structural | NO_CODE: implement yourself | Orthogonal transformation metric |
| 4.8.9 | Structural | NO_CODE: implement yourself | Adjoint construction formula |
| 4.8.10 | Structural | NO_CODE: implement yourself | Orthogonal transformation determinant |
| 4.8.11 | Structural | NO_CODE: implement yourself | Right contraction transformation |
| 4.8.12 | Structural | NO_CODE: implement yourself | Cross product transformation example |
| 4.8.13 | Structural | NO_CODE: implement yourself | Shear transformation matrix |
| 4.8.14 | Structural | NO_CODE: implement yourself | Identity matrix verification |
| 4.8.15 | Structural | NO_CODE: implement yourself | Inverse matrix formula |
| 4.8.16 | Structural | NO_CODE: implement yourself | Dual mapping matrix expression |
| 4.8.17 | Structural | NO_CODE: implement yourself | Projection matrix equivalence |
| 4.9.1 | Programming | HAS_CODE: ex1 | Orthogonal projection |
| 4.9.2 | Programming | HAS_CODE: ex2 | Projection with matrix representation |
| 4.9.3 | Programming | HAS_CODE: ex3 | Transforming normal vectors |

---

## Structural Exercises (Section 4.8)

### 4.8.1 Point Mirroring and Orientation

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Point mirroring in 3-D space leads to a change of orientation of the volume 3-blades. We know this spatial inversion better from reflection in a mirror. Show that this has indeed the same effect.

**Hints from book:**
Let the mirror plane be characterized by a 2-blade B, and let **a** be a vector perpendicular to B (for example, **a** = B*). Then define the linear transformation performing the mirror reflection, and apply it to a sensibly chosen 3-blade in this setup. Why does your result generalize to arbitrary 3-blades?

**Formulas needed:**
- Outermorphism: f[A ^ B] = f[A] ^ f[B] (Eq. 4.3)
- Uniform scaling on n-blade: S[A] = alpha^n * A (Eq. 4.4)

**Implementation hints:**
- Define mirror reflection as f[x] = x - 2*(x . a)*a/|a|^2 for vectors perpendicular to plane
- Apply to 3-blade I_3 = a ^ B where B is the 2-blade of the mirror plane
- Show that f[I_3] = -I_3, proving orientation reversal

---

### 4.8.2 Determinant in 2-D Space

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Let us compute the determinant according to (4.7) in a 2-D space and compare it to the classical determinant. Take a basis {**b**_1, **b**_2}, not necessarily orthonormal. Let the linear mapping f be such that f[**b**_1] = **x** and f[**b**_2] = **y**. Develop **x** and **y** onto the basis **x** = x_1 **b**_1 + x_2 **b**_2 and **y** = y_1 **b**_1 + y_2 **b**_2. Use I_2 = **x** ^ **y** and compute the determinant according to (4.7). Now compute the matrix of f on the given basis, and compute its classical determinant. The results should match.

**Formulas needed:**
- Determinant definition: f[I_n] = det(f) * I_n (Eq. 4.7)
- I_2 = **b**_1 ^ **b**_2

**Implementation hints:**
- Compute f[I_2] = f[**b**_1] ^ f[**b**_2] = **x** ^ **y**
- Expand using outer product: **x** ^ **y** = (x_1 y_2 - x_2 y_1) * (**b**_1 ^ **b**_2)
- Compare with classical determinant: det([[f]]) = x_1 y_2 - x_2 y_1

---

### 4.8.3 Determinant on Subspace Limitation

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
You may want to apply a linear mapping f to a k-dimensional subspace. You could then be tempted to use (4.7) with its pseudoscalar I_k substituted for I_n to define what the determinant of f is on this subspace. Why doesn't this work?

**Formulas needed:**
- Determinant definition: f[I_n] = det(f) * I_n (Eq. 4.7)

**Implementation hints:**
- Consider that f may map k-blades outside the original k-dimensional subspace
- The image f[I_k] may not be proportional to I_k itself
- Example: rotation in 3-D applied to a 2-blade not in the rotation plane

---

### 4.8.4 Eigenvectors and Eigen-2-blade Analysis

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Consider the linear transformation of vectors in the **a** ^ **b** plane determined by what happens to the vectors **a** and **b**: f[**a**] = 5**a** - 3**b** and f[**b**] = 3**a** - 5**b**. Use classical linear algebra methods to find eigenvectors and their eigenvalues. Now use our algebra to determine the determinant, and an eigen-2-blade with its corresponding eigenvalue, and then interpret the geometry of the transformation.

**Formulas needed:**
- f[A ^ B] = f[A] ^ f[B] (Eq. 4.3)
- f[I_n] = det(f) * I_n (Eq. 4.7)

**Implementation hints:**
- Classical: Set up matrix [[5, 3], [-3, -5]] and solve characteristic equation
- Eigenvalues: lambda^2 - 16 = 0, so lambda = +/- 4
- GA approach: f[**a** ^ **b**] = (5**a** - 3**b**) ^ (3**a** - 5**b**)
- Expand and simplify to find det(f) = -25 + 9 = -16
- Eigen-2-blade: **a** ^ **b** with eigenvalue -16 (plane is preserved but scaled and flipped)

---

### 4.8.5 Design Linear Map with Eigenvector

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Design a nontrivial linear map f : R^2 -> R^2 that has an eigenvector and an eigen-2-blade, both with eigenvalue 1.

**Formulas needed:**
- f[A ^ B] = f[A] ^ f[B] (Eq. 4.3)
- Eigenvalue condition: f[v] = lambda * v

**Implementation hints:**
- Eigenvalue 1 for eigen-2-blade means det(f) = 1
- One eigenvector with eigenvalue 1 constrains one direction
- Example: shear transformation f[x] = x + (x . e_1) * e_2 preserves e_1 and area

---

### 4.8.6 Scalar Product Transformation Paradox

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
When deriving the linear transformation of the scalar product f[A * B] = A * B in Section 4.3.1, we raised the issue that this appears to mean that every linear transformation leaves the squared norm A * A invariant. Show that this is of course not true.

**Formulas needed:**
- f[A * B] = A * B (Eq. 4.9)
- Scalar product definition from Chapter 3

**Implementation hints:**
- The key insight: f[A * B] = A * B does NOT mean f[A] * f[B] = A * B
- The correct expression for squared norm of transformed blade is f[A] * f[A]
- f[A * A] = A * A because A * A is a scalar, and f preserves scalars
- But |f[A]|^2 = f[A] * f[A] can differ from |A|^2 = A * A

---

### 4.8.7 Metric Mapping

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
To continue with the previous problem after you know about the adjoint in Section 4.3.2, rewrite the correct expression for the squared norm of f[A] in the form A * g[A] and determine g in terms of f. This is the metric mapping corresponding to the transformation f, and it shows that the transformed space can be treated as a space with a new inner product **a** . **b** := **a** * g[**b**].

**Formulas needed:**
- Adjoint definition: f[**a**] * **b** = **a** * f_bar[**b**] (Eq. 4.10)
- f[A] * B = A * f_bar[B] (Eq. 4.11)

**Implementation hints:**
- f[A] * f[A] = A * f_bar[f[A]] (by adjoint property)
- Therefore g = f_bar o f (composition of adjoint with original)
- In matrix terms: [[g]] = [[f]]^T [[f]]
- This is the metric tensor induced by f

---

### 4.8.8 Orthogonal Transformation Preserves Metric

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Continuing from the previous problem, show that the metric mapping corresponding to an orthogonal transformation is the identity. Therefore, orthogonal transformations preserve norms (and cosines of angles).

**Formulas needed:**
- Orthogonal: f[**a**] . f[**b**] = **a** . **b** (Definition in 4.3.4)
- For orthogonal: f_bar = f^{-1}

**Implementation hints:**
- From 4.8.7: g = f_bar o f
- For orthogonal f: g = f^{-1} o f = identity
- Therefore f[A] * f[A] = A * A (norms preserved)
- Angles preserved because cos(theta) = (A * B) / (|A| |B|)

---

### 4.8.9 Adjoint Construction Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Show that in a non-degenerate metric space R^n with arbitrary basis {**b**_i}_{i=1}^n, the adjoint of a linear transformation f can be constructed as:

f_bar[**x**] = sum_{i=1}^n (**x** * f[**b**_i]) **b**^i (Eq. 4.19)

**Formulas needed:**
- Adjoint definition: f[**a**] * **b** = **a** * f_bar[**b**] (Eq. 4.10)
- Reciprocal frame: **b**_i * **b**^j = delta_i^j (Eq. 3.32)

**Implementation hints:**
- Start with adjoint definition
- Expand **x** on reciprocal basis: **x** = sum_i (**x** * **b**^i) **b**_i
- Apply f_bar and use definition to verify formula
- Key: f_bar[**b**_j] * **b**^i = **b**_j * f[**b**^i]

---

### 4.8.10 Orthogonal Transformation Determinant

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Show that an orthogonal transformation has a determinant of +/- 1.

**Formulas needed:**
- det(g o f) = det(g) * det(f) (Eq. 4.8)
- For orthogonal: f_bar = f^{-1}
- det(f^{-1}) = 1/det(f)

**Implementation hints:**
- For orthogonal f: f_bar = f^{-1}
- Compose: det(f_bar o f) = det(identity) = 1
- But det(f_bar o f) = det(f_bar) * det(f) = det(f)^2
- Therefore det(f)^2 = 1, so det(f) = +/- 1

---

### 4.8.11 Right Contraction Transformation

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Give an expression for f[A _| B] (right contraction).

**Hint from book:** Consider the symmetry of (4.10).

**Formulas needed:**
- Left contraction transformation: f[A |_ B] = f_bar^{-1}[A] |_ f[B] (Eq. 4.13)
- Symmetry: A |_ B = (B~ _| A~)~ (from Chapter 3)

**Implementation hints:**
- Use the relationship between left and right contraction
- By symmetry with (4.13): f[A _| B] = f[A] _| f_bar^{-1}[B]
- Or derive from f[**a**] * **b** = **a** * f_bar[**b**] and extend

---

### 4.8.12 Cross Product Transformation Example

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Give an example of a linear transformation for which the transformed cross product f[**a** x **b**] is not parallel to the cross product of the transforms f[**a**] x f[**b**]. That of course implies it is not perpendicular to f[**a**] and f[**b**], so it has ceased to be a normal vector.

**Formulas needed:**
- Cross product transformation: **a** x **b** -> det(f) * f_bar^{-1}[**a** x **b**] (Eq. 4.15)
- f[**a**] x f[**b**] is NOT equal to f[**a** x **b**] for non-orthogonal f

**Implementation hints:**
- Use non-uniform scaling: f[x] = (s_1 x_1, s_2 x_2, s_3 x_3) with s_1 != s_2 != s_3
- Take **a** = e_1, **b** = e_2
- **a** x **b** = e_3
- f[e_3] = s_3 e_3 (bad: just scaled)
- f[**a**] x f[**b**] = (s_1 e_1) x (s_2 e_2) = s_1 s_2 e_3 (different scaling!)
- The programming example ex3 explores this visually

---

### 4.8.13 Shear Transformation Matrix

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
For the shear **x** -> f_s[**x**] := **x** + s * (**x** . **e**_1) * **e**_2 (on the standard orthonormal basis of R^{n,0}), compute the transformation matrix [[f_s]] (to act on vectors). Also compute the matrix [[f*_s]]. Verify the results in a picture of the shear of a planar line and its normal vector.

**Formulas needed:**
- Matrix element: [[f]]^j_i = f[**b**_i] . **b**^j (Eq. 4.17)
- Dual transformation: f* = det(f) * f_bar^{-1} (Eq. 4.14)

**Implementation hints:**
- f_s[e_1] = e_1 + s * e_2
- f_s[e_2] = e_2
- f_s[e_3] = e_3
- Matrix [[f_s]] = [[1, 0, 0], [s, 1, 0], [0, 0, 1]]
- For dual: f_bar_s^{-1}[x] requires computing adjoint first
- det(f_s) = 1 (shear preserves volume)
- [[f*_s]] = [[1, -s, 0], [0, 1, 0], [0, 0, 1]] (inverse transpose)

---

### 4.8.14 Identity Matrix Verification

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that (4.18) indeed gives the identity matrix for the identity mapping.

**Formulas needed:**
- [[f]]^j_i = (**b**_1 ^ ... ^ **b**_{j-1} ^ f[**b**_i] ^ **b**_{j+1} ^ ... ^ **b**_n) * I_n^{-1} (Eq. 4.18)

**Implementation hints:**
- For identity: f[**b**_i] = **b**_i
- When i = j: **b**_1 ^ ... ^ **b**_i ^ ... ^ **b**_n = I_n, so [[f]]^i_i = I_n * I_n^{-1} = 1
- When i != j: **b**_i appears twice in the outer product, giving 0
- Therefore [[f]] = identity matrix

---

### 4.8.15 Classical Inverse Matrix Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The classical closed-form formula for the inverse of a matrix [[A]] is:

[[A]]^{-1} = adj([[A]]) / det([[A]]) (Eq. 4.20)

where adj([[A]]) is the classical adjoint matrix, of which the (i,j)th element equals (-1)^{i+j} * det([[A_{ji}]]), with [[A_{ji}]] a minor matrix obtained from [[A]] by omitting the jth row and the ith column. Show that this terrific coordinate-based construction is identical to the coordinate-free formula (4.16).

**Formulas needed:**
- f^{-1}[A] = (f_bar[A |_ I_n^{-1}] |_ I_n) / det(f) (Eq. 4.16)

**Implementation hints:**
- Express (4.16) in coordinates using basis {**b**_i}
- The contraction A |_ I_n^{-1} produces an (n-1)-blade
- This corresponds to the "complementary" rows in the minor
- The adjoint f_bar produces the transpose
- Division by det(f) matches the classical formula

---

### 4.8.16 Dual Mapping Matrix Expression

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Continuing the previous exercise, give an expression in matrix form of the dual mapping f* = det(f) * f_bar^{-1}. This should endow the involved algebraic concept of a matrix of minors with a clear geometrical meaning.

**Formulas needed:**
- f* = det(f) * f_bar^{-1} (Eq. 4.14)
- f_bar = transpose in Euclidean basis

**Implementation hints:**
- [[f*]] = det([[f]]) * [[f]]^{-T}
- Using (4.20): [[f]]^{-T} = adj([[f]])^T / det([[f]])
- Therefore [[f*]] = adj([[f]])^T
- The matrix of cofactors (signed minors) has geometrical meaning as transformation of duals

---

### 4.8.17 Projection Matrix Equivalence

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In standard linear algebra, one way to encode a subspace is as the image of a matrix. The subspace spanned by the basis {**b**_1, ..., **b**_k} is then the image of the matrix [[B]] = [[**b**_1 ... **b**_k]]. The orthogonal projection of a vector **x** onto this subspace in [[B]] is computed using the projection matrix as the vector:

[[B]] * ([[B]]^T [[B]])^{-1} * [[B]]^T * [[**x**]]

Show that this is, in fact, the same mapping as our (**x** |_ B) * B^{-1} of (3.25). How would you describe the extension to an outermorphism in standard linear algebra?

**Formulas needed:**
- Orthogonal projection: P_B[**x**] = (**x** |_ B) * B^{-1} (Eq. 3.25)
- Matrix inverse formula (4.16)

**Implementation hints:**
- B = **b**_1 ^ ... ^ **b**_k represents the subspace
- [[B]]^T [[B]] is the Gram matrix of the basis
- Show equivalence by expanding (**x** |_ B) * B^{-1} in coordinates
- For outermorphism extension: would need to define projection on each grade separately using higher-order Gram matrices

---

## Programming Examples (Section 4.9)

### 4.9.1 Orthogonal Projection

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
This example lets you manipulate three vectors. One of the vectors gets projected onto the 2-blade spanned by the other two.

**Code location:** `ex1/chap4ex1.cpp`

**Key code:**
```cpp
// compute bivector (*4 to make it a bit larger):
bivector B = _bivector(4.0f * g_vectors[0] ^ g_vectors[1]);

// project g_vectors[2] onto the bivector
// The symbol '<<' is the left contraction
e3ga::vector P = _vector((g_vectors[2] << inverse(B)) << B);
```

**Formulas needed:**
- Orthogonal projection: P_B[**x**] = ((**x** |_ B) * B^{-1}) (Eq. 3.25)
- Left contraction '<<' is |_

**How to run:**
```bash
./run_ex.sh 4 1
```

---

### 4.9.2 Orthogonal Projection with Matrix Representation

**Type:** Programming
**Status:** HAS_CODE: ex2

**Problem:**
Outermorphisms are great because they can be summarized into their respective matrix representation, one matrix for each grade of blades. These outermorphism matrices can then be applied to any blade instead of the original outermorphism defined explicitly in terms of subspace products. That matrix approach is usually faster.

In this example, we redo the previous example, this time using the outermorphism matrices to apply the transformation. The example includes a benchmark comparing matrix vs. regular GA performance.

**Code location:** `ex2/chap4ex2.cpp`

**Key code:**
```cpp
// we need the images of the 3 basis vectors under the projection:
e3ga::vector imageOfE1 = _vector((e1 << inverse(B)) << B);
e3ga::vector imageOfE2 = _vector((e2 << inverse(B)) << B);
e3ga::vector imageOfE3 = _vector((e3 << inverse(B)) << B);

// initialize the matrix representation
om M(imageOfE1, imageOfE2, imageOfE3);

// apply the matrix to the vector:
e3ga::vector P = _vector(apply_om(M, g_vectors[2]));
```

**Formulas needed:**
- Outermorphism matrix: [[f]]^J_I = f[**b**_I] * **b**^J (Section 4.5.2)
- Matrix element: [[f]]^j_i = f[**b**_i] . **b**^j (Eq. 4.17)

**Benchmark results from book:**
```
10000000 projections using matrix representation: 0.128367 secs
10000000 projections using regular GA: 0.255311 secs
```

**How to run:**
```bash
./run_ex.sh 4 2
```

---

### 4.9.3 Transforming Normal Vectors

**Type:** Programming
**Status:** HAS_CODE: ex3

**Problem:**
As explained in Section 4.3.6, normal vectors transform differently from regular vectors under a linear transformation. We use non-uniform scaling as an example. The dramatically different results are illustrated.

The code shows a squashed dodecahedron. The correct normals (computed with 2-blades) are shown in green, the bad normals in red. The red normals are clearly not orthogonal to the surface.

**Code location:** `ex3/chap4ex3.cpp`

**Key code:**
```cpp
// initialize the outermorphism
// g_scale is a global array of floats
om M(
    _vector(g_scale[0] * e1),
    _vector(g_scale[1] * e2),
    _vector(g_scale[2] * e3));

// compute the normals
e3ga::vector badNormal, goodNormal;

badNormal = unit_e(apply_om(M, g_normals3D[i]));
goodNormal = unit_e(dual(apply_om(M, g_attitude3D[i])));
```

**Formulas needed:**
- Cross product transformation: **a** x **b** -> det(f) * f_bar^{-1}[**a** x **b**] (Eq. 4.15)
- Dual transformation: f*[X*] = (f[X])* (Section 4.3.5)
- Normal vector: n = (a ^ b)* in 3D

**Key insight:**
- BAD: Transforming normal vector directly as f[n]
- GOOD: Transform the 2-blade attitude, then dualize: dual(f[a ^ b])

**How to run:**
```bash
./run_ex.sh 4 3
```

---

## Additional Calculations in Chapter (Worth Implementing)

### 4.C.1 Uniform Scaling Outermorphism

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that uniform scaling S[**x**] = alpha * **x** on an n-blade A gives S[A] = alpha^n * A.

**Formulas needed:**
- Eq. 4.4: S[A] = alpha^n * A for n-blade A

**Implementation:**
```cpp
// For 2-blade in 3D
bivector B = e1 ^ e2;
float alpha = 2.0f;
// Apply scaling to each vector
bivector S_B = (alpha * e1) ^ (alpha * e2);  // = alpha^2 * B
// Verify: S_B == 4.0 * B
```

---

### 4.C.2 Determinant of Rotation

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that a 2-D rotation has determinant 1 by computing R[I_2] using the outermorphism property.

**Reference:** Section 4.2.3, "Determinant of a Rotation"

**Implementation hints:**
- Let R rotate **u** to **v** and **v** to **w**
- Then R[**u** ^ **v**] = **v** ^ **w** = **u** ^ **v** (from Figure 4.3)
- Therefore det(R) = 1

---

### 4.C.3 Projection Derivation Verification

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify the derivation in Section 4.2.2 Example 5 that P_B[**x**] ^ P_B[**y**] = P_B[**x** ^ **y**].

**Reference:** The long derivation showing orthogonal projection extends as outermorphism

**Implementation:**
```cpp
// Define projection onto bivector B
// Compute P_B[x] and P_B[y] separately
// Verify P_B[x] ^ P_B[y] == ((x^y) << B) << inverse(B)
```

---

### 4.C.4 Contraction Transformation Verification

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify numerically that f[A |_ B] = f_bar^{-1}[A] |_ f[B] for a specific non-orthogonal transformation.

**Formulas needed:**
- Eq. 4.13: f[A |_ B] = f_bar^{-1}[A] |_ f[B]

**Implementation hints:**
- Choose a simple non-orthogonal f (e.g., non-uniform scaling)
- Compute both sides for specific A, B
- Verify equality

---

### 4.C.5 Inverse Formula Verification

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify the inverse formula (4.16) for specific transformations: pseudoscalar, scalar, and vectors.

**Formulas needed:**
- f^{-1}[A] = (f_bar[A |_ I_n^{-1}] |_ I_n) / det(f) (Eq. 4.16)

**Reference:** Section 4.4 examples 1, 2, 3

**Implementation:**
```cpp
// Example for pseudoscalar:
// f^{-1}[I_n] = (f_bar[1] |_ I_n) / det(f) = I_n / det(f)
// Verify det(f^{-1}) = 1/det(f)
```

---

## Key Equations Summary

| Equation | Description |
|----------|-------------|
| 4.1 | Linear transformation definition: f[alpha*x + beta*y] = alpha*f[x] + beta*f[y] |
| 4.3 | Outermorphism rules: f[alpha]=alpha, f[A^B]=f[A]^f[B], f[A+B]=f[A]+f[B] |
| 4.4 | Uniform scaling on n-blade: S[A] = alpha^n * A |
| 4.7 | Determinant: f[I_n] = det(f) * I_n |
| 4.8 | Composition rule: det(g o f) = det(g) * det(f) |
| 4.9 | Scalar product: f[A * B] = A * B |
| 4.10 | Adjoint (vectors): f[a] * b = a * f_bar[b] |
| 4.11 | Adjoint (blades): f[A] * B = A * f_bar[B] |
| 4.13 | Contraction: f[A |_ B] = f_bar^{-1}[A] |_ f[B] |
| 4.14 | Dual transformation: f* = det(f) * f_bar^{-1} |
| 4.15 | Cross product: a x b -> det(f) * f_bar^{-1}[a x b] |
| 4.16 | Inverse: f^{-1}[A] = (f_bar[A |_ I_n^{-1}] |_ I_n) / det(f) |
| 4.17 | Matrix element: [[f]]^j_i = f[b_i] . b^j |
| 4.18 | Matrix element (GA form): explicit outer product formula |
| 4.19 | Adjoint construction: f_bar[x] = sum_i (x * f[b_i]) * b^i |
