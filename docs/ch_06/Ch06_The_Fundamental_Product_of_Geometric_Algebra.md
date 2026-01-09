# Chapter 6: The Fundamental Product of Geometric Algebra

We have seen how the outer product and the contraction characterize rather different properties of subspaces: qualitative spanning and quantitative measurements. Together, they have given us an enriched view of the linear algebra of subspaces. This much has been known for some time, and is part of the branch of applied mathematics that is called **Grassmann-Cayley algebra**.

In this chapter we will start afresh and introduce the basics of Clifford algebra to develop a powerful geometric algebra. This geometric algebra will incorporate operators on subspaces into our framework, and permit us to displace the constructions of the subspace algebra in a structure-preserving manner. The crucial construction is to unify the qualitative and quantitative subspace products into a single **geometric product**, more fundamental than either. The geometric product is invertible, and it allows us to manipulate and solve equations about geometrical quantities almost as if they were regular arithmetical expressions. The true power of this geometric product will become clear in the next chapter, when we use it to define the versor product construction for operators. This chapter defines the geometric product, first for vectors and then for general multivectors. Subsequently, we show how the geometric product indeed subsumes the earlier products (which is a bit of tedious but necessary algebra), and we end with the use of its invertibility to define general projection and rejection operations through geometric division.

---

## 6.1 The Geometric Product for Vectors

### 6.1.1 An Invertible Product for Geometry

Consider a fixed and known vector $\mathbf{a}$ and an unknown vector $\mathbf{x}$, both in a Euclidean vector space $\mathbb{R}^n$. Let us assume that all we know about $\mathbf{x}$ is the scalar value $\alpha$ of its inner product with $\mathbf{a}$. Then $\mathbf{x}$ must satisfy $\mathbf{x} \cdot \mathbf{a} = \alpha$. This implies that the endpoint of $\mathbf{x}$ lies on a hyperplane perpendicular to the direction of $\mathbf{a}$. In Figure 6.1, this is sketched in $\mathbb{R}^{3,0}$ as the yellow plane. Geometrically, it is clear that we cannot retrieve $\mathbf{x}$ from $\alpha$ and $\mathbf{a}$. Algebraically, this means that there is no unique "inner division". If there were, we could invert the inner product and retrieve $\mathbf{x}$ from its product with $\mathbf{a}$ by means of some formula like $(\mathbf{x} \cdot \mathbf{a})/\mathbf{a} = \mathbf{x}$.

The outer product is not much better in this respect. Suppose that we were told the value of the outer product of $\mathbf{a}$ and $\mathbf{x}$ is to be the bivector $\mathbf{B}$. That bivector must of course be an area element of the plane shared by $\mathbf{a}$ and $\mathbf{x}$. The equation $\mathbf{x} \wedge \mathbf{a} = \mathbf{B}$ defines a line in space, offset from the origin. (You can see this as follows: let $\mathbf{p}$ be a solution of $\mathbf{p} \wedge \mathbf{a} = \mathbf{B}$. Then $\mathbf{x}$ satisfies $\mathbf{x} \wedge \mathbf{a} = \mathbf{p} \wedge \mathbf{a}$, so that $(\mathbf{x} - \mathbf{p}) \wedge \mathbf{a} = 0$. We saw in Section 2.8.1 that this implies $(\mathbf{x} - \mathbf{p}) = \lambda\mathbf{a}$. Therefore $\mathbf{x} = \mathbf{p} + \lambda\mathbf{a}$, a general point on the line through $\mathbf{p}$ in the direction $\mathbf{a}$.) This line has been sketched in blue in Figure 6.1. The endpoint of $\mathbf{x}$ must be on this line; but knowing the line does not specify $\mathbf{x}$. This is the geometrical reason why we cannot algebraically retrieve $\mathbf{x}$ from knowing the outer product $\mathbf{B}$ and $\mathbf{a}$; there is no "outer division", and no formula such that $(\mathbf{x} \wedge \mathbf{a})/\mathbf{a} = \mathbf{x}$ for all $\mathbf{x}$.

We thus see that, when taken separately, the two products with $\mathbf{a}$ are insufficient to retrieve $\mathbf{x}$; yet they are somehow complementary. Indeed, combining the two pieces of information is obviously enough to fully determine $\mathbf{x}$, with its endpoint at the intersection of the hyperplane and the line, as illustrated in Figure 6.1 for 3-D space. **Therefore a product of $\mathbf{x}$ and $\mathbf{a}$ that contains both the inner product and outer product information should be invertible.**

> **Figure 6.1:** Combination of the noninvertible subspace products leads to the invertible geometric product.

---

### 6.1.2 Symmetry and Antisymmetry

There is a clean way to construct a composite product from the inner product $\mathbf{x} \cdot \mathbf{a}$ and the outer product $\mathbf{x} \wedge \mathbf{a}$. It is based on their symmetries. The inner product $\mathbf{x} \cdot \mathbf{a}$ is **symmetric** in $\mathbf{x}$ and $\mathbf{a}$, for it retains its value when $\mathbf{x}$ and $\mathbf{a}$ are interchanged. The outer product $\mathbf{x} \wedge \mathbf{a}$ is **antisymmetric**; it changes sign under exchange of $\mathbf{x}$ and $\mathbf{a}$.

We can now make a new product between $\mathbf{x}$ and $\mathbf{a}$ such that the inner product is its symmetric part and the outer product its antisymmetric part. That defines it uniquely. This product is called the **geometric product** (though some call it the Clifford product after its 1872 inventor William Kingdon Clifford). It is so central that we use the empty symbol ' ' to denote it, writing $\mathbf{x}\,\mathbf{a}$ for the geometric product of $\mathbf{x}$ and $\mathbf{a}$.

The demands on its symmetric and antisymmetric parts give the equations

$$\mathbf{x} \cdot \mathbf{a} = \frac{1}{2}(\mathbf{x}\,\mathbf{a} + \mathbf{a}\,\mathbf{x}) \tag{6.1}$$

and

$$\mathbf{x} \wedge \mathbf{a} = \frac{1}{2}(\mathbf{x}\,\mathbf{a} - \mathbf{a}\,\mathbf{x}). \tag{6.2}$$

By adding these equations, we find that the geometric product of the vectors $\mathbf{x}$ and $\mathbf{a}$ must be

> **Geometric product for vectors:**
> $$\mathbf{x}\,\mathbf{a} \equiv \mathbf{x} \cdot \mathbf{a} + \mathbf{x} \wedge \mathbf{a}. \tag{6.3}$$

This product of two vectors produces a multivector that consists of a scalar part and a 2-blade part. That is unusual; our previous products always produced outcomes of a single grade. But it is precisely because the parts of different grades do not mix in an addition that they can be retrieved separately. **That makes the geometric product invertible.**

---

### 6.1.3 Properties of the Geometric Product

Let us check the algebraic properties of this new product between vectors:

**Commutativity.** The geometric product of two general vectors is not commutative, for the equation $\mathbf{x}\,\mathbf{a} = \mathbf{a}\,\mathbf{x}$ would imply that $\mathbf{x} \wedge \mathbf{a} = 0$. This means that commutativity only happens when $\mathbf{x}$ and $\mathbf{a}$ are parallel. On the other hand, the product is also not anticommutative, for that would imply $\mathbf{x} \cdot \mathbf{a} = 0$, which is also a special relationship of $\mathbf{x}$ and $\mathbf{a}$. As a consequence of this lack of general commutativity, we should be very careful about the order of the factors in the product $\mathbf{x}\,\mathbf{a}$.

**Linearity and Distributivity.** The geometric product is linear and distributive, since both the inner and the outer product are, and these properties inherit under addition.

**Associativity.** Definition 6.3 does not specify how to compute the geometric product of more than two vector factors. We have motivated our definition because we wanted an invertible product so that $(\mathbf{x}\,\mathbf{a})/\mathbf{a}$ would be equal to $\mathbf{x}$ (with division defined in terms of the geometric product). This suggests that we should define the product to be associative. The desired equation then holds, since we could rewrite it to $(\mathbf{x}\,\mathbf{a})/\mathbf{a} = \mathbf{x}\,(\mathbf{a}/\mathbf{a}) = \mathbf{x}$. Moreover, in an associative algebra, each invertible element has a unique inverse, so the division would be uniquely defined. (We clarify that point later, in Section 6.1.5.)

We give the fully general algebraic definition of the geometric product in Section 6.2.1. But first, we would like to familiarize you with the use of having such a product for vectors, to aid your intuition and acceptance of this new construction.

---

### 6.1.4 The Geometric Product for Vectors on a Basis

When asked to evaluate the geometric product of two vectors $\mathbf{a}$ and $\mathbf{b}$ given in a coordinate basis, we can simply evaluate their inner and outer products and add them. However, it is more direct to expand the geometric product in terms of a sum of geometric products of the coordinate vectors. We then need to establish what those basis products are.

Let us take an orthonormal basis $\{\mathbf{e}_i\}$ in a metric space $\mathbb{R}^n$. The geometric product of a basis vector with itself evaluates to a scalar derived from the metric:

$$\mathbf{e}_i\,\mathbf{e}_i = \mathbf{e}_i \cdot \mathbf{e}_i + \mathbf{e}_i \wedge \mathbf{e}_i = \mathbf{e}_i \cdot \mathbf{e}_i = Q[\mathbf{e}_i, \mathbf{e}_i],$$

where we used either the inner product or the bilinear form $Q$ of the metric space (see Appendix A). In a Euclidean space $\mathbb{R}^{n,0}$, this is of course simply equal to $1$ for all orthonormal basis vectors.

For two different vectors from the orthonormal basis, we get

$$\mathbf{e}_i\,\mathbf{e}_j = \mathbf{e}_i \cdot \mathbf{e}_j + \mathbf{e}_i \wedge \mathbf{e}_j = \mathbf{e}_i \wedge \mathbf{e}_j.$$

This does not simplify further, but it does show that $\mathbf{e}_i\,\mathbf{e}_j = -\mathbf{e}_j\,\mathbf{e}_i$ when $i \neq j$. We sometimes denote $\mathbf{e}_i\,\mathbf{e}_j$ as $\mathbf{e}_{ij}$ to show more clearly that it is a single element of the algebra. This element has an unusual property:

$$\mathbf{e}_{ij}^2 = (\mathbf{e}_i\,\mathbf{e}_j)(\mathbf{e}_i\,\mathbf{e}_j) = \mathbf{e}_i(\mathbf{e}_j\,\mathbf{e}_i)\mathbf{e}_j = -\mathbf{e}_i(\mathbf{e}_i\,\mathbf{e}_j)\mathbf{e}_j = -(\mathbf{e}_i\,\mathbf{e}_i)(\mathbf{e}_j\,\mathbf{e}_j) = -1. \tag{6.4}$$

Therefore the algebra of the real Euclidean vector space $\mathbb{R}^{2,0}$ contains an element $\mathbf{e}_{12}$ that squares to $-1$ under the geometric product! It is not the imaginary unit from complex numbers, but a real 2-blade, representing a unit plane.

In a 2-D vector space, the element $\mathbf{e}_{12}$ completes the algebra. Multiplying $\mathbf{e}_{12}$ with $\mathbf{e}_1$ reverts to something we already had:

$$\mathbf{e}_{12}\,\mathbf{e}_1 = \mathbf{e}_1\,\mathbf{e}_2\,\mathbf{e}_1 = -\mathbf{e}_2\,\mathbf{e}_1\,\mathbf{e}_1 = -\mathbf{e}_2(\mathbf{e}_1 \cdot \mathbf{e}_1),$$

so this is simply a multiple of $\mathbf{e}_2$. For the 2-D Euclidean space $\mathbb{R}^{2,0}$ with orthonormal basis, the full multiplication table is:

|       | $1$            | $\mathbf{e}_1$      | $\mathbf{e}_2$       | $\mathbf{e}_{12}$    |
|-------|----------------|---------------------|----------------------|----------------------|
| $1$   | $1$            | $\mathbf{e}_1$      | $\mathbf{e}_2$       | $\mathbf{e}_{12}$    |
| $\mathbf{e}_1$ | $\mathbf{e}_1$ | $1$                 | $\mathbf{e}_{12}$    | $\mathbf{e}_2$       |
| $\mathbf{e}_2$ | $\mathbf{e}_2$ | $-\mathbf{e}_{12}$  | $1$                  | $-\mathbf{e}_1$      |
| $\mathbf{e}_{12}$ | $\mathbf{e}_{12}$ | $-\mathbf{e}_2$ | $\mathbf{e}_1$       | $-1$                 |

Now we can use the linearity and distributivity to compute the geometric product of any two vectors. For $\mathbf{a} = a_1\mathbf{e}_1 + a_2\mathbf{e}_2$ and $\mathbf{b} = b_1\mathbf{e}_1 + b_2\mathbf{e}_2$:

$$\begin{align}
\mathbf{a}\,\mathbf{b} &= (a_1\mathbf{e}_1 + a_2\mathbf{e}_2)(b_1\mathbf{e}_1 + b_2\mathbf{e}_2) \\
&= a_1b_1(\mathbf{e}_1\,\mathbf{e}_1) + a_2b_2(\mathbf{e}_2\,\mathbf{e}_2) + a_1b_2(\mathbf{e}_1\,\mathbf{e}_2) + a_2b_1(\mathbf{e}_2\,\mathbf{e}_1) \\
&= (a_1b_1 + a_2b_2) + (a_1b_2 - a_2b_1)\mathbf{e}_{12}
\end{align}$$

By the extension of these techniques, the geometric product can be computed for vectors in $n$-dimensional space.

---

### 6.1.5 Dividing by a Vector

Since the geometric product on vectors is invertible, a vector $\mathbf{a}$ should have an inverse. This inverse $\mathbf{a}^{-1}$ is easy to find:

> **Inverse of a vector:**
> $$\mathbf{a}^{-1} = \frac{\mathbf{a}}{\mathbf{a} \cdot \mathbf{a}} = \frac{\mathbf{a}}{\mathbf{a}^2}. \tag{6.5}$$

This indeed works, for

$$\mathbf{a}^{-1}\,\mathbf{a} = \frac{1}{\mathbf{a} \cdot \mathbf{a}}\,\mathbf{a}\,\mathbf{a} = \frac{1}{\mathbf{a} \cdot \mathbf{a}}\left(\mathbf{a} \cdot \mathbf{a} + \mathbf{a} \wedge \mathbf{a}\right) = \frac{1}{\mathbf{a} \cdot \mathbf{a}}(\mathbf{a} \cdot \mathbf{a} + 0) = 1.$$

Vectors with zero norms (the null vectors of Appendix A) do not have inverses.

The associativity of the geometric product makes the inverse of a vector unique. If $\tilde{\mathbf{a}}$ would also be an inverse of $\mathbf{a}$, then $\tilde{\mathbf{a}}\,\mathbf{a} = 1$. Now right-multiply both sides by $\mathbf{a}^{-1}$, regroup by associativity, and you get $\tilde{\mathbf{a}} = \mathbf{a}^{-1}$. Therefore, there is only one inverse.[^1]

[^1]: Note that the inverse for the geometric product is the same we used as "an" inverse for the inner product in Section 3.5.2; it was then not unique, but we conveniently picked one that would be useful in the wider context that we have now reached.

Having the inverse allows us to divide by vectors, so that we indeed can retrieve $\mathbf{x}$ from knowing the value of $(\mathbf{x}\,\mathbf{a})$ and $\mathbf{a}$, as was our goal:

$$(\mathbf{x}\,\mathbf{a})\,\mathbf{a}^{-1} = \mathbf{x}\,(\mathbf{a}\,\mathbf{a}^{-1}) = \mathbf{x}.$$

This shows the necessity of the associativity property. We often prefer to denote this by a division sign as $(\mathbf{x}\,\mathbf{a})/\mathbf{a}$, but note that the noncommutativity of the geometric product implies that division is also noncommutative. So using the notation $/\mathbf{a}$ is permitted as long as we remember that this means "division on the right by $\mathbf{a}$."

Geometrically, the inverse of a vector $\mathbf{a}$ is a vector in the same direction as $\mathbf{a}$, and properly rescaled.

---

### 6.1.6 Ratios of Vectors as Operators

Having an algebraic definition of the division of vectors already helps to solve geometric problems. In a 2-D Euclidean space $\mathbb{R}^{2,0}$, we can pose the similarity problem illustrated in Figure 6.2:

> Given two vectors $\mathbf{a}$ and $\mathbf{b}$, and a third vector $\mathbf{c}$ (in the plane of $\mathbf{a}$ and $\mathbf{b}$), determine $\mathbf{x}$ so that $\mathbf{x}$ is to $\mathbf{c}$ as $\mathbf{b}$ is to $\mathbf{a}$ (i.e., solve $\mathbf{x} : \mathbf{c} = \mathbf{b} : \mathbf{a}$).

It is geometrically intuitive what we would want: a proportionality involving both the relative length and angle of $\mathbf{b}$ and $\mathbf{a}$ should be transferred to $\mathbf{x}$ and $\mathbf{c}$.

We take a leap of faith, and read this ratio in terms of the geometric product. So we guess that the solution to this might be the solution to the equation

$$\mathbf{x}\,\mathbf{c}^{-1} = \mathbf{b}\,\mathbf{a}^{-1}.$$

The solution is immediate through right-multiplication of both sides by $\mathbf{c}$:

$$\mathbf{x} = (\mathbf{b}\,\mathbf{a}^{-1})\,\mathbf{c}. \tag{6.6}$$

> **Figure 6.2:** Ratios of vectors.

This is a fully computable expression. For instance, with $\mathbf{a} = \mathbf{e}_1$ (so that $\mathbf{a}^{-1} = \mathbf{e}_1$), $\mathbf{b} = \mathbf{e}_1 + \mathbf{e}_2$, and $\mathbf{c} = 2\mathbf{e}_2$ in the standard orthonormal basis, we obtain $\mathbf{x} = ((\mathbf{e}_1 + \mathbf{e}_2)\,\mathbf{e}_1^{-1})\,2\mathbf{e}_2 = 2(1 - \mathbf{e}_1\,\mathbf{e}_2)\,\mathbf{e}_2 = 2(\mathbf{e}_2 - \mathbf{e}_1)$. Draw a picture like Figure 6.2 to convince yourself of the correctness of this outcome.

In fact, we might see $(\mathbf{b}\,\mathbf{a}^{-1})$ in (6.6) as an operator that acts on $\mathbf{c}$ to produce $\mathbf{x}$. The operator is parametrized by $\mathbf{a}$ and $\mathbf{b}$, and it should be capable of both rotation and scaling to produce $\mathbf{x}$ from $\mathbf{c}$. From the construction above, we would suspect that it only depends on the relative angle and size of the vectors $\mathbf{a}$ and $\mathbf{b}$. If that is so, we may as well take $\mathbf{a}$ to be the unit vector $\mathbf{e}_1$ and $\mathbf{b} = \rho(\cos\phi\,\mathbf{e}_1 + \sin\phi\,\mathbf{e}_2)$, with $\rho$ the relative length and $\phi$ the relative angle (from $\mathbf{a}$ to $\mathbf{b}$). Then we compute that the rotation/scaling operator is

$$\mathbf{b}\,\mathbf{a}^{-1} = \rho(\cos\phi\,\mathbf{e}_1 + \sin\phi\,\mathbf{e}_2)\,\mathbf{e}_1 = \rho(\cos\phi - \sin\phi\,\mathbf{e}_{12}).$$

You may verify that $\mathbf{b}\,\mathbf{a}^{-1}$ acts on the basis vector $\mathbf{e}_1$ to produce $\rho(\cos\phi\,\mathbf{e}_1 + \sin\phi\,\mathbf{e}_2)$, and on $\mathbf{e}_2$ it yields $\rho(\cos\phi\,\mathbf{e}_2 - \sin\phi\,\mathbf{e}_1)$. Moreover, since the geometric product is linear, these results can be used to produce the result on a general vector $\mathbf{c} = c_1\,\mathbf{e}_1 + c_2\,\mathbf{e}_2$, which yields the $\mathbf{x}$ of our problem:

$$\mathbf{x} = \rho(c_1\cos\phi - c_2\sin\phi)\,\mathbf{e}_1 + \rho(c_1\sin\phi + c_2\cos\phi)\,\mathbf{e}_2. \tag{6.7}$$

This is precisely the solution we would expect to the original problem, if we would have expanded it in coordinates. It is clearly a rotation combined with a scaling. You would represent it in terms of a matrix operation as

$$\begin{pmatrix} x_1 \\ x_2 \end{pmatrix} = \begin{pmatrix} \rho\cos\phi & -\rho\sin\phi \\ \rho\sin\phi & \rho\cos\phi \end{pmatrix} \begin{pmatrix} c_1 \\ c_2 \end{pmatrix}, \tag{6.8}$$

when expressed on the $\{\mathbf{e}_1, \mathbf{e}_2\}$ basis.

It is highly satisfactory that our geometric product not only produces this result, but that it does so in the form (6.6): $\mathbf{x} = (\mathbf{b}/\mathbf{a})\,\mathbf{c}$. That expression is immediately derivable from the original problem statement and completely formulated in terms of the elements of the problem, rather than using an extraneous coordinate system. If you have to write code, that is how you would want to specify it in a high-level programming language for geometry; in comparison, (6.7) and especially (6.8) feel like assembly code, with their use of coordinates reminiscent of registers.

The coordinate-free operator $\mathbf{b}/\mathbf{a}$ is a good example of the kind of operational power that the geometric product gives us. We will have much more to say about such operators in Chapter 7.

---

## 6.2 The Geometric Product of Multivectors

In the definition of the geometric product for vectors, we followed a geometric motivation and defined it in terms of inner product and outer product, loosely following its historic process of invention by Clifford. We then claimed it was actually more fundamental than either. If that is indeed the case, we should be able to start with the geometric product and define it algebraically without reference to the other products. We do that now, for it allows us to extend the geometric product properly beyond vector terms and use it as the foundation of our geometric algebra.

### 6.2.1 Algebraic Definition of the Geometric Product

We start with a metric vector space $\mathbb{R}^n$ and its linear space of subspaces $\bigwedge\mathbb{R}^n$. Its metric is characterized by a bilinear form $Q$ (see Appendix A), or, equivalently, by an inner product of vectors.

We define the geometric product from $\bigwedge\mathbb{R}^n \times \bigwedge\mathbb{R}^n$ to $\bigwedge\mathbb{R}^n$ by the following properties:

**Scalars.** The geometric product is an extension of the usual scalar multiplication in $\bigwedge\mathbb{R}^n$, so the expressions

$$\alpha\beta \quad \text{and} \quad \alpha\mathbf{x}, \quad \alpha,\beta \in \mathbb{R}$$

can from now on be read as involving the geometric product. We will explicitly define this multiplication by a scalar to be commutative with any element $A$:

$$\alpha A = A\alpha \quad \text{for all } \alpha \in \mathbb{R}, A \in \bigwedge\mathbb{R}^n.$$

**Scalar Squares.** The geometric product $\mathbf{x}^2 \equiv \mathbf{x}\,\mathbf{x}$ of a vector $\mathbf{x}$ with itself is defined to be a scalar, equivalent to the metric quantity $\mathbf{x} \cdot \mathbf{x} = Q[\mathbf{x},\mathbf{x}]$. This ties the geometric product to the metric of the vector space $\mathbb{R}^n$.

**Distributivity and Linearity.** The geometric product is defined to be distributive over the addition of elements:

$$A(B + C) = AB + AC \quad \text{and} \quad (A + B)C = AC + BC$$

This also defines the general linearity of the geometric product (since $A$ can be a scalar).

**Associativity.** The geometric product is defined to be associative:

$$A(BC) = (AB)C$$

so that we may write $ABC$ without confusion about the result.

**Commutativity Not Required!** The geometric product is not defined to be either purely commutative or purely anticommutative (although it may be either, for suitably chosen factors). This is essential, as it permits the geometric product to unite the commutative properties of metric computations with the anticommutative properties of spanning to produce a product that is complete in its geometric properties.

Note that our original definition (6.3) of the geometric product as a sum of inner and outer product is not part of these algebraic defining properties. We will actually rederive (6.3), and with it will define the outer product and contraction in terms of the geometric product. Such a procedure demonstrates that it is indeed the more fundamental of the three, our order of treatment in this book notwithstanding.

The geometric product makes our algebra of $\bigwedge\mathbb{R}^n$ into a true **geometric algebra**, and we will use that term from now on. It transcends the subspace algebra we have used so far, and has a much more rich, powerful, and consistent structure. While subspace algebra was similar to Grassmann-Cayley algebra, geometric algebra closely resembles a nongeometrical mathematical construction called **Clifford algebra**. The terms are often used interchangeably by others, but we will make a distinction. For the moment, you can think of geometric algebra as the geometrically significant part of Clifford algebra. We will be able to make this distinction more precise in Section 7.7.2.

---

### 6.2.2 Evaluating the Geometric Product

Since the above are all the properties of the geometric product, they should enable the expansion of arbitrary expressions of the geometric product of multivectors. Let us do some of this before we proceed—we will develop faster techniques to compute with the geometric product, but it is important to realize that these definitions are indeed complete.

The completeness is most easily shown when we have an orthonormal basis for the metric vector space $\mathbb{R}^n$. We should demonstrate that we can compute the geometric product of any two basis vectors. This should of course agree with our special case for vectors, computed in Section 6.1.4, but we are not allowed to use those. We should work fully from the algebraic definition just given.

The geometric product of a basis vector with itself is easy, since by definition it can be expressed in terms of the bilinear form or the inner product that is part of the definition of the metric vector space:

$$\mathbf{e}_i\,\mathbf{e}_i = \mathbf{e}_i \cdot \mathbf{e}_i = Q[\mathbf{e}_i, \mathbf{e}_i]$$

But the geometric product of two different basis vectors $\mathbf{e}_i\,\mathbf{e}_j$ does not appear to allow simplification by the axioms:

$$\mathbf{e}_i\,\mathbf{e}_j = \;?$$

We know from the vector computations that it cannot be simplified, but we would at least like to be able to show that $\mathbf{e}_j\,\mathbf{e}_i = -\mathbf{e}_i\,\mathbf{e}_j$ to be in correspondence with the geometric product as we defined it earlier for vectors.

There is a neat trick called **polarization** that comes to the rescue. The bilinear form or inner product of the metric vector space can be evaluated on any two vectors. The bilinear nature gives an identity for $Q[\mathbf{x}, \mathbf{y}]$ or $\mathbf{x} \cdot \mathbf{y}$ that can be manipulated into a symmetric shape:

$$\begin{align}
\mathbf{x} \cdot \mathbf{y} &= \frac{1}{2}\left[(\mathbf{x} + \mathbf{y}) \cdot (\mathbf{x} + \mathbf{y}) - (\mathbf{x} \cdot \mathbf{x}) - (\mathbf{y} \cdot \mathbf{y})\right] \\
&= \frac{1}{2}\left[(\mathbf{x} + \mathbf{y})(\mathbf{x} + \mathbf{y}) - (\mathbf{x}\,\mathbf{x}) - (\mathbf{y}\,\mathbf{y})\right] \\
&= \frac{1}{2}(\mathbf{x}\,\mathbf{y} + \mathbf{y}\,\mathbf{x}) \tag{6.9}
\end{align}$$

Therefore the inner product $\mathbf{x} \cdot \mathbf{y}$ of two general vectors is the symmetric part of their geometric product. We are thus able to derive part of our motivating definitions of Section 6.1.2 from the algebraic definition above.

This symmetry property gives us the idea to manipulate our different basis vectors by splitting the product in its symmetric and antisymmetric parts:

$$\begin{align}
\mathbf{e}_i\,\mathbf{e}_j &= \frac{1}{2}(\mathbf{e}_i\,\mathbf{e}_j + \mathbf{e}_j\,\mathbf{e}_i) + \frac{1}{2}(\mathbf{e}_i\,\mathbf{e}_j - \mathbf{e}_j\,\mathbf{e}_i) \\
&= \mathbf{e}_i \cdot \mathbf{e}_j + \frac{1}{2}(\mathbf{e}_i\,\mathbf{e}_j - \mathbf{e}_j\,\mathbf{e}_i) \\
&= 0 + \frac{1}{2}(\mathbf{e}_i\,\mathbf{e}_j - \mathbf{e}_j\,\mathbf{e}_i),
\end{align}$$

since in the orthonormal basis $\mathbf{e}_i \cdot \mathbf{e}_j = 0$ for $i \neq j$. It follows that

$$\mathbf{e}_i\,\mathbf{e}_j = -\mathbf{e}_j\,\mathbf{e}_i.$$

So the new definition indeed permits us to derive this important property of the multiplication of basis vectors.

With the multiplication of the basis elements established, we can use associativity, linearity, and distributivity to compute the geometric product of any two elements in the linear space $\bigwedge\mathbb{R}^n$.

---

### 6.2.3 Grades and the Geometric Product

At this point you may object that we have not really shown that the geometric product, constructing elements starting from a metric vector space $\mathbb{R}^n$, really generates the same linear structure of elements of different grades that we had before. We are therefore formally not allowed to write $\bigwedge\mathbb{R}^n$ for the space in which geometric algebra lives.

That is a correct objection; but if the spaces are not the same, they are certainly algebraically isomorphic, and that is good enough to identify them geometrically. The reason is that the orthonormal basis of the vector space $\mathbb{R}^n$ leads to a basis for the product structure that satisfies $\mathbf{e}_i\,\mathbf{e}_j = -\mathbf{e}_j\,\mathbf{e}_i$. That is the essence in generating the higher-grade elements. This property is identical to the outer product antisymmetric property $\mathbf{e}_i \wedge \mathbf{e}_j = -\mathbf{e}_j \wedge \mathbf{e}_i$. The identity of these properties means that we can use the geometric product to at least faithfully reconstruct the basis of the ladder of subspaces $\bigwedge\mathbb{R}^n$ that we originally made using the outer product.

And even though the geometric product has richer properties than the outer product, we cannot make other elements beyond the ladder of subspaces. Consider for example $\mathbf{e}_1(\mathbf{e}_1\mathbf{e}_2)$ as an attempt to make something new. Had we used the outer product, the construction $\mathbf{e}_1 \wedge (\mathbf{e}_1\mathbf{e}_2) = \mathbf{e}_1 \wedge (\mathbf{e}_1 \wedge \mathbf{e}_2)$ would have been zero. For the geometric product, the result is not zero, but it reverts to something we already have:

$$\mathbf{e}_1(\mathbf{e}_1\mathbf{e}_2) = \mathbf{e}_1\,\mathbf{e}_1\,\mathbf{e}_2 = (\mathbf{e}_1^2)\,\mathbf{e}_2,$$

so this is $\pm\mathbf{e}_2$, depending on the metric. You can generalize this argument to show that nothing beyond the elements of $\bigwedge\mathbb{R}^n$ can be made; the scalar squares foil any such attempt. Therefore, the geometric product of a metric vector space $\mathbb{R}^n$ "lives" in precisely the same structure $\bigwedge\mathbb{R}^n$ as the outer product of the same space $\mathbb{R}^n$.

However, this analysis brings out an important difference between the geometric product and the outer product. When multiplying the extended basis elements of grade $k$ and grade $l$ by the outer product, we are left with a single element of grade $k + l$ (or zero). With the geometric product, the product of two basis elements of grade $k$ and $l$ may have any of the grades

$$|k - l|, |k - l| + 2, \ldots, (k + l - 2), (k + l).$$

The highest grade $(k + l)$ occurs when all basis vectors in the elements are different. (The geometric product is then essentially the same as the outer product of those elements.) But each vector in common between the two basis elements reduces the grade by two as it combines to produce a scalar. The extreme case is when all the vectors in one are contained in the other, leaving only $|k - l|$ factors as a result. (The geometric product is then the left or right contraction of one argument onto the other.)

If we now have arbitrary elements $A_k$ and $B_l$ of grade $k$ and $l$, respectively, these can be decomposed on the bases of $\bigwedge^k\mathbb{R}^n$ and $\bigwedge^l\mathbb{R}^n$. When we multiply them using the geometric product, any or all of the possible grades between $|k - l|$ and $(k + l)$ may occur. **Therefore the geometric product produces multivectors of mixed grade.** The grade() operation no longer has a single integer value in geometric algebra.

The algebraic invertibility of the geometric product can now be understood in principle. The series of terms in the geometric product of the two elements $A_k$ and $B_l$ apparently give us a complete inventory of their relative geometric relationship, allowing full reconstruction of one when we are given the other.

---

## 6.3 The Subspace Products Retrieved

The geometric product is the fundamental product in geometric algebra—you will not need any other product, since it contains all geometric relationships between its arguments. Yet we have seen that the subspace products (by which we mean the outer product, scalar product, and contraction) are also useful geometrically. In fact, the whole geometrical concept of subspace requires the outer product to be encoded in our algebra.

Since we want to have those products to "do geometry," we should show that they are included in our geometric algebra based on the geometric product. There are two routes:

1. We could use the **symmetries** of the geometric product to retrieve outer product and contraction (basically reversing the construction that motivated the geometric product in Section 6.1.2). This is actually only partly successful. It does not define the subspace products fully, but it does show that they are consistent with the symmetry structure of the geometric product. When we perform the analysis in Section 6.3.1 below, we obtain many useful relationships between the various products.

2. We can identify the subspace products of blades as certain well-defined **grades** of their geometric product. This indeed defines them fully, though it gives us less algebraic insight in their relationships. We do this in Section 6.3.2.

In the practice of applying the subspace products, both approaches are useful. Depending on the geometrical problem that one tries to solve computationally, either may feel like the more direct route. That is why we present both.

---

### 6.3.1 The Subspace Products from Symmetry

The familiar outer product of a vector $\mathbf{a}$ with a blade $B$ can be related to the geometric product by the following two expressions:

$$\mathbf{a} \wedge B = \frac{1}{2}(\mathbf{a}\,B + \widehat{B}\,\mathbf{a}), \tag{6.10}$$

$$B \wedge \mathbf{a} = \frac{1}{2}(B\,\mathbf{a} + \mathbf{a}\,\widehat{B}), \tag{6.11}$$

where $\widehat{B} = (-1)^{\text{grade}(B)} B$ is the grade involution of $B$ introduced in Section 2.9.5. (Writing the equations in this form makes it easier to lift them to general multivectors $B$.)

The proof of these statements may be found in Section C.1 of Appendix C. It demonstrates that the two equations above indeed identify the same outer product structure that we had before, at least when one of the factors is a vector, and it proves the associativity $(\mathbf{x} \wedge \mathbf{y}) \wedge \mathbf{z} = \mathbf{x} \wedge (\mathbf{y} \wedge \mathbf{z})$ of the product thus defined. Because of that associativity, this outer product in terms of the geometric product can be extended to general blades, and by linearity to general multivectors. Only the case of two scalars is formally not included, but other than that this outer product is isomorphic to the outer product we had before.

The contractions can be related to the geometric product in similar fashion when they involve a vector factor $\mathbf{a}$:

$$\mathbf{a} \rfloor B = \frac{1}{2}(\mathbf{a}\,B - \widehat{B}\,\mathbf{a}), \tag{6.12}$$

$$B \lfloor \mathbf{a} = \frac{1}{2}(B\,\mathbf{a} - \mathbf{a}\,\widehat{B}). \tag{6.13}$$

The proof of these statements may be found in Section C.2 of Appendix C.

Unfortunately, because of lack of associativity, we cannot prove the defining equation (3.11) $A \rfloor (B \rfloor C) = (A \wedge B) \rfloor C$ (nor its counterpart for the right contraction). Neither can we define the contraction result on two scalar arguments in this manner. So although the products defined by (6.12) and (6.13) are consistent with the earlier contractions, the contractions based on the symmetries of the geometric product are not pinned down very precisely. This algebraic freedom partly explains the variation in inner products in the geometric algebra literature exposed in Appendix B.

But at least for a vector factor, the constructions above define the subspace products uniquely. Conversely, this means that the geometric product of a vector with an arbitrary multivector can be decomposed using the contraction and the outer product.

$$\mathbf{a}\,B = \mathbf{a} \rfloor B + \mathbf{a} \wedge B, \tag{6.14}$$

$$\widehat{B}\,\mathbf{a} = B \lfloor \mathbf{a} + B \wedge \mathbf{a} = -\mathbf{a} \rfloor B + \mathbf{a} \wedge B, \tag{6.15}$$

where we used (3.19) to convert the right contraction to a left contraction. These equations subsume and generalize (6.3).

The subspace product definitions permit us to change the order of multiplications in a geometric product, which is often convenient in evaluating expressions:

$$\widehat{B}\,\mathbf{a} = \mathbf{a}\,B - 2\mathbf{a} \rfloor B = -\mathbf{a}\,B + 2\mathbf{a} \wedge B \tag{6.16}$$

and

$$\mathbf{a}\,B = \widehat{B}\,\mathbf{a} + 2\mathbf{a} \rfloor B = -\widehat{B}\,\mathbf{a} + 2\mathbf{a} \wedge B. \tag{6.17}$$

In all these equations, you may note that right-multiplication of $B$ by $\mathbf{a}$ is always accompanied by a grade involution—the formulas become simplest or most symmetrical when you define them in terms of $\mathbf{a}\,B$, $\mathbf{a} \rfloor B$, and $\mathbf{a} \wedge B$, combined with $\widehat{B}\,\mathbf{a}$, $B \lfloor \mathbf{a}$ (= $-\mathbf{a} \rfloor B$), and $B \wedge \mathbf{a}$ (= $\mathbf{a} \wedge B$). This grade involution is apparently the natural geometric sign when moving a vector to the right of a blade. We will see this phenomenon reappear throughout the equations of geometric algebra.

You may be puzzled by a paradox in the associativity of the various products. According to (6.14), the geometric product is the sum of the outer product and contraction. Both the geometric product and the outer product are associative, whereas the contraction is not. How can the sum of something associative and something nonassociative ever be associative itself? The solution is: don't look at it that way. Instead, start with the geometric product, which is defined to be associative. Then derive the outer product as (6.10) (i.e., as half the sum of a geometric product and its swapped version). This is associative since addition is associative. Then derive the contraction as (6.12) (i.e., as half the difference of a geometric product and its swapped version). This is nonassociative, since subtraction is nonassociative. Now there is no paradox.

By linearity, all equations in this section are easily extended from a blade $B$ to a general multivector $B$.

---

### 6.3.2 The Subspace Products as Selected Grades

An alternative way of obtaining the subspace products from the geometric product is as parts of well-chosen grades using the $k$-grade selection operator $\langle \cdot \rangle_k$. For the geometric product on vectors, this is simple:

$$\mathbf{a} \cdot \mathbf{b} = \langle \mathbf{a}\,\mathbf{b} \rangle_0 \quad \text{and} \quad \mathbf{a} \wedge \mathbf{b} = \langle \mathbf{a}\,\mathbf{b} \rangle_2. \tag{6.18}$$

This generalizes as follows:

$$A_k \wedge B_l \equiv \langle A_k\,B_l \rangle_{k+l} \tag{6.19}$$

$$A_k \rfloor B_l \equiv \langle A_k\,B_l \rangle_{l-k} \tag{6.20}$$

$$A_k \lfloor B_l \equiv \langle A_k\,B_l \rangle_{k-l} \tag{6.21}$$

$$A_k * B_l \equiv \langle A_k\,B_l \rangle_0 \tag{6.22}$$

Blades of negative grade are zero—so the left contraction $\rfloor$ is zero when $k > l$, and the right contraction $\lfloor$ is zero when $k < l$. By linearity of the geometric product, all these definitions can be lifted from blades to $k$-vectors and then to multivectors as a sum over the appropriate grades.

In contrast to the symmetry-based approach, these equations are complete definitions for all arguments. The proofs that these equations give the same products we had in the earlier chapters may be found in Section C.3 of Appendix C. It involves some new manipulation techniques that are useful to study.

A surprising property of these definitions is that the selection of certain grades of the geometric product of blades apparently produces another blade. Beware that this does not generalize to the selection of other grade parts!

Once these correspondences with the old subspace products have been established, some of the properties of the subspace products can be used to simplify grade-based expressions and vice versa. For instance, the symmetry property $A * B = B * A$ of the scalar product can be easily lifted to multivectors as $A * B = B * A$. This implies

$$\langle A\,B \rangle_0 = \langle B\,A \rangle_0 \tag{6.23}$$

which is a useful cyclic reordering property of the grade-0 symbol.

The grade approach to the subspace products is a feasible way of implementing all products in geometric algebra based on a single implemented product (the geometric product). This is explored in programming exercise 6.7.1.

---

## 6.4 Geometric Division

With the integration of subspace products with the geometric product, we have a more powerful algebra to analyze subspaces. We now combine our new capability of division by a subspace with the earlier techniques. This not only generalizes the projection, but it also produces the compact representation of a new construction: subspace reflection.

### 6.4.1 Inverses of Blades

The geometric product is invertible, so dividing by a multivector has a unique meaning, equivalent to multiplication by the inverse of the multivector. However, not all multivectors have inverses. Fortunately, we are mostly interested in two kinds: blades, and multivectors that can be written as a product of invertible vectors. The latter are called **versors**, and we treat them in Chapter 7; they are obviously invertible (their inverse is formed by the inverses of the vector factors, in reverse order).

Blades are also invertible, if they have a nonzero norm (i.e., if they are not null-blades; see Appendix A). The inverse of a blade $A$ is then

> **Inverse of a blade $A$:**
> $$A^{-1} = \frac{A}{A * A} = \frac{\widetilde{A}}{A * \widetilde{A}} = \frac{\widetilde{A}}{A^2} \tag{6.24}$$

where $\widetilde{A}$ is the reverse of Section 2.9.5. This formula is based on the property that the squared norm of a blade is a scalar, which makes the division well defined and unambiguous (since a scalar commutes with the geometric product, its right-division and left-division coincide). Its validity is most easily verified using an orthogonal factorization of the blade $A$ as a product of orthogonal vectors: $A = \mathbf{a}_1\,\mathbf{a}_2 \cdots \mathbf{a}_k$. Such a factorization can be made for invertible blades by the Gram-Schmidt procedure of Section 6.7.2. By computing the geometric product $A\,\widetilde{A}$ vector by vector, you find that it is equal to $A * \widetilde{A}$, so that the inverse formula is indeed correct.

This inverse of a blade is unique, by the associativity argument also used in Section 6.1.5.

---

### 6.4.2 Decomposition: Projection to Subspaces

We can express a vector $\mathbf{x}$ trivially relative to an invertible blade $A$ as $\mathbf{x} = \mathbf{x}\,(A\,A^{-1})$. Moving the brackets by associativity and invoking (6.14), we get a pleasantly suggestive rewriting. Let us first explore this for a 1-blade $A$, the vector $\mathbf{a}$.

$$\begin{align}
\mathbf{x} &= (\mathbf{x}\,\mathbf{a})\,\mathbf{a}^{-1} \\
&= (\mathbf{x} \cdot \mathbf{a} + \mathbf{x} \wedge \mathbf{a})\,\mathbf{a}^{-1} \\
&= (\mathbf{x} \cdot \mathbf{a})\,\mathbf{a}^{-1} + (\mathbf{x} \wedge \mathbf{a})\,\mathbf{a}^{-1} \tag{6.25}
\end{align}$$

The first term in (6.25) is a vector (since it is a scalar times a vector). We recognize it as $(\mathbf{x} \cdot \mathbf{a})\,\mathbf{a}^{-1} = (\mathbf{x} \cdot \mathbf{a}^{-1})\,\mathbf{a} = (\mathbf{x} \rfloor \mathbf{a}^{-1})\mathbf{a}$; that is, as the orthogonal projection of $\mathbf{x}$ onto $\mathbf{a}$ (see Section 3.6). We can now write it as a division:

> **Projection of $\mathbf{x}$ onto $\mathbf{a}$:** $(\mathbf{x} \rfloor \mathbf{a})/\mathbf{a}$.

It is the component of $\mathbf{x}$ in the $\mathbf{a}$-direction. The second term in (6.25) must then be the component of $\mathbf{x}$ that contains no $\mathbf{a}$-components at all (since the two terms must add to produce $\mathbf{x}$). We follow Hestenes in calling this the **rejection** of $\mathbf{x}$ by $\mathbf{a}$:

> **Rejection of $\mathbf{x}$ by $\mathbf{a}$:** $(\mathbf{x} \wedge \mathbf{a})/\mathbf{a}$

We can imagine its construction visually as in Figure 6.3: span the bivector $\mathbf{x} \wedge \mathbf{a}$. This is a reshapeable area element, and it is equivalent to a rectangle perpendicular to $\mathbf{a}$ spanned by some vector $\mathbf{r}$ perpendicular to $\mathbf{a}$. That rectangular element can be written as the outer product $\mathbf{r} \wedge \mathbf{a}$, but because $\mathbf{r}$ is perpendicular to $\mathbf{a}$ (implying that $\mathbf{r} \cdot \mathbf{a} = 0$), we can even write it as a geometric product:

$$\mathbf{x} \wedge \mathbf{a} = \mathbf{r} \wedge \mathbf{a} = \mathbf{r} \cdot \mathbf{a} + \mathbf{r} \wedge \mathbf{a} = \mathbf{r}\,\mathbf{a},$$

This rewriting is helpful because the geometric product is invertible; that makes this equation for $\mathbf{r}$ solvable. Through right-division by $\mathbf{a}$ on $\mathbf{r}\,\mathbf{a} = \mathbf{x} \wedge \mathbf{a}$, we obtain the solution $\mathbf{r} = (\mathbf{x} \wedge \mathbf{a})/\mathbf{a}$, which is indeed the rejection of $\mathbf{x}$ by $\mathbf{a}$.

We thus see that the identity $\mathbf{x} = (\mathbf{x}\,\mathbf{a})/\mathbf{a}$, when written out in terms of the inner product and the outer product, is actually a **decomposition** of the vector $\mathbf{x}$ relative to $\mathbf{a}$, providing its $\mathbf{a}$-component and non-$\mathbf{a}$-component. It offers us the possibility of describing a vector relative to another vector, but does so in a satisfyingly coordinate-free manner.

> **Figure 6.3:** Projection and rejection of $\mathbf{x}$ relative to $\mathbf{a}$.

Returning to the general blade $A$ and again invoking (6.14), we find the decomposition

$$\mathbf{x} = (\mathbf{x}\,A)\,A^{-1} = (\mathbf{x} \rfloor A)\,A^{-1} + (\mathbf{x} \wedge A)\,A^{-1}. \tag{6.26}$$

You may expect that the first term is a 1-blade fully contained in $A$, and that it should be equal to the projection of $\mathbf{x}$ onto $A$.

> **Projection of $\mathbf{x}$ onto $A$:** $(\mathbf{x} \rfloor A)/A$.

We have encountered this before (in Section 3.6) as $(\mathbf{x} \rfloor A)A^{-1}$, which commutes with all products. But structural exercise 7 explores why we can replace the contraction by a geometric division in this formula.

The second term is again called the **rejection of $\mathbf{x}$ by $A$**,

> **Rejection of $\mathbf{x}$ by $A$:** $(\mathbf{x} \wedge A)/A$,

since it is a vector perpendicular to $A$. To prove that fact compactly, we combine the subspace products and the grade selection of the geometric product (to be frank, it took us about an hour to make it this simple). If $(\mathbf{x} \wedge A)\,A^{-1}$ is perpendicular to $A$, it should be perpendicular to any vector in $A$. Let us pick one, $\mathbf{a}$, and compute the inner product:

$$\begin{align}
\mathbf{a} \cdot \left[(\mathbf{x} \wedge A)\,A^{-1}\right] &= \langle \mathbf{a}\,(\mathbf{x} \wedge A)\,A^{-1} \rangle_0 \\
&= \frac{1}{2}\left\langle \mathbf{a}\,\mathbf{x}\,A\,A^{-1} + \mathbf{a}\,\widehat{A}\,\mathbf{x}\,\widehat{A}^{-1} \right\rangle_0 \\
&= \frac{1}{2}\left\langle \mathbf{a}\,\mathbf{x} - A\,\mathbf{a}\,\mathbf{x}\,A^{-1} + 2(\mathbf{a} \wedge A)\,\mathbf{x}\,A^{-1} \right\rangle_0 \\
&= \frac{1}{2}\left\langle \mathbf{a}\,\mathbf{x} - \mathbf{a}\,\mathbf{x}\,A^{-1}\,A - 0 \right\rangle_0 \\
&= \frac{1}{2}\langle \mathbf{a}\,\mathbf{x} - \mathbf{a}\,\mathbf{x} \rangle_0 = 0.
\end{align}$$

Identify the steps we took—they are all based on formulas in this chapter and you will see an instructive example of how the grade approach and the symmetry approach to the subspace products can be combined. In the rejection, we can substitute the geometric product in $(\mathbf{x} \wedge A)\,A^{-1}$ by a right contraction (see structural exercise 8).

Although we can replace the geometric products by contractions in both projection and rejection, there is not necessarily an advantage in doing so. The geometric product is invertible, and this often helps to simplify expressions, so that would plead in favor of leaving it. On the other hand, the contraction helps remind us of the containment relationships (subspaces taken out of other subspaces), and makes it easier to apply duality relationships to convert the subspace products.

Since projection and rejection are linear transformations, we can extend them from vectors to general blades as outermorphisms (and even to multivectors, by linearity). For the projection, we have done this before in Section 4.2.2, and we derived that it boils down to substituting the general blade $X$ for the vector $\mathbf{x}$, to obtain

> **Projection of $X$ onto $A$:**
> $$X \mapsto (X \rfloor A)\,A^{-1}. \tag{6.27}$$

However, the outermorphic extension of the rejection quickly disappoints, since it becomes a rather trivial operation (although indeed linear). For $(X \wedge A)\,A^{-1}$ is zero as soon as $X$ contains at least one common vector with $A$ (and if both $X$ and $A$ were bivectors in 3-D, this would always be the case). The easiest way to express the concept of the rejection of a general blade $X$ by a subspace $A$ is simply as the difference of $X$ and its projection: $X \mapsto X - (X \rfloor A)\,A^{-1}$. However, this is not a proper subspace operation; it does not necessarily produce a blade (see structural exercise 9), so it should be used with care. The rejection is not as tidy as it appears at first sight, when we introduced it for vectors.

---

### 6.4.3 The Other Division: Reflection

We have seen that the geometric product is noncommutative. This implies that geometric division (which is just geometric multiplication by the inverse) is not commutative either. We have also seen that division of $(\mathbf{x}\,\mathbf{a})$ by $\mathbf{a}$ on the right (i.e., right division) produces $\mathbf{x}$, as you would hope. Let us investigate the result of left division:

$$\begin{align}
\mathbf{a}^{-1}\,\mathbf{x}\,\mathbf{a} &= \mathbf{a}^{-1}\,(\mathbf{x}\,\mathbf{a}) \\
&= \frac{1}{\mathbf{a}\,\mathbf{a}}\,\mathbf{a}\,(\mathbf{x}\,\mathbf{a}) \\
&= \mathbf{a}\,\mathbf{x}\,\mathbf{a}\,\frac{1}{\mathbf{a}\,\mathbf{a}} \quad \text{[since scalars commute]} \\
&= (\mathbf{a}\,\mathbf{x})\,\mathbf{a}^{-1} \\
&= (\mathbf{a} \cdot \mathbf{x})\,\mathbf{a}^{-1} + (\mathbf{a} \wedge \mathbf{x})\,\mathbf{a}^{-1} \\
&= (\mathbf{x} \cdot \mathbf{a})\,\mathbf{a}^{-1} - (\mathbf{x} \wedge \mathbf{a})\,\mathbf{a}^{-1} \tag{6.28}
\end{align}$$

Compare this to the decomposition of (6.26) (which was made with right division):

$$(\mathbf{x}\,\mathbf{a})\,\mathbf{a}^{-1} = (\mathbf{x} \cdot \mathbf{a})\,\mathbf{a}^{-1} + (\mathbf{x} \wedge \mathbf{a})\,\mathbf{a}^{-1}.$$

We observe that in (6.28) the non-$\mathbf{a}$-component of $\mathbf{x}$ (which we called the rejection of $\mathbf{a}$) is *subtracted* from the projection of $\mathbf{x}$ onto $\mathbf{a}$, rather than added. Figure 6.4 shows the effect: the vector $\mathbf{x}$ is **reflected** in the $\mathbf{a}$-line. Only when $\mathbf{x}$ and $\mathbf{a}$ have the same direction is there no difference between the two types of division (but they then trivially both result in $\mathbf{x}$).

> **Figure 6.4:** Reflection of $\mathbf{x}$ in $\mathbf{a}$.

The bad news is that we have to be careful about the order of division, but the good news is that we have found a simple way to make line reflections: we can reflect $\mathbf{x}$ through $\mathbf{a}$ by sandwiching $\mathbf{x}$ between $\mathbf{a}$ and $\mathbf{a}^{-1}$ as $\mathbf{a}^{-1}\,\mathbf{x}\,\mathbf{a}$ or equivalently $\mathbf{a}\,\mathbf{x}\,\mathbf{a}^{-1}$. This is actually one of the basic constructions in geometric algebra, so common that it could be considered as a product in its own right, the "**versor product**" of $\mathbf{x}$ by $\mathbf{a}$. It can be extended to blades, and is then a powerful way to represent orthogonal transformations.

The next chapter is fully devoted to this important operation.

---

## 6.5 Further Reading

With the geometric product, you are almost ready to read the literature on geometric algebra. However, since that typically involves the special representations of operators by rotors and versors, we recommend that you wait for one more chapter.

But if you are interested in the historical roots, an inspirational piece (without rotors) that focuses on the development of number systems for geometry is David Hestenes' *Origins of Geometric Algebra*, Chapter 1 in [29]. It traces the developments from Euclid via Descartes to Grassmann, and, implicitly, Clifford. Leo can recommend it as the piece that got him hooked, back in 1997.

---

## 6.6 Exercises

### 6.6.1 Drills

**1.** Let $\mathbf{a} = \mathbf{e}_1 + \mathbf{e}_2$ and $\mathbf{b} = \mathbf{e}_2 + \mathbf{e}_3$ in a 3-D Euclidean space with orthonormal basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$. Compute the following expressions, giving the results relative to the basis $\{1, \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3, \mathbf{e}_2 \wedge \mathbf{e}_3, \mathbf{e}_3 \wedge \mathbf{e}_1, \mathbf{e}_1 \wedge \mathbf{e}_2, \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3\}$. Show your work.

   (a) $\mathbf{a}\,\mathbf{a}$  
   (b) $\mathbf{a}\,\mathbf{b}$  
   (c) $\mathbf{b}\,\mathbf{a}$  
   (d) $(\mathbf{e}_1 \wedge \mathbf{e}_2)\,\mathbf{a}$  
   (e) $\mathbf{a}\,(\mathbf{e}_1 \wedge \mathbf{e}_2)$  
   (f) $(\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3)\,\mathbf{a}$  
   (g) $\mathbf{a}^{-1}$  
   (h) $\mathbf{b}\,\mathbf{a}^{-1}$  
   (i) $(\mathbf{e}_1 \wedge \mathbf{e}_2)^{-1}$

**2.** Make a full geometric product multiplication table for the 8 basis elements $\{1, \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3, \mathbf{e}_1 \wedge \mathbf{e}_2, \mathbf{e}_2 \wedge \mathbf{e}_3, \mathbf{e}_3 \wedge \mathbf{e}_1, \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3\}$; (a) in a Euclidean metric $\mathbb{R}^{3,0}$ and (b) in a metric $\mathbb{R}^{2,1}$ with $\mathbf{e}_1 \cdot \mathbf{e}_1 = -1$.

---

### 6.6.2 Structural Exercises

**1.** Section 6.1.1 demonstrated the noninvertibility of contraction and outer product. Show by a geometrical example that the cross product of two vectors is not invertible either. Also give an algebraic argument based on its (invertible) relationship to the outer product.

**2.** The pseudoscalar is the highest-order blade in the algebra of $\mathbb{R}^n$. It receives its name because in many dimensions it is like a scalar in its commutation properties with vectors under the geometric product. In which dimensions does it commute with all vectors?

**3.** The outer product can be defined as the completely antisymmetric summed average of all permutations of geometric products of its factors, with a sign for each term depending on oddness or evenness of the permutation. For the 3-blade, this means:

$$\mathbf{x} \wedge \mathbf{y} \wedge \mathbf{z} = \frac{1}{3!}(\mathbf{x}\,\mathbf{y}\,\mathbf{z} - \mathbf{y}\,\mathbf{x}\,\mathbf{z} + \mathbf{y}\,\mathbf{z}\,\mathbf{x} - \mathbf{z}\,\mathbf{y}\,\mathbf{x} + \mathbf{z}\,\mathbf{x}\,\mathbf{y} - \mathbf{x}\,\mathbf{z}\,\mathbf{y})$$

Derive this formula.

**4.** The parts of a certain grade of a geometric product of blades are not necessarily blades. Show that in a 4-D space with orthonormal basis $\{\mathbf{e}_i\}_{i=1}^4$, a counterexample is $\langle \mathbf{e}_1\,(\mathbf{e}_1 + \mathbf{e}_2)\,(\mathbf{e}_2 + \mathbf{e}_3)\,(\mathbf{e}_1 + \mathbf{e}_4) \rangle_2$. (You may want to use software for this. If you find a simpler counterexample, let us know...)

**5.** Show that the definition of the scalar product as $A * B = \langle A\,B \rangle_0$ is equivalent to the determinant definition of (3.2). You will then also understand why the matrix in the latter definition has the apparently reversed $\mathbf{a}_i \cdot \mathbf{b}_{k-j}$ as element $(i,j)$ for $k$-blades.

**6.** Originally, we motivated the contraction as the counterpart of an outer product relative to the scalar product, which led to the implicit definition (3.6):

$$(X \wedge A) * B = X * (A \rfloor B).$$

Prove this part of the definition using the grade-based definitions of $\wedge$, $*$, and $\rfloor$ in Section 6.3.2.

**7.** In the formula $(\mathbf{x} \rfloor A^{-1})\,A$, we can replace the geometric product by a contraction, so that it is in fact the projection $(\mathbf{x} \rfloor A^{-1}) \rfloor A$. Show this, using the suggestion that $\mathbf{x} \rfloor A^{-1}$ might be a subblade of $A$—which you first need to demonstrate. After that, decompose $\mathbf{x} \rfloor A^{-1}$ as a product of orthogonal vectors, and evaluate the two formulas to show their equivalence.

**8.** As a counterpart of the previous exercise, show that $(\mathbf{x} \wedge A^{-1})\,A = (\mathbf{x} \wedge A^{-1}) \lfloor A$. (Hint: Write the second $A$ as a wedge product of orthogonal vectors, and peel them off one by one).

**9.** In a 4-D space with orthonormal basis $\{\mathbf{e}_i\}_{i=1}^4$, project the 2-blade $X = (\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_3 + \mathbf{e}_4)$ onto the 2-blade $A = (\mathbf{e}_1 \wedge \mathbf{e}_3)$. Then determine the rejection as the difference of $X$ and its projection. Show that this is not a blade. (See also structural exercise 5 of Chapter 2.)

**10.** Let an orthonormal coordinate system $\{\mathbf{e}_i\}_{i=1}^3$ be given in 3-D Euclidean space $\mathbb{R}^{3,0}$. Compute the support vector (i.e., the vector of the point on the line closest to the origin) of the line with direction $\mathbf{u} = \mathbf{e}_1 + 2\mathbf{e}_2 - \mathbf{e}_3$, through the point $\mathbf{p} = \mathbf{e}_1 - 3\mathbf{e}_2$. What is the distance of the line to the origin?

---

## 6.7 Programming Examples and Exercises

### 6.7.1 Exercise: Subspace Products Retrieved

The geometric product is the fundamental product of geometric algebra. Other products are derived from it. In these exercises, we follow Section 6.3 and implement two different ways of retrieving the left contraction and the outer product from the geometric product.

#### Exercise 1a: The Symmetry Approach (for Vectors Only)

Implement the outer product of a vector and any multivector using (6.10):

$$\mathbf{a} \wedge B = \frac{1}{2}(\mathbf{a}\,B + \widehat{B}\,\mathbf{a}).$$

Implement the left contraction of a vector and any multivector using (6.12):

$$\mathbf{a} \rfloor B = \frac{1}{2}(\mathbf{a}\,B - \widehat{B}\,\mathbf{a}).$$

The downloadable example code provides a bare-bones framework for doing this. You should complete the following functions:

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

After you have completed the functions, compile and run the example. The testing code will complain if you made a mistake in the implementation. You may need the following functions:

- `gradeInvolution(const mv &X)` computes the grade involution of a multivector.
- `gp(const mv &X, const mv &Y)` computes the geometric product of two multivectors. The `*` operator is bound to it, see Table 2.4.

#### Exercise 1b: The Grade Approach

Equations (6.19) and (6.20) provide another way to obtain the outer product and the left contraction, respectively:

$$A_k \wedge B_l \equiv \langle A_k\,B_l \rangle_{k+l}$$

$$A_k \rfloor B_l \equiv \langle A_k\,B_l \rangle_{l-k}$$

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

You may need the following functions:

- `takeGrade(const mv &X, int gradeUsageBitmap)` extracts grade parts from multivector. The `gradeUsageBitmap` is a bitwise or of the constants `GRADE_0`, `GRADE_1`, `GRADE_2`, and `GRADE_3`, which have values 1, 2, 4, 8, respectively. So, to extract grade $k$, you can also use `takeGrade(X, 1 << k)`. In the context of integers, the `<<` operator means bitwise shift left, of course.
- If you want to know whether a grade part is present in a multivector variable `X`, you can use `((X.gu() & GRADE_k) != 0)`, where `k` is the grade part index. For example `((X.gu() & GRADE_2) != 0)` is true when the bivector grade part is present in `X`.

---

### 6.7.2 Gram-Schmidt Orthogonalization

Geometric algebra does not require the representation of its elements in terms of a particular basis of vectors. Therefore, the specific treatment of issues like orthogonalization are much less necessary. Yet it is sometimes convenient to have an orthogonal basis, and such a basis is simple to construct using our products. We saw a first glimpse of this in the example of Section 3.11.1, using the contraction. Now that we have the geometric product we can give a more general and more complete treatment of orthogonalization.

Suppose we have a set of three vectors $\mathbf{v}_1$, $\mathbf{v}_2$, $\mathbf{v}_3$ in a Euclidean space, as in Figure 6.5(a), and would like to form them into an orthogonal basis. The perpendicularized frame will have its vectors denoted as $\mathbf{b}_1$, $\mathbf{b}_2$, $\mathbf{b}_3$; we arbitrarily keep $\mathbf{v}_1$ as the first of those (Figure 6.5(b)):

$$\mathbf{b}_1 \equiv \mathbf{v}_1.$$

Then we form the rejection of $\mathbf{v}_2$ by $\mathbf{v}_1$, which is automatically perpendicular to $\mathbf{v}_1$, by forming $\mathbf{v}_2 \wedge \mathbf{b}_1$ (Figure 6.5(c)) and dividing out $\mathbf{b}_1$ to orthogonalize it (Figure 6.5(d)):

$$\mathbf{b}_2 \equiv (\mathbf{v}_2 \wedge \mathbf{b}_1)/\mathbf{b}_1$$

That is our second vector of the frame. Now we take the rejection of $\mathbf{v}_3$ by $\mathbf{b}_1 \wedge \mathbf{b}_2$, which is perpendicular to both $\mathbf{b}_1$ and $\mathbf{b}_2$. Graphically, this is done by forming the trivector $\mathbf{v}_3 \wedge \mathbf{b}_1 \wedge \mathbf{b}_2$ (Figure 6.5(e)), and straightening it by dividing it by $\mathbf{b}_1 \wedge \mathbf{b}_2$ (Figure 6.5(f)). Algebraically, $\mathbf{b}_3$ is:

$$\mathbf{b}_3 \equiv (\mathbf{v}_3 \wedge \mathbf{b}_1 \wedge \mathbf{b}_2)/(\mathbf{b}_1 \wedge \mathbf{b}_2),$$

and we are done. This is the **Gram-Schmidt orthogonalization** procedure, rewritten in geometric algebra.

> **Figure 6.5:** Gram-Schmidt orthogonalization as repeated rejections.

Figure 6.6 gives code listing for orthogonalizing an $n$-dimensional basis. Note that we view the selection of the first vector as a (rather trivial) rejection to produce clean code. Also note that the function throws a `std::string` when it detects a null blade. The rest of the example is identical to that of Section 3.11.1.

```cpp
/**
 * Uses GA to perform Gram-Schmidt orthogonalization.
 * Throws std::string when input vectors 'vIn' are dependent.
 * Results are returned in 'vOut'.
 */
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

> **Figure 6.6:** Gram-Schmidt orthogonalization code (Example 2).

The result of the Gram-Schmidt orthogonalization implies that vectors spanning a subspace can be orthogonalized if they are invertible. This has consequences for the blade representing that subspace, for using the new basis we can write it as a geometric product of vectors $\mathbf{b}_1\,\mathbf{b}_2 \cdots \mathbf{b}_k$ rather than as an outer product of vectors $\mathbf{v}_1 \wedge \mathbf{v}_2 \wedge \cdots \wedge \mathbf{v}_k$. This is often useful in algebraic manipulation inside proofs, since the geometric product has richer algebraic properties; for instance, it is invertible, whereas the outer product is not. Since orthogonal vectors anticommute, we have: **an invertible blade can be written as a geometric product of anticommuting vectors**.

In non-Euclidean metrics, null vectors and null blades occur and those are noninvertible. This implies we cannot use the division the orthogonalization algorithm requires. Yet even in such a space, a blade can be written as a geometric product of anticommuting vectors; we just have to compute them in a different manner. We recommend the method described in Section 19.4 as the numerically stable way of finding these anticommuting vectors. The method amounts to computing the metric matrix of the blade and computing its eigenvalue decomposition; the eigenvectors are then used to compute the anticommuting vectors that span the blade.

---

## Summary

This chapter introduced the **geometric product**, the fundamental operation of geometric algebra that unifies the inner and outer products:

$$\mathbf{x}\,\mathbf{a} = \mathbf{x} \cdot \mathbf{a} + \mathbf{x} \wedge \mathbf{a}$$

Key properties:

1. **Invertible**: Unlike the inner or outer product alone, the geometric product allows division
2. **Associative**: $(AB)C = A(BC)$
3. **Distributive**: $A(B + C) = AB + AC$
4. **Non-commutative**: In general, $AB \neq BA$

The geometric product enables:
- **Division by vectors and blades** via the inverse $\mathbf{a}^{-1} = \mathbf{a}/(\mathbf{a} \cdot \mathbf{a})$
- **Projection**: $(\mathbf{x} \rfloor A)/A$
- **Rejection**: $(\mathbf{x} \wedge A)/A$  
- **Reflection**: $\mathbf{a}^{-1}\,\mathbf{x}\,\mathbf{a}$ (the "sandwich" operation)

The subspace products can be retrieved from the geometric product either through symmetry relations or through grade selection, demonstrating that the geometric product is indeed more fundamental.
