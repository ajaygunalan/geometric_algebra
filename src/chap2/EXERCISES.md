# Chapter 2: Spanning Oriented Subspaces - Exercises

## Summary Table

| Section | Exercise | Type | Status | Description |
|---------|----------|------|--------|-------------|
| 2.12.1 | Drill 1 | Drill | NO_CODE: implement yourself | Compute outer products in 3-space |
| 2.12.1 | Drill 2 | Drill | NO_CODE: implement yourself | Determine if vectors lie in a plane |
| 2.12.1 | Drill 3 | Drill | NO_CODE: implement yourself | Compute parallelogram area |
| 2.12.1 | Drill 4 | Drill | NO_CODE: implement yourself | Line intersection using 2-blades |
| 2.12.1 | Drill 5 | Drill | NO_CODE: implement yourself | Grade-based outer product computation |
| 2.12.2 | Structural 1 | Structural | NO_CODE: implement yourself | Outer product in Euclidean metric space |
| 2.12.2 | Structural 2 | Structural | NO_CODE: implement yourself | Reconcile metric and coordinate formulas |
| 2.12.2 | Structural 3 | Structural | NO_CODE: implement yourself | Anticommutative algebra properties |
| 2.12.2 | Structural 4 | Structural | NO_CODE: implement yourself | Solve 3-D linear decomposition |
| 2.12.2 | Structural 5 | Structural | NO_CODE: implement yourself | Prove 2-vector is not a 2-blade |
| 2.12.2 | Structural 6 | Structural | NO_CODE: implement yourself | Show 2-vector contains no vectors |
| 2.12.2 | Structural 7 | Structural | NO_CODE: implement yourself | General blade characterization |
| 2.12.2 | Structural 8 | Structural | NO_CODE: implement yourself | Clifford conjugate properties |
| 2.12.2 | Structural 9 | Structural | NO_CODE: implement yourself | Prove blade antisymmetry formula |
| 2.13.1 | Programming 1 | Programming | HAS_CODE: ex1 | Drawing bivectors |
| 2.13.2 | Programming 2 | Programming | HAS_CODE: ex2 | Hidden surface removal |
| 2.13.3 | Programming 3 | Programming | HAS_CODE: ex3 | Singularities in vector fields |
| 2.3 | Calculation | Calculation | NO_CODE: implement yourself | Expand outer product onto basis |
| 2.4.2 | Calculation | Calculation | NO_CODE: implement yourself | Trivector expansion to determinant |
| 2.7.1 | Calculation | Calculation | NO_CODE: implement yourself | Solve linear equations with outer product |
| 2.7.2 | Calculation | Calculation | NO_CODE: implement yourself | Intersecting planar lines |

---

## 2.12.1 Drills

### 2.12.1.1 Drill 1: Compute Outer Products

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the outer products of the following 3-space expressions, giving the results relative to the basis {1, e1, e2, e3, e1^e2, e2^e3, e3^e1, e1^e2^e3}. Show your work.

(a) (e1 + e2) ^ (e1 + e3)
(b) (e1 + e2 + e3) ^ (2*e1)
(c) (e1 - e2) ^ (e1 - e3)
(d) (e1 + e2) ^ (0.5*e1 + 2*e2 + 3*e3)
(e) (e1 ^ e2) ^ (e1 + e3)
(f) (e1 + e2) ^ (e1^e2 + e2^e3)

**Formulas needed:**
- Antisymmetry: a ^ b = -b ^ a (Eq. 2.3 properties)
- Distributivity: a ^ (b + c) = (a ^ b) + (a ^ c)
- Scaling: a ^ (beta * b) = beta * (a ^ b)
- e_i ^ e_i = 0 for any basis vector

**Implementation hints:**
- Use distributivity to expand products
- Apply antisymmetry to simplify: e_i ^ e_i = 0, e_j ^ e_i = -e_i ^ e_j
- Express results as linear combinations of basis elements
- In GA Sandbox, use `e3ga` model with `e1`, `e2`, `e3` and outer product `^`

---

### 2.12.1.2 Drill 2: Plane Containment Test

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Given the 2-blade B = e1 ^ (e2 - e3) that represents a plane, determine if each of the following vectors lies in that plane. Show your work.

(a) e1
(b) e1 + e2
(c) e1 + e2 + e3
(d) 2*e1 - e2 + e3

**Formulas needed:**
- Vector x in plane of B <=> x ^ B = 0 (Section 2.8.1)
- Associativity: (a ^ b) ^ c = a ^ (b ^ c)

**Implementation hints:**
- Compute x ^ B for each vector x
- If result is zero (the zero trivector), the vector is in the plane
- If result is non-zero, the vector is not in the plane
- The plane spanned by e1 and (e2 - e3) contains vectors of form alpha*e1 + beta*(e2 - e3)

---

### 2.12.1.3 Drill 3: Parallelogram Area

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
What is the area of the parallelogram spanned by the vectors a = e1 + 2*e2 and b = -e1 - e2 (relative to the area of e1 ^ e2)?

**Formulas needed:**
- a ^ b = (a1*b2 - a2*b1) * (e1 ^ e2) (Eq. 2.2)
- Area measure is the coefficient of e1 ^ e2

**Implementation hints:**
- Expand (e1 + 2*e2) ^ (-e1 - e2) using distributivity
- Simplify using e1^e1 = 0, e2^e2 = 0, e2^e1 = -e1^e2
- The coefficient gives the signed area ratio
- Absolute value gives unsigned area

---

### 2.12.1.4 Drill 4: Line Intersection

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the intersection of the nonhomogeneous line L with position vector e1 and direction vector e2, and the line M with position vector e2 and direction vector (e1 + e2), using 2-blades. Does the basis {e1, e2} have to be orthonormal?

**Formulas needed:**
- Line intersection formula (Eq. 2.7):
  x = [(q ^ v) / (u ^ v)] * u + [(p ^ u) / (v ^ u)] * v
- Where L has position p, direction u; M has position q, direction v

**Implementation hints:**
- p = e1, u = e2 (line L)
- q = e2, v = e1 + e2 (line M)
- Compute p ^ u = e1 ^ e2
- Compute q ^ v = e2 ^ (e1 + e2) = e2 ^ e1 = -e1 ^ e2
- Compute u ^ v = e2 ^ (e1 + e2) = e2 ^ e1 = -e1 ^ e2
- The basis does NOT need to be orthonormal - outer product is nonmetric!

---

### 2.12.1.5 Drill 5: Grade-Based Computation

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute (2 + 3*e3) ^ (e1 + e2^e3) using the grade-based defining equations of Section 2.9.4.

**Formulas needed:**
- Outer product with scalars: alpha ^ x = x ^ alpha = alpha*x (Eq. 2.5)
- Grade operator: <A>_k selects grade-k part
- A ^ B = sum over grades (Eq. 2.10)

**Implementation hints:**
- Decompose: (2 + 3*e3) has grade-0 part = 2, grade-1 part = 3*e3
- Decompose: (e1 + e2^e3) has grade-1 part = e1, grade-2 part = e2^e3
- Compute each grade combination:
  - 2 ^ e1 = 2*e1
  - 2 ^ (e2^e3) = 2*(e2^e3)
  - (3*e3) ^ e1 = 3*(e3^e1)
  - (3*e3) ^ (e2^e3) = 0 (contains e3 twice)
- Sum all terms

---

## 2.12.2 Structural Exercises

### 2.12.2.1 Structural Exercise 1: Euclidean Metric Outer Product

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The outer product was defined for a vector space R^n without a metric, but it is of course still defined when we do have a metric space. In R^2 with Euclidean metric, choose an orthonormal basis {e1, e2} in the plane of a and b such that e1 is parallel to a. Write a = alpha*e1 and b = beta*(cos(phi)*e1 + sin(phi)*e2), where phi is the angle from a to b. Evaluate the outer product.

Your result should be:
  a ^ b = alpha * beta * sin(phi) * (e1 ^ e2)  (Eq. 2.14)

What is the geometrical interpretation?

**Formulas needed:**
- Distributivity and antisymmetry of outer product
- e1 ^ e1 = 0, e1 ^ e2 = -(e2 ^ e1)

**Implementation hints:**
- Substitute the parameterized forms of a and b
- Expand: alpha*e1 ^ beta*(cos(phi)*e1 + sin(phi)*e2)
- Use distributivity and simplify
- Geometrical interpretation: The magnitude alpha*beta*sin(phi) is the area of parallelogram
- This is the classic cross-product magnitude formula for 2D!

---

### 2.12.2.2 Structural Exercise 2: Reconcile Formulas

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Reconcile (2.14) (which uses lengths alpha and beta and an angle phi) with (2.2) (which uses coordinates).

**Formulas needed:**
- Eq. 2.14: a ^ b = alpha * beta * sin(phi) * (e1 ^ e2)
- Eq. 2.2: a ^ b = (a1*b2 - a2*b1) * (e1 ^ e2)
- alpha = ||a||, beta = ||b||

**Implementation hints:**
- In orthonormal coordinates: a = (a1, a2), b = (b1, b2)
- alpha = sqrt(a1^2 + a2^2), beta = sqrt(b1^2 + b2^2)
- cos(phi) = (a.b)/(alpha*beta), sin(phi) = ...
- Show that alpha*beta*sin(phi) = a1*b2 - a2*b1
- This is the 2D cross product identity!

---

### 2.12.2.3 Structural Exercise 3: Anticommutative Algebra

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The anticommutative algebra has unusual properties, so you should be careful when computing. For real numbers (x + y)(x - y) = x^2 - y^2, and for the dot product of two vectors (in a metric vector space) this corresponds simply to (x + y).(x - y) = x.x - y.y.

Now for comparison compute (x + y) ^ (x - y) and simplify as far as possible. You should get -2*x^y, which is a rather different result than the other products give!

Verify with a drawing that this algebraic result makes perfect sense geometrically in terms of oriented areas.

**Formulas needed:**
- Distributivity: (a + b) ^ (c + d) = a^c + a^d + b^c + b^d
- Antisymmetry: x ^ y = -y ^ x
- x ^ x = 0

**Implementation hints:**
- Expand: (x + y) ^ (x - y) = x^x - x^y + y^x - y^y
- Simplify: = 0 - x^y + y^x - 0 = -x^y - x^y = -2*(x^y)
- Geometrically: Draw the parallelogram for x+y and x-y (the diagonals of the x,y parallelogram)
- The area is twice the original x^y parallelogram, but with opposite orientation

---

### 2.12.2.4 Structural Exercise 4: 3-D Linear Decomposition

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Solve a 3-D version of the problem in Section 2.7.1:
  x = alpha*a + beta*b + gamma*c

using an appropriate choice of outer products to selectively compute alpha, beta, gamma. What is the geometry of the resulting solution?

**Formulas needed:**
- From Section 2.7.1: Taking outer products eliminates terms
- x ^ b ^ c eliminates beta and gamma terms
- alpha = (x ^ b ^ c) / (a ^ b ^ c)

**Implementation hints:**
- Take x ^ b ^ c: only the alpha*a term survives (since b^b = c^c = 0)
  x ^ b ^ c = alpha * (a ^ b ^ c)
- Therefore: alpha = (x ^ b ^ c) / (a ^ b ^ c)
- Similarly: beta = (x ^ c ^ a) / (b ^ c ^ a) = (x ^ c ^ a) / (a ^ b ^ c)
- And: gamma = (x ^ a ^ b) / (c ^ a ^ b) = (x ^ a ^ b) / (a ^ b ^ c)
- Geometry: Each coefficient is a ratio of oriented volumes (3D Cramer's rule!)

---

### 2.12.2.5 Structural Exercise 5: Non-Blade 2-Vector

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Consider R^4 with basis {e1, e2, e3, e4}. Show that the 2-vector B = e1^e2 + e3^e4 is not a 2-blade (i.e., it cannot be written as the outer product of two vectors).

Hint: Set a ^ b = B, develop a and b onto the basis, expand the outer product onto the bivector basis, and attempt to solve the resulting set of scalar equations.

**Formulas needed:**
- a = a1*e1 + a2*e2 + a3*e3 + a4*e4
- b = b1*e1 + b2*e2 + b3*e3 + b4*e4
- a ^ b expands to 6 basis bivectors in R^4

**Implementation hints:**
- Expand a ^ b = sum of (ai*bj - aj*bi)*(ei^ej) for i < j
- Compare coefficients with B = 1*(e1^e2) + 0*(e1^e3) + 0*(e1^e4) + 0*(e2^e3) + 0*(e2^e4) + 1*(e3^e4)
- You get: a1*b2 - a2*b1 = 1, a3*b4 - a4*b3 = 1, and four zero equations
- The zero equations (e.g., a1*b3 - a3*b1 = 0) over-constrain the system
- Show these equations have no solution (contradiction)

---

### 2.12.2.6 Structural Exercise 6: No Vectors in Non-Blade

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Show that B = e1^e2 + e3^e4 of the previous exercise does not contain any vector other than 0 (see Section 2.8.2 for the definition of contain).

**Formulas needed:**
- Vector x is in blade B <=> x ^ B = 0 (Section 2.8.2)
- x = x1*e1 + x2*e2 + x3*e3 + x4*e4

**Implementation hints:**
- Compute x ^ B = x ^ (e1^e2 + e3^e4)
- = x ^ (e1^e2) + x ^ (e3^e4)
- Expand and collect terms (results in a 3-vector)
- For x ^ B = 0, all coefficients of basis 3-vectors must be zero
- This gives equations like: x3 = 0, x4 = 0, x1 = 0, x2 = 0
- Therefore x = 0 is the only solution

---

### 2.12.2.7 Structural Exercise 7: Blade Characterization

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
(The general case of the previous exercises.) Show that a non-zero A contains precisely k independent vectors if and only if A is of the form A = a1 ^ a2 ^ ... ^ ak (i.e., if and only if A is a k-blade). This shows that among the multivectors, only k-blades represent k-dimensional subspaces.

**Formulas needed:**
- Containment: x in A <=> x ^ A = 0
- k-blade definition: outer product of k independent vectors
- Linear independence tests

**Implementation hints:**
- Forward direction: If A is a k-blade, show it contains exactly k independent vectors
  - The spanning vectors a1,...,ak are in A (since ai ^ A = 0)
  - Any k+1 vectors containing all ai must be dependent
- Reverse direction: If A contains k independent vectors, show A is a k-blade
  - Use the k independent vectors to factor A
- Key insight: k-vectors that aren't k-blades contain fewer than k vectors (like Ex 6)

---

### 2.12.2.8 Structural Exercise 8: Clifford Conjugate

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In some literature on Grassmann algebras, one defines the Clifford conjugate as:
  A_bar = grade_involution(reverse(A))

Is it an involution or an anti-involution? Derive the sign-change for A_bar as an alternative definition of the Clifford conjugate.

**Formulas needed:**
- Reversion: A_tilde = (-1)^(k(k-1)/2) * A_k (Eq. 2.12)
- Grade involution: A_hat = (-1)^k * A_k
- Clifford conjugate: A_bar = grade_involution(reversion(A))

**Implementation hints:**
- Combine the sign changes:
  A_bar = (-1)^k * (-1)^(k(k-1)/2) * A_k
  = (-1)^(k + k(k-1)/2) * A_k
  = (-1)^(k(k+1)/2) * A_k
- Check if (A_bar)_bar = A (involution property)
- Check if (A^B)_bar = ? (anti-involution would give B_bar ^ A_bar)
- The pattern: k=0: +1, k=1: -1, k=2: +1, k=3: +1, k=4: -1, ... (period 4)

---

### 2.12.2.9 Structural Exercise 9: Prove Blade Antisymmetry

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Prove (2.13): A_k ^ B_l = (-1)^(k*l) * B_l ^ A_k

**Formulas needed:**
- Antisymmetry for vectors: a ^ b = -b ^ a
- Associativity of outer product
- A k-blade has k vector factors

**Implementation hints:**
- Write A_k = a1 ^ a2 ^ ... ^ ak and B_l = b1 ^ b2 ^ ... ^ bl
- A_k ^ B_l = a1 ^ ... ^ ak ^ b1 ^ ... ^ bl
- To get B_l ^ A_k, move all b's to the front
- Each bi needs to pass k vectors (the a's) to reach the front
- Each swap introduces a factor of -1
- Total swaps: l vectors, each passing k vectors = k*l swaps
- Result: (-1)^(k*l) factor

---

## 2.13 Programming Examples and Exercises

### 2.13.1 Programming Example 1: Drawing Bivectors

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
Draw a grid of 2-D bivectors. Take two vectors v1 and v2. Vector v1 is fixed to e1, and v2 is rotated 360 degrees in 24 steps of 15 degrees. Render bivectors as either parallelograms or discs.

**Formulas needed:**
- Bivector B = v1 ^ v2
- v2 = cos(a)*e1 + sin(a)*e2 for angle a

**Implementation hints:**
- Located in: `ex1/chap2ex1.cpp`
- Uses e3ga model from GA Sandbox
- Default draw() function renders bivectors as discs
- Custom parallelogram rendering using GL_QUADS
- Vertices: origin -> v1 -> (v1+v2) -> v2

**Code location:** `/home/ajay/geometric_algebra/src/ga_sandbox-1.0.7/chap2/ex1/chap2ex1.cpp`

---

### 2.13.2 Programming Exercise 2: Hidden Surface Removal

**Type:** Programming
**Status:** HAS_CODE: ex2

**Problem:**
In computer graphics, back-facing polygons can be identified by computing the orientation of the projected (2-D) vertices of the polygon. Implement back-face culling using bivectors.

Given a triangle with vertices a, b, c (position vectors), determine if it is front-facing or back-facing by computing the bivector (b-a) ^ (c-a) and checking its sign relative to e1^e2.

**Formulas needed:**
- Oriented area of triangle: (1/2) * (b-a) ^ (c-a)
- Sign of e1^e2 coefficient determines orientation
- Counterclockwise = positive (front-facing)
- Clockwise = negative (back-facing)

**Implementation hints:**
- Located in: `ex2/chap2ex2.cpp`
- For each polygon, get 2D vertices v1, v2, v3
- Compute B = (v2 - v1) ^ (v3 - v1)
- If B.e1e2() < 0, skip rendering (back-facing)
- If B.e1e2() > 0, render polygon (front-facing)

**Code location:** `/home/ajay/geometric_algebra/src/ga_sandbox-1.0.7/chap2/ex2/chap2ex2.cpp`

---

### 2.13.3 Programming Example 3: Singularities in Vector Fields

**Type:** Programming
**Status:** HAS_CODE: ex3

**Problem:**
Use trivectors to locate singularities in a vector field. A singularity occurs where V(p) = 0. Sample the normalized vector field on faces of a cube, triangulate, and sum trivectors to detect if a singularity exists inside.

**Formulas needed:**
- Trivector of triangle: T = (1/6) * v(p1) ^ v(p2) ^ v(p3)
- Normalized vector: v(p) = V(p) / ||V(p)||
- If sum of trivectors ~ volume of unit sphere, singularity exists
- Normalize by 4*pi/3 (sphere volume)

**Implementation hints:**
- Located in: `ex3/` directory (multiple files)
- `main.cpp`: Main program and rendering
- `fields.cpp`: Vector field definitions
- `hpindex.cpp`: Singularity detection algorithm
- `render.cpp`: OpenGL rendering
- Uses trivector sum over triangulated cube faces
- Tests if |T| is between 0.9 and 1.1 for singularity detection

**Code location:** `/home/ajay/geometric_algebra/src/ga_sandbox-1.0.7/chap2/ex3/`

---

## Additional Calculations from Chapter Text

### 2.3 Calculation: Bivector Expansion in 3-D

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Given vectors a and b in R^3 with arbitrary basis {e1, e2, e3}, expand the outer product a ^ b onto the bivector basis.

**Formulas needed:**
- a = a1*e1 + a2*e2 + a3*e3
- b = b1*e1 + b2*e2 + b3*e3
- Eq. 2.3:
  a ^ b = (a1*b2 - a2*b1)*(e1^e2) + (a2*b3 - a3*b2)*(e2^e3) + (a3*b1 - a1*b3)*(e3^e1)

**Implementation hints:**
- Expand using distributivity: 9 terms
- Apply ei^ei = 0 (removes 3 terms)
- Apply antisymmetry to combine: ej^ei = -ei^ej
- Result has 3 basis bivector components
- Coefficients are 2x2 determinants (minors)

---

### 2.4.2 Calculation: Trivector Expansion

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Expand the trivector a ^ b ^ c for vectors in R^3 and show it equals the determinant times the unit pseudoscalar.

**Formulas needed:**
- Eq. 2.4:
  a ^ b ^ c = det([[a b c]]) * (e1 ^ e2 ^ e3)
- det = a1*b2*c3 - a1*b3*c2 + a2*b3*c1 - a2*b1*c3 + a3*b1*c2 - a3*b2*c1

**Implementation hints:**
- First compute a ^ b (as in previous calculation)
- Then compute (a ^ b) ^ c using associativity
- Use distributivity and ei ^ ej ^ ek = 0 if any indices repeat
- The result is a 3x3 determinant times e1^e2^e3

---

### 2.7.1 Calculation: Cramer's Rule via Outer Product

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Solve x = alpha*a + beta*b for alpha and beta using the outer product method (geometric Cramer's rule).

**Formulas needed:**
- Eq. 2.6:
  x = [(x ^ b) / (a ^ b)] * a + [(x ^ a) / (b ^ a)] * b
- alpha = (x ^ b) / (a ^ b)
- beta = (x ^ a) / (b ^ a)

**Implementation hints:**
- Wedge both sides with a: x ^ a = beta * (b ^ a)
- Wedge both sides with b: x ^ b = alpha * (a ^ b)
- Division of bivectors in same plane = ratio of coefficients
- Geometrically: ratio of parallelogram areas

---

### 2.7.2 Calculation: Line-Line Intersection

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Find the intersection of line L (position p, direction u) with line M (position q, direction v) using bivector reshaping.

**Formulas needed:**
- Eq. 2.7:
  x = [(q ^ v) / (u ^ v)] * u + [(p ^ u) / (v ^ u)] * v
- Key insight: x ^ u = p ^ u (reshapeability)
- Key insight: x ^ v = q ^ v (reshapeability)

**Implementation hints:**
- The intersection point x lies on both lines
- x is on L: x = p + lambda*u for some lambda
- x is on M: x = q + mu*v for some mu
- Use x ^ u = p ^ u (since x and p both lie on line with direction u)
- Use x ^ v = q ^ v (since x and q both lie on line with direction v)
- Substitute into decomposition formula

---

## Reference: Key Formulas

### Outer Product Properties
- Antisymmetry: a ^ b = -b ^ a
- Scaling: a ^ (beta*b) = beta*(a ^ b)
- Distributivity: a ^ (b + c) = (a ^ b) + (a ^ c)
- Associativity: (A ^ B) ^ C = A ^ (B ^ C)
- Scalars: alpha ^ a = a ^ alpha = alpha*a

### Grade Properties
- grade(A ^ B) = grade(A) + grade(B)
- A_k ^ B_l = (-1)^(k*l) * B_l ^ A_k

### Containment
- x in blade A <=> x ^ A = 0

### Reversion and Grade Involution
- Reversion: A_tilde = (-1)^(k(k-1)/2) * A_k
- Grade involution: A_hat = (-1)^k * A_k

### Area/Volume Formulas
- Parallelogram area: a ^ b
- Triangle area: (1/2) * a ^ b (for vectors from common vertex)
- Parallelepiped volume: a ^ b ^ c
- Tetrahedron volume: (1/6) * a ^ b ^ c
- Simplex in k-D: (1/k!) * a1 ^ ... ^ ak

---

## Implementation Notes for GA Sandbox

### Models Available
- `e2ga`: 2-D Euclidean (vectors, bivectors)
- `e3ga`: 3-D Euclidean (vectors, bivectors, trivectors)

### Key Types (e3ga)
```cpp
e3ga::vector    // grade 1
e3ga::bivector  // grade 2
e3ga::trivector // grade 3
e3ga::mv        // general multivector
```

### Operators
- `^` : Outer product
- `+`, `-` : Addition, subtraction
- Coordinate access: `.e1()`, `.e2()`, `.e3()`, `.e1e2()`, etc.

### Running Examples
From project root:
```bash
./run_ex.sh 2 1  # Chapter 2, Example 1 (Drawing Bivectors)
./run_ex.sh 2 2  # Chapter 2, Example 2 (Hidden Surface Removal)
./run_ex.sh 2 3  # Chapter 2, Example 3 (Vector Field Singularities)
```
