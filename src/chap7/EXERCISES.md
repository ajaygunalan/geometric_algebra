# Chapter 7: Orthogonal Transformations as Versors - Exercises

## Summary Table

| Exercise | Section | Type | Status | Topic |
|----------|---------|------|--------|-------|
| 7.9.1.1 | Drills | Drill | NO_CODE | Compute rotor and apply to basis vector |
| 7.9.1.2 | Drills | Drill | NO_CODE | Exponential rotor on bivector |
| 7.9.1.3 | Drills | Drill | NO_CODE | Rotor composition on bivector |
| 7.9.1.4 | Drills | Drill | NO_CODE | Extract axis and angle from rotor |
| 7.9.1.5 | Drills | Drill | NO_CODE | 4D rotor product on bivector |
| 7.9.1.6 | Drills | Drill | NO_CODE | Blade reflection in plane |
| 7.9.1.7 | Drills | Drill | NO_CODE | Dual plane reflector reflection |
| 7.9.2.1 | Structural | Structural | NO_CODE | Line reflection proof critique |
| 7.9.2.2 | Structural | Structural | NO_CODE | Geometric interpretation of I^2 = -1 |
| 7.9.2.3 | Structural | Structural | NO_CODE | Line reflection as rotation in 3D |
| 7.9.2.4 | Structural | Structural | NO_CODE | Versor preserves contraction |
| 7.9.2.5 | Structural | Structural | NO_CODE | Adjoint of versor product |
| 7.9.2.6 | Structural | Structural | NO_CODE | Reflecting mirrors in mirrors |
| 7.9.2.7 | Structural | Structural | NO_CODE | 2D vs 3D rotation composition |
| 7.9.2.8 | Structural | Structural | NO_CODE | Spherical image of rotation composition |
| 7.9.2.9 | Structural | Structural | NO_CODE | Rotated rotor spherical image |
| 7.9.2.10 | Structural | Structural | NO_CODE | Rotor-quaternion correspondence |
| 7.9.2.11 | Structural | Structural | NO_CODE | Dual blade reflection formulas |
| 7.9.2.12 | Structural | Structural | NO_CODE | Special reflection cases (scalar, pseudoscalar) |
| 7.9.2.13 | Structural | Structural | NO_CODE | Projection onto rotor interpretation |
| 7.9.2.14 | Structural | Structural | NO_CODE | 4D rotation composition and bivector |
| 7.10.1 | Programming | Programming | HAS_CODE: ex1 | Reflecting in vectors |
| 7.10.2 | Programming | Programming | HAS_CODE: ex2 | Two reflections equal one rotation |
| 7.10.3 | Programming | Programming | HAS_CODE: ex3 | Matrix-rotor conversion (geometric) |
| 7.10.4 | Programming | Programming | HAS_CODE: ex4 | Matrix-rotor conversion (efficient) |
| 7.10.5 | Programming | Programming | HAS_CODE: ex5 | Julia fractals |
| 7.10.5a | Programming | Programming | NO_CODE | Julia fractal with variable power p |
| 7.10.5b | Programming | Programming | NO_CODE | n-D Julia fractal |
| 7.10.6 | Programming | Programming | HAS_CODE: ex6 | Rotations in user interface |

---

## 7.9.1 Drills

### 7.9.1.1 Compute Rotor and Apply to e1

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute R_1 = R_{e1^e2, pi/2} and apply to e1.

**Formulas needed:**
- Rotor formula (7.4): R = cos(phi/2) - I*sin(phi/2)
- Rotor application (7.3): X -> R*X*R^(-1)

**Implementation hints:**
- The rotor for rotation in the e1^e2 plane over angle pi/2 has half-angle pi/4
- R_1 = cos(pi/4) - (e1^e2)*sin(pi/4) = (1 - e1^e2)/sqrt(2)
- Apply using sandwiching product: R_1 * e1 * inverse(R_1)
- Expected result: e2

---

### 7.9.1.2 Exponential Rotor on Bivector

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute R_2 = exp(e3^e1 * pi/4) and apply to e2^e4.

**Formulas needed:**
- Exponential form of rotor (7.12): R = exp(-I*phi/2)
- Note: exp(e3^e1 * pi/4) is actually R_{e3^e1, -pi/2}
- Rotor application to blade (7.3): X -> R*X*R^(-1)

**Implementation hints:**
- First compute R_2 = cos(pi/4) + (e3^e1)*sin(pi/4) in explicit form
- Apply to the 2-blade e2^e4
- Since e3^e1 shares no vectors with e2^e4, the rotation acts trivially on components outside the plane

---

### 7.9.1.3 Rotor Composition

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute R_2*R_1 and apply to e1^e2.

**Formulas needed:**
- R_1 from Drill 1, R_2 from Drill 2
- Rotor composition: R_total = R_2 * R_1
- Application formula (7.3)

**Implementation hints:**
- The geometric product of two rotors gives the composed rotor
- Apply the result to e1^e2 using the sandwiching product
- Watch for mixed-grade terms in the product

---

### 7.9.1.4 Extract Axis and Angle

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the axis and angle of R_2*R_1.

**Formulas needed:**
- Rotor structure (7.4): R = cos(phi/2) - I*sin(phi/2)
- Axis-plane duality (7.10): axis e = I * I_3^(-1)
- The scalar part gives cos(phi/2)
- The bivector part gives -I*sin(phi/2)

**Implementation hints:**
- Extract scalar part: c = <R>_0 = cos(phi/2)
- Extract bivector part: B = <R>_2 = -I*sin(phi/2)
- Angle: phi = 2*atan2(|B|, c)
- Plane I = -B/sin(phi/2), axis = dual of I in 3D

---

### 7.9.1.5 4D Rotor Product

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the product of the rotors R_{e14, pi/2} and R_{e23, pi/2} and apply to e12.

**Formulas needed:**
- Shorthand: e_ij means e_i ^ e_j
- Rotor formula (7.4) for each plane
- Rotor composition by geometric product

**Implementation hints:**
- R_{e14, pi/2} = (1 - e1^e4)/sqrt(2)
- R_{e23, pi/2} = (1 - e2^e3)/sqrt(2)
- In 4D, the product may have both scalar and 4-blade parts (see Section 7.4.3)
- Apply to e1^e2 and compute the result

---

### 7.9.1.6 Blade Reflection in Plane

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Reflect (e1 + e2) ^ e3 in the plane e1 ^ e4.

**Formulas needed:**
- Reflection of blade X in subspace A (Section 7.5.1):
  X -> (-1)^(x(a+1)) * A * X * A^(-1)
- Here x = grade(X) = 2, a = grade(A) = 2

**Implementation hints:**
- Sign factor: (-1)^(2*3) = 1
- Compute A * X * A^(-1) where A = e1^e4 and X = (e1+e2)^e3
- The reflection keeps components in A unchanged and inverts rejections

---

### 7.9.1.7 Dual Plane Reflector Reflection

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Reflect the dual plane reflector e1 in the plane e1 ^ e3.

**Formulas needed:**
- Reflection in direct subspace A of dual blade D (Table 7.1):
  Y -> (-1)^((y+1)(a+1)+(n-1)) * A * Y * A^(-1)
- Or use dual subspace formula from Table 7.1

**Implementation hints:**
- e1 is a dual characterization of the hyperplane perpendicular to e1
- A = e1^e3 is the mirror plane
- Apply the correct sign formula based on Table 7.1
- Consider: is the result relative to the original or reflected pseudoscalar?

---

## 7.9.2 Structural Exercises

### 7.9.2.1 Line Reflection Proof Critique

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The generalization of the line reflection from a*x*a^(-1) to a*X*a^(-1) seems straightforward when we remember that a k-blade can be written as the geometric product of k mutually orthogonal vectors: X = x_1*x_2*...*x_k, and then simply compute the outermorphism as (a*x_1*a^(-1))*(a*x_2*a^(-1))*...*(a*x_k*a^(-1)) = a*X*a^(-1). The result is correct but the proof is wrong as it stands. Why?

**Hint:** Can you guarantee the factorization after reflection?

**Implementation hints:**
- Consider: after reflection, are the images a*x_i*a^(-1) still mutually orthogonal?
- The proof assumes the geometric product equals the outer product for the reflected vectors
- This is only true if they remain orthogonal after reflection
- Think about what conditions guarantee orthogonality preservation

---

### 7.9.2.2 Geometric Interpretation of I^2 = -1

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
We have seen that for a Euclidean unit 2-blade, I^2 = -1. Interpret this geometrically in terms of versors.

**Formulas needed:**
- Versor product for even versors (7.19): X -> V*X*V^(-1)
- A 2-blade can be used as a versor

**Implementation hints:**
- A unit 2-blade I represents a rotation plane
- As a versor, I performs a 180-degree rotation (rotor angle pi)
- I^2 as a versor would be a 360-degree rotation
- But I^2 = -1 represents the "sense" information (Section 7.2.3)
- Relate to the plate trick and 4pi periodicity

---

### 7.9.2.3 Line Reflection as Rotation in 3D

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that a line reflection in 3-D can be performed as a rotation. Which rotation? Give the axis and angle. Verify that this reflection can be applied to any blade.

**Formulas needed:**
- Line reflection: x -> a*x*a^(-1)
- Determinant of line reflection: (-1)^(n+1) (Section 7.1)
- In 3D: det = (-1)^4 = +1, so it's a rotation

**Implementation hints:**
- Line reflection in a is equivalent to rotation by pi about the a-axis
- The axis is the line direction a
- The angle is pi (180 degrees)
- Verify by computing det(V) using (7.18) formula
- Apply to vectors, bivectors, and trivectors to verify

---

### 7.9.2.4 Versor Preserves Contraction

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Show that the fact that the geometric product transforms naturally under application of a versor, together with linearity, implies that the contraction is preserved.

**Hint:** An intermediate step uses linearity to show that the outer product is preserved.

**Formulas needed:**
- Versor preserves geometric product: V[AB] = V[A]*V[B]
- Outer product as antisymmetric part: A^B = (1/2)(AB - BA) for vectors
- Contraction as grade selection of geometric product

**Implementation hints:**
- Step 1: Use V[AB] = V[A]V[B] and linearity
- Step 2: Show V[A^B] = V[A]^V[B] using the antisymmetric definition
- Step 3: Use grade preservation to show contraction is preserved
- The key is that grade selection commutes with versor application

---

### 7.9.2.5 Adjoint of Versor Product

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Show from the definition of the adjoint (in Section 4.3.2) that the adjoint of a transformation that can be written as a versor product with a versor V is a versor product with the versor ~V^(-1). Relate this to the orthogonality of a versor-based transformation.

**Formulas needed:**
- Adjoint definition: <L[A], B> = <A, L*[B]>
- Versor product: V[X] = (+/-)V*X*V^(-1)
- For orthogonal transformations: L* = L^(-1)

**Implementation hints:**
- Compute the scalar product <V[A], B> using the versor formula
- Manipulate to find the form <A, ?[B]>
- The adjoint versor should be ~V^(-1)
- For unit versors, ~V = V^(-1), so adjoint = inverse, confirming orthogonality

---

### 7.9.2.6 Reflecting Mirrors in Mirrors

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
We can reflect mirrors into mirrors to compute the effective mirror of a total reflection. Why can you ignore all signs in that computation and therefore universally use M_2*M_1*M_2 for the reflection of mirror 1 in mirror 2 regardless of whether they have been represented directly or dually?

**Formulas needed:**
- Reflection formulas from Table 7.1
- Sandwiching product for transformations as objects (Section 7.5.3)

**Implementation hints:**
- When reflecting an operator (not an object), we use V*R*~V
- The signs from Table 7.1 only affect the reflected object, not the operator
- A mirror M used as reflector of another mirror M' produces M*M'*M^(-1)
- The sign factors cancel because M appears twice (once normal, once inverted)
- The formula works regardless of direct/dual representation

---

### 7.9.2.7 2D vs 3D Rotation Composition

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Match the computation of the composition of 2-D rotations in Section 7.3.1 to that of the 3-D rotations in Section 7.3.3, both algebraically and in the geometric visualization.

**Formulas needed:**
- 2D composition (7.3.1): R_{I,phi2}*R_{I,phi1} = R_{I,phi1+phi2}
- 3D composition (7.9): involves scalar products and cross terms

**Implementation hints:**
- In 2D, the rotation planes are identical (I_1 = I_2 = I)
- Therefore cos(angle between planes) = 1, sin = 0
- The perpendicular plane term I_perp vanishes
- The 3D formula (7.9) reduces to the 2D result when I_1 = I_2
- Geometrically: 2D rotations are arcs on a single great circle

---

### 7.9.2.8 Spherical Image of Rotation Composition

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
To study the spherical image of rotation composition, take a rotation in the e1*e3 plane over pi/2, followed by a rotation in the e3*e2 plane over pi/2. As rotors, these are (1 - e1*e3)/sqrt(2) and (1 - e3*e2)/sqrt(2). Draw two great circles, with poses corresponding to the rotation planes e1*e3 and e3*e2. On these great circles, the rotations over pi/2 are represented as oriented arcs of length pi/4 (the corresponding rotor angle). These arcs are freely movable along their great circles. To compose the rotations, make them meet so that you can perform R_1 and then R_2. This is a depiction as in Figure 7.6. The arc completing the spherical triangle is in a skew plane with a length that looks like it might be pi/3. Do an actual computation to confirm this value for the rotor angle and a plane of (-e3*e2 - e1*e3 + e2*e1)/sqrt(3). The resulting rotation is over -2*pi/3 in this plane. Rewrite this using (7.10), and show that the rotation axis is (-e1 - e2 + e3).

**Formulas needed:**
- Rotor composition: R_2 * R_1
- Rotor structure (7.4): R = cos(phi/2) - I*sin(phi/2)
- Axis-plane duality (7.10)
- Spherical triangle geometry (Figure 7.6)

**Implementation hints:**
- Compute R_2*R_1 = (1 - e3*e2)/sqrt(2) * (1 - e1*e3)/sqrt(2)
- Expand and collect scalar and bivector parts
- Verify scalar part = cos(pi/3) = 1/2 (so rotation angle is 2*pi/3)
- Verify bivector part gives the stated plane
- Use duality to find axis from rotation plane

---

### 7.9.2.9 Rotated Rotor Spherical Image

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Draw the rotated rotor R_2*R_1*~R_2 as an arc in the spherical image.

**Hint:** What would you expect it to be based on its geometric meaning?
**Warning:** It is not simply the R_1 arc rotated over the R_2-arc!

**Formulas needed:**
- Transformations as objects (Section 7.5.3): R'_1 = R_2*R_1*~R_2
- Rotor rotation: rotates the plane of R_1 by R_2

**Implementation hints:**
- R_2*R_1*~R_2 rotates the rotation plane of R_1
- The rotation angle remains the same (pi/2)
- The new plane is R_2*(e1^e3)*~R_2
- On the sphere: same arc length, but on a different great circle
- The great circle itself is rotated by the R_2 transformation

---

### 7.9.2.10 Rotor-Quaternion Correspondence

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Establish the precise correspondence between the quantities in the rotor composition (7.9) and the quaternion product of (7.11).

**Warning:** This is a painful exercise in keeping things straight, and not very rewarding.

**Formulas needed:**
- Rotor composition (7.9): involves c'_1, c'_2, s'_1, s'_2, I_1, I_2, c_perp, s_perp, I_perp
- Quaternion product (7.11): q_0*p_0 - q.p + (p_0*q + q_0*p + q x p)
- Quaternion-rotor correspondence (7.10): q_0 + q <-> q_0 - q*I_3

**Implementation hints:**
- Map quaternion scalar/vector parts to rotor scalar/bivector parts
- Use: vector q corresponds to bivector -q*I_3
- The cross product q x p corresponds to the grade-2 part of the bivector product
- Track all sign conventions carefully
- Verify the structural similarity between (7.9) and (7.11)

---

### 7.9.2.11 Dual Blade Reflection Formulas

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Derive the formulas for the reflection of a dual blade Y = X* from the formulas for reflection of a directly represented blade X. Derive the last column of Table 7.1 from the column before. Make sure you take the dual of both input and output relative to the same unreflected pseudoscalar I_n.

**Formulas needed:**
- Table 7.1 reflection formulas
- Duality: Y = X*I_n^(-1), so X = Y*I_n
- Reflection of pseudoscalar: how does I_n transform?

**Implementation hints:**
- Start with reflection formula for direct X: (-1)^(x(a+1))*A*X*A^(-1)
- Substitute X = Y*I_n
- Compute how I_n transforms under reflection
- Extract Y from the result
- Ensure input Y and output are dual with respect to the SAME I_n

---

### 7.9.2.12 Special Reflection Cases

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
A special case of reflection is when A is the scalar 1. Derive the algebraic outcome and interpret geometrically. Another special case is A = I_n; compute that and interpret. Why is the latter outcome not the dual of the former?

**Formulas needed:**
- Reflection formula: X -> (-1)^(x(a+1))*A*X*A^(-1)
- For A = 1: a = 0
- For A = I_n: a = n

**Implementation hints:**
- Case A = 1: reflection formula gives (-1)^(x*1)*1*X*1 = (-1)^x * X
  - This is the grade involution!
- Case A = I_n: (-1)^(x(n+1))*I_n*X*I_n^(-1)
  - Compute using I_n*X = (-1)^(x(n-x))*X*I_n
- Why not dual? Scalar and pseudoscalar have different grades (0 vs n)
  - Their reflection behaviors differ fundamentally

---

### 7.9.2.13 Projection onto Rotor

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
You can project onto a rotor and get a geometrically meaningful result. Give the geometric interpretation of the projection P_R[x] = (x _| R)*R^(-1). Think "chord." For rotors, it matters whether you put the inverse on the first or the last factor: what is (x _| R^(-1))*R?

**Formulas needed:**
- Contraction of vector with rotor: x _| R
- Rotor structure: R = cos(phi/2) - I*sin(phi/2)
- Projection formula: (X _| A)*A^(-1)

**Implementation hints:**
- For R = cos(phi/2) - I*sin(phi/2), compute x _| R
- The result is related to the chord from x to its rotated image
- Geometric interpretation: projects x onto the "rotation chord"
- Compare (x _| R)*R^(-1) vs (x _| R^(-1))*R
- The order matters because R and R^(-1) have different bivector signs

---

### 7.9.2.14 4D Rotation and Bivector Exponent

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In R^{4,0} with the usual basis, perform a rotation in the e1^e2 plane followed by a rotation in the e3^e4 plane. Compute the rotor of the composition, and show that this is the exponent of a bivector, not of a 2-blade.

**Hint:** See structural exercise 5 of Chapter 2.

Note also that the rotor is not of the simple form "scalar plus 2-blade" of Section 7.4 (or even "scalar plus bivector").

**Formulas needed:**
- Rotor for each plane: R_{e12,phi1} and R_{e34,phi2}
- Rotor composition: R_total = R_2 * R_1
- Bivector exponential (7.16): commuting 2-blades can be added in exponent

**Implementation hints:**
- e1^e2 and e3^e4 commute (share no vectors)
- The rotors therefore commute: R_2*R_1 = R_1*R_2
- The composition has form: (c_1 - I_1*s_1)(c_2 - I_2*s_2)
- Expand: c_1*c_2 - c_1*I_2*s_2 - I_1*s_1*c_2 + I_1*I_2*s_1*s_2
- The last term is a 4-blade! Not just scalar + bivector
- But it IS exp(B) where B = log(R_1) + log(R_2) is a bivector (not 2-blade)

---

## 7.10 Programming Examples and Exercises

### 7.10.1 Reflecting in Vectors

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
Implement the line reflection equation and allow interactive manipulation of both the reflector vector and the vector/bivector to be reflected.

**Code location:** `chap7/ex1/`

**Formulas needed:**
- Line reflection (7.1): X -> a*X*a^(-1)

**Implementation hints:**
```cpp
e3ga::vector reflectVector(const e3ga::vector &a,
                           const e3ga::vector &x) {
    return _vector(a*x*inverse(a));
}
```
- Program allows manipulation of `a` (red) and `x` (green)
- Popup menu switches to bivector reflection mode

---

### 7.10.2 Two Reflections Equal One Rotation

**Type:** Programming
**Status:** HAS_CODE: ex2

**Problem:**
Display an interactive version of Figure 7.2. Show that successively reflecting a vector in two different vectors produces a rotation.

**Code location:** `chap7/ex2/`

**Formulas needed:**
- Double reflection: x -> b*(a*x*a^(-1))*b^(-1) = (b/a)*x*(b/a)^(-1)
- Rotation angle is twice the angle between reflection vectors

**Implementation hints:**
```cpp
g_reflectedVector = reflectVector(g_reflectionVector1, g_inputVector);
g_rotatedVector = reflectVector(g_reflectionVector2, g_reflectedVector);
```

---

### 7.10.3 Matrix-Rotor Conversion 1 (Geometric)

**Type:** Programming
**Status:** HAS_CODE: ex3

**Problem:**
Implement conversion between rotors and rotation matrices using geometric intuition.

**Code location:** `chap7/ex3/`

**Formulas needed:**
- Rotor to matrix: columns are images of basis vectors under R*e_i*~R
- Matrix to rotor: use rotorFromVectorToVector() (7.23)

**Implementation hints:**
- Rotor to Matrix:
```cpp
void rotorToMatrix(const rotor &R, float M[9]) {
    rotor Ri = _rotor(inverse(R));
    e3ga::vector image[3] = {
        _vector(R * e1 * Ri),
        _vector(R * e2 * Ri),
        _vector(R * e3 * Ri)
    };
    // copy to matrix columns
}
```
- Matrix to Rotor (stable version handles near-180-degree cases)

---

### 7.10.4 Matrix-Rotor Conversion 2 (Efficient)

**Type:** Programming
**Status:** HAS_CODE: ex4

**Problem:**
Implement more efficient rotor-matrix conversion using symbolic expansion.

**Code location:** `chap7/ex4/`

**Formulas needed:**
- Rotor: R = w + x*e23 + y*e31 + z*e12, with w^2 + x^2 + y^2 + z^2 = 1
- Matrix formula (from symbolic computation of R*e_i*~R):
```
[[R]] = | 1-2y^2-2z^2   2xy+2wz      2xz-2wy   |
        | 2xy-2wz       1-2x^2-2z^2  2yz+2wx   |
        | 2xz+2wy       2yz-2wx      1-2x^2-2y^2|
```

**Implementation hints:**
- This is the same as quaternion-to-matrix conversion
- Initialize rotor from quaternion coordinates:
```cpp
rotor R(rotor_scalar_e1e2_e2e3_e3e1, w, -z, -x, -y);
```
- The efficient version is ~4x faster than geometric version

---

### 7.10.5 Julia Fractals

**Type:** Programming
**Status:** HAS_CODE: ex5

**Problem:**
Compute Julia fractals using geometric algebra instead of complex numbers.

**Code location:** `chap7/ex5/`

**Formulas needed:**
- Complex iteration: X_{k+1} = X_k^p + C
- Vector equivalent for p=2: x_{k+1} = x*e*x + c
- Complex number as ratio: X = x/e where e is unit vector in "real" direction

**Implementation hints:**
```cpp
for (int i = 0; i < maxIter; i++) {
    x = _vector(x * e * x + c);  // p = 2
    if (_Float(norm_e2(x)) > 1e4f) break;
}
```
- The geometric product x*e*x reflects e in x and scales by ||x||^2

---

### 7.10.5a Julia Fractal with Variable Power

**Type:** Programming
**Status:** NO_CODE: implement yourself

**Problem:**
Experiment with changing the power p in the fractal algorithm. You first need to derive the corresponding vector update equation!

**Formulas needed:**
- General iteration: X_{k+1} = X_k^p + C
- For complex X = x/e, need: X^p = (x/e)^p = x*e*x*e*...*x (p factors of x, p-1 factors of e)

**Implementation hints:**
- For p=3: x_{k+1} = x*e*x*e*x + c
- For p=4: x_{k+1} = x*e*x*e*x*e*x + c
- General pattern: alternate x and e, starting and ending with x
- Experiment with different values of p to see fractal changes

---

### 7.10.5b n-D Julia Fractal

**Type:** Programming
**Status:** NO_CODE: implement yourself

**Problem:**
If you are feeling adventurous, try implementing the n-D version.

**Formulas needed:**
- Same iteration: x_{k+1} = x*e*x + c
- Now x, e, c are vectors in R^n

**Implementation hints:**
- The algorithm is dimension-independent!
- For 3D: take x in R^3 with e = e1 as reference direction
- Visualize as isosurfaces or volume rendering
- Result is "quaternionic fractals" without using quaternions
- See Figure 7.13 for example 3D fractal output

---

### 7.10.6 Rotations in User Interface

**Type:** Programming
**Status:** HAS_CODE: ex6

**Problem:**
Implement scene rotation using mouse motion and rotors.

**Code location:** Extra example in various chapter codes

**Formulas needed:**
- Exponential rotor: R = exp(-I*phi/2)
- Rotation plane from mouse motion: motion ^ mousePos or motion ^ e3

**Implementation hints:**
```cpp
void MouseMotion(int x, int y) {
    e3ga::vector motion = _vector(mousePos - g_prevMousePos);
    if (g_rotateModelOutOfPlane)
        g_modelRotor = _rotor(exp(0.005f * (motion ^ e3)) * g_modelRotor);
    else
        g_modelRotor = _rotor(exp(0.00001f * (motion ^ mousePos)) * g_modelRotor);
}
```
- In-plane rotation: plane from motion and mousePos
- Out-of-plane rotation: plane from motion and e3 (screen normal)

---

## Key Formulas Reference

### Reflection Formulas
- Line reflection of vector: x -> a*x*a^(-1)
- Hyperplane reflection of vector: x -> -a*x*a^(-1) (a is normal)
- Reflection of blade X in subspace A: X -> (-1)^(x(a+1))*A*X*A^(-1)
- Reflection of X in dual subspace D: X -> (-1)^(xd)*D*X*D^(-1)

### Rotor Formulas
- Rotor from angle and plane: R = cos(phi/2) - I*sin(phi/2)
- Exponential form: R = exp(-I*phi/2)
- Rotor application: X -> R*X*~R
- Rotor composition: R_total = R_2 * R_1

### Versor Formulas
- Versor product on blade: X -> (-1)^(xv)*V*X*V^(-1)
- Even versors: X -> V*X*V^(-1)
- Odd versors: X -> V*^X*V^(-1) (with grade involution)
- Versors preserve: geometric product, outer product, contractions

### Useful Identities
- Rotor normalization: R*~R = 1
- Rotor inverse: R^(-1) = ~R (for unit rotor)
- 2D rotation simplification: R*x*~R = x*exp(I*phi) (if x in I-plane)
- Transformation of exponential: V[exp(B)] = exp(V[B])
