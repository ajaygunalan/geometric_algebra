# Chapter 5: Intersection and Union of Subspaces - Exercises

## Summary Table

| ID | Name | Type | Status | Description |
|----|------|------|--------|-------------|
| 5.10.1.1 | Drill: e1 and e2 | Drill | NO_CODE: implement yourself | Compute join and meet of e1 and e2 |
| 5.10.1.2 | Drill: e2 and e1 | Drill | NO_CODE: implement yourself | Compute join and meet of e2 and e1 (order swap) |
| 5.10.1.3 | Drill: e1 and 2e1 | Drill | NO_CODE: implement yourself | Compute join and meet of e1 and 2e1 (parallel) |
| 5.10.1.4 | Drill: e1 and (e1+e2)/sqrt(2) | Drill | NO_CODE: implement yourself | Compute join and meet of 45-degree vectors |
| 5.10.1.5 | Drill: e1 and cos(phi)e1+sin(phi)e2 | Drill | NO_CODE: implement yourself | Compute join and meet for general angle phi |
| 5.10.1.6 | Drill: Bivector and vector | Drill | NO_CODE: implement yourself | Compute join and meet of e1^e2 and rotated vector |
| 5.10.1.7 | Drill: e1^e2 and e2 | Drill | NO_CODE: implement yourself | Compute join and meet when vector lies in plane |
| 5.10.1.8 | Drill: Near-parallel perturbation | Drill | NO_CODE: implement yourself | Compute join and meet for e1^e2 and e2+0.00001e3 |
| 5.10.2.1 | Reciprocal relationship proof | Structural | NO_CODE: implement yourself | Verify and prove reciprocal relationships |
| 5.10.2.2 | Find the error | Structural | NO_CODE: implement yourself | Find error in meet transformation proof |
| 5.10.2.3 | Two vectors meet and join | Structural | NO_CODE: implement yourself | Show meet magnitude equals sine of angle |
| 5.10.2.4 | Parallel vectors meet and join | Structural | NO_CODE: implement yourself | Compute meet/join of parallel vectors |
| 5.10.2.5 | Common factor meet | Structural | NO_CODE: implement yourself | Find meet proportionality factor for (a^B) cap (a^C) |
| 5.10.2.6 | Verify factorization derivation | Structural | NO_CODE: implement yourself | Verify the ingenious factorization derivation steps |
| 5.10.2.7 | General factorization formula | Structural | NO_CODE: implement yourself | Derive (A^B) cap (A^C) = A(A^B^C)* |
| 5.11.1 | Interactive Meet and Join | Programming | HAS_CODE: ex1 | Interactive visualization of meet and join |
| 5.11.2 | Efficiency Benchmark | Programming | HAS_CODE: ex2 | Benchmark meet/join vs outer product |
| 5.11.3 | Floating Point Issues | Programming | HAS_CODE: ex3 | Explore grade flip-flop near degeneracy |
| 5.4-CALC | Two planes intersection example | Calculation | NO_CODE: implement yourself | Compute meet of two specific 2-blades |

---

## 5.10.1 Drills

### 5.10.1.1 Drill: e1 and e2

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 and B = e2

**Formulas needed:**
- Join formula (5.5): J = A ^ (M^{-1} |_ B) = (A _| M^{-1}) ^ B
- Meet formula (5.6): M = A cap B = (B _| J^{-1}) |_ A
- Dual meet (5.8): (A cap B)* = B* ^ A* (dualization relative to J)

**Implementation hints:**
- These are two perpendicular vectors in general position
- Join should be the plane e1^e2
- Meet should be a scalar (the origin point)
- The magnitude of meet relates to the sine of the angle between them

---

### 5.10.1.2 Drill: e2 and e1 (Order Swap)

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e2 and B = e1

**Formulas needed:**
- Join formula (5.5)
- Meet formula (5.6)
- Order sensitivity formula: B cap A = (-1)^{(j-a)(j-b)} A cap B

**Implementation hints:**
- Compare with 5.10.1.1 to verify order sensitivity
- For two lines in a plane (a=b=1, j=2): meet is antisymmetric
- See Table 5.1 for sign reference

---

### 5.10.1.3 Drill: e1 and 2e1 (Parallel/Coincident)

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 and B = 2e1

**Formulas needed:**
- Degenerate case handling
- Join becomes one of the blades when they coincide
- Grade relationships (5.4): j = a + b - m

**Implementation hints:**
- This is a degenerate case where the blades coincide
- Join should be proportional to e1 (a 1-blade, not a 2-blade)
- Meet should also be proportional to e1
- The meet formula with J=I_3 will return zero, signaling degeneracy

---

### 5.10.1.4 Drill: e1 and (e1+e2)/sqrt(2)

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 and B = (e1 + e2)/sqrt(2)

**Formulas needed:**
- Meet formula (5.6): M = (B _| J^{-1}) |_ A
- Meet magnitude interpretation: sine of angle from A to B

**Implementation hints:**
- These are vectors at 45 degrees
- Use J = e1^e2 as the join
- Meet magnitude should relate to sin(45 deg) = 1/sqrt(2)
- Check both magnitude and sign of result

---

### 5.10.1.5 Drill: General Angle phi

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 and B = cos(phi) e1 + sin(phi) e2

**Formulas needed:**
- Meet formula (5.6): M = (B _| J^{-1}) |_ A
- Meet magnitude = sin(phi) for normalized blades with normalized join

**Implementation hints:**
- This generalizes the previous drill to arbitrary angle phi
- Join is e1^e2 for general position (when sin(phi) != 0)
- Meet should be a scalar proportional to sin(phi)
- The sign indicates the direction of approach
- Test edge cases: phi=0 (parallel), phi=pi/2 (perpendicular)

---

### 5.10.1.6 Drill: Bivector and Rotated Vector

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 ^ e2 and B = cos(phi) e1 + sin(phi) e2

**Formulas needed:**
- Meet formula (5.6): M = (B _| J^{-1}) |_ A
- Grade analysis: A is grade-2, B is grade-1

**Implementation hints:**
- The vector B lies in the plane A
- Join should be proportional to e1^e2 (the plane itself)
- Meet should be proportional to B (the common subspace)
- This is a degenerate case where join equals one argument

---

### 5.10.1.7 Drill: e1^e2 and e2

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 ^ e2 and B = e2

**Formulas needed:**
- Meet formula (5.6)
- Containment check: B is contained in A

**Implementation hints:**
- Vector e2 lies within the plane e1^e2
- Join should be the plane e1^e2
- Meet should be the vector e2 (weighted)
- This verifies the containment case

---

### 5.10.1.8 Drill: Near-Parallel Perturbation

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Compute join A union B and meet A cap B for the following blades:
- A = e1 ^ e2 and B = e2 + 0.00001 e3

**Formulas needed:**
- Meet formula (5.6)
- Floating-point sensitivity analysis

**Implementation hints:**
- The tiny e3 component moves B out of the plane A
- With exact arithmetic: join is I_3, meet is a scalar
- With floating point: may show grade instability near epsilon ~ 10^{-7}
- Compare behavior with the previous drill (5.10.1.7)
- See Section 5.11.3 for related floating-point discussion

---

## 5.10.2 Structural Exercises

### 5.10.2.1 Reciprocal Relationship Proof

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
There is an interesting reciprocal relationship between A, B, J, and M:

    (B _| J^{-1}) * (A _| M^{-1}) = 1

Verify the steps in the following proof:
    1 = M^{-1} * M
      = M^{-1} * ((B _| J^{-1}) |_ A)
      = (M^{-1} ^ (B _| J^{-1})) * A
      = (B _| J^{-1}) * (A _| M^{-1})

Then prove in a similar manner:
    (M^{-1} |_ B) * (J^{-1} |_ A) = 1

**Formulas needed:**
- Meet formula (5.6): M = (B _| J^{-1}) |_ A
- Scalar product duality with outer/contraction products
- Factorization (5.1): A = A' ^ M, B = M ^ B'

**Implementation hints:**
- Verify each equality step numerically with specific blades
- The first proof uses right contractions; the second uses left contractions
- This demonstrates the algebraic duality between meet and join

---

### 5.10.2.2 Find the Error

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Find the error in this part of a 'proof' of the meet transformation formula (from the first printing of the book):

> Let us first establish how the inverse of the join transforms by transforming the join normalization equation J^{-1} * J = 1:
>
> 1 = f[1] = f[J^{-1} * J] = f^{-1}[J^{-1}] * f[J]
>
> so that f^{-1}[J^{-1}] = f[J]^{-1}.

**Formulas needed:**
- Linear transformation properties
- Outermorphism property: f[A^B] = f[A] ^ f[B]
- Scalar product transformation behavior

**Implementation hints:**
- The error is in assuming f[J^{-1} * J] = f^{-1}[J^{-1}] * f[J]
- Linear transformations do NOT preserve the scalar product in this way
- The scalar product involves the metric, which transforms under f
- Think about how the inner product/contraction transforms

---

### 5.10.2.3 Two Vectors Meet and Join

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Compute meet and join of two vectors a and b in general position, and show that the magnitude of their meet (relative to their join) is the sine of their angle. Relate the sign of the sine to the order of intersection. In this case, the meet should be antisymmetric.

**Formulas needed:**
- Meet formula (5.6): M = (B _| J^{-1}) |_ A
- Dual meet (5.7): M _| J^{-1} = (B _| J^{-1}) ^ (A _| J^{-1})
- Order sensitivity: B cap A = (-1)^{(j-a)(j-b)} A cap B
- For vectors (a=b=1, j=2): exponent = (2-1)(2-1) = 1, so antisymmetric

**Implementation hints:**
- Use J = a ^ b (normalized) as the join
- The meet is a scalar whose magnitude equals |a||b|sin(theta)
- Verify antisymmetry: a cap b = -(b cap a)
- The sign relates to the oriented angle from a to b

---

### 5.10.2.4 Parallel Vectors Meet and Join

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Compute the meet and join of two parallel vectors u and v. The meet should now be symmetric. (Hint: Use one of them as the join.)

**Formulas needed:**
- Degenerate case: when blades coincide
- Grade relationships (5.4)

**Implementation hints:**
- For parallel vectors, the join is 1-dimensional (a vector), not 2-dimensional
- Use J = u (normalized) as the join
- Both meet and join are proportional to the common direction
- Verify symmetry: u cap v = v cap u when j=1

---

### 5.10.2.5 Common Factor Meet Proportionality

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
As an exercise in symbolic manipulation of the products so far, let us consider the meet of (a ^ B) and (a ^ C), where a is a vector and the blades B and C have no common factor. The answer should obviously be proportional to a, but what precisely is the proportionality factor? (Hint: If you get stuck, the next exercise derives the answer as (a ^ B ^ C)*.)

**Formulas needed:**
- Meet formula (5.6)
- Dual meet (5.8)
- Dualization relative to join J = a ^ B ^ C

**Implementation hints:**
- Both blades share the common factor a
- The meet should be: a (a ^ B ^ C)*
- The dual is taken relative to the join
- Verify with concrete examples: e.g., a=e1, B=e2, C=e3

---

### 5.10.2.6 Verify Factorization Derivation

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Verify the steps in the following computation of the answer to the previous exercise. They are rather ingenious; note the third step especially, and the conversion to a scalar product (check the grades involved!). The join for dualization should be a blade proportional to a ^ B ^ C.

The derivation:
    (a ^ B) cap (a ^ C) = ((a ^ C)* ^ (a ^ B)*)^{-*}
                        = ((a |_ C*) ^ (a |_ B*))^{-*}
                        = (a |_ (C* ^ (a |_ B*)))^{-*}
                        = (a |_ (C* ^ (a ^ B)*))^{-*}
                        = (a ^ (C* _| (a ^ B)))
                        = (a ^ (C* * (a ^ B)))
                        = (a ^ ((a ^ B) * C*))
                        = (a ^ ((a ^ B) _| C*))
                        = a ^ (a ^ B ^ C)*

**Formulas needed:**
- Dual meet (5.8): (A cap B)* = B* ^ A*
- Contraction identities from Chapter 3 and 4
- Grade analysis for scalar product conversion

**Implementation hints:**
- Step 3 uses: (a |_ C*) ^ (a |_ B*) = a |_ (C* ^ (a |_ B*))
- This requires B* and (a |_ B*) to be orthogonal in grade sense
- The conversion to scalar product works because grades match for full contraction
- Verify each step numerically with specific blades

---

### 5.10.2.7 General Factorization Formula

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Use the previous derivation to derive the general factorization of the meet:

    (A ^ B) cap (A ^ C) = A (A ^ B ^ C)*     (Equation 5.11)

where A, B, and C have no common factors.

**Formulas needed:**
- Extension of 5.10.2.6 from vector a to general blade A
- Dual meet (5.8)
- Contraction identities

**Implementation hints:**
- Generalize the derivation from vector case to blade case
- The key insight is that A factors out of both arguments
- Verify with examples: A = e1^e2, B = e3, C = e3+e4 (in 4D)
- This formula is useful for factorizing complex meets

---

## 5.11 Programming Examples and Exercises

### 5.11.1 Interactive Meet and Join

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
Create an interactive visualization that allows you to select and manipulate two multivectors. The multivectors can be vector-valued or 2-blade-valued. Either the meet or the join of the multivectors are drawn.

**Formulas needed:**
- meet(M1, M2) function
- join(M1, M2) function
- General mv class for variable-grade output

**Implementation hints:**
- The existing code uses:
```cpp
mv X;
if (g_draw == DRAW_MEET) X = meet(M1, M2);
else X = join(M1, M2);
draw(X);
```
- Coordinates are rounded to multiples of 0.2 for easier manipulation of degenerate cases
- Use the mv class because neither input nor output has fixed type
- Working with mv class and meet()/join() is slower than specialized classes

**Run command:**
```bash
./run_ex.sh 5 1
```

---

### 5.11.2 Efficiency Benchmark

**Type:** Programming
**Status:** HAS_CODE: ex2

**Problem:**
Perform a benchmark to demonstrate the computational cost of meet and join versus ordinary products. Create 1,000,000 pairs of random vectors and bivectors. Time how long it takes to compute the outer product versus the join.

**Formulas needed:**
- Outer product: B ^ A
- Join: join(A, B)

**Implementation hints:**
- The join is about 100x slower than outer product because:
  1. A specialized factorization algorithm is used (see Section 21.7)
  2. The algorithm uses the slow mv class with coordinate compression
  3. Ordinary products in Gaigen 2 are highly optimized
- Optimization could potentially reduce to ~10x slower
- If efficiency matters, use the formula B* |_ A instead of A cap B when possible

**Run command:**
```bash
./run_ex.sh 5 2
```

---

### 5.11.3 Floating Point Issues

**Type:** Programming
**Status:** HAS_CODE: ex3

**Problem:**
Explore the floating-point behavior of the meet/join algorithm near degenerate cases. Search for the point where the join of two (near-)parallel vectors changes from a vector to a 2-blade.

**Formulas needed:**
- join(a, b) function
- mvAnalysis class for grade detection

**Implementation hints:**
- Start with probe epsilon = 10^{-10}
- Test if join(e1, e1 + epsilon * e2) is a 2-blade
- If not, grow epsilon by factor of 1.01 and repeat
- The flip-flop occurs around epsilon ~ 10^{-7} (the algorithm's internal threshold)
- The grade detection involves comparing a condition number to a threshold

**Run command:**
```bash
./run_ex.sh 5 3
```

**Expected output:**
```
join(1*e1, 1*e1 + 1.007748e-07*e2) is a 2-blade
```

---

## In-Chapter Calculations

### 5.4-CALC Two Planes Intersection Example

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Reproduce the worked example from Section 5.4: Intersect two planes represented by the 2-blades:
- A = (1/sqrt(2))(e1 + e2) ^ (e2 + e3)
- B = e1 ^ e2

Compute their meet using J = I_3 = e1^e2^e3.

**Formulas needed:**
- Meet formula (5.6): A cap B = (B _| J^{-1}) |_ A
- For J = I_3 in 3D Euclidean space: J^{-1} = -I_3 = e3^e2^e1

**Implementation hints:**
The calculation proceeds as:
1. Compute B _| J^{-1} = (e1^e2) _| (e3^e2^e1) = e3
2. Compute e3 |_ A = e3 |_ ((e1+e2)^(e2+e3))/sqrt(2)
3. Result: -(e1+e2)/sqrt(2) = -sqrt(2/3) * ((e1+e2)/sqrt(2)) normalized

**Expected result:**
The meet is the line -(e1+e2)/sqrt(3), which normalized is:
- Direction: (e1+e2)/sqrt(2)
- Magnitude: sqrt(2/3) = sin(angle from A to B)
- Sign: negative (A approaches B from a specific side)

**Verification:**
The angle between the planes is arcsin(sqrt(2/3)) approximately 54.7 degrees.

---

## Key Formulas Reference

### Core Definitions

**Outer Factorization (5.1):**
```
A = A' ^ M    and    B = M ^ B'
```

**Join and Meet (5.2):**
```
A union B = A' ^ M ^ B'    and    A cap B = M
```

### Computational Formulas

**Factoring out the meet (5.3):**
```
B' = M^{-1} |_ B    and    A' = A _| M^{-1}
```

**Join from meet (5.5):**
```
J = A union B = A ^ (M^{-1} |_ B) = (A _| M^{-1}) ^ B
```

**Meet from join (5.6):**
```
M = A cap B = (B _| J^{-1}) |_ A
```

**Dual meet (5.7, 5.8):**
```
M _| J^{-1} = (B _| J^{-1}) ^ (A _| J^{-1})
(A cap B)* = B* ^ A*   (dual relative to J)
```

### Grade Relationships (5.4)

```
a' = a - m
b' = b - m
j = a + b - m
m + j = a + b
```

### Order Sensitivity

```
B cap A = (-1)^{(j-a)(j-b)} A cap B
```

| Elements | j-a | j-b | (j-a)(j-b) | Symmetric? |
|----------|-----|-----|------------|------------|
| Two vectors in plane | 1 | 1 | 1 | Antisymmetric |
| Line and plane in 3D | 2 | 1 | 2 | Symmetric |
| Two planes in 3D | 1 | 1 | 1 | Antisymmetric |

### Linear Transformation Properties (Section 5.7)

```
f[A union B] = f[A] union f[B]
f[A cap B] = f[A] cap f[B]
```

The meet transform uses duality relative to the transformed join f[J].

---

## Tips for Implementation

1. **Always normalize** input blades for interpretable magnitude results
2. **Choose the right join**: For general position, use the pseudoscalar of the common space
3. **Check for degeneracy**: If meet returns zero, the join needs to change
4. **Use B* |_ A** instead of meet(A,B) for efficiency when you know the join
5. **Mind the signs**: Order of arguments matters for antisymmetric cases
6. **Floating-point caution**: Near-degenerate cases may show grade instability around epsilon ~ 10^{-7}
