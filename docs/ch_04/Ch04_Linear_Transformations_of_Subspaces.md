# Chapter 4: Linear Transformations of Subspaces

Linear transformations of a vector space $\mathbb{R}^n$ change its vectors. When this happens, the blades spanned by those vectors change quite naturally to become the spans of the transformed vectors. That defines the extension of a linear transformation to the full subspace algebra. This embedding gives us more powerful tools to apply linear transformations immediately to subspaces, without needing to first decompose those subspaces into vectors.

We study the resulting structure in this chapter. The algebra dictates how we should do the outer products and contractions of transformed blades, and in that way gives us the transformation formulas for the products themselves. Transforming contractions is a lot more involved than transforming outer products (since it involves the metric of the space), but the effort pays off by providing a compact coordinate-free formula for the inverse of a linear transformation.

In this book we will mostly be interested in orthogonal transformations. We can easily derive some of their properties in this chapter and see why they are special (they are the only transformations that are structure-preserving for the contraction). Their real importance and ease of representation will be revealed only in Chapter 7.

At first reading, you can skim through this chapter, taking in only the principle of the outermorphism, which takes the structure preservation of the outer product as its tenet and the transformation formulas for the other products. The main facts are summarized in [[#4.6 Summary|Section 4.6]].

---

## 4.1 Linear Transformations of Vectors

We are interested in linear transformations, mapping a vector space $\mathbb{R}^n$ onto itself.[^1] Such a *linear transformation* $\mathsf{f} : \mathbb{R}^n \to \mathbb{R}^n$ has the defining properties

$$\mathsf{f}[\alpha \mathbf{x} + \beta \mathbf{y}] = \alpha \mathsf{f}[\mathbf{x}] + \beta \mathsf{f}[\mathbf{y}], \tag{4.1}$$

where $\alpha, \beta \in \mathbb{R}$ are scalars and $\mathbf{x}, \mathbf{y} \in \mathbb{R}^n$ are vectors. It is convenient to see this as two conditions:

$$\begin{cases} \mathsf{f}[\alpha \mathbf{x}] = \alpha \mathsf{f}[\mathbf{x}] \\ \mathsf{f}[\mathbf{x} + \mathbf{y}] = \mathsf{f}[\mathbf{x}] + \mathsf{f}[\mathbf{y}] \end{cases} \tag{4.2}$$

The first condition means that a line through the origin remains a straight line through the origin, with a preservation of ratios of vectors along the lines (Figure 4.1(a)). The second condition means that the parallelogram-based addition is preserved (see Figure 4.1(b)).

Examples of such linear transformations on subspaces include scaling, rotation (but only around an axis through origin), and reflection (but only relative to subspace containing the origin), but *not* translation, which tends to produce nonhomogeneous, offset spaces.

> **Figure 4.1:** The defining properties of a linear transformation. (a) Scalar multiplication preserves ratios along lines through the origin. (b) The parallelogram construction for vector addition is preserved.

Linear transformations therefore do not include certain important transformations that we definitely want to include in our treatment of geometry. Yet linear transformations are important, because we will see in Part II how we can construct those desirables using linear transformations in higher-dimensional operational models of affine or Euclidean space. Also, linear mappings provide a local description of a wide class of arbitrary mappings, which is a successful way to study those in differential geometry.

[^1]: In this chapter, we perform linear transformations within the same space $\mathbb{R}^n$, not from one space to another. Though the same principles apply to both, the additional notation involved in such space-to-space transformations would hide the basic structural simplicity we need to expose here.

---

## 4.2 Outermorphisms: Linear Transformations of Blades

We start with a specific linear transformation $\mathsf{f}$ in the vector space $\mathbb{R}^n$, which maps vectors to vectors. We will use sans serif type to denote these linear transformations to distinguish them from the blades (and other elements we introduce later), and denote their action by square brackets to avoid confusion with the grouping brackets of the products, and remind ourselves of their linearity. So $\mathsf{f}[\mathbf{x}]$ denotes the action of the linear transformation $\mathsf{f}$ on the vector $\mathbf{x}$.

We would like to find a natural extension that makes $\mathsf{f}$ act on arbitrary blades, or even arbitrary multivectors. We will argue that this natural extension should be done according to the following simple rules:

$$\begin{aligned}
\mathsf{f}[\alpha] &= \alpha \quad \text{for scalar } \alpha \\
\mathsf{f}[A \wedge B] &= \mathsf{f}[A] \wedge \mathsf{f}[B] \\
\mathsf{f}[A + B] &= \mathsf{f}[A] + \mathsf{f}[B]
\end{aligned} \tag{4.3}$$

where $A$ and $B$ are blades of arbitrary grade (even grade 0), although the results immediately generalize to general multivectors by the imposed linearity. (The third rule is a consequence of the second and (4.2), at least for same-grade blades, but we prefer to have it explicit so that linearity can be easily extended to multivectors.)

An extension of a map of vectors to vectors in this manner to the whole of the Grassmann algebra is called extension as a *(linear) outermorphism*, since the second property shows that we obtain a morphism (i.e., a mapping) that commutes with the outer product. The properties in (4.3) fully define the outermorphism corresponding to the linear transformation $\mathsf{f}$.

Outermorphisms have nice algebraic properties that are essential to their geometrical usage:

- **Blades Remain Blades.** Geometrically, oriented subspaces are transformed to oriented subspaces.

- **Grades Are Preserved.** The linear transformation $\mathsf{f}$ turns vectors into vectors. Then it follows immediately from the second rule that $\text{grade}(\mathsf{f}[A]) = \text{grade}(A)$ for blades. Geometrically, this means that the dimensionality of subspaces does not change under a linear transformation.

- **Preservation of Factorization.** If $A$ and $B$ have a blade $C$ in common (so that they may be written as $A = A' \wedge C$ and $B = C \wedge B'$, for appropriately chosen $A'$ and $B'$), then $\mathsf{f}[A]$ and $\mathsf{f}[B]$ have $\mathsf{f}[C]$ in common. Geometrically, this means that the meet (intersection) of subspaces is preserved.

If you are happy with (4.3) as a definition, you can move on to [[#4.2.2 Examples of Outermorphisms|Section 4.2.2]]. If you need some motivation to convince yourself of its consistency with the algebra of subspaces as we developed it thus far, read the next section.

### 4.2.1 Motivation of the Outermorphism

Let us take a step back from the algebraic generalization of a linear transformation in (4.3) and show its geometric plausibility.

In the beginning, we have nothing more than the linear transformation $\mathsf{f}$ from vectors to vectors $\mathsf{f} : \mathbb{R}^n \to \mathbb{R}^n$. It obviously satisfies the linearity axioms of (4.2), graphically depicted in Figure 4.1.

We want linear transformations on all $k$-blades. Starting with 2-blades, we introduce a linear transformation $\mathsf{f}_2$ mapping 2-blades to 2-blades (i.e., $\mathsf{f}_2 : \bigwedge^2 \mathbb{R}^n \to \bigwedge^2 \mathbb{R}^n$).

Linearity of $\mathsf{f}_2$ now means linearity for 2-blades, so satisfying $\mathsf{f}_2[\alpha A] = \alpha \mathsf{f}_2[A]$ and $\mathsf{f}_2[A + B] = \mathsf{f}_2[A] + \mathsf{f}_2[B]$ — where $A$ and $B$ are 2-blades. But this mapping $\mathsf{f}_2$ cannot be totally arbitrary. One way to construct the 2-blades is by using two vectors. If $A = \mathbf{x} \wedge \mathbf{y}$, how should we relate $\mathsf{f}$ (acting on vectors in $\mathbb{R}^n$) to $\mathsf{f}_2$ (acting on 2-blades in $\bigwedge^2 \mathbb{R}^n$), so that we get a consistent structure to our subspace algebra? Figure 4.1 provides the clue: the parallelogram construction is preserved under $\mathsf{f}$ by the linearity axioms—and such a construction occurs not only in defining the sum of vectors, but also in defining the 2-blade through the outer product (compare Figure 2.2 to Figure 2.3(a)). So we must connect the two linear transformations $\mathsf{f}$ and $\mathsf{f}_2$ in a structurally consistent manner by setting

$$\mathsf{f}_2[\mathbf{x} \wedge \mathbf{y}] = \mathsf{f}[\mathbf{x}] \wedge \mathsf{f}[\mathbf{y}].$$

This 2-blade is linear in $\mathbf{x}$ and $\mathbf{y}$, and so are both sides of this equation, guaranteeing that the construction is internally consistent. For instance: $\mathsf{f}_2[\alpha(\mathbf{x} \wedge \mathbf{y})] = \mathsf{f}_2[(\alpha \mathbf{x}) \wedge \mathbf{y}] = \mathsf{f}[\alpha \mathbf{x}] \wedge \mathsf{f}[\mathbf{y}] = \alpha \mathsf{f}[\mathbf{x}] \wedge \mathsf{f}[\mathbf{y}] = \alpha \mathsf{f}_2[\mathbf{x} \wedge \mathbf{y}]$, which is a proof that $\mathsf{f}_2$ thus defined indeed has one of the linearity properties. Since it is so consistent, we can consider $\mathsf{f}$ and $\mathsf{f}_2$ as the same linear transformation, just overloaded to apply to arguments of different grade, so we denote them both by $\mathsf{f}$.

The story for 3-blades is similar—the parallelepiped construction can be interpreted as a span (outer product) or as an addition diagram (linearity). Equating the two suggests defining

$$\mathsf{f}[\mathbf{x} \wedge \mathbf{y} \wedge \mathbf{z}] = \mathsf{f}[\mathbf{x}] \wedge \mathsf{f}[\mathbf{y}] \wedge \mathsf{f}[\mathbf{z}].$$

Associativity of the outer product gives us associativity for the outermorphism $\mathsf{f}$, and then $\mathsf{f}$ naturally extends to all grades.

There is also a strong suggestion of how we should relate a linear transformation among scalars (i.e., 0-blades) to the linear transformation $\mathsf{f}$ of vectors in a consistent manner. Remember that by (2.5), the standard product of a vector with a scalar is just the outer product in disguise. As a consequence, the first linearity condition of (4.2) can be read in our exterior algebra as $\mathsf{f}[\alpha \wedge \mathbf{x}] = \alpha \wedge \mathsf{f}[\mathbf{x}]$. To keep the outermorphism property, it is therefore natural to define

$$\mathsf{f}[\alpha] = \alpha$$

as the extension of $\mathsf{f}$ to scalars. The geometric semantics of this is that the point at the origin remains fixed under a linear transformation, in all its qualities, including weight and sign.

This is how the whole ladder of subspaces is affected naturally by the linear transformation of the underlying vector space, preserving the structure of the spanning product that went into its construction: **the span of the transforms is the transform of the span**.

### 4.2.2 Examples of Outermorphisms

Let us look at some simple examples of such extensions of linear transformations.

#### 1. Uniform Scaling

This is the linear transformation $\mathsf{S}[\mathbf{x}] = \alpha \mathbf{x}$. On an $n$-blade $A = \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge \cdots \wedge \mathbf{a}_n$, this gives

$$\mathsf{S}[A] = \mathsf{S}[\mathbf{a}_1] \wedge \mathsf{S}[\mathbf{a}_2] \wedge \cdots \wedge \mathsf{S}[\mathbf{a}_n] = \alpha^n A. \tag{4.4}$$

For 2-blades represented as parallelograms, this contains the well-known result that as each of the sides is multiplied by $\alpha$, the area is multiplied by $\alpha^2$; but it is more, since it also contains the statement that the attitude of the 2-blade remains the same, and so does its orientation, even when $\alpha$ is negative. And since 2-blades have no fixed shape, the same applies to any area in the plane: as the linear measure gets scaled by $\alpha$, the area measure scales by $\alpha^2$.

For a 3-blade $I_3 = \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge \mathbf{a}_3$ in 3-D space, we obtain $\mathsf{S}[I_3] = \alpha^3 I_3$, as expected. When $\alpha$ is negative, there is thus an orientation change of the volume. Again, nothing shatteringly new in its geometric interpretation, but note how in the formulation of such statements, their computation and their proof are all an intrinsic part of the algebra at a very elementary level. That is how we would want it.

#### 2. Parallel Projection onto a Line

In the plane with 2-blade $\mathbf{a} \wedge \mathbf{b}$, let the linear transformation $\mathsf{P}$ be such that $\mathsf{P}[\mathbf{a}] = \mathbf{a}$, while $\mathsf{P}[\mathbf{b}] = 0$. This is a projection in the $\mathbf{b}$-direction onto the $\mathbf{a}$-line (see Figure 4.2). Since any vector $\mathbf{x}$ in this plane can be written as an $\mathbf{a}$-component plus a $\mathbf{b}$-component, this determines the transformation

$$\mathsf{P}[\mathbf{x}] = \mathsf{P}[\alpha \mathbf{a} + \beta \mathbf{b}] = \alpha \mathbf{a} \tag{4.5}$$

(where $\alpha$ can be computed as $(\mathbf{x} \wedge \mathbf{b})/(\mathbf{a} \wedge \mathbf{b})$ using the reciprocal frame of Section 3.8 or the techniques of Section 2.7.1). Extending this $\mathsf{P}$ as an outermorphism, we find that $\mathsf{P}[\mathbf{a} \wedge \mathbf{b}] = \mathsf{P}[\mathbf{a}] \wedge \mathsf{P}[\mathbf{b}] = \mathbf{a} \wedge 0 = 0$. Any 2-blade in the plane $\mathbf{a} \wedge \mathbf{b}$ becomes 0: this transformation makes areas disappear.

> **Figure 4.2:** Projection onto a line $\mathbf{a}$ in the $\mathbf{b}$-direction.

You may have expected the answer to be $\mathsf{P}[\mathbf{a} \wedge \mathbf{b}] = \mathsf{P}[\mathbf{a}]$, because intuitively the plane $\mathbf{a} \wedge \mathbf{b}$ becomes the line $\mathbf{a}$. But this is not what an outermorphism does (it always preserves grade), so we must be careful with such naïve geometrical motivations for the results of algebraic computations. The image of the plane of vectors is indeed the line of vectors, but the plane of vectors is not equivalent to the 2-blade of the plane!

#### 3. Planar Rotation

Consider two independent unit vectors $\mathbf{u}$ and $\mathbf{v}$ that span a 2-blade $\mathbf{u} \wedge \mathbf{v}$. This 2-blade determines a plane through the origin in a Euclidean space $\mathbb{R}^{n,0}$. Let $\mathsf{R}$ be a rotation around the origin in this plane, a linear transformation. Let the rotation be such that it turns $\mathbf{u}$ to $\mathbf{v}$, so $\mathsf{R}[\mathbf{u}] = \mathbf{v}$. Since the whole plane rotates, the vector originally at $\mathbf{v}$ also rotates to a unit vector $\mathbf{w} \equiv \mathsf{R}[\mathbf{v}]$. Since the rotation around the origin is linear, the parallelogram spanned by $\mathbf{u}$ and $\mathbf{v}$ transforms to another parallelogram spanned by $\mathbf{v} = \mathsf{R}[\mathbf{u}]$ and $\mathbf{w} = \mathsf{R}[\mathbf{v}]$ (see Figure 4.3). The sketch shows that $\mathbf{u} \wedge \mathbf{v}$ and $\mathbf{v} \wedge \mathbf{w}$ are identical 2-blades, so $\mathbf{u} \wedge \mathbf{v} = \mathbf{v} \wedge \mathbf{w}$. This permits us to compute the effect of the rotation on a 2-blade:

$$\mathsf{R}[\mathbf{u} \wedge \mathbf{v}] = \mathsf{R}[\mathbf{u}] \wedge \mathsf{R}[\mathbf{v}] = \mathbf{v} \wedge \mathbf{w} = \mathbf{u} \wedge \mathbf{v}. \tag{4.6}$$

It follows that the 2-blade $\mathbf{u} \wedge \mathbf{v}$ is preserved under the rotation. This corresponds well to our insight that a rotation plane is an invariant of a rotation. But note how specific (4.6) is: it states that *all* properties of the plane—attitude, area measure, and orientation—are preserved. It is remarkable that although the vectors $\mathbf{u}$ and $\mathbf{v}$ themselves are not preserved (they rotate), their 2-blade is. We might express this as *a rotation has no real eigenvectors in its plane, but it has a real eigenblade of grade 2: the plane itself*.

> **Figure 4.3:** A rotation around the origin of unit vectors in the plane of the page, described by 2-blades.

Note that we have not specified any space in which we perform the rotation, assuming only that it has at least 2 dimensions for the 2-blade to be nonzero. So our picture and reasoning apply to any space of more than 1 dimension.

#### 4. Point Reflections

In a point reflection through the origin, all vectors change sign. So this is a uniform scaling by $-1$. Then (4.4) shows that an $n$-blade changes by $(-1)^n$: blades of even grades are unchanged, and blades of odd grades obtain the opposite orientation. Note that this does not depend on the dimensionality of the space in which they are embedded. As an example, point reflection in 3-D space changes the orientation of 3-blades, that is, the handedness of objects: a right-hand glove becomes a left-hand glove (see also structural exercise 1). We will see soon that this cannot be undone by a rotation, using an argument that only involves the outer product.

#### 5. Orthogonal Projection

In (3.25) we met the orthogonal projection of a vector $\mathbf{x}$ onto a blade $B$ as $\mathsf{P}_B[\mathbf{x}] = ((\mathbf{x} \rfloor B) B^{-1})$. Since the mapping is linear, we can extend it as an outermorphism to construct the projection of a higher-order subspace $X$ onto $B$. Let us first extend this orthogonal projection from the vector $\mathbf{x}$ to the bivector $\mathbf{x} \wedge \mathbf{y}$. By outermorphism, the projection of $(\mathbf{x} \wedge \mathbf{y})$ onto $B$ should be $\mathsf{P}_B[\mathbf{x}] \wedge \mathsf{P}_B[\mathbf{y}]$.

Now we have a straightforward derivation in which we challenge you to identify the rewriting rules.

$$\begin{aligned}
\mathsf{P}_B[\mathbf{x}] \wedge \mathsf{P}_B[\mathbf{y}] &= ((\mathbf{x} \rfloor B)B^{-1}) \wedge ((\mathbf{y} \rfloor B)B^{-1}) \\
&= ((\mathbf{x} \rfloor B)B^{-1}(\mathbf{y} \rfloor B)) \rfloor B^{-1} \\
&= (((\mathbf{x} \rfloor B)B^{-1} \wedge \mathbf{y}) \rfloor B) \rfloor B^{-1} \\
&= -(\mathbf{y} \wedge ((\mathbf{x} \rfloor B)B^{-1}B)) \rfloor B^{-1} \\
&= -(\mathbf{y} \rfloor ((\mathbf{x} \rfloor B)B^{-1})) \rfloor B) \rfloor B^{-1} \\
&= -(\mathbf{y} \rfloor ((\mathbf{x} \rfloor B) \wedge (B^{-1}B))) \rfloor B^{-1} \\
&= -(\mathbf{y} \rfloor (\mathbf{x} \rfloor B)) \rfloor B^{-1} \\
&= -((\mathbf{y} \wedge \mathbf{x}) \rfloor B) \rfloor B^{-1} \\
&= ((\mathbf{x} \wedge \mathbf{y}) \rfloor B) \rfloor B^{-1} \\
&= \mathsf{P}_B[\mathbf{x} \wedge \mathbf{y}].
\end{aligned}$$

The final result is, therefore, that we can just apply the projection formula directly to the blade $\mathbf{x} \wedge \mathbf{y}$ to get the outermorphism. Similar steps can be used to provide an inductive proof of the general result for blades of (3.26).

Geometrically, the outermorphism property implies that the projection formula generalizes to higher-order blades in a pleasant way. Our algebra permits the direct projection of subspaces without the necessity of breaking them up into vectors, projecting those, and recomposing the result.

These examples show how merely having the outer product already refines and extends our analysis and application of linear transformations.

### 4.2.3 The Determinant of a Linear Transformation

We have seen in Chapter 2 how in an $n$-dimensional space, the blade of highest grade that can be constructed without being identical to 0 is an $n$-blade, which is a pseudoscalar for the space. The grade-preservation property of a linear transformation $\mathsf{f}$ implies that a linear transformation on a pseudoscalar $I_n$ produces another pseudoscalar. Moreover, all pseudoscalars are scalar multiples of each other, since the space of $n$-blades $\bigwedge^n \mathbb{R}^n$ is a 1-D linear space. Therefore we find $\mathsf{f}[I_n] = \delta I_n$, with $\delta$ a scalar. This defines $\delta$ as the change in pseudoscalar magnitude and orientation, as a ratio of the transformed $n$-dimensional hypervolume (for that is what a pseudoscalar is) to the original hypervolume. It is called the **determinant** of $\mathsf{f}$, denoted $\det(\mathsf{f})$. So we have the important implicit definition

$$\boxed{\text{determinant}: \quad \mathsf{f}[I_n] \equiv \det(\mathsf{f}) \, I_n.} \tag{4.7}$$

This scalar number $\det(\mathsf{f})$ is indeed equivalent in value to that concept in linear algebra, so we are not abusing the name. There, too, the determinant is a ratio of signed hypervolume measures.

The usual way of teaching linear algebra in the applied sciences relies heavily on matrix representations. You might be excused for believing that linear algebra is about matrices rather than about linear transformations, and that the determinant is just a property of a square matrix rather than a fundamental property of a linear transformation. But it is just that, and it can be defined without referring to matrices. We have just done so in (4.7), even managing to avoid coordinates altogether. We briefly show how we can use this geometrical approach to retrieve the determinants of some common transformations.

**Determinant of a Rotation.** The example of the rotation in the Euclidean plane indicated by the blade $\mathbf{u} \wedge \mathbf{v}$ demonstrated that $\mathsf{R}[\mathbf{u} \wedge \mathbf{v}] = \mathbf{u} \wedge \mathbf{v}$. Since $\mathbf{u} \wedge \mathbf{v}$ is proportional to the pseudoscalar $I_2$ of the plane, this implies

$$\mathsf{R}[I_2] = I_2.$$

Therefore the determinant of a 2-D rotation equals 1.

If the rotation plane is embedded within an $n$-dimensional Euclidean metric space $\mathbb{R}^{n,0}$, then we can span a pseudoscalar for the $n$-dimensional embedding space using $I_2$ combined with $(n - 2)$ vectors perpendicular to the plane. Each of those vectors is not affected by the rotation, so for the part of the space they span we have $\mathsf{R}[I_{n-2}] = I_{n-2}$ (where $I_{n-2}$ is a pseudoscalar for the $(n - 2)$-dimensional space), by the outermorphism property. We thus find: $\mathsf{R}[I_n] = \mathsf{R}[I_2 \wedge I_{n-2}] = \mathsf{R}[I_2] \wedge \mathsf{R}[I_{n-2}] = I_2 \wedge I_{n-2} = I_n$. So the determinant of a rotation still equals 1, even in an $n$-dimensional space $(n \geq 2)$.

**Determinant of a Point Reflection.** We have seen that a point reflection satisfies $\mathsf{f}[I_n] = (-1)^n I_n$. Thus its determinant equals 1 in even dimensions and $-1$ in odd dimensions. This suggests that in even dimensions, a reflection can be performed as a rotation, and indeed it can.

**Determinant of a Projection onto a Line.** The projection $\mathsf{P}$ onto a line has a determinant that varies with the dimensionality of the space $\mathbb{R}^n$. We have seen how any blade with grade exceeding 1 becomes zero. Therefore any pseudoscalar of $\mathbb{R}^n$ with $n > 1$ is projected to 0, and $\det(\mathsf{P}) = 0$. However, for $n = 1$ the line must necessarily be the whole space $\mathbb{R}^1$. Now the projection is the identity, so $\det(\mathsf{P}) = 1$.

We can continue the theme of determinants. Applying two linear transformations $\mathsf{f} : \mathbb{R}^n \to \mathbb{R}^n$ and $\mathsf{g} : \mathbb{R}^n \to \mathbb{R}^n$, first $\mathsf{f}$ then $\mathsf{g}$, we obtain a composite transformation that is again linear (as you can easily show) and that can therefore also be extended as an outermorphism. We denote this composite transformation by $(\mathsf{g} \circ \mathsf{f})$. We compute its determinant:

$$\det(\mathsf{g} \circ \mathsf{f}) \, I_n = (\mathsf{g} \circ \mathsf{f})[I_n] = \mathsf{g}[\mathsf{f}[I_n]] = \det(\mathsf{f}) \, \mathsf{g}[I_n] = \det(\mathsf{g}) \det(\mathsf{f}) \, I_n.$$

Therefore, we get the composition rule of determinants:

$$\det(\mathsf{g} \circ \mathsf{f}) = \det(\mathsf{g}) \det(\mathsf{f}). \tag{4.8}$$

This is a well-known result, derived within this context of the outer product in a straightforward algebraic manner with satisfying geometrical semantics.

---

## 4.3 Linear Transformation of the Metric Products

The linear transformation $\mathsf{f}$ has been extended to an outermorphism to transform an outer product completely naturally as

$$\mathsf{f}[A \wedge B] = \mathsf{f}[A] \wedge \mathsf{f}[B].$$

Of course, we should also understand how the scalar product and the contraction transform; those three combined will then enable us to transform arbitrary geometric compositions and will give us the full extent of linear transformations in our subspace algebra.

The scalar product is easily transformed, but the contraction takes a bit more work and requires us to introduce an important concept: the adjoint of a linear transformation.

### 4.3.1 Linear Transformation of the Scalar Product

The scalar product returns a scalar, so it transforms under a linear transformation as

$$\mathsf{f}[A * B] = A * B. \tag{4.9}$$

This looks straightforward, but when you remember that $A * A$ is the squared norm of the blade $A$, does this now mean that no linear transformation can change the norm? Or, a related question since $A * B$ is proportional to the cosine of the angle between $A$ and $B$, does this mean that no linear transformation can change the angle? That would imply that all linear transformations are orthogonal transformations.

Resolve these problems for yourself—or take a hint from structural exercise 6.

### 4.3.2 The Adjoint of a Linear Transformation

The transformation $\mathsf{f}[A \rfloor B]$ for the contraction $A \rfloor B$ will follow from our definitions so far, but can only be formulated compactly when we introduce an additional construction: the adjoint of $\mathsf{f}$. We do this first.

The **adjoint** $\bar{\mathsf{f}}$ of the linear transformation $\mathsf{f} : \mathbb{R}^n \to \mathbb{R}^n$ is a linear transformation $\bar{\mathsf{f}} : \mathbb{R}^n \to \mathbb{R}^n$, defined implicitly for vectors by the equation

$$\boxed{\text{adjoint transformation}: \quad \mathsf{f}[\mathbf{a}] * \mathbf{b} = \mathbf{a} * \bar{\mathsf{f}}[\mathbf{b}]} \tag{4.10}$$

for all $\mathbf{a}$ and $\mathbf{b}$ of $\mathbb{R}^n$. In nondegenerate metrics, this defines it fully. In degenerate metrics, we have similar incompleteness issues as for (3.6)—you can then use an explicit, coordinate-based formula. This is explored in structural exercise 9.

It is strange to have the definition so implicit. To show that the adjoint is actually a familiar concept from linear algebra, we momentarily convert the equation to matrix notation. Let $[[\mathsf{f}]]$ be the matrix of the mapping $\mathsf{f}$ and $[[\bar{\mathsf{f}}]]$ be the matrix of $\bar{\mathsf{f}}$, and convert the inner product to a matrix product. Vectors like $\mathbf{a}$ are represented as a column matrix $[[\mathbf{a}]]$. By transferring (4.10) to matrix notation in the case of a Euclidean orthonormal basis and by using the matrix transpose, we obtain

$$[[\mathbf{a}]]^T [[\bar{\mathsf{f}}]][[\mathbf{b}]] = ([[\mathsf{f}]][[\mathbf{a}]])^T [[\mathbf{b}]] = [[\mathbf{a}]]^T [[\mathsf{f}]]^T [[\mathbf{b}]],$$

so $[[\bar{\mathsf{f}}]] = [[\mathsf{f}]]^T$. This implies that for vectors in a Euclidean orthonormal basis, the adjoint of $\mathsf{f}$ is the transpose mapping, specified in a coordinate-free manner.

For blades (and even for multivectors), we extend $\bar{\mathsf{f}}$ as an outermorphism. This leads to

$$\boxed{\text{adjoint transformation}: \quad \mathsf{f}[A] * B = A * \bar{\mathsf{f}}[B],} \tag{4.11}$$

which we could have taken as the definition of the adjoint for blades. For general $\mathsf{f}$, it follows easily from the symmetry of the scalar product that

$$\bar{\bar{\mathsf{f}}} = \mathsf{f},$$

since $\bar{\mathsf{f}}[A] * B = A * \mathsf{f}[B] = \mathsf{f}[A] * B$, for all $B$. Another useful property is

$$\overline{\mathsf{f}^{-1}} = \bar{\mathsf{f}}^{-1},$$

which is easily shown from the definition (4.10).

Some examples:

- If $\mathsf{f}$ is the uniform scaling defined by $\mathsf{f}[\mathbf{x}] = \alpha \mathbf{x}$, then $\mathsf{f}[\mathbf{x}] \cdot \mathbf{a} = \mathbf{x} \cdot (\alpha \mathbf{a}) = (\alpha \mathbf{x}) \cdot \mathbf{a}$ for all $\mathbf{x}$ and $\mathbf{a}$. This yields $\bar{\mathsf{f}}[\mathbf{x}] = \alpha \mathbf{x}$, so in this case $\bar{\mathsf{f}} = \mathsf{f}$, the adjoint equals the original transformation. As an outermorphism on blades, the adjoint is also $\bar{\mathsf{f}}[X] = \mathsf{f}[X]$.

- A special case of the uniform scaling is the point-reflection into the origin, which has $\alpha = -1$. Again, $\bar{\mathsf{f}} = \mathsf{f}$, but now also $\mathsf{f}^{-1} = \mathsf{f}$.

- In Figure 4.2, we met the line projection $\mathsf{P}[\mathbf{x}] = \mathbf{a} (\mathbf{x} \wedge \mathbf{b})/(\mathbf{a} \wedge \mathbf{b}) = \mathbf{a} (\mathbf{x} \wedge \mathbf{b})(\mathbf{a} \wedge \mathbf{b})^{-1}$. Its adjoint is $\bar{\mathsf{P}}[\mathbf{x}] = (\mathbf{x} \cdot \mathbf{a}) \mathbf{b}(\mathbf{a} \wedge \mathbf{b})^{-1}$. This, therefore, is proportional to the dual of $\mathbf{b}$ in the $(\mathbf{a} \wedge \mathbf{b})$ plane.

### 4.3.3 Linear Transformation of the Contraction

To demonstrate how the contraction product transforms under linear transformations, we first show

$$\mathsf{f}[\bar{\mathsf{f}}[A] \rfloor B] = A \rfloor \mathsf{f}[B], \tag{4.12}$$

which we derive simply using the scalar product definition:

$$\begin{aligned}
X * (A \rfloor \mathsf{f}[B]) &= (X \wedge A) * \mathsf{f}[B] \\
&= \mathsf{f}[X \wedge A] * B \\
&= (\mathsf{f}[X] \wedge \mathsf{f}[A]) * B \\
&= \mathsf{f}[X] * (\mathsf{f}[A] \rfloor B) \\
&= X * \bar{\mathsf{f}}[\mathsf{f}[A] \rfloor B].
\end{aligned}$$

If $\bar{\mathsf{f}}$ is invertible (which happens precisely when $\mathsf{f}$ is invertible), we can define $A' = \bar{\mathsf{f}}^{-1}[A]$. Substituting that in (4.12) and dropping the prime gives the promised transformation law for the contraction product:

$$\boxed{\text{contraction transformation}: \quad \mathsf{f}[A \rfloor B] = \bar{\mathsf{f}}^{-1}[A] \rfloor \mathsf{f}[B].} \tag{4.13}$$

By the linearity of the functions and operators involved, this is of course immediately extendable to arbitrary multivectors as $\mathsf{f}[A \rfloor B] = \bar{\mathsf{f}}^{-1}[A] \rfloor \mathsf{f}[B]$.

The result of (4.13) is very powerful, but unfortunately rather abstract. We have not found an easy geometric picture that will convince you of its necessary truth. But the interpretation of the contraction $A \rfloor B$ as "the part of $B$ that remains when $A$ is taken out in a perpendicular manner" (to paraphrase) helps remember the placement of $\mathsf{f}$ and its derived mappings. Obviously, the transformed result is a part of $B$, so it should transform as $\mathsf{f}[B]$; and taking $A$ out could explain the inverse $\mathsf{f}^{-1}$; doing so in an orthogonal manner justifies the adjoint $\bar{\mathsf{f}}$.

### 4.3.4 Orthogonal Transformations

If a linear transformation of vectors preserves their inner product, we call it an **orthogonal transformation**. It then satisfies

$$\boxed{\text{orthogonal transformation}: \quad \mathsf{f}[\mathbf{a}] \cdot \mathsf{f}[\mathbf{b}] = \mathbf{a} \cdot \mathbf{b}, \quad \text{for all } \mathbf{a}, \mathbf{b} \in \mathbb{R}^n.}$$

Since orthogonal transformations are invertible, we may set $\mathbf{a} = \mathsf{f}^{-1}[\mathbf{x}]$, to obtain $\mathbf{x} \cdot \mathsf{f}[\mathbf{b}] = \mathsf{f}^{-1}[\mathbf{x}] \cdot \mathbf{b}$ for all $\mathbf{x}, \mathbf{b}$. It follows that

$$\bar{\mathsf{f}} = \mathsf{f}^{-1},$$

so for an orthogonal transformation, the adjoint equals the inverse transformation. You probably knew this fact from linear algebra, in terms of *the inverse of an orthogonal matrix is its transpose*. In the present context, "inverse equals adjoint" is a statement about the mappings rather than their matrices, and by outermorphism, it also holds for the outermorphism extension of the mapping to blades.

With this, the transformation formula of the contraction is much simpler when $\mathsf{f}$ is an orthogonal transformation:

$$\mathsf{f}[A \rfloor B] = \mathsf{f}[A] \rfloor \mathsf{f}[B].$$

Therefore, for orthogonal transformations, the contraction transforms in a structure-preserving manner: the contraction of the transformed blades is the transformation of the contraction. Orthogonal transformations are thus "innermorphisms" as well as outermorphisms (since the contraction is actually an inner product for blades).

Familiar examples are reflections and rotations. In fact, they are the prototypical orthogonal transformations, and we will discover in Chapter 7 that the general case can always be written as a rotation followed by a reflection (or vice versa).

### 4.3.5 Transforming a Dual Representation

The dual of a blade $X$ is $X^* \equiv X I_n^{-1}$. When $X$ undergoes a linear transformation $\mathsf{f}$, the dual is transformed as well. We should define the transformation $\mathsf{f}^*$ of the dual by demanding that it preserve the duality relationship: the $\mathsf{f}^*$-transform of the dual should be the dual of the $\mathsf{f}$-transformed $X$. In formula:

$$\boxed{\text{dual transformation}: \quad \mathsf{f}^*[X^*] \equiv (\mathsf{f}[X])^*.}$$

That specifies it. We introduce $D = X^*$, and find

$$\begin{aligned}
\mathsf{f}^*[D] &= (\mathsf{f}[D^{-*}])^* \\
&= \mathsf{f}[D I_n] I_n^{-1} \\
&= (\bar{\mathsf{f}}^{-1}[D] \rfloor \mathsf{f}[I_n]) \rfloor I_n^{-1} \\
&= \bar{\mathsf{f}}^{-1}[D] \wedge (\mathsf{f}[I_n] \rfloor I_n^{-1}) \\
&= \det(\mathsf{f}) \bar{\mathsf{f}}^{-1}[D], \tag{4.14}
\end{aligned}$$

as the necessary definition of the linear transformation on duals. Since this is not generally equal to $\mathsf{f}[D]$, it implies that blades that are intended as dual representations do not transform in the same way as blades that are intended as direct representations. In a proper representation of geometry, we therefore need to indicate how a blade is to be interpreted before we can act on it appropriately with a linear transformation.

Note that the outermorphism transformation law of direct blades is nonmetric, since it only involves the outer product. By contrast, $\mathsf{f}^* = \det(\mathsf{f}) \bar{\mathsf{f}}^{-1}$ is metric, since it is expressible in terms of the adjoint $\bar{\mathsf{f}}$ whose definition involves the scalar product. This makes sense, since in our algebra of subspaces dualization is a metric concept.

An orthogonal transformation has a determinant equal to $\pm 1$ (see structural exercise 10), and has $\bar{\mathsf{f}}^{-1} = \mathsf{f}$. For such transformations, the dual representation therefore transforms rather nicely: $\mathsf{f}^*[X^*] = \pm \mathsf{f}[X^*]$. For rotations, which have determinant $+1$, this is completely structure-preserving: the dual of the transform is the transform of the dual. For rotations it is therefore not necessary to know whether a blade is a dual or direct representation before you can transform it. For orthogonal transformations containing a reflection, which have determinant $-1$, the extra minus sign in the dual is caused by the reflection of the pseudoscalar of the space. It now makes a difference whether you desire to take the dual of the transform relative to the original pseudoscalar (then you need the $-1$), or relative to the transformed pseudoscalar (then there is no sign).

### 4.3.6 Application: Linear Transformation of the Cross Product

As we discussed in Section 3.7, the cross product is an inherently 3-D construct, and we can replace all its uses by elements of our subspace algebra that generalize to $n$-dimensional space:

$$\mathbf{a} \times \mathbf{b} = (\mathbf{a} \wedge \mathbf{b})^* = (\mathbf{a} \wedge \mathbf{b}) I_3^{-1}.$$

It is interesting to derive an additional argument as to why the cross product should not be used: the normal vector $\mathbf{a} \times \mathbf{b}$ of $\mathbf{a}$ and $\mathbf{b}$, used as a characterization of the homogeneous plane spanned by $\mathbf{a}$ and $\mathbf{b}$, behaves rather awkwardly under a linear transformation $\mathsf{f}$. For its definition clearly shows that it is a dual representation of a 2-blade, and therefore it should transform according to (4.14):

$$\mathbf{a} \times \mathbf{b} \to \det(\mathsf{f}) \bar{\mathsf{f}}^{-1}[\mathbf{a} \times \mathbf{b}]. \tag{4.15}$$

This is not equal to $\mathsf{f}[\mathbf{a}] \times \mathsf{f}[\mathbf{b}]$, so the normal vector of the transforms does not equal the transform of the normal vector.

In computer graphics and engineering applications, it is customary to use "vector" as a synonym for a tuple of coordinates as well as for a geometrical 1-D direction. The three coefficients of $\mathbf{n} = \mathbf{a} \times \mathbf{b}$ are a vector in the sense of a 3-tuple, but the geometry of $\mathbf{n}$ makes this vector transform unlike a geometrical direction, so it is called a **normal vector**. Even though it is given on the same basis as a regular vector, it requires its own methods to be transformed. The transformation of such a normal vector under the linear transformation with matrix $[[\mathsf{f}]]$ on regular vectors must explicitly be implemented as the matrix $\det(\mathsf{f}) [[\mathsf{f}^{-1}]] = \det(\mathsf{f}) [[\mathsf{f}]]^{-T}$, where $[[\mathsf{f}]]^{-T}$ is the inverse of the transposed matrix.

Within the code, such a different transformation for seemingly similar 3-tuples can only be invoked if their data type is kept explicitly. Even then, novices easily get confused; this is a common source of programming error. We provide a programming exercise at the end of this chapter to explore the differences.

In our subspace algebra, we have two choices. We can introduce normal vectors, which then of course need to transform according to $\mathsf{f}^* = \det(\mathsf{f}) \bar{\mathsf{f}}^{-1}$. They do so automatically when we define them explicitly in the code. Or we can just characterize the same quantity using the original 2-blade $\mathbf{a} \wedge \mathbf{b}$, which transforms according to the outermorphism $\mathsf{f}$ as $\mathsf{f}[\mathbf{a} \wedge \mathbf{b}] = \mathsf{f}[\mathbf{a}] \wedge \mathsf{f}[\mathbf{b}]$. As a characterization of either a plane or a rotation (through its rotation plane), the 2-blade is just as admissible as the classical normal vector, and now you don't need to remember how it transforms. This transformational simplicity reinforces the practical considerations of Section 3.7, and reaffirms our decision to drop the cross product from sound practice in geometrical representation.

---

## 4.4 Inverses of Outermorphisms

With the transformation formula for the contraction, we can derive a closed form, coordinate-free formula for the inverse of an outermorphism. First, we compute

$$\mathsf{f}[A \rfloor I_n^{-1}] = \bar{\mathsf{f}}^{-1}[A] \rfloor \mathsf{f}[I_n^{-1}] = \det(\mathsf{f}) \bar{\mathsf{f}}^{-1}[A] \rfloor I_n^{-1}.$$

Since $\det(\bar{\mathsf{f}}) = \det(\bar{\mathsf{f}}) I_n^{-1} * I_n = \bar{\mathsf{f}}[I_n^{-1}] * I_n = I_n^{-1} * \mathsf{f}[I_n] = \det(\mathsf{f}) I_n^{-1} * I_n = \det(\mathsf{f})$, we can substitute $\det(\mathsf{f})$ by $\det(\bar{\mathsf{f}})$. Now do the contraction of both sides on $I_n$, giving[^2]

$$\boxed{\mathsf{f}^{-1}[A] = \frac{\bar{\mathsf{f}}[A \rfloor I_n^{-1}] \rfloor I_n}{\det \mathsf{f}}.} \tag{4.16}$$

In terms of duals, (4.16) reads

$$\mathsf{f}^{-1}[A]^* = \frac{\bar{\mathsf{f}}[A^*]}{\det \mathsf{f}}.$$

Mathematicians may object to the use of duality in this formula: taking the inverse of a mapping does not necessarily require a metric space, whereas duality is of course a metric concept. It turns out that the two dualities in (4.16) cancel each other, in the sense that the result does not depend on the precise form of the metric any more, and is therefore actually nonmetric. We feel that if you have a metric (as you often do), you should use it. If you don't have one, you can temporarily introduce a convenient one (e.g., Euclidean) and compute on.

[^2]: When rereading this book, you may want to replace the contractions in formula (4.16) by the geometric product of Chapter 6.

Here are some examples of evaluation of the inverse on various blades:

#### 1. Pseudoscalar

$$\mathsf{f}^{-1}[I_n] = \frac{\bar{\mathsf{f}}[1] \rfloor I_n}{\det \mathsf{f}} = \frac{1}{\det \mathsf{f}} I_n,$$

showing that $\det(\mathsf{f}^{-1}) = (\det \mathsf{f})^{-1}$.

#### 2. Scalar

$$\mathsf{f}^{-1}[\alpha] = \frac{\bar{\mathsf{f}}[\alpha I_n^{-1}] \rfloor I_n}{\det \mathsf{f}} = \frac{\alpha \det \bar{\mathsf{f}} (I_n^{-1} \rfloor I_n)}{\det \mathsf{f}} = \alpha \frac{\det \bar{\mathsf{f}}}{\det \mathsf{f}} = \alpha,$$

as expected since the inverse is also a linear transformation.

#### 3. Vectors

$$\mathsf{f}^{-1}[\mathbf{a}] = \frac{\bar{\mathsf{f}}[\mathbf{a} \rfloor I_n^{-1}] \rfloor I_n}{\det \mathsf{f}}.$$

For vectors there is no simplification of the basic equation, but when you follow this computation for the matrix of $\mathsf{f}^{-1}$ on some basis, you find that you have essentially the minor-based construction of the inverse from classical linear algebra (see structural exercise 15). But remember, that construction only applies to $\mathsf{f}$ acting on vectors, whereas (4.16) is much more powerful because it also applies to the outermorphism extension on arbitrary blades and multivectors.

---

## 4.5 Matrix Representations

A matrix is a convenient way of representing a linear transformation relative to a given basis. It is specific to that basis, and therein lies its strength (it is efficient) and its weakness (you cannot tell what it does directly from its form). Matrices are used in implementations of geometric algebra, though usually hidden from the user. You do not need them to specify your linear transformations, but they are an efficient implementation of the specified transformation at the very lowest level.

We introduce our notation for matrices, and show how they can be written completely in terms of the products from subspace algebra to convey their geometric specificity. Then we construct the matrix of the outermorphism of a linear transformation $\mathsf{f}$ acting on all multivectors of $\mathbb{R}^n$.

### 4.5.1 Matrices for Vector Transformations

If you have a basis $\{\mathbf{b}_i\}_{i=1}^n$ (not necessarily orthonormal) for the vector space $\mathbb{R}^n$, you can use this to define a matrix representation of a linear transformation $\mathsf{f}$ of that space. This can then be used to transform arbitrary vectors, since they can be written as a weighted sum of basis vectors, over which $\mathsf{f}$ distributes.

We define a column representation of the vector $\mathbf{x}$, in which the element in the $j$th row of the column is labeled by a superscript as $[[\mathbf{x}]]^j$. Then

$$[[\mathbf{x}]]^j = x^j = \mathbf{x} \cdot \mathbf{b}^j,$$

using the reciprocal frame from Section 3.8. We define the matrix through specification of its element $(j, i)$, which is the $j$-coordinate of the transformed $\mathbf{b}_i$:

$$[[\mathsf{f}]]^j_i \equiv \mathsf{f}[\mathbf{b}_i] \cdot \mathbf{b}^j. \tag{4.17}$$

For this matrix, the superscript index $j$ labels the row of matrix, and the subscript index $i$ labels the column (so it is consistent with viewing a vector as a matrix with 1 column and $n$ rows). Equation (4.17) implies that the $i$th column of the matrix is the image of the $i$th basis vector $\mathbf{b}_i$ under the transformation $\mathsf{f}$.

The transformation of an arbitrary vector $\mathbf{x}$ can be composed from the matrix contributions as

$$\mathsf{f}[\mathbf{x}] = \sum_{i=1}^n \mathsf{f}[(\mathbf{x} \cdot \mathbf{b}^i) \mathbf{b}_j] = \sum_{j=1}^n \sum_{i=1}^n (\mathbf{x} \cdot \mathbf{b}^i)(\mathsf{f}[\mathbf{b}_i] \cdot \mathbf{b}^j) \mathbf{b}_j = \sum_{j=1}^n \sum_{i=1}^n [[\mathsf{f}]]^j_i [[\mathbf{x}]]^i \mathbf{b}_j.$$

Taking the inner product with $\mathbf{b}^j$ and using $\mathbf{b}_i \cdot \mathbf{b}^j = \delta^j_i$ (according to (3.32)), the $\mathbf{b}_j$-coefficient of the transformed vector is

$$[[\mathsf{f}[\mathbf{x}]]]^j = \mathsf{f}[\mathbf{x}] \cdot \mathbf{b}^j = \sum_{i=1}^n [[\mathsf{f}]]^j_i [[\mathbf{x}]]^i.$$

We have thus retrieved the familiar multiplication of a vector by a matrix, which may be denoted in shorthand over all rows as

$$[[\mathsf{f}[\mathbf{x}]]] = [[\mathsf{f}]] [[\mathbf{x}]].$$

Writing out (4.17) using the techniques of (3.32), we find the matrix element fully expressed in geometric algebra (remember that $I_n = \mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_n$, and $\breve{\mathbf{b}}_j$ means that $\mathbf{b}_j$ is omitted):

$$\begin{aligned}
[[\mathsf{f}]]^j_i &= (-1)^{j-1} \mathsf{f}[\mathbf{b}_i] \rfloor (\mathbf{b}_1 \wedge \cdots \wedge \breve{\mathbf{b}}_j \wedge \cdots \wedge \mathbf{b}_n) I_n^{-1} \\
&= (-1)^{j-1} (\mathsf{f}[\mathbf{b}_i] \wedge \mathbf{b}_1 \wedge \cdots \wedge \breve{\mathbf{b}}_j \wedge \cdots \wedge \mathbf{b}_n) I_n^{-1} \\
&= (\mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_{j-1} \wedge \mathsf{f}[\mathbf{b}_i] \wedge \mathbf{b}_{j+1} \wedge \cdots \wedge \mathbf{b}_n) I_n^{-1}. \tag{4.18}
\end{aligned}$$

So the recipe to construct the matrix element is that $\mathsf{f}[\mathbf{b}_i]$ takes the place of $\mathbf{b}_j$ in the first factor of the expression $I_n I_n^{-1}$.

The general expression of (4.18) denotes explicitly which geometrical concepts are involved in the definition of the matrix of a transformation: a particular basis (not necessarily orthonormal) and a particular choice of pseudoscalar for the space. The latter is automatically determined once one specifies the basis vectors in the desired order, as $I_n = \mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_n$. But (4.18) demonstrates that there is a rather involved object at the basis of the common way of doing linear algebra. This has advantages in its compactness; but taking it fully as the basis of expression, one loses the power to express simpler concepts when those would suffice.

### 4.5.2 Matrices for Outermorphisms

A linear mapping can be represented as a matrix, and this holds not only for the original mapping on vectors, but also on the outermorphism mappings on each of the $k$-blades (or $k$-vectors). This follows the same procedure as for vectors, but now on a basis for the $\binom{n}{k}$-dimensional space $\bigwedge^k \mathbb{R}^n$ of $k$-blades (or $k$-vectors) in $\mathbb{R}^n$.

We first need to establish a basis and a reciprocal basis for that space. Let us illustrate the principle for bivectors; the generalization is straightforward. If the basis of the vector space is $\{\mathbf{b}_i\}_{i=1}^n$, then we can take as our basis 2-blades:

$$\mathbf{b}_{ij} \equiv \mathbf{b}_i \wedge \mathbf{b}_j.$$

There is no natural order among them (except perhaps in 3-D, where you can take them in order of the missing index: $\{\mathbf{b}_{23}, \mathbf{b}_{31}, \mathbf{b}_{12}\}$, with cyclically varying indices). You should see $ij$ as a single index running through its $\binom{n}{2}$ possible values. We denote that by a capital index, so a general bivector would be expressible as $X = \sum_I X^I \mathbf{b}_I$, with appropriately chosen coefficients $X^I$.

In a metric space $\mathbb{R}^n$, the reciprocal basis corresponding to the basis $\{\mathbf{b}_I\}$ is then constructed using the reciprocal basis vectors:

$$\mathbf{b}^{ij} = (\mathbf{b}^i \wedge \mathbf{b}^j)^{\sim}.$$

The reversion makes the scalar product between the basis vectors behave as if it were an orthonormal basis under the scalar product (or, if you prefer, the contraction):

$$\mathbf{b}_I * \mathbf{b}^I = \mathbf{b}_{ij} * \mathbf{b}^{ij} = (\mathbf{b}_i \wedge \mathbf{b}_j) * (\mathbf{b}^j \wedge \mathbf{b}^i) = (\mathbf{b}_i * \mathbf{b}^i)(\mathbf{b}_j * \mathbf{b}^j) = 1,$$

and the scalar product is zero for unequal indices. Therefore

$$\mathbf{b}_I * \mathbf{b}^J = \delta^J_I.$$

The coefficient $X^I$ of a bivector $X$ on the basis $\{\mathbf{b}_I\}$ is then $X * \mathbf{b}^I$, so that we can write

$$X = \sum_I (X * \mathbf{b}^I) \mathbf{b}_I.$$

With this preparation, the matrix of the outermorphism of $\mathsf{f}$ can be defined by complete analogy with the vector case as

$$[[\mathsf{f}]]^J_I = \mathsf{f}[\mathbf{b}_I] * \mathbf{b}^J.$$

This is enough to compute the matrix. If the linear transformation $\mathsf{f}$ is expensive to evaluate, you may prefer a form that expresses this matrix directly in terms of the vectors $\mathsf{f}[\mathbf{b}_i]$. Let us expand the general term, reverting to the specific vector indices:

$$\begin{aligned}
[[\mathsf{f}]]^{j_1 j_2}_{i_1 i_2} &= \mathsf{f}[\mathbf{b}_{i_1 i_2}] * \mathbf{b}^{j_1 j_2} \\
&= (\mathsf{f}[\mathbf{b}_{i_1}] \wedge \mathsf{f}[\mathbf{b}_{i_2}]) * (\mathbf{b}^{j_2} \wedge \mathbf{b}^{j_1}) \\
&= (\mathsf{f}[\mathbf{b}_{i_2}] * \mathbf{b}^{j_2})(\mathsf{f}[\mathbf{b}_{i_1}] * \mathbf{b}^{j_1}) - (\mathsf{f}[\mathbf{b}_{i_2}] * \mathbf{b}^{j_1})(\mathsf{f}[\mathbf{b}_{i_1}] * \mathbf{b}^{j_2}) \\
&= [[\mathsf{f}]]^{j_2}_{i_2} [[\mathsf{f}]]^{j_1}_{i_1} - [[\mathsf{f}]]^{j_1}_{i_2} [[\mathsf{f}]]^{j_2}_{i_1}.
\end{aligned}$$

By either method, the outermorphism matrix can be constructed from the matrix acting on the basis vectors. In any implementation, this trivial computation of the outermorphism should be hidden from the user, who should simply be allowed to apply the linear transformation to any element of the algebra. The programming exercise in [[#4.9.2 Orthogonal Projection, Matrix Representation|Section 4.9.2]] lets you enjoy this functionality, and compares the efficiency of the matrix approach to the regular subspace algebra implementation of the outermorphism.

---

## 4.6 Summary

We summarize the most important results of this chapter:

- A linear transformation $\mathsf{f} : \mathbb{R}^n \to \mathbb{R}^n$ can always be extended as an **outermorphism** to a linear transformation working on blades in all of $\bigwedge \mathbb{R}^n$, also denoted by $\mathsf{f}$.

- Under a linear transformation $\mathsf{f}$ (extended as an outermorphism), the products of the subspace algebra transform as follows:

$$\begin{aligned}
\mathsf{f}[A \wedge B] &= \mathsf{f}[A] \wedge \mathsf{f}[B] \\
\mathsf{f}[A * B] &= A * B \\
\mathsf{f}[A \rfloor B] &= \bar{\mathsf{f}}^{-1}[A] \rfloor \mathsf{f}[B],
\end{aligned}$$

  where $\bar{\mathsf{f}}$ is the adjoint transformation (basically, the transpose of matrix algebra). **The structure of the outer product is therefore preserved by any linear transformation.**

- There is a coordinate-free formula for the inverse of a linear transformation $\mathsf{f} : \mathbb{R}^n \to \mathbb{R}^n$, which reads

$$\mathsf{f}^{-1}[A] = \frac{\bar{\mathsf{f}}[A \rfloor I_n^{-1}] \rfloor I_n}{\det \mathsf{f}}.$$

- For **orthogonal transformations**, $\mathsf{f}^{-1} = \bar{\mathsf{f}}$, so the structure of the contraction is preserved by any orthogonal transformations.

---

## 4.7 Suggestions for Further Reading

In this single chapter, we have explained all you need to know for this book about linear transformations in general. We will home in on the orthogonal transformations in particular, and the powerful ways geometric algebra offers to represent them, in Chapter 7. But of course a lot more can be said about linear transformations and how they can be analyzed using the tools of the algebra of subspaces.

Some of the following literature is better studied when you have also learned about the geometric product (after Chapter 6), but it seems most appropriate to give you this list of material on linear transformations in the eponymous chapter.

- A very accessible article by Hestenes [27] gives a good entry to linear transformations as viewed by geometric algebra, and uses its tools to expose the structure of linear algebra.

- Working with blades as computational elements is very similar to developing a multilinear algebra (though in a metric manner). Classically, that quickly gets into tensor representations of multilinear mappings. Doran and Lasenby ([15], Chapter 4) relate this clearly to the geometric algebra representation.

- Numerical techniques in linear algebra rely heavily on techniques like the singular value decomposition (SVD) and eigenvector analysis. The extension of such tools to geometric algebra should be straightforward and would give us the general eigenspaces. As yet, little numerical work exists that uses it directly, though [1] gives some initial results.

- We will have more to say about the representation of orthogonal transformations in the "Further Reading" list of Chapter 7.

---

## 4.8 Structural Exercises

1. Point mirroring in 3-D space leads to a change of orientation of the volume 3-blades. We know this spatial inversion better from reflection in a mirror. Show that this has indeed the same effect. *(Hint: Let the mirror plane be characterized by a 2-blade $B$, and let $\mathbf{a}$ be a vector perpendicular to $B$ (for example, $\mathbf{a} = B^*$). Then define the linear transformation performing the mirror reflection, and apply it to a sensibly chosen 3-blade in this setup. Why does your result generalize to arbitrary 3-blades?)*

2. Let us compute the determinant according to (4.7) in a 2-D space and compare it to the classical determinant. Take a basis $\{\mathbf{b}_1, \mathbf{b}_2\}$, not necessarily orthonormal. Let the linear mapping $\mathsf{f}$ be such that $\mathsf{f}[\mathbf{b}_1] = \mathbf{x}$ and $\mathsf{f}[\mathbf{b}_2] = \mathbf{y}$. Develop $\mathbf{x}$ and $\mathbf{y}$ onto the basis $\mathbf{x} = x_1 \mathbf{b}_1 + x_2 \mathbf{b}_2$ and $\mathbf{y} = y_1 \mathbf{b}_1 + y_2 \mathbf{b}_2$. Use $I_2 = \mathbf{x} \wedge \mathbf{y}$ and compute the determinant according to (4.7). Now compute the matrix of $\mathsf{f}$ on the given basis, and compute its classical determinant. The results should match.

3. You may want to apply a linear mapping $\mathsf{f}$ to a $k$-dimensional subspace. You could then be tempted to use (4.7) with its pseudoscalar $I_k$ substituted for $I_n$ to define what the determinant of $\mathsf{f}$ is on this subspace. Why doesn't this work?

4. Consider the linear transformation of vectors in the $\mathbf{a} \wedge \mathbf{b}$ plane determined by what happens to the vectors $\mathbf{a}$ and $\mathbf{b}$: $\mathsf{f}[\mathbf{a}] = 5\mathbf{a} - 3\mathbf{b}$ and $\mathsf{f}[\mathbf{b}] = 3\mathbf{a} - 5\mathbf{b}$. Use classical linear algebra methods to find eigenvectors and their eigenvalues. Now use our algebra to determine the determinant, and an eigen-2-blade with its corresponding eigenvalue, and then interpret the geometry of the transformation.

5. Design a nontrivial linear map $\mathsf{f} : \mathbb{R}^2 \to \mathbb{R}^2$ that has an eigenvector and an eigen-2-blade, both with eigenvalue 1.

6. When deriving the linear transformation of the scalar product $\mathsf{f}[A * B] = A * B$ in [[#4.3.1 Linear Transformation of the Scalar Product|Section 4.3.1]], we raised the issue that this appears to mean that every linear transformation leaves the squared norm $A * A$ invariant. Show that this is of course not true. *(Hint: What is the formula for the squared norm of the transformed $A$ actually?)*

7. To continue with the previous problem after you know about the adjoint in [[#4.3.2 The Adjoint of a Linear Transformation|Section 4.3.2]], rewrite the correct expression for the squared norm of $\mathsf{f}[A]$ in the form $A * \mathsf{g}[A]$ and determine $\mathsf{g}$ in terms of $\mathsf{f}$. This is the metric mapping corresponding to the transformation $\mathsf{f}$, and it shows that the transformed space can be treated as a space with a new inner product $\mathbf{a} \cdot \mathbf{b} \equiv \mathbf{a} * \mathsf{g}[\mathbf{b}]$.

8. Continuing from the previous problem, show that the metric mapping corresponding to an orthogonal transformation is the identity. Therefore, orthogonal transformations preserve norms (and cosines of angles).

9. Show that in a non-degenerate metric space $\mathbb{R}^n$ with arbitrary basis $\{\mathbf{b}_i\}_{i=1}^n$, the adjoint of a linear transformation $\mathsf{f}$ can be constructed as

$$\bar{\mathsf{f}}[\mathbf{x}] = \sum_{i=1}^n (\mathbf{x} * \mathsf{f}[\mathbf{b}_i]) \mathbf{b}^i. \tag{4.19}$$

10. Show that an orthogonal transformation has a determinant of $\pm 1$.

11. Give an expression for $\mathsf{f}[A \lfloor B]$. *Hint: Consider the symmetry of (4.10).*

12. Give an example of a linear transformation for which the transformed cross product $\mathsf{f}[\mathbf{a} \times \mathbf{b}]$ is not parallel to the cross product of the transforms $\mathsf{f}[\mathbf{a}] \times \mathsf{f}[\mathbf{b}]$. That of course implies it is not perpendicular to $\mathsf{f}[\mathbf{a}]$ and $\mathsf{f}[\mathbf{b}]$, so it has ceased to be a normal vector. This theme is further explored in the programming exercise of [[#4.9.3 Transforming Normal Vectors|Section 4.9.3]] below.

13. For the shear $\mathbf{x} \to \mathsf{f}_s[\mathbf{x}] \equiv \mathbf{x} + s (\mathbf{x} \cdot \mathbf{e}_1) \mathbf{e}_2$ (on the standard orthonormal basis of $\mathbb{R}^{n,0}$), compute the transformation matrix $[[\mathsf{f}_s]]$ (to act on vectors). Also compute the matrix $[[\mathsf{f}^*_s]]$. Verify the results in a picture of the shear of a planar line and its normal vector.

14. Verify that (4.18) indeed gives the identity matrix for the identity mapping.

15. The classical closed-form formula for the inverse of a matrix $[[A]]$ is

$$[[A]]^{-1} = \frac{\text{adj}([[A]])}{\det([[A]])}, \tag{4.20}$$

where $\text{adj}([[A]])$ is the classical adjoint matrix, of which the $(i, j)$th element equals $(-1)^{i+j} \det([[A_{ji}]])$, with $[[A_{ji}]]$ a minor matrix obtained from $[[A]]$ by omitting the $j$th row and the $i$th column. Show that this terrific coordinate-based construction is identical to the coordinate-free formula (4.16). Equation (4.20) is very hard to compute with algebraically, though we will say that it is easy to implement. *(We should mention that in practice, one implements matrix inversion by Gaussian elimination, so that (4.20) is usually treated as little more than a mathematical curiosity, neither good for derivation nor for implementation.)*

16. Continuing the previous exercise, give an expression in matrix form of the dual mapping $\mathsf{f}^* = \det(\mathsf{f}) \bar{\mathsf{f}}^{-1}$. This should endow the involved algebraic concept of a matrix of minors with a clear geometrical meaning.

17. In standard linear algebra, one way to encode a subspace is as the image of a matrix. The subspace spanned by the basis $\{\mathbf{b}_1, \ldots, \mathbf{b}_k\}$ is then the image of the matrix $[[B]] = [[\mathbf{b}_1 \cdots \mathbf{b}_k]]$. The orthogonal projection of a vector $\mathbf{x}$ onto this subspace in $[[B]]$ is computed using the projection matrix as the vector

$$[[B]]([[B]]^T [[B]])^{-1} [[B]]^T [[\mathbf{x}]].$$

Show that this is, in fact, the same mapping as our $(\mathbf{x} \rfloor B) B^{-1}$ of (3.25). How would you describe the extension to an outermorphism in standard linear algebra?

---

## 4.9 Programming Examples and Exercises

### 4.9.1 Orthogonal Projection

This example lets you manipulate three vectors. One of the vectors gets projected onto the 2-blade spanned by the other two. The code is very simple:

```cpp
// g_vectors[] is a global array of 3 vectors.
// compute bivector (*4 to make it a bit larger):
bivector B = _bivector(4.0f * g_vectors[0] ^ g_vectors[1]);

// project g_vectors[2] onto the bivector
// The symbol '<<' is the left contraction
e3ga::vector P = _vector((g_vectors[2] << inverse(B)) << B);
```

> **Figure 4.4:** Projection. The blue vector is projected onto the bivector spanned by the red and green vector.

In the next example, we use the outermorphism matrix representation of the projection to do the same thing.

### 4.9.2 Orthogonal Projection, Matrix Representation

Outermorphisms are great because they can be summarized into their respective matrix representation, one matrix for each grade of blades. These outermorphism matrices can then be applied to any blade instead of the original outermorphism defined explicitly in terms of subspace products. That matrix approach is usually faster.

In this example, we redo the previous example, this time using the outermorphism matrices to apply the transformation. See the code in Figure 4.5. First, we compute the images of all basis vectors under the linear transformation—in this case, orthogonal projection. Those images are used to initialize the matrix representation `M` of the transformation on vectors:

```cpp
om M(imageOfE1, imageOfE2, imageOfE3);
```

The `om` class (for outermorphism matrix) contains a matrix for each grade part $1, 2, \ldots, n$ of elements in the $n$-dimensional space $\mathbb{R}^n$. Given the images of the basis vectors, it initializes all outermorphism matrices using the method described in [[#4.5.2 Matrices for Outermorphisms|Section 4.5.2]]. Once the `om` class is initialized, it can be applied to any blade, for example,

```cpp
e3ga::vector P = _vector(apply_om(M, g_vectors[2]));
```

> **Figure 4.5:** Matrix representation of projection code.

```cpp
// g_vectors[] is a global array of 3 vectors.
// compute bivector (*4 to make it a bit larger):
bivector B = _bivector(4.0f * g_vectors[0] ^ g_vectors[1]);

// we need the images of the 3 basis vectors under the
// projection:
e3ga::vector imageOfE1 = _vector((e1 << inverse(B)) << B);
e3ga::vector imageOfE2 = _vector((e2 << inverse(B)) << B);
e3ga::vector imageOfE3 = _vector((e3 << inverse(B)) << B);

// initialize the matrix representation
om M(imageOfE1, imageOfE2, imageOfE3);

// apply the matrix to the vector:
e3ga::vector P = _vector(apply_om(M, g_vectors[2]));
```

The example program may take some time to start up because it also contains a little benchmark that is called at the start of the `main()` function. The benchmark times how many seconds it takes to do 1,000,000 projections, either using the regular method of computing the projection as $(X \rfloor B) B^{-1}$ or using the precomputed outermorphism matrix representation. The results are printed to the console. On one of our machines, the result was

```
10000000 projections using matrix representation: 0.128367 secs
10000000 projections using regular GA: 0.255311 secs
```

So using the outermorphism matrix representation was about twice as fast as using the explicit product method. The result on your machine depends on your CPU architecture as well as your compiler, but in general, the outermorphism matrix representation is faster.

### 4.9.3 Transforming Normal Vectors

As we explained in [[#4.3.6 Application Linear Transformation of the Cross Product|Section 4.3.6]], normal vectors transform differently from regular vectors under a linear transformation. We use non-uniform scaling as an example. The dramatically different results are illustrated in Figure 4.6.

> **Figure 4.6:** Transforming normal vectors. The screenshot shows a squashed dodecahedron. The correct normals—computed with 2-blades—are shown in green, the bad normals in red. It is clear that the red normals are not orthogonal to the surface, especially for the two top polygons.

The code for initializing the non-uniform scaling outermorphism matrix is:

```cpp
// initialize the outermorphism
// g_scale is a global array of floats
om M(
    _vector(g_scale[0] * e1),
    _vector(g_scale[1] * e2),
    _vector(g_scale[2] * e3));
```

The good and bad normals are then computed as

```cpp
// compute the normals
// g_normals3D is a global array of vectors
// g_attitude3D is a global array of bivectors
e3ga::vector badNormal, goodNormal;

badNormal = unit_e(apply_om(M, g_normals3D[i]));
goodNormal = unit_e(dual(apply_om(M, g_attitude3D[i])));
```

As in Section 2.13.2, the 3-D models are extracted from GLUT, this time using two orthogonal projections. See the `getGLUTmodel3D()` function.
