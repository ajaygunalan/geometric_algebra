# Chapter 6: The Fundamental Product of Geometric Algebra - Exercises

## Summary Table

| Exercise | Name | Type | Status |
|----------|------|------|--------|
| 6.6.1.1 | Geometric Product Computations | Drill | NO_CODE: implement yourself |
| 6.6.1.2 | Multiplication Table | Drill | NO_CODE: implement yourself |
| 6.6.2.1 | Cross Product Non-Invertibility | Structural | NO_CODE: implement yourself |
| 6.6.2.2 | Pseudoscalar Commutation | Structural | NO_CODE: implement yourself |
| 6.6.2.3 | Outer Product as Antisymmetric Sum | Structural | NO_CODE: implement yourself |
| 6.6.2.4 | Grade Selection Counterexample | Structural | NO_CODE: implement yourself |
| 6.6.2.5 | Scalar Product Equivalence | Structural | NO_CODE: implement yourself |
| 6.6.2.6 | Contraction Implicit Definition | Structural | NO_CODE: implement yourself |
| 6.6.2.7 | Projection Contraction Equivalence | Structural | NO_CODE: implement yourself |
| 6.6.2.8 | Rejection Contraction Equivalence | Structural | NO_CODE: implement yourself |
| 6.6.2.9 | Non-Blade Rejection | Structural | NO_CODE: implement yourself |
| 6.6.2.10 | Support Vector Computation | Structural | NO_CODE: implement yourself |
| 6.7.1a | Symmetry Approach Products | Programming | HAS_CODE: ex1 |
| 6.7.1b | Grade Approach Products | Programming | HAS_CODE: ex1 |
| 6.7.2 | Gram-Schmidt Orthogonalization | Programming | HAS_CODE: ex2 |

---

## 6.6.1.1 Geometric Product Computations

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Let **a** = **e**_1 + **e**_2 and **b** = **e**_2 + **e**_3 in a 3-D Euclidean space with orthonormal basis {**e**_1, **e**_2, **e**_3}. Compute the following expressions, giving the results relative to the basis {1, **e**_1, **e**_2, **e**_3, **e**_2 ^ **e**_3, **e**_3 ^ **e**_1, **e**_1 ^ **e**_2, **e**_1 ^ **e**_2 ^ **e**_3}. Show your work.

(a) **a** **a**
(b) **a** **b**
(c) **b** **a**
(d) (**e**_1 ^ **e**_2) **a**
(e) **a** (**e**_1 ^ **e**_2)
(f) (**e**_1 ^ **e**_2 ^ **e**_3) **a**
(g) **a**^(-1)
(h) **b** **a**^(-1)
(i) (**e**_1 ^ **e**_2)^(-1)

**Formulas needed:**
- Geometric product for vectors: **x** **a** = **x** . **a** + **x** ^ **a** (Eq. 6.3)
- Inverse of a vector: **a**^(-1) = **a** / (**a** . **a**) = **a** / **a**^2 (Eq. 6.5)
- Inverse of a blade: A^(-1) = A~ / (A * A~) (Eq. 6.24)
- For orthonormal basis: **e**_i **e**_i = 1, **e**_i **e**_j = -**e**_j **e**_i (i != j)

**Implementation hints:**
- Use the multiplication table for 2-D Euclidean space as a guide
- Expand vectors in basis, then use distributivity
- The geometric product of a basis vector with itself equals its metric signature (+1 in Euclidean)

---

## 6.6.1.2 Multiplication Table

**Type:** Drill
**Status:** NO_CODE: implement yourself

**Problem:**
Make a full geometric product multiplication table for the 8 basis elements {1, **e**_1, **e**_2, **e**_3, **e**_1 ^ **e**_2, **e**_2 ^ **e**_3, **e**_3 ^ **e**_1, **e**_1 ^ **e**_2 ^ **e**_3}:

(a) in a Euclidean metric R^{3,0}
(b) in a metric R^{2,1} with **e**_1 . **e**_1 = -1

**Formulas needed:**
- **e**_i **e**_i = **e**_i . **e**_i = Q[**e**_i, **e**_i] (metric signature)
- **e**_i **e**_j = -**e**_j **e**_i for i != j (anticommutativity)
- **e**_{ij}^2 = -1 for Euclidean orthonormal basis vectors (Eq. 6.4)
- Associativity: A(BC) = (AB)C

**Implementation hints:**
- Start with the 2-D table as reference (Section 6.1.4)
- For R^{2,1}, **e**_1 . **e**_1 = -1 changes the signs of products involving **e**_1
- The pseudoscalar **e**_1 ^ **e**_2 ^ **e**_3 has special commutation properties

---

## 6.6.2.1 Cross Product Non-Invertibility

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Section 6.1.1 demonstrated the noninvertibility of contraction and outer product. Show by a geometrical example that the cross product of two vectors is not invertible either. Also give an algebraic argument based on its (invertible) relationship to the outer product.

**Formulas needed:**
- Cross product and outer product relationship: **a** x **b** = -I_3 (**a** ^ **b**) where I_3 is the unit pseudoscalar
- The cross product is always perpendicular to both input vectors
- For inner product: **x** . **a** = alpha defines a hyperplane
- For outer product: **x** ^ **a** = B defines a line

**Implementation hints:**
- Consider what geometric locus is defined by **x** x **a** = **c** for given **a** and **c**
- The cross product loses information about the component parallel to **a**
- Multiple vectors can have the same cross product with **a**

---

## 6.6.2.2 Pseudoscalar Commutation

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The pseudoscalar is the highest-order blade in the algebra of R^n. It receives its name because in many dimensions it is like a scalar in its commutation properties with vectors under the geometric product. In which dimensions does it commute with all vectors?

**Formulas needed:**
- Grade involution: B_hat = (-1)^{grade(B)} B
- From Eq. 6.16: B_hat **a** = **a** B - 2(**a** |_ B)
- For pseudoscalar I_n in R^n: grade(I_n) = n
- I_n commutes with **a** when I_n **a** = **a** I_n

**Implementation hints:**
- The pseudoscalar has grade n in n-dimensional space
- Consider the grade involution: I_n_hat = (-1)^n I_n
- For the pseudoscalar, **a** |_ I_n != 0 in general
- Check dimensions n = 1, 2, 3, 4, ... to find the pattern
- The answer relates to whether n is odd or even

---

## 6.6.2.3 Outer Product as Antisymmetric Sum

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The outer product can be defined as the completely antisymmetric summed average of all permutations of geometric products of its factors, with a sign for each term depending on oddness or evenness of the permutation. For the 3-blade, this means:

**x** ^ **y** ^ **z** = (1/3!)(**x** **y** **z** - **y** **x** **z** + **y** **z** **x** - **z** **y** **x** + **z** **x** **y** - **x** **z** **y**)

Derive this formula.

**Formulas needed:**
- Outer product from symmetry (Eq. 6.10): **a** ^ B = (1/2)(**a** B + B_hat **a**)
- For vectors: **x** ^ **y** = (1/2)(**x** **y** - **y** **x**)
- Associativity of geometric product
- There are 3! = 6 permutations of three elements

**Implementation hints:**
- Start with **x** ^ **y** = (1/2)(**x** **y** - **y** **x**)
- Then compute (**x** ^ **y**) ^ **z** using Eq. 6.10
- The grade involution of a 2-blade is positive: (**x** ^ **y**)_hat = **x** ^ **y**
- Expand and collect all permutation terms
- Verify the signs match even/odd permutations

---

## 6.6.2.4 Grade Selection Counterexample

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
The parts of a certain grade of a geometric product of blades are not necessarily blades. Show that in a 4-D space with orthonormal basis {**e**_i}_{i=1}^4, a counterexample is:

<**e**_1 (**e**_1 + **e**_2) (**e**_2 + **e**_3) (**e**_1 + **e**_4)>_2

(You may want to use software for this. If you find a simpler counterexample, let us know...)

**Formulas needed:**
- Grade selection: <A>_k extracts the grade-k part
- Geometric product is associative and distributive
- A 2-vector is a blade iff it can be written as **a** ^ **b** for some vectors
- A 2-vector B is a blade iff B ^ B = 0

**Implementation hints:**
- Expand the geometric product step by step
- Extract the grade-2 part of the result
- To test if a 2-vector is a blade, check if B ^ B = 0
- The result will be a sum of basis bivectors that cannot be factored as a single outer product

---

## 6.6.2.5 Scalar Product Equivalence

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Show that the definition of the scalar product as A * B = <A B>_0 is equivalent to the determinant definition of (3.2). You will then also understand why the matrix in the latter definition has the apparently reversed **a**_i . **b**_{k-j} as element (i,j) for k-blades.

**Formulas needed:**
- Scalar product via geometric product: A * B = <A B>_0 (Eq. 6.22)
- Determinant definition (Eq. 3.2): A_k * B_k = det(M) where M_{ij} = **a**_i . **b**_{k+1-j}
- For vectors: **a** . **b** = <**a** **b**>_0
- Reverse of a blade: (A_k)~ = (-1)^{k(k-1)/2} A_k

**Implementation hints:**
- Start with k-blades written as outer products of vectors
- Use the geometric product expansion in terms of basis
- The reversal of indices in the matrix relates to the reverse operation
- Show equivalence for k = 2 first, then generalize

---

## 6.6.2.6 Contraction Implicit Definition

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Originally, we motivated the contraction as the counterpart of an outer product relative to the scalar product, which led to the implicit definition (3.6):

(X ^ A) * B = X * (A |_ B)

Prove this part of the definition using the grade-based definitions of ^, *, and |_ in Section 6.3.2.

**Formulas needed:**
- Outer product: A_k ^ B_l = <A_k B_l>_{k+l} (Eq. 6.19)
- Left contraction: A_k |_ B_l = <A_k B_l>_{l-k} (Eq. 6.20)
- Scalar product: A_k * B_l = <A_k B_l>_0 (Eq. 6.22)
- Cyclic reordering: <A B>_0 = <B A>_0 (Eq. 6.23)

**Implementation hints:**
- Let X be grade r, A be grade k, B be grade l
- The left side requires l = r + k for non-zero scalar product
- The right side requires l - k = r for non-zero A |_ B, then scalar product needs grade r
- Use associativity and the cyclic property of <...>_0

---

## 6.6.2.7 Projection Contraction Equivalence

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In the formula (**x** |_ A^(-1)) A, we can replace the geometric product by a contraction, so that it is in fact the projection (**x** |_ A^(-1)) |_ A. Show this, using the suggestion that **x** |_ A^(-1) might be a subblade of A--which you first need to demonstrate. After that, decompose **x** |_ A^(-1) as a product of orthogonal vectors, and evaluate the two formulas to show their equivalence.

**Formulas needed:**
- Projection of **x** onto A: (**x** |_ A) / A (Section 6.4.2)
- For a subblade B of A: B A = B |_ A (when B is fully contained in A)
- Inverse of blade: A^(-1) = A~ / (A * A~) (Eq. 6.24)
- Gram-Schmidt orthogonalization (Section 6.7.2)

**Implementation hints:**
- First show **x** |_ A^(-1) is contained in the subspace of A
- Use orthogonal factorization of A = **a**_1 **a**_2 ... **a**_k
- The contraction **x** |_ A^(-1) removes components of **x** outside A
- Compare (**x** |_ A^(-1)) A with (**x** |_ A^(-1)) |_ A term by term

---

## 6.6.2.8 Rejection Contraction Equivalence

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
As a counterpart of the previous exercise, show that (**x** ^ A^(-1)) A = (**x** ^ A^(-1)) _| A.

(Hint: Write the second A as a wedge product of orthogonal vectors, and peel them off one by one.)

**Formulas needed:**
- Rejection of **x** by A: (**x** ^ A) / A (Section 6.4.2)
- Right contraction: A_k _| B_l = <A_k B_l>_{k-l} (Eq. 6.21)
- For orthogonal vectors: **a** ^ **b** = **a** **b** when **a** . **b** = 0
- Inverse of blade: A^(-1) = A~ / (A * A~)

**Implementation hints:**
- Write A = **a**_1 ^ **a**_2 ^ ... ^ **a**_k with orthogonal vectors
- The rejection **x** ^ A^(-1) is perpendicular to all vectors in A
- Peel off vectors from A one at a time
- Use the fact that a vector perpendicular to another gives **r** **a** = **r** ^ **a** = -**a** ^ **r**

---

## 6.6.2.9 Non-Blade Rejection

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
In a 4-D space with orthonormal basis {**e**_i}_{i=1}^4, project the 2-blade X = (**e**_1 + **e**_2) ^ (**e**_3 + **e**_4) onto the 2-blade A = (**e**_1 ^ **e**_3). Then determine the rejection as the difference of X and its projection. Show that this is not a blade.

(See also structural exercise 5 of Chapter 2.)

**Formulas needed:**
- Projection: (X |_ A) A^(-1) (Eq. 6.27)
- Rejection (general): X - (X |_ A) A^(-1)
- A 2-vector B is a blade iff B ^ B = 0
- Left contraction of blades: A_k |_ B_l = <A_k B_l>_{l-k}

**Implementation hints:**
- Expand X = (**e**_1 + **e**_2) ^ (**e**_3 + **e**_4) = **e**_1^**e**_3 + **e**_1^**e**_4 + **e**_2^**e**_3 + **e**_2^**e**_4
- Compute X |_ A = X |_ (**e**_1 ^ **e**_3)
- Find the projection (X |_ A) / A
- The rejection = X - projection
- Test if rejection ^ rejection = 0

---

## 6.6.2.10 Support Vector Computation

**Type:** Structural
**Status:** NO_CODE: implement yourself

**Problem:**
Let an orthonormal coordinate system {**e**_i}_{i=1}^3 be given in 3-D Euclidean space R^{3,0}. Compute the support vector (i.e., the vector of the point on the line closest to the origin) of the line with direction **u** = **e**_1 + 2**e**_2 - **e**_3, through the point **p** = **e**_1 - 3**e**_2. What is the distance of the line to the origin?

**Formulas needed:**
- Rejection of **x** by **a**: (**x** ^ **a**) / **a** (Section 6.4.2)
- The support vector is the rejection of **p** by **u**
- Distance = |support vector|
- Inverse of vector: **u**^(-1) = **u** / (**u** . **u**)

**Implementation hints:**
- The support vector **s** is perpendicular to the line direction **u**
- **s** = (**p** ^ **u**) / **u** = rejection of **p** by **u**
- Compute **p** ^ **u** first (this is a bivector)
- Then divide by **u** using the geometric product
- The distance is the norm of **s**

---

## 6.7.1a Symmetry Approach Products

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
Implement the outer product of a vector and any multivector using (6.10):

**a** ^ B = (1/2)(**a** B + B_hat **a**)

Implement the left contraction of a vector and any multivector using (6.12):

**a** |_ B = (1/2)(**a** B - B_hat **a**)

Complete the following functions:

```cpp
// exercise 1a: complete in this function
mv outerProduct_1a(const e3ga::vector &a, const mv &B) {
    printf("Warning: outerProduct_1a() not implemented yet!\n");
    return 0.0f;
}

// exercise 1a: complete in this function
mv leftContraction_1a(const e3ga::vector &a, const mv &B) {
    printf("Warning: leftContraction_1a() not implemented yet!\n");
    return 0.0f;
}
```

**Formulas needed:**
- Eq. 6.10: **a** ^ B = (1/2)(**a** B + B_hat **a**)
- Eq. 6.12: **a** |_ B = (1/2)(**a** B - B_hat **a**)
- Grade involution: B_hat = gradeInvolution(B)

**Implementation hints:**
- Use `gradeInvolution(const mv &X)` to compute B_hat
- Use `gp(const mv &X, const mv &Y)` or the `*` operator for geometric product
- The symmetry approach only works when one factor is a vector
- Test with various multivectors B of different grades

---

## 6.7.1b Grade Approach Products

**Type:** Programming
**Status:** HAS_CODE: ex1

**Problem:**
Equations (6.19) and (6.20) provide another way to obtain the outer product and the left contraction:

A_k ^ B_l = <A_k B_l>_{k+l}

A_k |_ B_l = <A_k B_l>_{l-k}

Implement this by filling in `outerProduct_1b()` and `leftContraction_1b()` in the example code.

```cpp
// exercise 1b: complete in this function
mv outerProduct_1b(const mv &A, const mv &B) {
    printf("Warning: outerProduct_1b() not implemented yet!\n");
    return 0.0f;
}

// exercise 1b: complete in this function
mv leftContraction_1b(const mv &A, const mv &B) {
    printf("Warning: leftContraction_1b() not implemented yet!\n");
    return 0.0f;
}
```

**Formulas needed:**
- Eq. 6.19: A_k ^ B_l = <A_k B_l>_{k+l}
- Eq. 6.20: A_k |_ B_l = <A_k B_l>_{l-k}
- Grade extraction: takeGrade(X, 1 << k) extracts grade k

**Implementation hints:**
- Use `takeGrade(const mv &X, int gradeUsageBitmap)` to extract grades
- To extract grade k, use `takeGrade(X, 1 << k)`
- Check grade presence with `((X.gu() & GRADE_k) != 0)`
- For multivectors, iterate over all grade combinations and sum the results
- Handle the case l - k < 0 (result is zero)

---

## 6.7.2 Gram-Schmidt Orthogonalization

**Type:** Programming
**Status:** HAS_CODE: ex2

**Problem:**
Implement Gram-Schmidt orthogonalization using geometric algebra. Given a set of vectors {**v**_1, **v**_2, ..., **v**_n}, produce an orthogonal set {**b**_1, **b**_2, ..., **b**_n} spanning the same subspace.

The algorithm:
1. **b**_1 = **v**_1
2. **b**_2 = (**v**_2 ^ **b**_1) / **b**_1
3. **b**_3 = (**v**_3 ^ **b**_1 ^ **b**_2) / (**b**_1 ^ **b**_2)
4. Continue pattern...

```cpp
void GramSchmidtGA(const e3ga::vector vIn[], e3ga::vector vOut[], int nbVectors) {
    mv B = 1;
    for (int i = 0; i < nbVectors; i++) {
        mv newB = vIn[i] ^ B;

        // check for dependence of input vectors:
        if (_Float(norm_r2(newB)) == 0.0f)
            throw std::string("input vectors are dependent");

        // compute orthogonal vector 'i':
        vOut[i] = _vector(newB * inverse(B));

        B = newB;
    }
}
```

**Formulas needed:**
- Rejection: (**x** ^ A) / A gives vector perpendicular to subspace A
- Geometric division: A / B = A * B^(-1)
- Blade inverse: A^(-1) = A~ / (A * A~)

**Implementation hints:**
- B accumulates the subspace spanned by processed vectors
- newB = **v**_i ^ B is the extension of B by **v**_i
- If newB = 0, the input vectors are linearly dependent
- newB / B = newB * inverse(B) gives the orthogonal component
- The `inverse()` function computes the blade inverse

---

## Calculation Tasks from Text

These are computational examples from the chapter that can also be implemented as exercises.

### Calculation: Vector Ratio Operator (Section 6.1.6)

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Given vectors **a** = **e**_1, **b** = **e**_1 + **e**_2, and **c** = 2**e**_2, compute **x** = ((**b** **a**^(-1))) **c** which solves **x** : **c** = **b** : **a**.

**Formulas needed:**
- Vector ratio as operator: **x** = (**b** **a**^(-1)) **c** (Eq. 6.6)
- For unit **a** = **e**_1: **a**^(-1) = **e**_1
- Rotation/scaling operator: **b** **a**^(-1) = rho(cos(phi) - sin(phi) **e**_{12})

**Expected result:**
**x** = 2(**e**_2 - **e**_1)

---

### Calculation: Decomposition Example (Section 6.4.2)

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
For a vector **x** and blade A, verify that:
**x** = (**x** A) A^(-1) = (**x** |_ A) A^(-1) + (**x** ^ A) A^(-1)

decomposes **x** into its projection onto A and rejection by A.

**Formulas needed:**
- Eq. 6.14: **a** B = **a** |_ B + **a** ^ B
- Projection: (**x** |_ A) / A
- Rejection: (**x** ^ A) / A
- Eq. 6.26: **x** = (**x** |_ A) A^(-1) + (**x** ^ A) A^(-1)

---

### Calculation: Reflection Formula (Section 6.4.3)

**Type:** Calculation
**Status:** NO_CODE: implement yourself

**Problem:**
Verify that **a**^(-1) **x** **a** reflects **x** in the line defined by **a**:

**a**^(-1) **x** **a** = (**x** . **a**) **a**^(-1) - (**x** ^ **a**) **a**^(-1)

**Formulas needed:**
- Eq. 6.28: **a**^(-1) **x** **a** = (**x** . **a**) **a**^(-1) - (**x** ^ **a**) **a**^(-1)
- Scalars commute with geometric product
- The projection is preserved, the rejection is negated

---

## Key Equations Reference

| Eq. | Formula | Description |
|-----|---------|-------------|
| 6.1 | **x** . **a** = (1/2)(**x** **a** + **a** **x**) | Inner product as symmetric part |
| 6.2 | **x** ^ **a** = (1/2)(**x** **a** - **a** **x**) | Outer product as antisymmetric part |
| 6.3 | **x** **a** = **x** . **a** + **x** ^ **a** | Geometric product for vectors |
| 6.4 | **e**_{ij}^2 = -1 | Square of unit bivector |
| 6.5 | **a**^(-1) = **a** / (**a** . **a**) | Inverse of a vector |
| 6.9 | **x** . **y** = (1/2)(**x** **y** + **y** **x**) | Polarization identity |
| 6.10 | **a** ^ B = (1/2)(**a** B + B_hat **a**) | Outer product via symmetry |
| 6.12 | **a** |_ B = (1/2)(**a** B - B_hat **a**) | Left contraction via symmetry |
| 6.14 | **a** B = **a** |_ B + **a** ^ B | Geometric product decomposition |
| 6.19 | A_k ^ B_l = <A_k B_l>_{k+l} | Outer product via grade |
| 6.20 | A_k |_ B_l = <A_k B_l>_{l-k} | Left contraction via grade |
| 6.22 | A_k * B_l = <A_k B_l>_0 | Scalar product via grade |
| 6.24 | A^(-1) = A~ / (A * A~) | Inverse of a blade |
