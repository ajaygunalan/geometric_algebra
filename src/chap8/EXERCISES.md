# Chapter 8: Geometric Differentiation - Exercises

## Summary Table

| Exercise | Name | Type | Status | Key Concepts |
|----------|------|------|--------|--------------|
| 8.9.1.1 | Tangent Circle Radius | Drill | NO_CODE | Curvature, exponential rotation |
| 8.9.1.2a | Directional Derivative of x^3 | Drill | NO_CODE | Directional differentiation |
| 8.9.1.2b | Vector Derivative of x^3 | Drill | NO_CODE | Vector differentiation |
| 8.9.1.2c | Directional Derivative of Reflection | Drill | NO_CODE | Reflection, directional derivative |
| 8.9.1.2d | Vector Derivative of Reflection | Drill | NO_CODE | Reflection, vector derivative |
| 8.9.1.2e | Overdot Notation | Drill | NO_CODE | Product rule notation |
| 8.9.1.2f | Overdot Wedge Product | Drill | NO_CODE | Outer product derivative |
| 8.9.1.2g | Overdot Inner Product | Drill | NO_CODE | Inner product derivative |
| 8.9.1.3 | Coordinate Vectors via Differentiation | Drill | NO_CODE | Coordinate basis |
| 8.9.1.4 | Reciprocal Frame as Gradients | Drill | NO_CODE | Reciprocal basis, gradients |
| 8.9.2.1 | Jacobi Identity Proof | Structural | NO_CODE | Commutator product, nonassociativity |
| 8.9.2.2 | Rotor Taylor Expansion | Structural | NO_CODE | Rotor transformation, Taylor series |
| 8.9.2.3 | Baker-Campbell-Hausdorff Formula | Structural | NO_CODE | Exponential product, commutators |
| 8.9.2.4 | Spherical Projection Derivative | Structural | NO_CODE | Projection, directional derivative |
| 8.9.2.5 | Taylor Expansion Formula | Structural | NO_CODE | Taylor series, exponential operator |
| 8.9.2.6 | Variable Bivector Rotor Derivative | Structural | NO_CODE | Time-varying rotation plane |

---

## 8.9.1 Drills

### 8.9.1.1 Tangent Circle Radius

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the radius of the tangent circle for the circular motion $\mathbf{r}(\tau) = \exp(-I\tau)\mathbf{e}_1$ in the plane $I = \mathbf{e}_1 \wedge \mathbf{e}_2$, at the general location $\mathbf{r}(\tau)$.

**Formulas needed:**
- Curvature formula (Section 8.4.1):
  $$\kappa = \frac{(\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}})^*}{\|\dot{\mathbf{r}}\|^3}$$
- Radius: $\rho = 1/\kappa$
- Center of tangent circle:
  $$\mathbf{c} = \mathbf{r} - \frac{\dot{\mathbf{r}}^3}{\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}}}$$

**Implementation hints:**
1. Compute $\dot{\mathbf{r}}(\tau) = \partial_\tau[\exp(-I\tau)\mathbf{e}_1]$ using scalar differentiation
2. Compute $\ddot{\mathbf{r}}(\tau)$ similarly
3. Apply the curvature formula
4. For circular motion, expect radius = 1 (unit circle)

---

### 8.9.1.2a Directional Derivative of x^3

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the directional derivative: $(\mathbf{a} * \partial_\mathbf{x})\mathbf{x}^3$

**Formulas needed:**
- Definition of directional derivative:
  $$(\mathbf{a} * \partial_\mathbf{x}) F(\mathbf{x}) \equiv \lim_{\epsilon \to 0} \frac{F(\mathbf{x} + \epsilon\mathbf{a}) - F(\mathbf{x})}{\epsilon}$$
- Product rule for directional derivative
- From Table 8.1: $(\mathbf{a} * \partial_\mathbf{x})\mathbf{x} = P[\mathbf{a}]$

**Implementation hints:**
- Use the product rule: $\mathbf{x}^3 = \mathbf{x} \cdot \mathbf{x}^2$
- Apply directional derivative to each factor
- Result should involve terms like $\mathbf{a}\mathbf{x}^2 + \mathbf{x}\mathbf{a}\mathbf{x} + \mathbf{x}^2\mathbf{a}$

---

### 8.9.1.2b Vector Derivative of x^3

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the vector derivative: $\partial_\mathbf{x} \mathbf{x}^3$

**Formulas needed:**
- Vector derivative definition (Eq. 8.12):
  $$\partial_\mathbf{x} \equiv \sum_{i=1}^{m} \mathbf{e}^i (\mathbf{e}_i * \partial_\mathbf{x})$$
- From Table 8.1: $\partial_\mathbf{x} \mathbf{x} = m$ (dimension of space)
- From example (8.13): $\partial_\mathbf{x} \mathbf{x}^2 = 2\mathbf{x}$

**Implementation hints:**
- Use product rule: $\partial_\mathbf{x}(\mathbf{x} \cdot \mathbf{x}^2)$
- Be careful with noncommutativity when using accent notation

---

### 8.9.1.2c Directional Derivative of Reflection

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the directional derivative: $(\mathbf{a} * \partial_\mathbf{x})(\mathbf{x}\mathbf{b}/\mathbf{x})$

**Formulas needed:**
- Definition of directional derivative
- From Table 8.1: $(\mathbf{a} * \partial_\mathbf{x})\mathbf{x}^{-1} = -\mathbf{x}^{-1} P[\mathbf{a}] \mathbf{x}^{-1}$
- Reflection formula: $\mathbf{x}\mathbf{b}\mathbf{x}^{-1}$ reflects $\mathbf{b}$ in the hyperplane perpendicular to $\mathbf{x}$

**Implementation hints:**
- Apply product rule to $\mathbf{x} \cdot \mathbf{b} \cdot \mathbf{x}^{-1}$
- Use the inverse derivative result from the table
- Simplify using geometric algebra identities

---

### 8.9.1.2d Vector Derivative of Reflection

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the vector derivative: $\partial_\mathbf{x}(\mathbf{x}\mathbf{b}/\mathbf{x})$

**Formulas needed:**
- Vector derivative definition
- Results from 8.9.1.2c
- Product rule with accent notation

**Implementation hints:**
- Use the result from the directional derivative
- Sum over basis directions
- The reflection $\mathbf{x}\mathbf{b}\mathbf{x}^{-1}$ is grade-preserving

---

### 8.9.1.2e Overdot Notation

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute: $\dot{\mathbf{x}}\dot{\partial}_\mathbf{x}$

**Formulas needed:**
- Product rule notation where overdot indicates which factor is differentiated
- From Section 8.6.2: accent denotes on what factor the scalar differentiation part should act

**Implementation hints:**
- The overdot notation means: apply the scalar part of $\partial_\mathbf{x}$ to $\mathbf{x}$
- This effectively reverses the order compared to $\partial_\mathbf{x} \mathbf{x}$

---

### 8.9.1.2f Overdot Wedge Product

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute: $\dot{\mathbf{x}} \wedge \dot{\partial}_\mathbf{x}$

**Formulas needed:**
- Outer product properties
- From Table 8.1: $\partial_\mathbf{x} \wedge \mathbf{x} = 0$

**Implementation hints:**
- Consider the antisymmetry of the wedge product
- Compare with $\partial_\mathbf{x} \wedge \mathbf{x}$

---

### 8.9.1.2g Overdot Inner Product

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute: $\dot{\mathbf{x}} \cdot \dot{\partial}_\mathbf{x}$

**Formulas needed:**
- Inner product properties
- From Table 8.1: $\partial_\mathbf{x} \cdot \mathbf{x} = m$ (dimension)

**Implementation hints:**
- The inner product is symmetric for vectors
- Compare with $\partial_\mathbf{x} \cdot \mathbf{x}$

---

### 8.9.1.3 Coordinate Vectors via Differentiation

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Show that the coordinate vectors are related to differentiation through:
$$\mathbf{e}_k = \frac{\partial}{\partial x^k}\mathbf{x}$$

**Formulas needed:**
- Coordinate expansion: $\mathbf{x} = \sum_{i=1}^{m} x^i \mathbf{e}_i$
- Partial derivative definition

**Implementation hints:**
- Write out $\mathbf{x}$ in coordinates
- Apply $\frac{\partial}{\partial x^k}$ and use linearity
- Only the $k$-th term survives

---

### 8.9.1.4 Reciprocal Frame as Gradients

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Show that the reciprocal frame vectors are the gradients of coordinate functions:
$$\mathbf{e}^k = \partial_\mathbf{x} x^k$$

**Formulas needed:**
- Vector derivative definition (Eq. 8.12): $\partial_\mathbf{x} = \sum_i \mathbf{e}^i \frac{\partial}{\partial x^i}$
- Coordinate function: $x^k = \mathbf{e}^k \cdot \mathbf{x}$
- Reciprocal frame property: $\mathbf{e}^i \cdot \mathbf{e}_j = \delta^i_j$

**Implementation hints:**
- Apply the vector derivative to $x^k$
- Use $\frac{\partial x^k}{\partial x^i} = \delta^k_i$
- The sum collapses to give $\mathbf{e}^k$

---

## 8.9.2 Structural Exercises

### 8.9.2.1 Jacobi Identity Proof

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Prove the Jacobi identity (8.2) and relate it to nonassociativity of the bivector algebra:
$$(A \times B) \times C + (C \times A) \times B + (B \times C) \times A = 0$$

**Formulas needed:**
- Commutator product definition: $X \times B \equiv \frac{1}{2}(XB - BX)$
- Geometric product associativity

**Implementation hints:**
1. Expand each commutator using the definition
2. The result is: $(A \times B) \times C - A \times (B \times C) = B \times (C \times A)$
3. This shows the commutator algebra is not associative, but satisfies Jacobi identity
4. The Jacobi identity makes the bivector space a Lie algebra under the commutator product

---

### 8.9.2.2 Rotor Taylor Expansion

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Derive the Taylor expansion of a rotor transformation (Eq. 8.3):
$$e^{-B/2} X e^{B/2} = X + X \times B + \frac{1}{2}((X \times B) \times B) + \cdots$$

**Formulas needed:**
- Exponential expansion: $e^{-B/2} \approx 1 - B/2 + B^2/8 - \cdots$
- Commutator product definition
- For small bivectors (Eq. 8.4): $e^{-\delta B/2} X e^{\delta B/2} = X + X \times \delta B + O(\delta^2)$

**Implementation hints:**
1. Start with small bivector approximation: $\exp(-B/2) \approx 1 - B/2$
2. Write versor with finite $B$ as composition of versors with $B/2$, $B/4$, $B/8$, ...
3. Build up the total form through repeated application
4. Each iteration adds another commutator term
5. Verify the pattern matches the Taylor series of the exponential

---

### 8.9.2.3 Baker-Campbell-Hausdorff Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The **Baker-Campbell-Hausdorff formula** writes the product of two exponentials as a third:
$$e^C = e^A e^B$$

with
$$C = A + B + A \times B + \frac{1}{3}(A \times (A \times B) + B \times (B \times A)) + \cdots$$

Show that these first terms of the series are correct.

**Formulas needed:**
- Exponential expansion: $e^A = 1 + A + A^2/2! + A^3/3! + \cdots$
- Commutator product: $A \times B = \frac{1}{2}(AB - BA)$
- Logarithm expansion: $\ln(1 + X) = X - X^2/2 + X^3/3 - \cdots$

**Implementation hints:**
1. Expand $e^A e^B$ to third order in $A$ and $B$
2. Take the logarithm of the result
3. Verify the first few terms match the BCH formula
4. Note: The general terms are more complicated than the pattern suggests
5. This formula quantifies how non-commuting variables differ from commuting ones

---

### 8.9.2.4 Spherical Projection Derivative

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Suppose that we project a vector $\mathbf{x}$ on the unit sphere by the function:
$$\mathbf{x} \mapsto P[\mathbf{x}] = \mathbf{x}/\|\mathbf{x}\|$$

Compute its directional derivative in the $\mathbf{a}$ direction, as a standard differential quotient using Taylor series expansion. Use geometric algebra to write the result compactly, and give its geometric meaning.

**Formulas needed:**
- Directional derivative definition
- From Table 8.1: $(\mathbf{a} * \partial_\mathbf{x})\|\mathbf{x}\|^k = k(P[\mathbf{a}] \cdot \mathbf{x})\|\mathbf{x}\|^{k-2}$
- From Table 8.1: $(\mathbf{a} * \partial_\mathbf{x})\dfrac{\mathbf{x}}{\|\mathbf{x}\|^k} = \dfrac{P[\mathbf{a}] - k(P[\mathbf{a}] \cdot \mathbf{x})/\mathbf{x}}{\|\mathbf{x}\|^k}$

**Implementation hints:**
1. Write $P[\mathbf{x} + \epsilon\mathbf{a}] = (\mathbf{x} + \epsilon\mathbf{a})/\|\mathbf{x} + \epsilon\mathbf{a}\|$
2. Expand $\|\mathbf{x} + \epsilon\mathbf{a}\|$ using Taylor series
3. Compute the limit as $\epsilon \to 0$
4. **Geometric meaning:** The result is the rejection of $\mathbf{a}$ from $\mathbf{x}$, normalized - only the component of $\mathbf{a}$ perpendicular to $\mathbf{x}$ contributes to changing the direction on the sphere

---

### 8.9.2.5 Taylor Expansion Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Justify the following form of Taylor's expansion formula of a function $F$ around the location $\mathbf{x}$:
$$F(\mathbf{x} + \mathbf{a}) = e^{\mathbf{a} * \partial_\mathbf{x}} F(\mathbf{x})$$

where you can interpret the exponent in a natural manner as a symbolic expansion instruction.

**Formulas needed:**
- Exponential expansion: $e^X = 1 + X + X^2/2! + X^3/3! + \cdots$
- Directional derivative: $(\mathbf{a} * \partial_\mathbf{x}) F(\mathbf{x})$
- Standard Taylor series: $F(\mathbf{x} + \mathbf{a}) = F(\mathbf{x}) + (\mathbf{a} \cdot \nabla)F + \frac{1}{2}(\mathbf{a} \cdot \nabla)^2 F + \cdots$

**Implementation hints:**
1. Expand the exponential operator
2. Apply each power of $(\mathbf{a} * \partial_\mathbf{x})$ to $F(\mathbf{x})$
3. Compare with the standard multivariable Taylor series
4. The exponential notation provides a compact representation of all derivative orders

---

### 8.9.2.6 Variable Bivector Rotor Derivative

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
For variable $I(\tau)$, the resulting $\partial_\tau X(\tau)$ of (8.8) can still be written as a commutator $X \times B$ with a bivector $B$. Derive the explicit expression for $B$:
$$B = I\partial_\tau[\phi] + \partial_\tau[I](e^{I\phi} - 1)/I$$

**Formulas needed:**
- Scalar differentiation of rotor (Eq. 8.8): $\partial_\tau X(\tau) = X \times \partial_\tau[I\phi]$ (for constant $I$)
- Rotor: $R = e^{-I\phi/2}$
- Hint from book: $B = -2\partial_\tau[R]\tilde{R}$ (from reference [15])

**Implementation hints:**
1. Start with $R = e^{-I\phi/2}$ where both $I$ and $\phi$ depend on $\tau$
2. Use the product rule: $\partial_\tau[R] = \partial_\tau[e^{-I\phi/2}]$
3. Apply the hint: $B = -2\partial_\tau[R]\tilde{R}$
4. For the case when $I$ varies, the exponential derivative becomes more complex
5. The term $(e^{I\phi} - 1)/I$ handles the non-trivial interaction when the rotation plane changes

---

## Additional Computational Exercises from Chapter Text

These are not in the formal exercises section but are calculation tasks mentioned throughout the chapter that are suitable for implementation:

### 8.A.1 Commutator Grade Preservation

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that $\text{grade}(X \times B) = \text{grade}(X)$ when $\text{grade}(B) = 2$ for various grades of $X$.

**Source:** Section 8.2.1

**Formulas needed:**
- Commutator: $X \times B \equiv \frac{1}{2}(XB - BX)$
- Reversion sign pattern: $+ + - - + + - - \cdots$

**Implementation hints:**
- Test with $X$ of grades 0, 1, 2, 3, 4
- Use a specific bivector $B = \mathbf{e}_1 \wedge \mathbf{e}_2$
- Verify the grade of the result matches the grade of $X$

---

### 8.A.2 Lie Algebra of Rotations in 3D

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that two rotation bivectors can generate the third through their commutator:
- $A = \mathbf{e}_1 \wedge \mathbf{e}_2$
- $B = \mathbf{e}_2 \wedge \mathbf{e}_3$
- Show: $A \times B = -\mathbf{e}_3 \wedge \mathbf{e}_1$

**Source:** Section 8.2.3

**Formulas needed:**
- Commutator product
- Geometric product of basis bivectors

**Implementation hints:**
- This proves directions in 3D are controllable with only two basic rotations
- Contrast with translations which commute ($A \times B = 0$)

---

### 8.A.3 Curvature of Planar Curves

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Implement the curvature formula for planar curves and verify with specific examples:
$$\kappa = \frac{(\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}})^*}{\|\dot{\mathbf{r}}\|^3}$$

**Source:** Section 8.4.1

**Test cases:**
1. Circle: $\mathbf{r}(\tau) = \cos(\tau)\mathbf{e}_1 + \sin(\tau)\mathbf{e}_2$ (expect $\kappa = 1$)
2. Ellipse: $\mathbf{r}(\tau) = a\cos(\tau)\mathbf{e}_1 + b\sin(\tau)\mathbf{e}_2$
3. Parabola: $\mathbf{r}(\tau) = \tau\mathbf{e}_1 + \tau^2\mathbf{e}_2$

---

### 8.A.4 Mirror Tilt Formula

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Implement and verify the tilting mirror result (Eq. 8.11):
$$\beta = 2\phi\sin(\psi)$$

where $\beta$ is the rotation angle of the reflected element, $\phi$ is the rotation angle of the mirror, and $\psi$ is the angle between mirror normal and rotation axis.

**Source:** Section 8.5.2

**Formulas needed:**
- Reflection: $\sigma_\mathbf{n}[X] = \mathbf{n} X \mathbf{n}^{-1}$
- Directional derivative of reflection (Eq. 8.10):
  $$B = 2\phi\,\mathbf{n}^{-1} \wedge (\mathbf{n} \cdot I)$$

**Test cases:**
1. $\psi = 0$ (axis aligned with normal): $\beta = 0$
2. $\psi = \pi/2$ (axis perpendicular to normal): $\beta = 2\phi$

---

### 8.A.5 Optimal Rotor Estimation

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Implement the Procrustes/Wahba problem solution using the condition (Eq. 8.17):
$$\sum_{i=1}^{k} (R_* \mathbf{u}_i \tilde{R}_*) \wedge \mathbf{v}_i = 0$$

**Source:** Section 8.7.2

**Implementation approach:**
1. Given $k$ pairs of vectors $(\mathbf{u}_i, \mathbf{v}_i)$
2. Construct the linear function $f[\mathbf{x}] = \sum_{i=1}^{k} \mathbf{u}_i (\mathbf{v}_i \cdot \mathbf{x})$
3. Compute the SVD of the matrix representation of $f$
4. Extract the rotation matrix as $[[V]][[U]]^T$
5. Convert to rotor form

**Test case:**
- Create random vectors, rotate them by a known rotor, add noise
- Verify the estimated rotor is close to the true rotor

---

## Key Equations Reference

### Commutator Product
$$X \times B \equiv \frac{1}{2}(XB - BX) \tag{Def}$$

### Jacobi Identity
$$(A \times B) \times C + (C \times A) \times B + (B \times C) \times A = 0 \tag{8.2}$$

### Rotor Taylor Expansion
$$e^{-B/2} X e^{B/2} = X + X \times B + \frac{1}{2}(X \times B) \times B + \cdots \tag{8.3}$$

### Small Rotor Perturbation
$$e^{-\delta B/2} X e^{\delta B/2} = X + X \times \delta B + O(\delta^2) \tag{8.4}$$

### Perturbation of Transformation Versor
$$\delta B = -2(V \times \delta A)/V = \delta A - V \delta A / V \tag{8.6}$$

### Product Rule for Scalar Differentiation
$$\frac{d}{d\tau}[F(\tau) G(\tau)] = \frac{d}{d\tau}[F(\tau)] G(\tau) + F(\tau) \frac{d}{d\tau}[G(\tau)] \tag{8.7}$$

### Scalar Differentiation of Rotor Transform
$$\partial_\tau X(\tau) = X \times \partial_\tau[I\phi] \tag{8.8}$$

### Curvature Center
$$\mathbf{c} = \mathbf{r} - \frac{\dot{\mathbf{r}}^3}{\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}}} \tag{8.9}$$

### Mirror Tilt Bivector
$$B = 2\phi\,\mathbf{n}^{-1} \wedge (\mathbf{n} \cdot I) \tag{8.10}$$

### Mirror Tilt Angle (3D)
$$\beta = 2\phi\sin(\psi) \tag{8.11}$$

### Vector Derivative Definition
$$\partial_\mathbf{x} \equiv \sum_{i=1}^{m} \mathbf{e}^i (\mathbf{e}_i * \partial_\mathbf{x}) = \sum_i \mathbf{e}^i \frac{\partial}{\partial x^i} \tag{8.12}$$

### Adjoint via Derivative
$$\bar{f}[\mathbf{x}] \equiv \partial_\mathbf{y}(f[\mathbf{y}] * \mathbf{x}) \tag{8.14}$$

### Chain Rule
$$\partial_\mathbf{x} G(\mathbf{y}(\mathbf{x})) = \bar{\mathbf{y}}[\partial_{\mathbf{y}(\mathbf{x})}] G(\mathbf{y}(\mathbf{x})) \tag{8.15}$$

### Optimal Rotor Condition
$$\sum_{i=1}^{k} (R_* \mathbf{u}_i \tilde{R}_*) \wedge \mathbf{v}_i = 0 \tag{8.17}$$

---

## Notes

1. **No C++ examples exist** in the GA Sandbox for Chapter 8. All exercises require implementation from scratch.

2. **Chapter focus:** This chapter is mathematically oriented, focusing on differentiation techniques in geometric algebra. The exercises emphasize:
   - Commutator algebra and Lie theory connections
   - Directional and vector derivatives
   - Applications to curves, reflections, and optimization

3. **Recommended implementation order:**
   - Start with Drills 8.9.1.3 and 8.9.1.4 (coordinate/reciprocal frame relations)
   - Then Drill 8.9.1.2 series (derivative computations)
   - Then Structural 8.9.2.1 (Jacobi identity) as foundation for other exercises
   - Finally the applications (8.A.3-8.A.5)

4. **Dependencies:** This chapter builds on Chapter 7 (versors and rotors). Review Eq. 7.22 and Section 7.10.4 for rotor-matrix conversion.
