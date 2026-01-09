# Chapter 3: Metric Products of Subspaces

With the outer product of the previous chapter we can span subspaces. It also enables us to compare lengths on a line, areas in the same plane, and volumes in the same space. We clearly have a need to compare lengths on different lines and areas in different planes. The nonmetrical outer product cannot do that, so in this chapter we extend our subspace algebra with a real-valued scalar product to serve this (geo)metric need. It generalizes the familiar dot product between vectors to act between blades of the same grade.

Then we carry the algebra further, and investigate how the scalar product and the outer product interact. This automatically leads to an inner product between subspaces of different dimensionality that we call the **contraction**. The contraction of subspace $A$ onto subspace $B$ computes the part of $B$ least like $A$. That also gives us a dual way to characterize subspaces, through blades denoting their orthogonal complement.

With these metric products, we can easily compute geometrically useful operations like the orthogonal projection and determine reciprocal frames for nonorthonormal coordinate systems. We can even use them to embed the 3-D cross product, although we provide strong arguments for using geometric algebra constructs instead.

---

## 3.1 Sizing Up Subspaces

### 3.1.1 Metrics, Norms, and Angles

To establish quantitative measures of subspaces, we need them to be defined in an $n$-dimensional metric space $\mathbb{R}^n$. Such a metric space is just a vector space with a way to compute the norm of an arbitrary vector. That capability can be specified in several ways.

The mathematically preferred method is to use a **bilinear form** $Q$, which is a scalar-valued function of vectors. That is equivalent to defining an **inner product** $\mathbf{a} \cdot \mathbf{b} = Q[\mathbf{a}, \mathbf{b}]$ between two arbitrary vectors $\mathbf{a}$ and $\mathbf{b}$ (also known as the dot product). Algebraically, it returns a scalar from two vectors, so it is a mapping $\cdot : \mathbb{R}^n \times \mathbb{R}^n \rightarrow \mathbb{R}$, and it is linear and symmetric. It defines a metric on the vector space $\mathbb{R}^n$.

For most of this chapter, you can safely develop your intuition by thinking of a **Euclidean metric** in which the dot product is positive definite (the latter meaning that $\mathbf{a} \cdot \mathbf{a}$ is only zero when $\mathbf{a}$ is). Any positive definite metric can be rescaled to a Euclidean metric by choosing one's coordinate axes properly, so this appears quite general enough. These positive definite metrics are called **nondegenerate**. They may seem to be all you need to do Euclidean geometry. But as we already indicated in Chapter 1, there are useful models of Euclidean geometry that use vector spaces with non-Euclidean metrics in their representation of elements in physical space. Such **degenerate metrics** are no longer positive definite, so that for some vector $\mathbf{a}$ the inner product $\mathbf{a} \cdot \mathbf{a}$ can be negative. For some vectors, $\mathbf{a} \cdot \mathbf{a}$ can even be zero without $\mathbf{a}$ being zero; such a vector is called a **null vector**. More detail at this point would distract from our main goal in this chapter, which is to extend the dot product to blades, so we provide Appendix A as additional explanation.

As a notation for these metric spaces, we use $\mathbb{R}^{p,q}$ for a space with $p$ positive dimensions and $q$ negative dimensions. A space $\mathbb{R}^{n,0}$ is then an $n$-dimensional metric space that is effectively a space with a Euclidean metric. We write $\mathbb{R}^n$ if we are not specific on a metric. We will only start using degenerate metrics in Chapter 13.

We commonly use the algebraically defined inner product to compute geometrically useful properties. We compute the **length** (or **norm**) $\|\mathbf{a}\|$ of a vector $\mathbf{a}$, through

$$\|\mathbf{a}\|^2 = \mathbf{a} \cdot \mathbf{a},$$

and the cosine of the angle $\phi$ between vectors $\mathbf{a}$ and $\mathbf{b}$ through

$$\cos \phi = \frac{\mathbf{a} \cdot \mathbf{b}}{\|\mathbf{a}\| \|\mathbf{b}\|}. \tag{3.1}$$

We clearly want such capabilities for general subspaces of the same grade: to be able to assign an absolute measure to their weight (length, area, volume, etc.) and to compare their relative attitudes by an angle measure. We provide for this geometric need algebraically by introducing a real-valued scalar product between blades of the same grade.

---

### 3.1.2 Definition of the Scalar Product

The scalar product is a mapping from a pair of $k$-blades to the real numbers, and we will denote it by an asterisk ($*$). In mathematical terms, we define a function $* : \bigwedge^k \mathbb{R}^n \times \bigwedge^k \mathbb{R}^n \rightarrow \mathbb{R}$. (Do not confuse this terminology with the scalar multiplication in the vector space $\mathbb{R}^n$, which is a mapping $\mathbb{R} \times \mathbb{R}^n \rightarrow \mathbb{R}^n$, making a vector $\alpha \mathbf{x}$ out of a vector $\mathbf{x}$. As we have seen in the previous chapter, that is essentially the outer product.)

The inner product of vectors is a special case of this scalar product, as applied to vectors. When applied to $k$-blades, it should at least be backwards compatible with that vector inner product in the case of 1-blades. In fact, the scalar product of two $k$-blades $A = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k$ and $B = \mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_k$ can be defined using all combinations of inner products between their vector factors, and this provides that compatibility. It implies that the metric introduced in the original vector space $\mathbb{R}^n$ automatically tells us how to measure the $k$-blades in $\bigwedge^k \mathbb{R}^n$. The precise combination must borrow the antisymmetric flavor of the spanning product to make it independent of the factorization of the blades $A$ and $B$, so that it becomes a quantitative measure that can indeed be interpreted as an absolute area or (hyper)volume.

Let us just define it first, and then show that it works in the next few pages. We conveniently employ the standard notation of a determinant to define the scalar product. It may look intimidating at first, but it is compact and computable.

> **Definition:** For $k$-blades $A = \mathbf{a}_1 \wedge \ldots \wedge \mathbf{a}_k$ and $B = \mathbf{b}_1 \wedge \ldots \wedge \mathbf{b}_k$ and scalars $\alpha$ and $\beta$, the **scalar product** $* : \bigwedge^k \mathbb{R}^n \times \bigwedge^k \mathbb{R}^n \rightarrow \mathbb{R}$ is defined as
>
> $$\alpha * \beta = \alpha\beta$$
>
> $$A * B = \begin{vmatrix} \mathbf{a}_1 \cdot \mathbf{b}_k & \mathbf{a}_1 \cdot \mathbf{b}_{k-1} & \ldots & \mathbf{a}_1 \cdot \mathbf{b}_1 \\ \mathbf{a}_2 \cdot \mathbf{b}_k & \mathbf{a}_2 \cdot \mathbf{b}_{k-1} & \ldots & \mathbf{a}_2 \cdot \mathbf{b}_1 \\ \vdots & & \ddots & \vdots \\ \mathbf{a}_k \cdot \mathbf{b}_k & \mathbf{a}_k \cdot \mathbf{b}_{k-1} & \ldots & \mathbf{a}_k \cdot \mathbf{b}_1 \end{vmatrix} \tag{3.2}$$
>
> $$A * B = 0 \quad \text{between blades of unequal grades}$$

Note that the symmetry of the determinant implies some useful symmetries in the scalar product, which we can use in derivations:

$$B * A = A * B = A * \widetilde{B}. \tag{3.3}$$

Here the tilde denotes the **reversion** operation of (2.11) or (2.12).

---

### 3.1.3 The Squared Norm of a Subspace

The (squared) norm of a blade can now be defined in terms of its scalar product through

> **Squared norm:** $\|A\|^2 = A * \widetilde{A}$. $\tag{3.4}$

Let us verify that this algebraic expression indeed gives us a sensible geometric measure of the weight of the subspace represented by the blade, as an area or (hyper)volume.

**Vectors.** The scalar product of two vectors $\mathbf{a}$ and $\mathbf{b}$ is clearly equal to the standard dot product of the vectors, $\mathbf{a} \cdot \mathbf{b}$. In particular, $\mathbf{a} * \mathbf{a}$ will give us the squared length of the vector $\mathbf{a}$.

**2-Blades.** For a 2-blade $A$, factorizable by the outer product as $\mathbf{a}_1 \wedge \mathbf{a}_2$, we obtain

$$\|A\|^2 = (\mathbf{a}_1 \wedge \mathbf{a}_2) * (\mathbf{a}_1 \wedge \mathbf{a}_2)$$
$$= (\mathbf{a}_1 \wedge \mathbf{a}_2) * (\mathbf{a}_2 \wedge \mathbf{a}_1)$$
$$= \begin{vmatrix} \mathbf{a}_1 \cdot \mathbf{a}_1 & \mathbf{a}_1 \cdot \mathbf{a}_2 \\ \mathbf{a}_2 \cdot \mathbf{a}_1 & \mathbf{a}_2 \cdot \mathbf{a}_2 \end{vmatrix}$$
$$= (\mathbf{a}_1 \cdot \mathbf{a}_1)(\mathbf{a}_2 \cdot \mathbf{a}_2) - (\mathbf{a}_1 \cdot \mathbf{a}_2)^2.$$

This expression is more easily interpreted when we introduce the angle $\psi$ between $\mathbf{a}_1$ and $\mathbf{a}_2$ and use (3.1):

$$\|A\|^2 = (\mathbf{a}_1 \cdot \mathbf{a}_1)(\mathbf{a}_2 \cdot \mathbf{a}_2) - (\mathbf{a}_1 \cdot \mathbf{a}_2)^2$$
$$= \|\mathbf{a}_1\|^2 \|\mathbf{a}_2\|^2 \left(1 - (\cos \psi)^2\right)$$
$$= (\|\mathbf{a}_1\| \|\mathbf{a}_2\| \sin \psi)^2$$

We recognize this as the squared area of the parallelogram spanned by $\mathbf{a}_1$ and $\mathbf{a}_2$, precisely as we had hoped when we defined the outer product. Moreover, the properties of the determinant make this independent of the factorization of the blade: factorizing instead as $A = \mathbf{a}_1 \wedge (\mathbf{a}_2 + \lambda \mathbf{a}_1)$ results in the same value for the scalar product, as you can easily verify.

**$k$-Blades.** We know from the previous chapter that the $k$-volume associated with a $k$-blade $A = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k$ is proportional to the determinant of the matrix $[[A]] = [[\mathbf{a}_1 \cdots \mathbf{a}_k]]$. Once you realize that the scalar product definition of the squared norm can be written in terms of a matrix product as $\|A\|^2 = \det([[A]]^T [[A]])$, you can use the properties of determinants to simplify this to $\det([[A]])^2$. So indeed, for $k$-blades, we do compute the squared $k$-dimensional hypervolume.

---

### 3.1.4 The Angle Between Subspaces

Applying the scalar product to two different blades of the same grade, we also would hope that the scalar product $A * \widetilde{B}$ has a geometrical meaning that expresses the cosine of the relative angle $\phi$ between $A$ and $B$ in terms of the scalar product (in analogy to the dot product equation (3.1)). This is indeed the case, and the precise definition is

> **Angle:** $\cos \phi = \frac{A * \widetilde{B}}{\|A\| \|B\|}$. $\tag{3.5}$

Let us verify that the scalar product indeed yields the correct angle.

**Vectors.** This formula clearly works for vectors, since it reverts to the well-known vector formula $\cos \phi = (\mathbf{a} \cdot \mathbf{b})/(\|\mathbf{a}\| \|\mathbf{b}\|)$.

**2-Blades.** For 2-blades $A = \mathbf{a}_1 \wedge \mathbf{a}_2$ and $B = \mathbf{b}_1 \wedge \mathbf{b}_2$, we would define their relative angle conceptually by finding out what it takes to turn one onto the other. In 3-D, this involves first finding a common factor $\mathbf{c}$ with $\|\mathbf{c}\| = 1$. Next, we reshape the two 2-blades to have $\mathbf{c}$ as one component and a vector perpendicular to $\mathbf{c}$ as the other component:

$$\mathbf{a}_1 \wedge \mathbf{a}_2 = \mathbf{a} \wedge \mathbf{c} \quad \text{with } \mathbf{a} \cdot \mathbf{c} = 0,$$
$$\mathbf{b}_1 \wedge \mathbf{b}_2 = \mathbf{b} \wedge \mathbf{c} \quad \text{with } \mathbf{b} \cdot \mathbf{c} = 0.$$

Now evaluating the scalar product shows that the angle between the original 2-blades $A$ and $B$ has effectively been reduced to the angle between the vectors $\mathbf{a}$ and $\mathbf{b}$, for which we have a clear definition through the inner product formula:

$$A * \widetilde{B} = (\mathbf{a}_1 \wedge \mathbf{a}_2) * (\mathbf{b}_1 \wedge \mathbf{b}_2)$$
$$= (\mathbf{a} \wedge \mathbf{c}) * (\mathbf{b} \wedge \mathbf{c})$$
$$= (\mathbf{a} \wedge \mathbf{c}) * (\mathbf{c} \wedge \mathbf{b})$$
$$= \begin{vmatrix} \mathbf{a} \cdot \mathbf{b} & \mathbf{a} \cdot \mathbf{c} \\ \mathbf{c} \cdot \mathbf{b} & \mathbf{c} \cdot \mathbf{c} \end{vmatrix}$$
$$= \begin{vmatrix} \mathbf{a} \cdot \mathbf{b} & 0 \\ 0 & 1 \end{vmatrix}$$
$$= \mathbf{a} \cdot \mathbf{b}$$
$$= \|\mathbf{a}\| \|\mathbf{b}\| \cos \phi$$
$$= \|A\| \|B\| \cos \phi,$$

where we used that $\|A\| = \|\mathbf{a}\|$, easily derived from $\|A\|^2 = \|\mathbf{a} \wedge \mathbf{c}\|^2 = (\mathbf{a} \cdot \mathbf{a})(\mathbf{c} \cdot \mathbf{c}) - (\mathbf{a} \cdot \mathbf{c})^2 = \mathbf{a} \cdot \mathbf{a} = \|\mathbf{a}\|^2$, and the fact that norms are positive.

So the formula works for 2-blades, giving the angle we expect. Of course, in practice you would evaluate it directly algebraically using the definition, and without the geometric reshaping involving $\mathbf{c}$—the derivation was merely meant to show that the resulting value indeed gives the angle we desire.

**$k$-Blades.** The 2-blade example also motivates the result for general $k$-blades. All common factors between the two blades can be taken out (as $\mathbf{c}$ was in the example above), and they don't affect the cosine value. Of the remainder, there are three possibilities:

1. **Only scalars are left.** The blades were then multiples of each other, so their angle is 0, the cosine equals 1, and the scalar product is the product of their norms.

2. **We are left with one vector in each term.** We can then rotate one vector onto the other with a well-defined rotation, so their relative angle and its cosine are well defined through the usual dot product formula. We saw that in the 2-blade example above.

3. **We are left with totally disjoint subblades of at least grade 2.** We then need at least two rotations in orthogonal 2-blades to bring the subblades into alignment. The cosine computed by (3.5) is now equal to the product of the cosines of these orthogonal rotations, and therefore zero if at least one of them is over a right angle. In that case, the blades should be considered perpendicular. (An example of such a situation in 4-D space involves the 2-blades $A = \mathbf{e}_1 \wedge \mathbf{e}_3$ and $B = (\cos \alpha \, \mathbf{e}_1 - \sin \alpha \, \mathbf{e}_2) \wedge (\cos \beta \, \mathbf{e}_3 - \sin \beta \, \mathbf{e}_4)$. Verify that $A \wedge B = -\sin \alpha \sin \beta \, \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 \wedge \mathbf{e}_4$, so that they are indeed disjoint, while their cosine equals $A * \widetilde{B} = \cos \alpha \cos \beta$.)

Reinterpreting a zero cosine within this larger context, it means that two blades are perpendicular if they require at least one right-angle rotation to align them. This sounds like a reasonable enough extension of the concept of perpendicularity to such higher dimensional spaces. In this case, the algebraic imperative should probably inform our geometric intuition, which is ill-developed for more than three dimensions.

As an aside at this point, you may remark that the two useful geometrical properties we can recover from the scalar product (norm and cosine) both involve a reversion of the second argument. If we would have absorbed that reversion into the definition of the scalar product, those formulas would be simpler, and the definition would be tidied up as well (since we would get a matrix, of which element $(i, j)$ would be $\mathbf{a}_i \cdot \mathbf{b}_j$). This is true, and done in some mathematical texts such as [41] (though the reversion then pops up soon after, in the definition of the contraction product). We have chosen (3.2) since that coincides with the scalar product that you will find in geometric algebra literature, though defined in a different manner (and then quite naturally leading to that relatively reversed form, as we will see in Chapter 6).

---

## 3.2 From Scalar Product to Contraction

In the computation of the relative weight and the attitude of $k$-dimensional subspaces of the same grade, we sensibly reduced the scalar products to a lower-dimensional situation by factoring out a common blade. This dimension reduction of subspaces is of course very useful geometrically, since it focuses the computation on the geometrically different factors of the subspaces. We now formalize it algebraically, in terms of the outer product and scalar product so that our subspace algebra remains consistent. Fortunately, that formalization can be done relatively simply using the mathematical structure of the subspace algebra. The geometric interpretation then follows the algebraic justification.

### 3.2.1 Implicit Definition of Contraction

We first define a contraction operation implicitly. Our implicit definition is fashioned by using the scalar product on blades of the same grade with a common factor $A$, and then insisting that the scalar product of the two blades be equal to the scalar product of those blades with the common factor $A$ removed. That obviously constrains the algebraic properties of the removal operation and in fact makes the removal operation into a product that we identify with the contraction.

Let $B$ and $Y$ be blades of the same grade, with a common factor $A$. Writing $Y = X \wedge A$, let us try to remove this common factor $A$ from $Y$. We attempt to rewrite the scalar product $Y * B$ as a scalar product of $X$ with "$A$ removed from $B$". For now we denote the latter by $A \rfloor B$, an obviously asymmetrical notation for an obviously asymmetrical geometric concept. So we should have

$$(X \wedge A) * B = X * (A \rfloor B) \tag{3.6}$$

as a desired property of this new element $A \rfloor B$. This somewhat defines the properties of the new blade $A \rfloor B$ relative to this chosen $Y$ (and hence $X$). We could pick another $Y$ (still with a common factor of $A$ with $B$, so actually we have picked another $X$) and learn a bit more about the value of $A \rfloor B$. In fact, we can try all possibilities for $X$, of all grades, and if the metric is nondegenerate this actually completely determines what $A \rfloor B$ must be (see structural exercise 1 for an example). If the metric is degenerate, vectors can have an inner product of zero without being zero themselves, and this means that the value of $A \rfloor B$ cannot be determined completely (see structural exercise 2).

These properties imply that (at least in nondegenerate metrics) this element $A \rfloor B$ is not just a weird shorthand notation for a reduced blade, but that we have actually defined a new product in our subspace algebra, making a new blade from its two factors. We call $A \rfloor B$ the **contraction of $A$ onto $B$**.

We can easily compute the grade of this new element. The left side of (3.6) is nonzero if $\text{grade}(X) + \text{grade}(A) = \text{grade}(B)$, and the right side is nonzero if $\text{grade}(A \rfloor B) = \text{grade}(X)$. Therefore,

$$\boxed{\text{grade}(A \rfloor B) = \text{grade}(B) - \text{grade}(A)}$$

(with only positive grades allowed), and we see that *the contraction is a grade-reducing product between blades*. As a function mapping defined between blades of different grades $\rfloor : \bigwedge^k \mathbb{R}^n \times \bigwedge^l \mathbb{R}^n \rightarrow \bigwedge^{l-k} \mathbb{R}^n$, it is bilinear since both the outer product and the scalar product are. For the same reason, it is distributive over addition, so that we could lift its definition to the full Grassmann algebra context. But as always, we will mostly use it on blades, and we keep our explanation simple by restricting ourselves to blades in this chapter.

When the grades of $A$ and $B$ are the same, $X$ is a nonzero scalar; call this scalar $\xi$. Then the left-hand side of (3.6) is $(\xi \wedge A) * B = \xi (A * B)$, while the right-hand side equals $\xi (A \rfloor B)$. So for same-grade blades, the contraction is identical to the scalar product. We can therefore view the contraction as the general grade-reduction product applying to any pair of blades, automatically reducing to the more specific scalar product when it can. This reduces the number of symbols, so it is what one uses in practice—although it somewhat obscures the fact that the scalar product is more fundamental.

---

### 3.2.2 Computing the Contraction Explicitly

The definition of the contraction by (3.6) has two disadvantages: it is implicit, and it only works for nondegenerate metrics. We need a universally valid, explicitly constructive, computational formula for $A \rfloor B$.

We give it now, in an axiomatic form that immediately suggests a recursive program to evaluate the contraction. Of course we have to show that this procedure indeed computes the same product as the implicit definition of (3.6) (when that is defined), and that takes a bit of work.

> **Definition:** The **contraction** $\rfloor$ is a product producing an $(l - k)$-blade from a $k$-blade and an $l$-blade (so it is a bilinear mapping $\rfloor : \bigwedge^k \mathbb{R}^n \times \bigwedge^l \mathbb{R}^n \rightarrow \bigwedge^{l-k} \mathbb{R}^n$), with the following defining properties:
>
> $$\alpha \rfloor B = \alpha B \tag{3.7}$$
> $$B \rfloor \alpha = 0 \quad \text{if } \text{grade}(B) > 0 \tag{3.8}$$
> $$\mathbf{a} \rfloor \mathbf{b} = \mathbf{a} \cdot \mathbf{b} \tag{3.9}$$
> $$\mathbf{a} \rfloor (B \wedge C) = (\mathbf{a} \rfloor B) \wedge C + (-1)^{\text{grade}(B)} B \wedge (\mathbf{a} \rfloor C) \tag{3.10}$$
> $$(A \wedge B) \rfloor C = A \rfloor (B \rfloor C), \tag{3.11}$$
>
> where $\alpha$ is a scalar, $\mathbf{a}$ and $\mathbf{b}$ are vectors, and $A$, $B$, and $C$ are blades (which could be scalars or vectors as well as higher-dimensional blades).

It follows that the contraction has useful bilinear and distributive properties:

$$(A + B) \rfloor C = A \rfloor C + B \rfloor C \tag{3.12}$$
$$A \rfloor (B + C) = A \rfloor B + A \rfloor C \tag{3.13}$$
$$(\alpha A) \rfloor B = \alpha (A \rfloor B) = A \rfloor (\alpha B) \tag{3.14}$$

Before we relate this new explicit definition to the implicit definition of (3.6), note that it can indeed be used to compute the contraction product of arbitrary blades by the following procedure. We first split off a vector $\mathbf{a}$ from any first argument $k$-blade $A_k$ in the expression $A_k \rfloor B_l$. Then, writing $A_k \equiv A_{k-1} \wedge \mathbf{a}$, we use (3.11) as

$$A_k \rfloor B_l = (A_{k-1} \wedge \mathbf{a}) \rfloor B_l = A_{k-1} \rfloor (\mathbf{a} \rfloor B_l). \tag{3.15}$$

Here, $\mathbf{a} \rfloor B_l$ is an $(l - 1)$-blade. Therefore we have reduced the contraction of a $k$-blade onto an $l$-blade to that of a $(k-1)$-blade onto an $(l-1)$-blade. Proceeding by splitting off additional vectors, we can therefore reduce the expression completely to that of a scalar 0-blade and a $(k-l)$-blade, or an $(l-k)$-blade and a scalar (which gives 0 if $l \neq k$ by (3.8)).

**Example:** Let us compute the contraction of $A = \mathbf{e}_1 \wedge \mathbf{e}_2$ onto $B = \mathbf{e}_1 \wedge \mathbf{e}_3 \wedge \mathbf{e}_2$, with $\{\mathbf{e}_i\}_{i=1}^n$ an orthonormal basis in the Euclidean metric space $\mathbb{R}^{n,0}$, so that $\mathbf{e}_i \cdot \mathbf{e}_j = 0$ for $i \neq j$, and $\mathbf{e}_i \cdot \mathbf{e}_i = 1$. We indicate the rewriting steps:

$$(\mathbf{e}_1 \wedge \mathbf{e}_2) \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_3 \wedge \mathbf{e}_2)$$
$$= \mathbf{e}_1 \rfloor (\mathbf{e}_2 \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_3 \wedge \mathbf{e}_2)) \quad \text{by (3.11)}$$
$$= \mathbf{e}_1 \rfloor \left((\mathbf{e}_2 \rfloor \mathbf{e}_1) \wedge (\mathbf{e}_3 \wedge \mathbf{e}_2) - \mathbf{e}_1 \wedge (\mathbf{e}_2 \rfloor (\mathbf{e}_3 \wedge \mathbf{e}_2))\right) \quad \text{by (3.10)}$$
$$= \mathbf{e}_1 \rfloor \left((\mathbf{e}_2 \rfloor \mathbf{e}_1) \wedge (\mathbf{e}_3 \wedge \mathbf{e}_2) - \mathbf{e}_1 \wedge ((\mathbf{e}_2 \rfloor \mathbf{e}_3) \wedge \mathbf{e}_2 - \mathbf{e}_3 \wedge (\mathbf{e}_2 \rfloor \mathbf{e}_2))\right) \quad \text{by (3.10)}$$
$$= \mathbf{e}_1 \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_3) \quad \text{by (3.9)}$$
$$= (\mathbf{e}_1 \rfloor \mathbf{e}_1) \wedge \mathbf{e}_3 - \mathbf{e}_1 \wedge (\mathbf{e}_1 \rfloor \mathbf{e}_3) \quad \text{by (3.10)}$$
$$= \mathbf{e}_3.$$

We showed this computation in all its detail; with (3.16), below, such evaluations become one-liners, done on sight.

If you want to have the contraction defined for general multivectors in the context of a Grassmann algebra, you just use the linear properties of the contraction to write its arguments as a sum of blades, and use distributivity to reduce the result to a sum of contractions of blades.

---

### 3.2.3 Algebraic Subtleties

In Appendix B.2, we give the actual proof that the explicit definition of (3.7)–(3.11) agrees with the implicit definition (3.6). Reading through the proof will familiarize you with the algebra and its techniques, but it is better to first understand the geometrical meaning of the contraction as explained in the next section. So you had better leave the proof for a second pass.

Still, a really useful thing to come out of the detailed proof in the Appendix B is a formula that permits us to do the contraction $\mathbf{x} \rfloor A$ of a vector $\mathbf{x}$ on a blade $A$ by passing the operation $\mathbf{x} \rfloor$ through the factored blade. It is

$$\mathbf{x} \rfloor (\mathbf{a}_1 \wedge \mathbf{a}_2 \wedge \cdots \wedge \mathbf{a}_k) = \sum_{i=1}^{k} (-1)^{i-1} \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge \cdots \wedge (\mathbf{x} \rfloor \mathbf{a}_i) \wedge \cdots \wedge \mathbf{a}_k. \tag{3.16}$$

Since $\mathbf{x} \rfloor \mathbf{a}_i = \mathbf{x} \cdot \mathbf{a}_i$, this reduces the contraction of a vector onto a blade to a series of inner products. This basically implements the product occurring on the left-hand side of (3.15) as a one-liner, and therefore facilitates the evaluation of arbitrary contractions between blades. The special case for bivectors is

$$\mathbf{x} \rfloor (\mathbf{a}_1 \wedge \mathbf{a}_2) = (\mathbf{x} \cdot \mathbf{a}_1) \mathbf{a}_2 - (\mathbf{x} \cdot \mathbf{a}_2) \mathbf{a}_1 \tag{3.17}$$

We will use it often in computations where we chose to drop the wedges for the scalar multiples.

---

## 3.3 Geometric Interpretation of the Contraction

All the above formulas are the unavoidable algebraic consequences of our simple desire to design a product that could factor the metric scalar product. Now the time has come to investigate the geometric properties of this new product between subspaces. We begin with the following observations to develop our intuition about the contraction of two blades:

1. **$A \rfloor B$ is a blade when $A$ and $B$ are**, so $A \rfloor B$ represents an oriented subspace with specific attitude, orientation, and weight.

2. **The blade $A \rfloor B$ represents a subspace that is contained in $B$.** To show this, factor one vector $\mathbf{a}$ out of $A$, giving $A = A' \wedge \mathbf{a}$. Then, by (3.11), we obtain
   $$A \rfloor B = (A' \wedge \mathbf{a}) \rfloor B = A' \rfloor (\mathbf{a} \rfloor B).$$
   The term $\mathbf{a} \rfloor B$ is of the form (3.16), and it is definitely in $B$ since it only contains vectors of $B$. Now split another vector off and recurse—the property of remaining in $B$ inherits. Recursion stops when all that is left of $A$ is a scalar; then (3.7) shows that the final result is still in $B$. At any point in this recursion, we may encounter a 0 result, notably when the grade of $A$ exceeds that of $B$. But 0 is the empty blade, and as such contained in any blade (of any grade), so it is also in $B$.

3. **For a vector $\mathbf{x}$, having $\mathbf{x} \rfloor A = 0$ means that $\mathbf{x}$ is perpendicular to all vectors in $A$.** This follows immediately from the expansion (3.16): the right-hand side can only be zero if all $\mathbf{x} \rfloor \mathbf{a}_i = \mathbf{x} \cdot \mathbf{a}_i$ are zero; therefore $\mathbf{x}$ is perpendicular to all vectors in a basis of the subspace $A$; therefore $\mathbf{x}$ is perpendicular to all of $A$.

4. **The outcome of $A \rfloor B$ is perpendicular to the subspace $A$.** The proof is simple: take a vector $\mathbf{a}$ of $A$, then $\mathbf{a} \wedge A = 0$. Now by (3.11) for the contraction, $\mathbf{a} \rfloor (A \rfloor B) = (\mathbf{a} \wedge A) \rfloor B = 0 \rfloor B = 0$, so $\mathbf{a}$ is perpendicular to $A \rfloor B$ by item 3 above. But $\mathbf{a}$ was just an arbitrary vector in $A$. Choosing a set of vectors that forms a basis for $A$, we can thus show that all of them are perpendicular to $A \rfloor B$. Therefore, the whole subspace $A$ is perpendicular to the subspace $A \rfloor B$.

5. **The norm of the blade $A \rfloor B$ is proportional to the norm of $A$, the norm of $B$, and the cosine of the angle between $A$ and its projection onto $B$.** The derivation of this is a straightforward application of the norm and angle definitions. It may be found in Appendix B.4, but is probably better appreciated after learning about orthogonal projections in Section 3.6.

6. As we have seen,
   $$\text{grade}(A \rfloor B) = \text{grade}(B) - \text{grade}(A).$$
   This confirms the original motivation of $A \rfloor B$ as "$A$ taken out of $B$": the subspace $B$ loses the dimension of $A$ in the contraction. Since blades with negative grades do not exist, the contraction result is zero when $\text{grade}(A) > \text{grade}(B)$.

We attempt to summarize these results as:

> **Summary:** The contraction $A$ on $B$ of an $a$-blade $A$ and a $b$-blade $B$ is a specific subblade of $B$ of grade $b-a$ perpendicular to $A$, with a weight proportional to the norm of $B$ and to the norm of the projection of $A$ onto $B$.

When we equate blades with subspaces, we see that this is a compact geometric statement about the meaning of the contraction. It combines the two geometrical concepts of *containment in a subspace* and *perpendicularity* into one product with well-defined algebraic properties. Still, the statement is rather involved. We provide a more geometrically intuitive visualization of the contraction in Section 3.6 (in terms of the projection of $A$ onto $B$).

For a 2-blade $B$ and a vector $\mathbf{x}$, the situation in 3-D is depicted in Figure 3.3: $\mathbf{x} \rfloor B$ is a vector on a line in the plane determined by $B$, perpendicular to $\mathbf{x}$. (Obviously, all vectors along the line determined by the $\mathbf{x} \rfloor B$ would be sensible results, as long as they are linear in the magnitudes of $\mathbf{x}$ and $B$.) Intuitively, you could think of $\mathbf{x} \rfloor B$ as the blade of the largest subspace of $B$ that is most unlike $\mathbf{x}$.

The geometric meaning of the contraction as the largest subspace most unlike a given space even extends to the extreme cases of scalars interpreted geometrically as weighted points at the origin, as long as you realize that the algebraic blade "zero" should be interpreted geometrically as the empty subspace. We give structural exercises 4–6 to explore that point and convince you of the consistency across the whole range of validity.

We stated that the norm of $A \rfloor B$ is in general proportional to the norms of $B$ and the projection of $A$ onto $B$. In the example of Figure 3.3, this is perhaps most easily shown by introducing orthonormal coordinates $\{\mathbf{e}_i\}_{i=1}^3$. Choose them such that $B = \|B\| \mathbf{e}_1 \wedge \mathbf{e}_2$ and $\mathbf{x} = \|\mathbf{x}\| (\mathbf{e}_1 \cos \phi + \mathbf{e}_3 \sin \phi)$, then you compute easily that $\mathbf{x} \rfloor B = \|\mathbf{x}\| \|B\| \cos \phi \, \mathbf{e}_2$, confirming all aspects of attitude, orientation, and weight.

When $\mathbf{x}$ is perpendicular to $B$, the contraction is zero. In the example we should interpret that geometrically as the nonuniqueness of a 1-D subspace of the 2-blade $B$ that is perpendicular to $\mathbf{x}$ (any homogeneous line in $B$ would do). The small weight of the contraction blade in an almost perpendicular situation is then an indication of the numerical significance or numerical instability of the result. That interpretation is confirmed by the opposite situation: when $\mathbf{x}$ is contained in $B$, the cosine is 1, and the contraction is the orthogonal vector within the plane. Nothing is lost in the projection to the plane that determines the norm of $\mathbf{x} \rfloor B$, and in that sense $\mathbf{x}$ is as stably perpendicular to its projection as it can ever be.

---

## 3.4 The Other Contraction

We motivated the original definition of $A \rfloor B$ in (3.6) in terms of geometrical subspaces as "$A$ taken out of $B$". This is clearly asymmetrical in $A$ and $B$, and we could also have used the same geometrical intuition to define an operation $B \lfloor A$, interpreted as "take $B$ and remove $A$ from it." The two are so closely related that we really only need one to set up our algebra, but occasionally formulas get simpler when we switch over to this other contraction. Let us briefly study their relationship.

Define the **right contraction** implicitly by taking $A$ out of the scalar product:

> **Right contraction:** $B * (\widetilde{A} \wedge X) = (B \lfloor A) * X$. $\tag{3.18}$

This is a simple interchange of the order of factors relative to (3.6). The relationship between the two contractions is easily established from the reversion symmetry of the scalar product (3.3) as

$$B \lfloor A = \widetilde{(\widetilde{A} \rfloor \widetilde{B})} = (-1)^{a(b+1)} A \rfloor B, \tag{3.19}$$

with $a = \text{grade}(A)$ and $b = \text{grade}(B)$. The first equation follows from a straightforward computation using the reversion signs: $X * (B \lfloor A) = \widetilde{X} * \widetilde{(B \lfloor A)} = \widetilde{(B \lfloor A)} * \widetilde{X} = B * (\widetilde{A} \wedge \widetilde{X}) = B * \widetilde{(X \wedge A)} = \widetilde{(X \wedge A)} * B = (X * A \rfloor B)$. So $B \lfloor A$ and $A \rfloor B$ differ only by a grade-dependent sign, which can be computed by using (2.12) repeatedly.

Although it therefore does not lead to a fundamentally new product, this right contraction is convenient at times for compact notation of relationships. It can be developed axiomatically along the same lines as the regular (left) contraction, and has a similar (but reverse) grade reduction property:

$$\text{grade}(B \lfloor A) = \text{grade}(B) - \text{grade}(A).$$

For vectors, both contractions reduce to the familiar inner product, so we can see them as generalized inner products now acting on blades (or even on multivectors).

The terms we have used for the contractions correspond to the usage in [39]. It is somewhat unfortunate that the left contraction is denoted by a right parenthesis symbol $\rfloor$, and the right contraction by a left symbol $\lfloor$. The terminology is that something is being contracted from the left or from the right, and the hook on the parenthesis points to the contractor rather than to the contractee. We pronounce the left contraction $A \rfloor B$ as "$A$ (contracted) on $B$," and the right contraction $B \lfloor A$ as "$B$ (contracted) by $A$." We will mostly use the left contraction to express our results.

Most other authors use definitions of inner products that differ from both left and right contraction. The geometry behind those products is essentially the same as for the contractions, but their algebraic implementation generally leads to more involved and conditional expressions for advanced results. We explore these issues in detail in Section B.1 of Appendix B.

---

## 3.5 Orthogonality and Duality

### 3.5.1 Nonassociativity of the Contraction

Algebraically, the contraction is **nonassociative**, for $A \rfloor (B \rfloor C)$ is not equal to $(A \rfloor B) \rfloor C$. It cannot be, for even the grades of both expressions are unequal, being respectively $\text{grade}(C) - \text{grade}(B) - \text{grade}(A)$, and $\text{grade}(C) - \text{grade}(B) + \text{grade}(A)$. So what do the two expressions $A \rfloor (B \rfloor C)$ and $(A \rfloor B) \rfloor C)$ represent, and how are they different?

- The geometrical interpretation of the expression $A \rfloor (B \rfloor C)$ is: first restrict the outcome to $B \rfloor C$, the subspace of $C$ that is perpendicular to $B$; then from that subspace pick the subspace perpendicular to $A$. We can of course construct this as the subspace that is in $C$ and perpendicular to both $A$ and to $B$. The equivalence of both procedures is the geometrical interpretation of the defining property (3.11), which reads

$$(A \wedge B) \rfloor C = A \rfloor (B \rfloor C) \quad \text{(universally valid)} \tag{3.20}$$

- The other possibility of composing the contractions $(A \rfloor B) \rfloor C$ is not part of our defining properties. It can also be simplified to an expression using the outer product, though the result is not universal but conditional:

$$(A \rfloor B) \rfloor C = A \wedge (B \rfloor C) \quad \text{when } A \subseteq C \tag{3.21}$$

The proof is nontrivial, and is in Section B.3 of Appendix B.

The geometrical interpretation of this formula is a bit of a tongue-twister. The left-hand side, $(A \rfloor B) \rfloor C$, asks us to take the part of a subspace $B$ that is most unlike $A$ (in the sense of orthogonal containment), and then remove that from $C$. The right-hand side, $A \wedge (B \rfloor C)$, suggests that we have then actually only taken $B$ out of $C$, and have effectively put $A$ back into the result. That feels more or less correct, but not quite. To make it hold, we need the condition that $A$ was in $C$ to begin with—we could not "reconstruct" any other parts of $A$ by the double complementarity of $(A \rfloor B) \rfloor C$.

We will refer to (3.20) and (3.21) together as the **duality formulas** for reasons that become clear below.

---

### 3.5.2 The Inverse of a Blade

There is no unique inverse $A^{-1}$ of a blade $A$ that would satisfy the equation $A \rfloor A^{-1} = 1$, for we can always add a blade perpendicular to $A$ to $A^{-1}$ and still satisfy the equation. Still, we can define a unique blade that works as an inverse of a $k$-blade $A_k$ relative to the contraction. We define it as[^1]

> **Inverse of a blade:** $A_k^{-1} \equiv \frac{\widetilde{A}_k}{\|A_k\|^2} = (-1)^{k(k-1)/2} \frac{A_k}{\|A_k\|^2}$. $\tag{3.22}$

[^1]: Later, when we have introduced the associative geometric product in Chapter 6, this will be found to be "the" inverse, relative to that product. Since that inverse can be defined completely in terms of the contraction, we have chosen to define it now and use the same symbol to denote it, to prevent a proliferation of notations.

Note that this is a blade of the same grade as $A_k$, representing a subspace with the same attitude, and differing from $A_k$ only by its weight and possibly its orientation. You can easily verify that this is indeed an inverse of $A$ for the contraction:

$$A_k \rfloor A_k^{-1} = A_k \rfloor \frac{\widetilde{A}_k}{\|A_k\|^2} = \frac{A_k \rfloor \widetilde{A}_k}{A_k * \widetilde{A}_k} = \frac{A_k \rfloor \widetilde{A}_k}{A_k \rfloor \widetilde{A}_k} = 1, \tag{3.23}$$

using the equivalence of scalar product and contraction for blades of equal grade.

The inverse of a vector $\mathbf{a}$ is thus

$$\mathbf{a}^{-1} = \mathbf{a}/\|\mathbf{a}\|^2,$$

and as you would expect, a unit vector is its own inverse. That is not true for general blades, as shown by the inverses of the unit blades $\mathbf{e}_1 \wedge \mathbf{e}_2$ and $\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$ (defined in the standard orthonormal basis):

$$(\mathbf{e}_1 \wedge \mathbf{e}_2)^{-1} = \mathbf{e}_2 \wedge \mathbf{e}_1 = -\mathbf{e}_1 \wedge \mathbf{e}_2$$
$$(\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3)^{-1} = \mathbf{e}_3 \wedge \mathbf{e}_2 \wedge \mathbf{e}_1 = -\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$$

When we use unit pseudoscalars $I_n = \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \cdots \wedge \mathbf{e}_n$ for an $n$-dimensional Euclidean metric space $\mathbb{R}^{n,0}$, the inverse is simply the reverse:[^2]

$$I_n^{-1} = \widetilde{I}_n.$$

[^2]: In a general metric space $\mathbb{R}^{p,q}$ (see A.1 in Appendix A), this changes to $I_{p,q}^{-1} = (-1)^q \widetilde{I}_{p,q}$, as you can easily verify.

Inverses of unit pseudoscalars are important in the formulation of duality; for consistency in orientations, you should always remember to include the reverse.

For a **null blade**, which has norm zero (see Appendix A), the inverse is not defined. In computations involving the contractions of null blades, one can substitute it by the reciprocal of the blade, which we will meet in Section 3.8. This is a more involved concept, only well defined in "balanced" algebras. We have preferred to keep the formulas in our initial explanations simple, by focusing on nondegenerate metrics and the inverse rather than general metrics and the reciprocal. When we start using the degenerate metrics seriously (in Chapter 13), we will be more careful.

---

### 3.5.3 Orthogonal Complement and Duality

Given a $k$-blade $A_k$ in the space $\mathbb{R}^n$ with unit pseudoscalar $I_n$, its **dual** is obtained by the dualization mapping $^* : \bigwedge^k \mathbb{R}^n \rightarrow \bigwedge^{n-k} \mathbb{R}^n$ defined by

> **Dualization:** $A_k^* = A_k \rfloor I_n^{-1}$.

The operation "taking the dual" is linear in $A_k$, and it results in a blade with the same magnitude as $A_k$ and a well-defined orientation. The reason for the inverse pseudoscalar is clear when we use it on a (hyper) volume blade such as $\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}$. We have seen in the previous chapter how such an $n$-blade is proportional to the pseudoscalar $I_n$ by a scalar that is the oriented volume. With the definition of dual, that oriented scalar volume is simply its dual, $(\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c})^*$, without extraneous signs.

**Example in 2-D:** The dual of a vector in a space with counterclockwise orientation is the clockwise vector perpendicular to it. This is easily proved: choose coordinates such that $\mathbf{a} = \alpha \mathbf{e}_1$ and $I_2 = \mathbf{e}_1 \wedge \mathbf{e}_2$. Then

$$\mathbf{a}^* = \alpha \mathbf{e}_1 \rfloor (\mathbf{e}_2 \wedge \mathbf{e}_1) = -\alpha \mathbf{e}_2.$$

This vector is indeed perpendicular to $\mathbf{a}$. But note that the expression $\mathbf{a} \rfloor \widetilde{I}_2$ requires no coordinates to denote such a vector perpendicular to $\mathbf{a}$. In fact, for a vector $\mathbf{a}$ in the $I_2$-plane, $\rfloor\widetilde{I}_2$ *acts like an operator that rotates $\mathbf{a}$ clockwise over $\frac{1}{2}\pi$ in the plane $I_2$*, independent of any coordinate system. We will get back to such operators in Chapter 7.

Taking the dual again does not result in the original vector, but in its opposite:

$$(\mathbf{a}^*)^* = -\alpha \mathbf{e}_2 \rfloor (\mathbf{e}_2 \wedge \mathbf{e}_1) = -\alpha \mathbf{e}_1 = -\mathbf{a}.$$

This is a property of other dimensionalities as well. Let us derive the general result:

$$(A_k^*)^* = (A_k \rfloor I_n^{-1}) \rfloor I_n^{-1} = A_k \wedge (I_n^{-1} \rfloor I_n^{-1})$$
$$= (-1)^{n(n-1)/2} A_k \wedge (I_n \rfloor \widetilde{I}_n) = (-1)^{n(n-1)/2} A_k \wedge 1 = (-1)^{n(n-1)/2} A_k$$

(we used (3.21) in this derivation). There is a dimension-dependent sign, with the pattern $+ + - - + + - - \cdots$, so for 2-D and 3-D, this minus sign in the double reversion occurs. If we need to be careful about signs, we should use an **undualization** operation to retrieve the proper element of which the dual would be $A$. It is simply defined through:

> **Undualization:** $A^{-*} \equiv A \rfloor I_n$.

If there is any ambiguity concerning the pseudoscalar relative to which the duality is taken, then we will write it out in full.

**Example in 3-D:** Figure 3.5 illustrates dualization in $\mathbb{R}^{3,0}$ with its Euclidean metric. We define a right-handed pseudoscalar $I_3 \equiv \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$ relative to the standard orthonormal basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$. A general vector $\mathbf{a} = a_1\mathbf{e}_1 + a_2\mathbf{e}_2 + a_3\mathbf{e}_3$ is dualized to

$$\mathbf{a}^* = \mathbf{a} \rfloor I_3^{-1}$$
$$= (a_1\mathbf{e}_1 + a_2\mathbf{e}_2 + a_3\mathbf{e}_3) \rfloor (\mathbf{e}_3 \wedge \mathbf{e}_2 \wedge \mathbf{e}_1)$$
$$= -a_1 \mathbf{e}_2 \wedge \mathbf{e}_3 - a_2 \mathbf{e}_3 \wedge \mathbf{e}_1 - a_3 \mathbf{e}_1 \wedge \mathbf{e}_2.$$

By our geometric interpretation of the contraction, this 2-blade $A \equiv \mathbf{a}^*$ denotes a plane that is the **orthogonal complement** to $\mathbf{a}$. Note that $A$ has the same coefficients as $\mathbf{a}$ had on its orthonormal basis of vectors, but now on a 2-blade basis that can be associated with the orthonormal vector basis in a natural manner. In this way, a vector is naturally associated with a 2-blade, in 3-D space. (Of course, this is similar to what we would do classically: we use $\mathbf{a}$ as the normal vector for the plane $A$, but that only works in 3-D space.)

Whenever you have forgotten the signs involved in a desired dualization, it is simplest to make a quick check using a standardized situation of vectors and 2-blades along the axes in an orthonormal basis $\{\mathbf{e}_i\}_{i=1}^n$ (such as $\mathbf{e}_1^* = \mathbf{e}_1 \rfloor (\mathbf{e}_2 \wedge \mathbf{e}_1) = -\mathbf{e}_2$, so this is a clockwise rotation). But this usage of coordinates should only be a check: with enough practice, you will be able to avoid the extraneous coordinates in the specification of your actual geometrical computations. This will save unnecessary writing and maintain clear geometrical relationships of the elements introduced.

---

### 3.5.4 The Duality Relationships

There is a dual relationship between the contraction and the outer product, which we can see explicitly by using the two properties (3.20) and (3.21) when $C$ is a unit pseudoscalar $I_n$ for the space $\mathbb{R}^n$. Since all blades are contained in the pseudoscalar, both properties now become universally valid and can be written using the duality operator:

$$\boxed{(A \wedge B)^* = A \rfloor (B^*)}$$
$$(A \rfloor B)^* = A \wedge (B^*) \quad \text{for } A \subseteq I. \tag{3.24}$$

These duality relationships are very important in simplification of formulas. You can often evaluate an expression a lot more compactly by taking the dual, change a contraction into an outer product, use its properties, undualize, and so on. We will see many examples of this technique in the coming chapters.

---

### 3.5.5 Dual Representation of Subspaces

The duality relationships permit us to represent geometrical subspaces in a dual manner. We have seen in Section 2.8 how a blade $A$ can represent a subspace directly, checking whether a vector $\mathbf{x}$ is in it by testing whether $\mathbf{x} \wedge A = 0$. We introduce the **dual representation** of a subspace $A$ simply by taking the dual of the defining equation $\mathbf{x} \wedge A = 0$ using (3.24). We obtain

> $D = A^*$ is the **dual representation** of $A$ : $( \mathbf{x} \in A \Longleftrightarrow \mathbf{x} \rfloor D = 0 )$.

The blade $D$ that dually represents the subspace $A$ is also a direct representation of the orthogonal complement of the subspace $A$. You can confirm this by finding all vectors $\mathbf{y}$ for which $\mathbf{y} \wedge D = 0$ and again using (3.24). This mirrors and generalizes the practice in elementary linear algebra to have a normal vector $\mathbf{n}$ represent a homogeneous hyperplane through the equation $\mathbf{x} \cdot \mathbf{n} = 0$.

Once we really start doing geometry in Part II, we will very flexibly switch between the direct representation and the dual representation, and this will be a powerful way of finding the simplest expressions for our geometrical operations. It is therefore pleasant to have both representations present within our algebra of blades.

Readers who are acquainted with Grassmann-Cayley algebras will note that we have used the contraction to construct the dual representation, and that this therefore involves the metric of the space. Grassmann-Cayley algebra has a seemingly nonmetric way of making dualities, using mathematical constructions called 1-forms. We view these as a disguised form of metric. Since we will be mostly working in $\mathbb{R}^n$ and usually have an obvious metric, the metric road to duality through the contraction is more convenient in our applications. It saves us from having to introduce a lot of mathematical terminology that we do not really need.

---

## 3.6 Orthogonal Projection of Subspaces

With the contraction and the inverse, we have the ingredients to construct the **orthogonal projection** of a subspace represented by a blade $X$ onto a subspace represented by a blade $B$. We assume that this blade $B$ has an inverse relative to the contraction, the blade $B^{-1}$.

To introduce the construction, consider Figure 3.6, which depicts the projection of a vector on a 2-blade. The vector $\mathbf{x} \rfloor B$ is a vector in the $B$-plane perpendicular to $\mathbf{x}$, and that means that it is also perpendicular to the projection of $\mathbf{x}$ on $B$. Therefore we can simply rotate $\mathbf{x} \rfloor B$ over $\pi/2$ in the $B$-plane to obtain the projection. A rotation with the correct sign is performed by the dual within that plane (i.e., by the operation $\rfloor B^{-1}$). The string of operations then yields $(\mathbf{x} \rfloor B) \rfloor B^{-1}$, as depicted in the figure.

Inspired by this 3-D example, we define the **(orthogonal) projection** $P_B[\,] : \mathbb{R}^n \rightarrow \mathbb{R}^n$ as

> **Orthogonal projection of vector $\mathbf{x}$ onto $B$:** $P_B[\mathbf{x}] \equiv (\mathbf{x} \rfloor B) \rfloor B^{-1}$. $\tag{3.25}$

This mapping is linear in $\mathbf{x}$, but nonlinear in $B$. In fact, only the attitude of $B$ affects the outcome; its weight and orientation are divided out. In this operation, $B$ acts as an unoriented, unweighted subspace.

A projection should be **idempotent** (applying it twice should be the same as applying it once). This is easily verified using the duality properties of Section 3.5.1:

$$P_B[P_B[\mathbf{x}]] = \left(\left((\mathbf{x} \rfloor B) \rfloor B^{-1}\right) \rfloor B\right) \rfloor B^{-1} = \left((\mathbf{x} \rfloor B) \rfloor B^{-1}\right) \wedge (B \rfloor B^{-1})$$
$$= \left((\mathbf{x} \rfloor B) \rfloor B^{-1}\right) \wedge 1 = P_B[\mathbf{x}].$$

To investigate its properties further, let us write $\mathbf{x}$ as $\mathbf{x} = \mathbf{x}_\perp + \mathbf{x}_\parallel$, where $\mathbf{x}_\perp \rfloor B = 0$, while $\mathbf{x}_\parallel \rfloor B \neq 0$. In a space with a Euclidean metric, we would say that $\mathbf{x}_\perp$ is perpendicular to $B$. The projection kills this perpendicular part of $\mathbf{x}$,

$$P_B[\mathbf{x}] = (\mathbf{x}_\perp \rfloor B) \rfloor B^{-1} + (\mathbf{x}_\parallel \rfloor B) \rfloor B^{-1} = 0 + \mathbf{x}_\parallel \wedge (B \rfloor B^{-1}) = \mathbf{x}_\parallel,$$

leaving the part $\mathbf{x}_\parallel$ that is contained in $B^{-1}$ and hence in $B$. This is just what you would expect of a projection.

When you consider the projection of a general blade $X$ onto the blade $B$, the principles are the same. The contraction $X \rfloor B$ produces a subblade of $B$ that is perpendicular to $X$ and of grade $(b - x)$, where $b \equiv \text{grade}(B)$ and $x \equiv \text{grade}(X)$. The projection is a subblade of $B$ of the same grade as $X$. Such a blade can be made from $X \rfloor B$ by dualization of the contraction. The correct sign and magnitude to be in agreement with the formula for the vector projection implies the use of $B^{-1}$. In total, we obtain for the orthogonal projection of a blade $X$ onto a blade $B$:

> **Projection of $X$ onto $B$:** $P_B[X] \equiv (X \rfloor B) \rfloor B^{-1}$. $\tag{3.26}$

Note that if you try to project a subspace of too high a grade onto $B$, the contraction automatically causes the result to be zero. Even when $\text{grade}(X) \le \text{grade}(B)$ this may happen; it all depends on the relative geometric positions of the subspaces, as it should.

The reasoning to achieve the projection formula (3.26) was rather geometrical, but it can also can be derived in a more algebraic manner. Section B.4 in Appendix B gives a proof in terms of the present chapter, but the next chapter gives a perhaps more satisfying proof by naturally extending the projection of a vector to act on a blade, in Section 4.2.2.

Since the projection is more intuitive than the contraction, you may prefer to make (3.26) the formulation of the geometry of the contraction. Through a contraction by $B$ on both sides, we obtain

$$X \rfloor B = P_B[X] \rfloor B,$$

and this inspires the following characterization of the contraction:

> The contraction $A \rfloor B$ is the subblade of $B$ of grade $b - a$ that is dual (by $B$) to the projection of $A$ onto $B$.

As long as you realize that "dual by $B$" is shorthand for $\rfloor B$, the geometrical properties of the contraction listed in Section 3.3 follow easily.

This geometric characterization of $A \rfloor B$ probably makes a lot more intuitive sense to you than our earlier description of $A \rfloor B$ as the part of $B$ least like $A$, for the description in terms of projection and perpendicularity (which is what the dual signifies) better matches the usual primitive operations of linear algebra. Yet algebraically, the contraction is the simpler concept, for unlike the projection of $A$ onto $B$, *it is linear in both $A$ and $B$*. That makes it a better choice than the projection as a primitive operation on subspaces, algebraically on a par with the outer product $A \wedge B$, even though we have to get used to its geometry.

To return to (3.26), it is actually somewhat better to define the projection through

> **Projection of $X$ onto $B$:** $P_B[X] \equiv (X \rfloor B^{-1}) \rfloor B$. $\tag{3.27}$

Writing it in this manner makes it obviously an element of $B$ rather than of $B^{-1}$. For nonnull blades, there is no difference in outcome, since it simply moves the normalization $1/\|B\|^2$. For the null-blades that may occur in degenerate metrics (see Appendix A), the inverse does not exist and needs to be replaced by the reciprocal relative to the contraction. The reciprocal of $B$ may then differ from $B$ by more than scaling, and even have a different attitude. The projection (3.26) is no longer guaranteed to produce a subblade of $B$, as we would want, but (3.27) always will.

---

## 3.7 The 3-D Cross Product

In 3-D Euclidean space $\mathbb{R}^{3,0}$, one is used to having the cross product available. In the algebra as we are constructing it now, we have avoided it, for two reasons: we can make it anyway if we need it, and better still, another construction can take its place that generalizes to arbitrary dimensions for all uses of the cross product. We demonstrate these points in this section.

### 3.7.1 Uses of the Cross Product

First, when do we use a cross product in classical vector computations in 3-D Euclidean space?

**Normal Vectors.** The cross product is used to determine the vector $\mathbf{a}$ perpendicular to a plane $A$, called the **normal vector** of the plane. This vector can be obtained from two vectors $\mathbf{x}$ and $\mathbf{y}$ in the plane as their cross product $\mathbf{x} \times \mathbf{y}$. This works in 3-D space only (though it is often used in 2-D space as well, through the cheat of embedding it in a 3-D space). This representation is then used to characterize the plane, for instance, to perform reflections in it when the plane is the tangent plane to some object that is to be rendered in computer graphics. Unfortunately, this representation of the tangent plane does not transform simply under linear transformations as a regular vector, and requires special code to transform the normal vector (you need to use the inverse transpose mapping, scaled by a determinant, as we will show in Section 4.3.6).

**Rotational Velocities.** We also use the cross product to compute the velocity of a point at location $\mathbf{x}$ turning around an axis $\mathbf{a}$ (also indicated by a vector). Then the instantaneous velocity is proportional to $\mathbf{a} \times \mathbf{x}$. Yet the indication of a rotation by a rotation axis works only in 3-D space; even in 2-D, the axis points out of the plane of the space, and is therefore not really a part of it. In 4-D, a rotation in a plane needs a plane of axes to denote it, since there are two independent directions perpendicular to any plane. Even for computations in 3-D Euclidean geometry, such higher-dimensional rotations are relevant: we need them in the 5-D operational model $\mathbb{R}^{4,1}$ to perform 3-D motions efficiently (in Chapter 13).

**Intersecting Planes.** A third use is to compute the intersection of two homogeneous planes $A$ and $B$ in 3-D space: if both are characterized by their normals $\mathbf{a}$ and $\mathbf{b}$, the line of intersection is along the vector $\mathbf{a} \times \mathbf{b}$. This construction is a bit of a trick, specific for that precise situation, and it does not generalize in a straightforward manner to the intersection of other homogeneous subspaces such as lines, or to other dimensions. You can also use it to intersect general lines in 2-D through the embedding in homogeneous coordinates, but that's about it.

All these uses have their limitations, and none extends easily to higher-dimensional spaces. The cross product is, basically, a 3-D trick, and we need to replace it with something more universally applicable.

---

### 3.7.2 The Cross Product Incorporated

Let us take the characterization of the plane spanned by two vectors $\mathbf{a}$ and $\mathbf{b}$ as the defining example to redo the cross product with our subspace products. Using our subspace algebra, we would characterize the plane by the 2-blade $\mathbf{a} \wedge \mathbf{b}$ and the subspace normal to it in the space with pseudoscalar $I_n$ by the orthogonal complement $(\mathbf{a} \wedge \mathbf{b}) \rfloor I_n^{-1}$. In 3-D Euclidean space $\mathbb{R}^{3,0}$, the inverse pseudoscalar $I_3^{-1}$ equals $-I_3$, and the orthogonal complement is then indeed a vector, computed as $(\mathbf{a} \wedge \mathbf{b})^* = (\mathbf{b} \wedge \mathbf{a}) \rfloor I_3$.

The classical method computes the normal vector as $\mathbf{a} \times \mathbf{b}$. Both ways of computing the normal vector must be equivalent, so we obtain a definition of the cross product in terms of the outer product and contraction:

$$\boxed{\mathbf{a} \times \mathbf{b} = (\mathbf{a} \wedge \mathbf{b})^* = (\mathbf{a} \wedge \mathbf{b}) \rfloor I_3^{-1}} \tag{3.28}$$

Note that this definition indicates explicitly that there are two geometrical concepts involved in the cross product: *spanning*, and *taking the orthogonal complement*. The latter is related to the metric of the embedding space (since it ultimately contains the inner product), and this makes the cross product a rather involved construction. In the next chapter, we will see that it also makes its transformation laws complicated.

Let us verify (3.28) by a coordinate-based computation in an orthonormal basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$ for the 3-D Euclidean space $\mathbb{R}^{3,0}$. Let $\mathbf{a} = a_1\mathbf{e}_1 + a_2\mathbf{e}_2 + a_3\mathbf{e}_3$ and $\mathbf{b} = b_1\mathbf{e}_1 + b_2\mathbf{e}_2 + b_3\mathbf{e}_3$. Then

$$\mathbf{a} \times \mathbf{b} = (a_2b_3 - a_3b_2) \mathbf{e}_1 + (a_3b_1 - a_1b_3) \mathbf{e}_2 + (a_1b_2 - a_2b_1) \mathbf{e}_3. \tag{3.29}$$

In (2.3), we have a coordinate expression for $\mathbf{a} \wedge \mathbf{b}$:

$$\mathbf{a} \wedge \mathbf{b} = (a_1b_2 - a_2b_1) \mathbf{e}_1 \wedge \mathbf{e}_2 + (a_2b_3 - a_3b_2) \mathbf{e}_2 \wedge \mathbf{e}_3 + (a_3b_1 - a_1b_3) \mathbf{e}_3 \wedge \mathbf{e}_1.$$

It is easy to take the dual of this by using $(\mathbf{e}_1 \wedge \mathbf{e}_2) \rfloor (\mathbf{e}_3 \wedge \mathbf{e}_2 \wedge \mathbf{e}_1) = \mathbf{e}_3$ and the like. The result indeed agrees with the above.

So in terms of coordinates, we are computing very similar quantities whether we use $\mathbf{a} \wedge \mathbf{b}$ or $\mathbf{a} \times \mathbf{b}$. Yet $\mathbf{a} \wedge \mathbf{b}$ is a simpler concept geometrically, because it does not depend on a metric, and it is usable in $n$-dimensional space (not just 3-D). You used to be forced into using the dual concept $\mathbf{a} \times \mathbf{b}$ since you could only treat vectors in standard linear algebra. Now that we know that it is actually the dual of a bivector $\mathbf{a} \wedge \mathbf{b}$, we had better not dualize it and use $\mathbf{a} \wedge \mathbf{b}$ "as is."

This does not lose any geometry, for all computations with the cross product depicted in Figure 3.7 can be recast into geometric algebra. Let us check them off:

**Normal Vectors.** We have just seen that a plane can be characterized directly by its bivector rather than by a normal vector constructed from two vectors in it.

**Velocities.** For the velocity representation involving the cross product $\mathbf{a} \times \mathbf{x}$, we note that our algebra provides a suggestive rewriting through the duality properties:

$$\mathbf{a} \times \mathbf{x} = (\mathbf{a} \wedge \mathbf{x})^* = -(\mathbf{x} \wedge \mathbf{a})^* = -\mathbf{x} \rfloor \mathbf{a}^* = \mathbf{x} \rfloor A, \tag{3.30}$$

where $A \equiv \mathbf{a} \rfloor I_3$ is the 2-blade whose dual is $\mathbf{a}$.

So we can replace the computation of the velocity of $\mathbf{x}$ during a rotation around the axis $\mathbf{a}$ by a computation involving the rotation plane $A$. That actually works in $n$-dimensional space (even in $n = 2$, where a rotation "axis" does not really exist!). (From Chapter 7 onward, we will even be able to define a rotation in $n$-dimensional space directly in terms of its rotation plane $A$, as $\exp(A)$.)

**Intersecting Planes.** The intersection of the two homogeneous planes of Figure 3.7(c) can be written in terms of the bivectors as

$$\mathbf{a} \times \mathbf{b} = \left((A \rfloor I_3^{-1}) \wedge (B \rfloor I_3^{-1})\right) \rfloor I_3^{-1} = \left((B \rfloor I_3^{-1}) \rfloor \left((A \rfloor I_3^{-1}) \rfloor I_3\right)\right)$$
$$= (B \rfloor I_3^{-1}) \rfloor A = (B^*) \rfloor A.$$

We shall see (in Chapter 5) that this final expression generalizes to intersections of subspaces of arbitrary dimension as the **meet** of $B$ and $A$. That will be the algebraic representation for the general incidence operator on subspaces.

In summary, we can use our other products and the blades to replace the specific and peculiar 3-D cross product on vector representations in a manner that works for all dimensions. Therefore, we will do so. Apart from revisiting it in the context of linear transformations in Chapter 4, where we find more arguments against its use, we will not employ the cross product any more (except occasionally to show the classical form of some of our results). If you have used the cross product a lot, you may wonder what happened to some of the identities that were useful in geometric computations (such as the bac-cab formula). Structural exercises 10–12 show you what to substitute for them.

---

## 3.8 Application: Reciprocal Frames

Although we avoid using coordinates in our computations, they are often required to present their results. We therefore need a way to retrieve the coefficient $x^i$ of some vector $\mathbf{x}$, expressible as $\mathbf{x} = \sum x^i \mathbf{b}_i$ on some basis $\{\mathbf{b}_i\}_{i=1}^n$. If the basis happens to be orthonormal, then this is simple: $x^i = \mathbf{x} \cdot \mathbf{b}_i$, as is easily verified. However, we would like the flexibility to choose our bases arbitrarily to correspond to whatever the important directions are in any given problem. We then need a more general expression.

In a metric space $\mathbb{R}^n$ with chosen basis $\{\mathbf{b}_i\}_{i=1}^n$ and pseudoscalar $I_n = \mathbf{b}_1 \wedge \mathbf{b}_2 \wedge \cdots \wedge \mathbf{b}_n$ we can do this as follows. Associate with each basis vector $\mathbf{b}_i$ a **reciprocal basis vector** $\mathbf{b}^i$, defined as

$$\mathbf{b}^i \equiv (-1)^{i-1}(\mathbf{b}_1 \wedge \mathbf{b}_2 \wedge \cdots \wedge \breve{\mathbf{b}}_i \wedge \cdots \wedge \mathbf{b}_n) \rfloor I_n^{-1}. \tag{3.31}$$

Here the inverted arc denotes the removal of the vector $\mathbf{b}_i$, so this vector $\mathbf{b}^i$ is the dual of an $(n-1)$-blade spanned by all vectors except $\mathbf{b}_i$ (as in (3.16)). The reciprocals of the basis vectors form a basis $\{\mathbf{b}^i\}_{i=1}^n$ for the vector space.

The two bases $\{\mathbf{b}_i\}_{i=1}^n$ and $\{\mathbf{b}^i\}_{i=1}^n$ are **mutually orthonormal**, for

$$\mathbf{b}_i \cdot \mathbf{b}^j = (-1)^{j-1}\mathbf{b}_i \rfloor \left((\mathbf{b}_1 \wedge \cdots \wedge \breve{\mathbf{b}}_j \wedge \cdots \wedge \mathbf{b}_n) \rfloor I_n^{-1}\right)$$
$$= (-1)^{j-1}(\mathbf{b}_i \wedge \mathbf{b}_1 \wedge \cdots \wedge \breve{\mathbf{b}}_j \wedge \cdots \wedge \mathbf{b}_n) \rfloor I_n^{-1}$$
$$= \delta_i^j (\mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_n) \rfloor I_n^{-1}$$
$$= \delta_i^j I_n \rfloor I_n^{-1}$$
$$= \delta_i^j, \tag{3.32}$$

where the selector symbol $\delta_i^j$ is defined to be 1 when $i = j$, and 0 otherwise.

In spaces without an orthonormal basis, it is common to express the coefficients of a vector $\mathbf{x}$ by a superscript, so that $\mathbf{x} = \sum_i x^i \mathbf{b}_i$. (Some authors, like [15], then use a summation convention, in which summation is implied when the same index appears above and below, but we will not employ it.) It is now straightforward to verify that $x^i = \mathbf{x} \cdot \mathbf{b}^i$:

$$\mathbf{x} \cdot \mathbf{b}^i = \left(\sum_j x^j \mathbf{b}_j\right) \cdot \mathbf{b}^i = \sum_j x^j (\mathbf{b}_j \cdot \mathbf{b}^i) = \sum_j x^j \delta_j^i = x^i.$$

Therefore:

> Even on a nonorthonormal basis, the coefficients of a vector representation can be computed by an inner product with appropriately chosen basis vectors.

It should be noted that orthonormal basis vectors have the same attitude as their reciprocal:

$$\mathbf{b}^i = \pm\mathbf{b}_i \quad \text{if } \{\mathbf{b}_i\}_{i=1}^n \text{ is an orthonormal basis},$$

with the $+$ sign for positive vectors for which $\mathbf{b}_i \cdot \mathbf{b}_i = +1$, and the $-$ sign for negative vectors for which $\mathbf{b}_i \cdot \mathbf{b}_i = -1$. In a Euclidean metric space $\mathbb{R}^{n,0}$, the reciprocal basis vectors therefore equal the basis vectors, and the distinction is merely notational.

Reciprocal frames are especially useful, as they allow consistent and convenient treatment of nonorthonormal bases. These are known techniques from standard linear algebra. Usually, the reciprocal basis vectors are formulated in terms of minors of certain determinants. It is satisfying to see how easily (3.31) defines the reciprocal basis as a geometrical construction, namely as the orthogonal complement of the span of the other vectors. The geometrically interpretable algebraic formula shows clearly that, for a general basis, the coefficient of $\mathbf{b}_i$ depends on all vectors; for an orthogonal basis, it would only depend on $\mathbf{b}_i$ itself.

---

## 3.9 Further Reading

When reading other literature in geometric algebra, you will find that most authors use slightly different inner products. These alternatives are spelled out and compared in Section B.1 of Appendix B. We maintain that the contractions are more pure mathematically and geometrically, and they lead to fewer conditional computations in your code. That is why we use them in this book.

We tried to convey their geometrical relevance for computer science in [17] (though with limited success), inspired by [39] and [41]. The latter gives links to the mathematical origins of the construction.

---

## 3.10 Exercises

### 3.10.1 Drills

1. Let $\mathbf{a} = \mathbf{e}_1 + \mathbf{e}_2$ and $\mathbf{b} = \mathbf{e}_2 + \mathbf{e}_3$ in a 3-D Euclidean space $\mathbb{R}^{3,0}$ with orthonormal basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$. Compute the following expressions, giving the results relative to the basis $\{1, \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3, \mathbf{e}_1 \wedge \mathbf{e}_2, \mathbf{e}_2 \wedge \mathbf{e}_3, \mathbf{e}_3 \wedge \mathbf{e}_1, \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3\}$. Show your work.
   - (a) $\mathbf{e}_1 \rfloor \mathbf{a}$
   - (b) $\mathbf{e}_1 \rfloor (\mathbf{a} \wedge \mathbf{b})$
   - (c) $(\mathbf{a} \wedge \mathbf{b}) \rfloor \mathbf{e}_1$
   - (d) $(2\mathbf{a} + \mathbf{b}) \rfloor (\mathbf{a} + \mathbf{b})$
   - (e) $\mathbf{a} \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3)$
   - (f) $\mathbf{a}^*$
   - (g) $(\mathbf{a} \wedge \mathbf{b})^*$
   - (h) $\mathbf{a} \rfloor \mathbf{b}^*$

2. Compute the cosine of the angle between the following subspaces given on an orthonormal basis of a Euclidean space:
   - (a) $\mathbf{e}_1$ and $\alpha \mathbf{e}_1$
   - (b) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge \mathbf{e}_3$ and $\mathbf{e}_1 \wedge \mathbf{e}_3$
   - (c) $(\cos \phi \, \mathbf{e}_1 + \sin \phi \, \mathbf{e}_2) \wedge \mathbf{e}_3$ and $\mathbf{e}_2 \wedge \mathbf{e}_3$
   - (d) $\mathbf{e}_1 \wedge \mathbf{e}_2$ and $\mathbf{e}_3 \wedge \mathbf{e}_4$

3. Set up and draw the reciprocal frame for vectors $\mathbf{b}_1$ and $\mathbf{b}_2$ on an orthogonal basis $\{\mathbf{e}_1, \mathbf{e}_2\}$ represented as $\mathbf{b}_1 = \mathbf{e}_1$ and $\mathbf{b}_2 = \mathbf{e}_1 + \mathbf{e}_2$. Use the reciprocal frame to compute the coordinates of the vector $\mathbf{x} = 3\mathbf{e}_1 + \mathbf{e}_2$ on the $\{\mathbf{b}_1, \mathbf{b}_2\}$-basis.

---

### 3.10.2 Structural Exercises

1. In 2-D Euclidean space $\mathbb{R}^{2,0}$ with orthonormal basis $\{\mathbf{e}_1, \mathbf{e}_2\}$, let us determine the value of the contraction $\mathbf{e}_1 \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_2)$ by means of its implicit definition (3.6) with $A = \mathbf{e}_1$ and $B = \mathbf{e}_1 \wedge \mathbf{e}_2$. Let $X$ range over the basis of the blades: $\{1, \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_1 \wedge \mathbf{e}_2\}$. This produces four equations, each of which gives you information on the coefficient of the corresponding basis element in the final result. Show that $\mathbf{e}_1 \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_2) = 0 (1) + 0 (\mathbf{e}_1) + 1 (\mathbf{e}_2) + 0 (\mathbf{e}_1 \wedge \mathbf{e}_2)$.

2. (continued from previous) Change the metric such that $\mathbf{e}_2 \cdot \mathbf{e}_2 = 0$. This is a nondegenerate metric, of which $\mathbf{e}_2$ is a null vector (see Appendix A). Show that you cannot now determine the coefficient of $\mathbf{e}_2$ in the value of $\mathbf{e}_1 \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_2)$ through the procedure based on (3.6). Then use the explicit definition of the contraction to show that the contraction is still well defined, and equal to $\mathbf{e}_1 \rfloor (\mathbf{e}_1 \wedge \mathbf{e}_2) = \mathbf{e}_2$.

3. Derive the following dualities for the right contraction, corresponding to (3.20) and (3.21) for the usual (left) contraction:
   $$C \lfloor (B \wedge A) = (C \lfloor B) \lfloor A \quad \text{universally valid} \tag{3.33}$$
   $$C \lfloor (B \lfloor A) = (C \lfloor B) \wedge A \quad \text{when } A \subseteq C \tag{3.34}$$
   Then give the counterpart of (3.24). (Hint: use (3.19).)

4. Verify the geometric interpretation of the usual inner product between vectors, in the light of viewing it as a specific example of the contraction. In agreement with Section 3.3, show that $\mathbf{x} \cdot \mathbf{a}$ can be interpreted as an element of the 0-dimensional subspace of $\mathbf{a}$ perpendicular to the subspace $\mathbf{x}$.

5. The equation $\mathbf{x} \rfloor \alpha = 0$ (in (3.8)) also has a consistent geometric interpretation in the sense of Section 3.3. Since the scalar $\alpha$ denotes the point at the origin, $\mathbf{x} \rfloor \alpha$ has the following semantics: the subspace of vectors perpendicular to $\mathbf{x}$, contained in the 0-blade $\alpha$. Give a plausible correctness argument of this statement.

6. Similar to the previous two exercises, verify the geometric semantics of (3.7).

7. Duality in 1-D Euclidean space should avoid the extra sign involved in double duality, as specified in (3.24). Show this explicitly, by taking the dual of a vector $\mathbf{a}$ relative to a suitably chosen unit pseudoscalar for the 1-D space and dualizing again.

8. We have seen in Section 2.4 how in 3-D space a trivector $\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}$ can be written as
   $$\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} = \det([[\mathbf{a}\mathbf{b}\mathbf{c}]]) \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3,$$
   with $[[\mathbf{a}\mathbf{b}\mathbf{c}]]$ the $3 \times 3$ matrix having the three 3-D vectors $\mathbf{a}$, $\mathbf{b}$, $\mathbf{c}$ as columns (a construction borrowed from standard linear algebra). Express this determinant fully in terms of our subspace algebra.

9. In a plane with unit pseudoscalar $I_2$, we can rotate a vector by a right angle using the fact that contraction $\mathbf{x} \rfloor I_2$ is a perpendicular to $\mathbf{x}$. Therefore, you can construct an orthogonal basis for the plane from any vector in it. Use this capability to give a coordinate-free specification of a rotation of a vector $\mathbf{x}$ over $\phi$ radians in that plane. Make sure you get the rotation direction correctly related to the plane's orientation. (We will do rotations properly in Chapter 7.)

10. Using the definition of the cross product (3.28), verify that you can compute the volume spanned by three vectors $\mathbf{a}$, $\mathbf{b}$, and $\mathbf{c}$ as $\mathbf{a} \cdot (\mathbf{b} \times \mathbf{c})$. What is the corresponding formula using $\wedge$ and $\rfloor$?

11. Derive the notorious **bac-cab formula** for the cross product (i.e., $\mathbf{a} \times (\mathbf{b} \times \mathbf{c}) = \mathbf{b} (\mathbf{a} \cdot \mathbf{c}) - \mathbf{c} (\mathbf{a} \cdot \mathbf{b})$), directly from its definition (3.28). What is the corresponding formula using $\wedge$ and $\rfloor$, and what is its geometric interpretation?

12. The inner product formula for cross products is $(\mathbf{a} \times \mathbf{b}) \cdot (\mathbf{c} \times \mathbf{d}) = (\mathbf{a} \cdot \mathbf{c}) (\mathbf{b} \cdot \mathbf{d}) - (\mathbf{a} \cdot \mathbf{d}) (\mathbf{b} \cdot \mathbf{c})$. Derive it from (3.28). What is the corresponding formula using $\wedge$ and $\rfloor$, and what is its geometric interpretation?

13. In a nonorthonormal basis, the outer product $\mathbf{b}^i \wedge \mathbf{b}_i$ of a vector and its corresponding reciprocal is not generally zero. However, when summed over all basis vectors, all those 2-blades cancel out:
    $$\sum_i \mathbf{b}^i \wedge \mathbf{b}_i = 0. \tag{3.35}$$
    Show this by expressing $\mathbf{b}^i$ on the usual basis $\{\mathbf{b}_j\}$, and using a symmetry argument on the resulting double summation.

---

## 3.11 Programming Examples and Exercises

### 3.11.1 Orthonormalization

In this example we use the contraction product and the outer product to orthonormalize a set of three vectors. The code is given in Figure 3.9, and Figure 3.10 shows a screenshot of its output. The first vector is normalized using the function `unit_e()`. This function takes any multivector and returns its unit in the sense that the Euclidean norm (sum of the squares of all coordinates) is 1. `unit_e()` assumes that its input is nonzero.

The second vector is computed in two steps. First, the bivector containing the first two vectors is computed. Then, the first vector is removed from the bivector using the left contraction (the `<<` operator), resulting in the second vector, orthogonal to the first. This is in fact a computation of the dual within the plane of the two vectors.

The third vector is determined by computing the trivector spanned by all three vectors and removing the bivector spanned by the first two vectors (this is duality in their common space). In 3-D this step is actually redundant, as the third vector is fully determined by the first two vectors. It can be computed using dualization of the bivector or using the cross product (see the next exercise). We will generalize this example to Gram-Schmidt orthogonalization in programming exercise 6.7.2 of Chapter 6.

*What happens when the input vectors become dependent?*

```cpp
void computeOrthoVectors(const e3ga::vector nonOrtho[3], e3ga::vector ortho[3]) {
    // compute ortho vector 1:
    // unit_e() returns a unit multivector (Euclidean metric)
    ortho[0] = unit_e(nonOrtho[0]);

    // compute ortho vector 2:
    // << is the operator used for the left contraction
    ortho[1] = unit_e(ortho[0] << (ortho[0] ^ nonOrtho[1]));

    // compute ortho vector 3:
    ortho[2] = unit_e((ortho[1] ^ ortho[0]) <<
        (ortho[0] ^ ortho[1] ^ nonOrtho[2]));
}
```
**Figure 3.9:** Orthonormalization code (Example 1).

---

### 3.11.2 Exercise: Implementing the Cross Product

When you download the code for exercise 2 of this Chapter, you will find that it contains a bare-bones `crossProduct()` function:

```cpp
/// returns a x b
e3ga::vector crossProduct(const e3ga::vector &a,
                          const e3ga::vector &b) {
    // exercise: compute the cross product, return it:
    return _vector(0);
}
```

Fill in the function such that it computes the cross product, according to the method of in Section 3.7. The function `dual()` is available to compute the dual of multivectors. If you need the pseudoscalar, use the constant `I3`, or its inverse, `I3i`.

You can check that your implementation works by running the example: drag the input vectors (red and green) around, and verify that the blue vector stays orthogonal to them.

---

### 3.11.3 Reciprocal Frames

In this example, we explore the construction of reciprocal frames as explained in Section 3.8. The example program allows you to manipulate three vectors and see the reciprocal frame of these three vectors. Drag the mouse (using any button) to change the vectors and orbit the scene. When you play around with the example, note the following:

- When you make a vector longer, its reciprocal vector becomes shorter.
- The reciprocal of a vector is always orthogonal to the other two vectors in the original frame. The easiest way to verify this is by "orbiting" the scene, but you may want to take it upon yourself to draw the orthogonal plane as an exercise.

```cpp
/**
Computes the reciprocal frame 'RF' of input frame 'IF'
Throws std::string when vectors in 'IF' are not independent,
or if one of the IF[i] is null.
*/
void reciprocalFrame(e3ga::vector *IF, e3ga::vector *RF, int nbVectors) {
    // Treat special cases ('nbVectors' equals 0 or 1)
    // ... (not shown here)

    // compute pseudoscalar 'I' of space spanned by input frame:
    mv I = IF[0];
    for (unsigned int i = 1; i < nbVectors; i++) I ^= IF[i];

    if (_Float(norm_r2(I)) == 0.0)
        throw std::string("reciprocalFrame(): vectors are not independent");

    // compute inverse of 'I':
    mv Ii = inverse(I);

    // compute the vectors of the reciprocal frame vector
    for (unsigned int i = 0; i < nbVectors; i++) {
        // compute outer product of all vectors except IF[i]
        mv P = (i & 1) ? -1.0f : 1.0f; // = pow(-1, i)
        for (unsigned int j = 0; j < nbVectors; j++)
            if (j != i) P ^= IF[j];

        // compute reciprocal vector 'i':
        RF[i] = _vector(P << Ii);
    }
    return;
}
```
**Figure 3.11:** Reciprocal frame code (Example 3). Edited for readability: some code was removed at the beginning of the function that dealt with special cases for which `(nbVectors < 2)`.

Note that the example code uses a class called `mv`. In the code shown so far, we always used specialized multivector classes such as `vector`, `bivector`, and `trivector`. The general multivector class `mv` is required here because we have the need for variables that can hold different multivector types. For example, in the following loop, the multivector `P` holds four types of values: first a scalar, then a vector, then a bivector, and finally a trivector.

```cpp
mv P = (i & 1) ? -1.0f : 1.0f; // = pow(-1, i)
for (unsigned int j = 0; j < nbVectors; j++)
    if (j != i) P ^= IF[j];
```

Working with general multivectors is not as efficient as working with specialized multivectors, but sometimes we cannot avoid them.

---

### 3.11.4 Color Space Conversion

The reciprocal frame algorithm can be used to do color space conversion. Common conversions (e.g., RGB to YUV) are from one orthogonal frame to another, so that the reciprocal frame is not really necessary. The following is an example when computing the reciprocal frame is required.

Suppose you want to detect the light emitted by red, green, and blue LEDs in a digital image. The colors of the LEDs are unlikely to be pure red, pure green, and pure blue in the RGB color space. But it is possible to transform the color space such that the LEDs do register as such coordinate directions. First, measure the RGB values of the different LEDs in the digital image. Then, compute the reciprocal frame of these three "color vectors" and use the reciprocal frame to convert the image colors.

```cpp
/**
Converts colors in 'source' images to 'dest' image, according
to the input color frame 'IFcolors'. Reciprocal vectors are returned
in 'RFcolors'.
*/
void colorSpaceConvert(
    const unsigned char *source,
    unsigned char *dest,
    unsigned int width, unsigned int height,
    const e3ga::vector *IFcolors,
    e3ga::vector *RFcolors) {
    
    // compute reciprocal frame
    reciprocalFrame(IFcolors, RFcolors, 3);

    for (unsigned int i = 0; i < (width * height) * 3; i += 3) {
        // convert RGB pixel to vector:
        e3ga::vector c(vector_e1_e2_e3, (float)source[i + 0], 
                       (float)source[i + 1], (float)source[i + 2]);

        // compute colors in destination image:
        float red = _Float(c << g_RFcolors[0]);
        float green = _Float(c << g_RFcolors[1]);
        float blue = _Float(c << g_RFcolors[2]);

        // clip colors:
        if (red < 0.0f) red = 0.0f;
        else if (red > 255.0f) red = 255.0f;
        if (green < 0.0f) green = 0.0f;
        else if (green > 255.0f) green = 255.0f;
        if (blue < 0.0f) blue = 0.0f;
        else if (blue > 255.0f) blue = 255.0f;

        // set colors in destination image
        dest[i + 0] = (unsigned char)(red + 0.5f);   // +0.5f for correct rounding
        dest[i + 1] = (unsigned char)(green + 0.5f);
        dest[i + 2] = (unsigned char)(blue + 0.5f);
    }
}
```
**Figure 3.12:** Color space conversion code (Example 4).

The example program lets you play around by sampling different color values and seeing the result of the conversion in real time.

You can sample colors at any point in the viewport, including the color-bar at the top. The code that draws this bar is also based on the subspace algebra: A unit vector in the "white" direction in the color space is initialized, then the dual of this vector is computed and factorized:

```cpp
// get 'white' vector:
e3ga::vector white = _vector(unit_e(e1 + e2 + e3));

// Get two vectors, orthogonal to white:
// factorizeBlade() find two vectors such that
// dual(white) == O[1] ^ O[2]
e3ga::vector O[2];
factorizeBlade(dual(white), O);
```

We now have a frame which spans the RGB color space. We can generate all fully saturated colors by performing a rotation in the `O[0] ∧ O[1]`-plane:

```cpp
// alpha runs from 0 to 2 PI
for (float angle = 0.0f; angle < PI2; angle += STEP) {
    // generate all fully saturated colors:
    e3ga::vector C = _vector(white + cos(angle) * O[0] +
                             sin(angle) * O[1]);

    // set current color:
    glColor3fv(C.getC(vector_e1_e2_e3));

    // draw small patch in the current color:
    // ...
}
```

---

## Summary of Key Formulas

| Concept | Formula |
|---------|---------|
| Scalar Product | $A * B = \det(\mathbf{a}_i \cdot \mathbf{b}_j)$ |
| Squared Norm | $\|A\|^2 = A * \widetilde{A}$ |
| Angle Between Subspaces | $\cos \phi = \frac{A * \widetilde{B}}{\|A\| \|B\|}$ |
| Grade of Contraction | $\text{grade}(A \rfloor B) = \text{grade}(B) - \text{grade}(A)$ |
| Inverse of Blade | $A_k^{-1} = \frac{\widetilde{A}_k}{\|A_k\|^2}$ |
| Dualization | $A^* = A \rfloor I_n^{-1}$ |
| Undualization | $A^{-*} = A \rfloor I_n$ |
| Projection | $P_B[X] = (X \rfloor B) \rfloor B^{-1}$ |
| Cross Product (3-D) | $\mathbf{a} \times \mathbf{b} = (\mathbf{a} \wedge \mathbf{b}) \rfloor I_3^{-1}$ |
| Reciprocal Basis | $\mathbf{b}^i = (-1)^{i-1}(\mathbf{b}_1 \wedge \cdots \wedge \breve{\mathbf{b}}_i \wedge \cdots \wedge \mathbf{b}_n) \rfloor I_n^{-1}$ |

---

## Key Duality Relationships

$$(A \wedge B) \rfloor C = A \rfloor (B \rfloor C) \quad \text{(universally valid)}$$

$$(A \rfloor B) \rfloor C = A \wedge (B \rfloor C) \quad \text{when } A \subseteq C$$

$$(A \wedge B)^* = A \rfloor (B^*)$$

$$(A \rfloor B)^* = A \wedge (B^*) \quad \text{for } A \subseteq I$$
