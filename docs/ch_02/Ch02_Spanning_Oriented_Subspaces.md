# Chapter 2: Spanning Oriented Subspaces

After many attempts at formalizing space and spatial relationships, the concept of a vector space emerged as the useful framework for geometrical computations. We use it as our point of departure, and use some of the standard linear algebra governing its mappings. Yet already we will have much to add to its usual structure. By the end of this chapter you will realize that a vector space is much more than merely a space of vectors, and that it is straightforward and useful to extend it computationally.

The crucial idea is to make the subspaces of a vector space explicit elements of computation. To build our algebra of subspaces, we revisit the familiar lines and planes through the origin. We investigate their geometrical properties carefully, and formalize those by the aid of a new algebraic outer product, which algebraically builds subspaces from vectors. We consider the structure it gives us for the Grassmann space of subspaces of a vector space $\mathbb{R}^n$, and define many terms to describe its features.

Throughout this chapter, we consider a real $n$-dimensional vector space $\mathbb{R}^n$, but have no need for a metric; and we only treat its homogeneous subspaces (i.e., subspaces containing the origin).

---

## 2.1 Vector Spaces

We start with an $n$-dimensional vector space. However, the definition of a vector space in linear algebra is more general than what we need in this book, being defined over arbitrary fields of scalars. Since we are interested in computing with spatial elements, we will immediately narrow our focus and consider only $n$-dimensional vector spaces over the real numbers $\mathbb{R}$. Such a vector space $\mathbb{R}^n$ consists, by definition, of elements called vectors and an addition and multiplication by reals (called scalars), such that

1. $\mathbf{x} + \mathbf{y} \in \mathbb{R}^n \quad \forall \mathbf{x}, \mathbf{y} \in \mathbb{R}^n$
2. $(\mathbf{x} + \mathbf{y}) + \mathbf{z} = \mathbf{x} + (\mathbf{y} + \mathbf{z}) \quad \forall \mathbf{x}, \mathbf{y}, \mathbf{z} \in \mathbb{R}^n$
3. $\exists \mathbf{0} \in \mathbb{R}^n : \mathbf{x} + \mathbf{0} = \mathbf{x} \quad \forall \mathbf{x} \in \mathbb{R}^n$
4. $\exists \mathbf{y} \in \mathbb{R}^n : \mathbf{x} + \mathbf{y} = \mathbf{0} \quad \forall \mathbf{x} \in \mathbb{R}^n$
5. $\mathbf{x} + \mathbf{y} = \mathbf{y} + \mathbf{x} \quad \forall \mathbf{x}, \mathbf{y} \in \mathbb{R}^n$
6. $\alpha (\mathbf{x} + \mathbf{y}) = \alpha \mathbf{x} + \alpha \mathbf{y} \quad \forall \alpha \in \mathbb{R}, \mathbf{x}, \mathbf{y} \in \mathbb{R}^n$
7. $(\alpha + \beta) \mathbf{x} = \alpha \mathbf{x} + \beta \mathbf{x} \quad \forall \alpha, \beta \in \mathbb{R}, \mathbf{x} \in \mathbb{R}^n$
8. $(\alpha \beta) \mathbf{x} = \alpha (\beta \mathbf{x}) \quad \forall \alpha, \beta \in \mathbb{R}, \mathbf{x} \in \mathbb{R}^n$
9. $1 \mathbf{x} = \mathbf{x} \quad \forall \mathbf{x} \in \mathbb{R}^n$

Properties (1-4) make the vector space into a group, property (5) even into a commutative group, and properties (6-9) define how scalar multiplication works on its elements. All this shows that scalars are considered separate from vectors, and that no other elements are part of the usual definition of a vector space.

Such a vector space can contain subspaces that are also vector spaces. The dimensionality of a (sub)space is the maximum number of independent vectors in it (i.e., vectors that cannot be expressed as a scalar-weighted sum of other vectors). These subspaces must obviously contain the element $\mathbf{0}$, and are sometimes called *homogeneous subspaces* (or *proper subspaces*).

In standard linear algebra, specific homogeneous subspaces are defined implicitly, typically by sets of vector equations, or explicitly by parameterized expressions. That is workable, but it is really too cumbersome for such important algebraic features of any vector space. We will first turn subspaces into direct elements of computation, following the pioneering work by Grassmann (in 1844) that unfortunately did not make it into the mainstream linear algebra texts.

To do so, we revisit the familiar homogeneous subspaces of a vector space in their geometrical interpretation. We list their properties, defining terms that unify those across dimensions. This uncovers an algebraic product that can span them, thus making those subspaces and their properties elements of computation.

The concept of a subspace is independent of any metric properties a vector space might have. In this chapter, we therefore avoid using a metric and the inner product that defines it. This also implies that we cannot use orthonormal bases in our examples, which may make them look a bit less specific than they could be. Of course, the concepts still work when you do have a metric, and some of the exercises bring this out. This is the only chapter in which we avoid using a metric, since that is the cleanest way to show that the results actually hold for a vector space with any kind of metric.

---

## 2.2 Oriented Line Elements

To develop our thinking about subspaces, we consider the homogeneous subspaces of a 3-D space. We skip over the 0-D subspace for the moment, and start with lines through the origin.

### 2.2.1 Properties of Homogeneous Lines

A line through the origin is a 1-D homogeneous subspace of the vector space $\mathbb{R}^n$. It is characterized by any nonzero vector $\mathbf{a}$, in the sense that any vector $\mathbf{x}$ denoting a point on the line is a multiple of $\mathbf{a}$. This gives a correspondence between the geometry and the algebra of a line:

$$\mathbf{x} \text{ on line determined by } \mathbf{a} \quad \Leftrightarrow \quad \mathbf{x} = \lambda\mathbf{a}, \text{ for some } \lambda \in \mathbb{R}, \tag{2.1}$$

If you think of a line as a set of points, then any scalar multiple of $\mathbf{a}$ determines the same line. For many applications, this is enough, but in others you need more detailed properties, such as its heading (opposite for $\mathbf{a}$ and $-\mathbf{a}$) and its speed (twice as much for $2\mathbf{a}$ as for $\mathbf{a}$). The characterization of a line by a vector allows it to have those extra properties. In preparation for more general subspaces, we attempt to find descriptive terms for those features that can transcend vectors. At first, these terms will seem merely intuitive, but we can give them more exact definitions when we are done, in Table 2.1.

- A line has an **attitude** (or stance) in the surrounding space; it is characterized by $\mu\mathbf{a}$, for any nonzero $\mu$. We will use the term attitude purely in the sense of the subspace occupied by the line; lines characterized by $\mathbf{a}$ and $-\mathbf{a}$ have the same attitude. They both determine the same linear line-like carrier stretching to infinity in both directions.

- We can give the line an **orientation**; this means that we care about the sign of $\lambda$ in (2.1). Then $\mathbf{a}$ and $-\mathbf{a}$ represent lines of different orientation (but $2\mathbf{a}$ has the same orientation as $\mathbf{a}$).[^1] We will reserve the term **direction** for a combination of attitude and orientation; so the set of all vectors $\lambda\mathbf{a}$ with the same $\mathbf{a}$ and the same sign of $\lambda$ represent lines with the same direction.

- We also care about a distance measure along the line, which is quantified in the magnitude of $\mathbf{a}$. Here we should be careful in choosing our term, since "magnitude" suggests a metric measure by which we can compare different lines. For now, we cannot, since we are still working in a nonmetric vector space. We choose to use the term **weight** (because the term speed does not transfer well to higher-dimensional subspaces). A line with twice the weight could be said to pass through its points twice as fast for the same change in $\lambda$. We will allow the weight to be negative, in which case the line is oriented oppositely to a standard direction for that 1-D subspace.

[^1]: This use of the term *oriented line* is common in oriented projective geometry.

Those three properties of an oriented line through the origin are all part of its specification by a vector.

### 2.2.2 Visualizing Vectors

As is customary, we visualize vectors as arrows. The straightness of the arrow indicates its nature of representing a 1-D subspace; the length is its weight, the attitude is indicated by the shaft, and the orientation by the ordering from tail to arrowhead.

The addition of arrows can be represented by the familiar parallelogram construction: place the two arrows to be added with their tails together, complete the parallelogram to obtain a fourth location, and the result is an arrow from the tails to the opposite point.

This and all similar figures have been generated using our software GAViewer, and you can download these figures to view and change them interactively.

The visualizations serve an important purpose in this book, and the interactive software is essential to get a good feeling for geometric algebra. Vector addition is a good example of the principle. If you would work on paper, in coordinates, you might think that vector addition in 3-D is the addition of three scalars. It is implemented in that way, of course, to generate the figures. But you should think and feel that vector addition is geometric: it completes the parallelogram of $\mathbf{a}$ and $\mathbf{b}$, and algebraically there is no need to go lower than the notation $\mathbf{a}+\mathbf{b}$, which has all the properties you need. Playing with this and the other figures will aid your intuition. It will help you dare to leave coordinates behind, and think about the algebra at the proper level of geometric primitives.

---

## 2.3 Oriented Area Elements

### 2.3.1 Properties of Planes

A plane through the origin is a 2-D homogeneous subspace of the vector space $\mathbb{R}^n$. It may be determined by two linearly independent vectors, $\mathbf{a}$ and $\mathbf{b}$, in the sense that any vector $\mathbf{x}$ in the plane can be written as

$$\mathbf{x} = \lambda\mathbf{a} + \mu\mathbf{b}.$$

This specification is not unique. For instance, replacing $\mathbf{a}$ and $\mathbf{b}$ by $(\mathbf{a} + \mathbf{b})/\sqrt{2}$ and $(\mathbf{a} - \mathbf{b})/\sqrt{2}$ gives the same set of vectors, as do many other linear combinations on $\mathbf{a}$ and $\mathbf{b}$. We should think about replacing the specification with something more appropriate, which will make it easier to verify whether two specifications refer to the same plane.

Moreover, just like the homogeneous line, a homogeneous plane has more properties than just being a set of vectors. We list those properties:

- A homogeneous plane has an **attitude** in the surrounding $n$-dimensional space $\mathbb{R}^n$. This is its "subspace aspect" of being a particular planar carrier. In 3-D, this is the property traditionally characterized by a normal vector for the plane, with any weight or orientation. But such a characterization by a vector is insufficient for a planar subspace of an $n$-dimensional space. (Another defect is that it characterizes the nonmetric concept of a particular 2-D subspace by a metric construction involving perpendicularity.)

- A plane may be considered to have an **orientation**, in the sense that the plane determined by two vectors $\mathbf{a}$ and $\mathbf{b}$ would have the opposite orientation of a plane determined by the vectors $\mathbf{b}$ and $\mathbf{a}$. We use this often when we specify angles, speaking of the angle from $\mathbf{a}$ to $\mathbf{b}$ as being of opposite sign to the angle from $\mathbf{b}$ to $\mathbf{a}$. The sign of the angle should be referred to more properly as relative to the orientation of the plane in which its defining vectors reside.

- A plane has a measure of area, which we shall call its **weight**. The plane determined by the vectors $2\mathbf{a}$ and $\mathbf{b}$ has twice the weight (or double the area measure) of the plane determined by the vectors $\mathbf{a}$ and $\mathbf{b}$. As with vectors, this weight is for now only a relative measure within planes of the same attitude. (We would need a metric to compare areas within different planes.)

In linear algebra, the orientation and the area measure are both well represented by the determinant of a matrix made of the two spanning vectors $\mathbf{a}$ and $\mathbf{b}$ of the plane: the orientation is its sign, the area measure its weight (both relative to orientation and area measure of the basis used to specify the coordinates of $\mathbf{a}$ and $\mathbf{b}$). In 2-D, this specifies an area element of the plane. In 3-D, such an area element would be incomplete without a specification of the attitude of the plane in which it resides. Of course we would prefer to have a single algebraic element that contains all this geometric information about the plane.

### 2.3.2 Introducing the Outer Product

We now introduce a product between vectors to aid in the specification of the plane containing the two vectors $\mathbf{a}$ and $\mathbf{b}$. Its definition should allow us to retrieve all geometrical properties of the plane. We denote this algebraic product by $\mathbf{a} \wedge \mathbf{b}$.

The algebraic consequence of our geometrical desire to give the plane an orientation is that $\mathbf{a}\wedge\mathbf{b}$ should be opposite in sign to $\mathbf{b}\wedge\mathbf{a}$, so that $\mathbf{a}\wedge\mathbf{b} = -\mathbf{b}\wedge\mathbf{a}$. When $\mathbf{b}$ coincides with $\mathbf{a}$, this would give the somewhat unusual algebraic result $\mathbf{a}\wedge\mathbf{a} = -\mathbf{a}\wedge\mathbf{a}$. This suggests that the square of $\mathbf{a}$, using this product, must be zero. Geometrically, this is very reasonable: the vector $\mathbf{a}$ does not span a planar element with itself, and we may encode that as a planar element with weight zero.[^2]

[^2]: We use "span" here informally, and different from the use in some linear algebra texts, where the span of two identical vectors would still be their common 1-D subspace rather than zero. That span is not very well-behaved; it is not even linear. In Chapter 5, its geometry will be encoded by the join product.

When we decrease the angle between $\mathbf{a}$ and $\mathbf{b}$, the area spanned by $\mathbf{a}$ and $\mathbf{b}$ gets smaller as they become more parallel. In fact, in a space with a Euclidean metric you would expect the measure of area associated with the planar element $\mathbf{a} \wedge \mathbf{b}$ to be $\|\mathbf{a}\| \|\mathbf{b}\| \sin \phi$, with $\phi$ the angle between them. However, we should not make such an explicit property part of the definition of $\mathbf{a} \wedge \mathbf{b}$—it involves just too many extraneous concepts like norm and angle, which are moreover intrinsically metric. Instead, we try to define the product so that this metric area formula is a consequence of more basic axioms. We note that the area measure increases linearly in the magnitude of each of the vector factors of the product. So let us at least make the product bilinear, giving it proper scaling and distributivity relative to the constituent vectors.

Bilinearity and antisymmetry are already enough to define the product $\mathbf{a} \wedge \mathbf{b}$ completely. We call the result the **outer product** of $\mathbf{a}$ and $\mathbf{b}$. In view of the above, its defining properties are:

> **Antisymmetry:** $\mathbf{a} \wedge \mathbf{b} = -\mathbf{b} \wedge \mathbf{a}$
> 
> **Scaling:** $\mathbf{a} \wedge (\beta \mathbf{b}) = \beta (\mathbf{a} \wedge \mathbf{b})$
> 
> **Distributivity:** $\mathbf{a} \wedge (\mathbf{b} + \mathbf{c}) = (\mathbf{a} \wedge \mathbf{b}) + (\mathbf{a} \wedge \mathbf{c})$

We pronounce $\mathbf{a} \wedge \mathbf{b}$ as "a wedge b." The outcome of the outer product $\mathbf{a} \wedge \mathbf{b}$ of two vectors is called a **bivector** or, more properly, **2-blade** (we explain the difference between these terms in Section 2.9.3). It is an element of the algebra we are developing that is different from the scalars and vectors we have seen so far. Since the outer product is linear, its outcomes are elements of a linear space, the "bivector space." If we denote that space by $\bigwedge^2 \mathbb{R}^n$, the outer product is a mapping $\wedge : \mathbb{R}^n \times \mathbb{R}^n \to \bigwedge^2 \mathbb{R}^n$.

You may think of $\mathbf{a}\wedge\mathbf{b}$ as the span of $\mathbf{a}$ and $\mathbf{b}$, in a quantitative manner, or as an oriented area element of a particular homogeneous plane. Let us verify that that geometric interpretation is indeed consistent with its algebraic properties. If we take a basis $\{\mathbf{e}_1,\mathbf{e}_2\}$ in the subspace with the same attitude as $\mathbf{a} \wedge \mathbf{b}$, we can write $\mathbf{a} = a_1 \mathbf{e}_1 + a_2 \mathbf{e}_2$ and $\mathbf{b} = b_1 \mathbf{e}_1 + b_2 \mathbf{e}_2$. Then, using the definition, we develop the outer product to a recognizable form:

$$\begin{aligned}
\mathbf{a} \wedge \mathbf{b} &= (a_1 \mathbf{e}_1 + a_2 \mathbf{e}_2) \wedge (b_1 \mathbf{e}_1 + b_2 \mathbf{e}_2) \\
&= a_1 b_1 \mathbf{e}_1 \wedge \mathbf{e}_1 + a_1 b_2 \mathbf{e}_1 \wedge \mathbf{e}_2 + a_2 b_1 \mathbf{e}_2 \wedge \mathbf{e}_1 + a_2 b_2 \mathbf{e}_2 \wedge \mathbf{e}_2 \\
&= (a_1 b_2 - a_2 b_1) \mathbf{e}_1 \wedge \mathbf{e}_2
\end{aligned} \tag{2.2}$$

since the antisymmetry implies that $\mathbf{e}_1 \wedge \mathbf{e}_1 = -\mathbf{e}_1 \wedge \mathbf{e}_1$, so it must be equal to $0$—as is any outer product of parallel vectors.

We can write the final result in terms of a determinant by introducing the matrix $[[\mathbf{a}\,\mathbf{b}]]$ with, as its columns, the coefficients of $\mathbf{a}$ and $\mathbf{b}$ on the $\{\mathbf{e}_1,\mathbf{e}_2\}$-basis. This yields

$$\mathbf{a} \wedge \mathbf{b} = \det([[\mathbf{a}\,\mathbf{b}]]) \, \mathbf{e}_1 \wedge \mathbf{e}_2.$$

This determinant you know from linear algebra as a relative measure for the oriented area spanned by $\mathbf{a}$ and $\mathbf{b}$ relative to the area spanned by the basis vectors $\mathbf{e}_1$ and $\mathbf{e}_2$. Its value is what we called the relative weight of a plane element. The other part of the result, $\mathbf{e}_1 \wedge \mathbf{e}_2$, can then be consistently interpreted as the geometrical unit in which area in this plane is measured (i.e., the amount of standard area with the correct attitude, in the plane spanned by the basis vectors $\mathbf{e}_1$ and $\mathbf{e}_2$). The orientation of the plane, and hence the relative orientation of $\mathbf{a} \wedge \mathbf{b}$, is specified by the order of $\mathbf{e}_1$ and $\mathbf{e}_2$.

The outcome of $\mathbf{a} \wedge \mathbf{b}$ neatly contains all three geometric properties in one algebraic element of computation, as we had hoped. If you want to see what happens when you have a Euclidean metric in the plane, do structural exercise 1.

In summary, we have the following algebraic representation of the geometry of homogeneous planes:

> $\mathbf{a} \wedge \mathbf{b}$ is a weighted, oriented area element of the 2-D subspace spanned by $\mathbf{a}$ and $\mathbf{b}$ (or other vectors producing the same attitude)

This element $\mathbf{a} \wedge \mathbf{b}$ may become zero when $\mathbf{a}$ and $\mathbf{b}$ are parallel, or when either vector has zero norm, in agreement with our geometrical intuition that no planar element is spanned in those cases.

When we have multiple area elements in different planes in space, we cannot choose independent bases for each of them. Yet it is still possible to decompose $\mathbf{a} \wedge \mathbf{b}$ on a bivector basis for the whole space. We demonstrate this in a 3-D space $\mathbb{R}^3$ with a totally arbitrary basis $\{\mathbf{e}_1,\mathbf{e}_2,\mathbf{e}_3\}$ (not necessarily orthonormal). Let the coefficients of $\mathbf{a}$ and $\mathbf{b}$ on this basis be $a_i$ and $b_i$, respectively. Then we compute, using the definition of the outer product:

$$\begin{aligned}
\mathbf{a} \wedge \mathbf{b} &= (a_1\mathbf{e}_1 + a_2\mathbf{e}_2 + a_3\mathbf{e}_3) \wedge (b_1\mathbf{e}_1 + b_2\mathbf{e}_2 + b_3\mathbf{e}_3) \\
&= a_1b_1(\mathbf{e}_1 \wedge \mathbf{e}_1) + a_1b_2(\mathbf{e}_1 \wedge \mathbf{e}_2) + a_1b_3(\mathbf{e}_1 \wedge \mathbf{e}_3) + \\
&\quad a_2b_1(\mathbf{e}_2 \wedge \mathbf{e}_1) + a_2b_2(\mathbf{e}_2 \wedge \mathbf{e}_2) + a_2b_3(\mathbf{e}_2 \wedge \mathbf{e}_3) + \\
&\quad a_3b_1(\mathbf{e}_3 \wedge \mathbf{e}_1) + a_3b_2(\mathbf{e}_3 \wedge \mathbf{e}_2) + a_3b_3(\mathbf{e}_3 \wedge \mathbf{e}_3) \\
&= (a_1b_2 - a_2b_1) \mathbf{e}_1 \wedge \mathbf{e}_2 + (a_2b_3 - a_3b_2) \mathbf{e}_2 \wedge \mathbf{e}_3 + (a_3b_1 - a_1b_3) \mathbf{e}_3 \wedge \mathbf{e}_1
\end{aligned} \tag{2.3}$$

This cannot be simplified further. We see that an outer product of two vectors in 3-D space can be written as a scalar-weighted sum of three standard elements $\mathbf{e}_1 \wedge \mathbf{e}_2$, $\mathbf{e}_2 \wedge \mathbf{e}_3$, $\mathbf{e}_3 \wedge \mathbf{e}_1$. Their weighting coefficients are obviously 2-D determinants, which we know represent directed area measures, now of the components of the original plane on the coordinate planes of the basis. The formula is then consistent with the interpretation of these three elements as standard area elements for the coordinate planes of the basis vectors.

It is a pleasant surprise that area elements in 3-D have such a decomposable structure as a weighted sum over a basis. Mathematically, this means that they reside in their own bivector space of $\bigwedge^2 \mathbb{R}^3$, of three dimensions, with basis elements

$$\mathbf{e}_{12} \equiv \mathbf{e}_1 \wedge \mathbf{e}_2, \quad \mathbf{e}_{23} \equiv \mathbf{e}_2 \wedge \mathbf{e}_3, \quad \mathbf{e}_{31} \equiv \mathbf{e}_3 \wedge \mathbf{e}_1.$$[^3]

[^3]: This bivector space satisfies the mathematical axioms of a vector space, but it would be geometrically confusing to call its elements vectors. We will reserve the term vector exclusively for the elements of $\mathbb{R}^n$.

> Any area element of the form $\mathbf{a} \wedge \mathbf{b}$ can be decomposed onto a basis of standard area elements.

In 3-D space, the converse also holds: a weighted sum of basis 2-blades is an area element that can be factorized by the outer product in the form $\mathbf{a} \wedge \mathbf{b}$. But that property does not hold in $n$-dimensional space; you cannot in general make factorizable 2-blades of the form $\mathbf{a} \wedge \mathbf{b}$ simply by adding basis bivectors with arbitrary weights. We get back to this important issue in Section 2.9.

With the outer product, we can generate additional structure from our initial 3-D vector space $\mathbb{R}^3$ and its real scalars $\mathbb{R}$. You already know from linear algebra that determinants of $2 \times 2$ matrices with 2-D vectors as columns are scalar areas, and that determinants of $3 \times 3$ matrices of 3-D vectors are scalar volumes; now we also have 2-D-oriented areas spanned by 3-D vectors as a 3-D linear space of 2-D determinants. Subspaces and their measures are beginning to fall into a new pattern.

### 2.3.3 Visualizing Bivectors

The algebraic properties of a bivector in 3-D are equivalent to those of a directed area element. It is good to get a mental picture of such area elements, and of their interaction using addition, that stays close to their algebraic properties. This will help us to "see" bivectors in problems and their solutions.

A first attempt might be $\mathbf{a}\wedge\mathbf{b}$ as the parallelogram spanned by $\mathbf{a}$ and $\mathbf{b}$. Since that does not convey the orientation (it looks commutative rather than anticommutative), we need to denote this orientation by something extra, such as by the oriented circular arc inside. We could also use a representation in which the orientation follows naturally from the order of the arrows. We can extend this to show some more of the anticommutativity of the construction, which implies $\mathbf{a} \wedge \mathbf{b} = (-\mathbf{b} \wedge \mathbf{a}) = \mathbf{b} \wedge (-\mathbf{a}) = (-\mathbf{a})\wedge(-\mathbf{b})$ by showing all of those four vectors along the border. This shows that none of the vertices of the parallelogram can be seen as an anchor. Therefore the depiction of the bivector is free to move translationally within its carrier plane, though we will prefer drawing it near the origin. Also, since $\mathbf{a} \wedge \mathbf{a} = 0$, we have to remember that drawing the corresponding parallelogram is equivalent to drawing nothing at all, rather than some flattened shape.

Not only can we imagine sliding the bivector out of the origin, but we can also reshape it in some ways without changing its algebraic value. Anticommutativity of the outer product implies, for instance, that $(\mathbf{a} - \frac{1}{2}\mathbf{b}) \wedge \mathbf{b} = \mathbf{a} \wedge \mathbf{b} = (\mathbf{a} - \frac{1}{2}\mathbf{b}) \wedge (\frac{1}{2}\mathbf{a} + \frac{3}{4}\mathbf{b})$. Therefore, we are allowed to reshape the parallelogram geometrically by sliding the arrows along any of its parallel sides, obtaining another faithful depiction of the same bivector $\mathbf{a} \wedge \mathbf{b}$. If you have a coordinate system, there may be an advantage to redrawing the bivector to have sides to be aligned with the coordinate vectors. But you should realize that there is no unique way of doing this; since $\mathbf{a}\wedge\mathbf{b} = (2\mathbf{a})\wedge(\mathbf{b}/2)$, and so on, the magnitudes of the components are adjustable (as long as area and orientation remain the same).

In fact, as soon as we have computed a bivector quantity, we have lost the identity of the vectors that generated it. We may therefore prefer to denote it by a circular area in the plane (as long as we realize that even this circular shape is arbitrary).

We cannot emphasize enough that these redrawings all represent the *same* element. The algebraic bivector is not specific on shape; geometrically, it is an amount of oriented area in a specific plane, that's all. Initially, this may appear too vague to be useful; but we will soon see that this "reshapeability" is a strength, not a weakness.

### 2.3.4 Visualizing Bivector Addition

We can also make a geometrical representation of *bivector addition*. In the same plane, addition of bivectors can be done by reshaping them until they can be added visually, preserving both magnitude and orientation of their area during the reshaping. To add $\mathbf{c} \wedge \mathbf{d}$ to $\mathbf{a}\wedge\mathbf{b}$ (assumed to be in the same plane!), first reshape $\mathbf{c}\wedge\mathbf{d}$ to be of the form $(\gamma\mathbf{c}) \wedge (-\mathbf{b})$. Place them side to side so that the $(-\mathbf{b})$ side of the first bivector matches the $\mathbf{b}$ side of the second. Then reshape the area again, so that $\mathbf{c} \wedge \mathbf{d}$ is finally of the form $\alpha\mathbf{a} \wedge \mathbf{b}$. Now the result is obviously $(1 + \alpha)\mathbf{a} \wedge \mathbf{b}$. But of course, you could change the order of the arguments and do not really need to do the reshaping at all. It is just a matter of putting oriented areas together and algebraically it is handled automatically by adding their coefficients relative to a bivector basis.

Now consider the addition of two bivectors in $\mathbb{R}^3$. In 3-D space, two homogeneous planes intersect in at least a homogeneous line, so two bivectors must have some vector in common. Calling this vector $\mathbf{e}$, we can then reshape the two addends to have $\mathbf{e}$ as a factor. Then they are both aligned with $\mathbf{e}$, and the bivector addition reduces to vector addition. For example, we compute $(3\mathbf{e}_1 \wedge \mathbf{e}_2)+(\ \mathbf{e}_3 \wedge \mathbf{e}_2)$ by factoring out $\mathbf{e} = \mathbf{e}_2$ and adding $3\mathbf{e}_1$ and $\mathbf{e}_3$. You have to be a bit careful, since you may have to change the sign of one of the vectors before adding due to the antisymmetry of the outer product.

In higher-dimensional spaces, this geometric construction is likely to fail, since in general you will not be able to find a common 1-D direction for two planes. Algebraically this corresponds to the fact that not all bivectors can be factored as the outer product of two vectors; we call the ones that can **2-blades**. The algebraic difference between bivectors and 2-blades will be treated in detail in Section 2.9.3.

---

## 2.4 Oriented Volume Elements

### 2.4.1 Properties of Volumes

We now consider representations of oriented volumes. By analogy with homogeneous lines and planes, volumes can be treated as 3-D homogeneous subspaces of a vector space $\mathbb{R}^n$. They have the geometric properties we found for lines and planes.

- Although it is somewhat hard to visualize for us 3-D beings, volumes have an **attitude** in spaces of more than three dimensions, denoting the 3-D subspace that contains them. In a 3-D space there is, of course, only one choice—all volumes are proportional to the volume of the unit cube.

- The volume has an **orientation**, usually referred to as handedness. In the 3-D space of our example, the volume spanned by $\mathbf{e}_1$, $\mathbf{e}_2$, $\mathbf{e}_3$ (in that order), has opposite orientation from that spanned by $\mathbf{e}_1$, $\mathbf{e}_2$, $-\mathbf{e}_3$ (in that order); use a mirror in the $(\mathbf{e}_1 \wedge \mathbf{e}_2)$ plane to see this. The latter has the same orientation as the volume spanned by $\mathbf{e}_2$, $\mathbf{e}_1$, $\mathbf{e}_3$ (in that order—use two more mirrors), and of any odd permutation of $(\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3)$. Orientation of volumes is thus an antisymmetric property, and therefore there exist only two different orientations (a glove can be right-handed or left-handed—that's all).

- Volume has a scalar **weight**. It is well known from linear algebra that in 3-D space the signed magnitude of the volume spanned by $\mathbf{a}$, $\mathbf{b}$, and $\mathbf{c}$ is proportional to the determinant of the coefficient matrix $[[\mathbf{a}\mathbf{b}\mathbf{c}]]$ with $\mathbf{a}$, $\mathbf{b}$, and $\mathbf{c}$ as columns. It is therefore an antisymmetric linear function of the vectors.

We should try to find an algebraic product to represent these geometric properties of volumes.

### 2.4.2 Associativity of the Outer Product

The antisymmetry we signaled in the classical characterization of volume measures is a clue to its representation in our new algebra. We simply attempt to extend the "span" operation of the outer product to more than two terms. Algebraically, the most natural way is to define the outer product to be associative:

$$\text{associativity:} \quad (\mathbf{a} \wedge \mathbf{b}) \wedge \mathbf{c} = \mathbf{a} \wedge (\mathbf{b} \wedge \mathbf{c}).$$

We can thus write the volume element as $\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}$ without ambiguity. (You should realize that the outer product is still pairwise antisymmetric, so that $\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} = -\mathbf{a} \wedge \mathbf{c} \wedge \mathbf{b} = \mathbf{c} \wedge \mathbf{a} \wedge \mathbf{b}$, etc.) Geometrically, this property would imply that we can span the same oriented volume in different ways as the span of a planar element and a vector; if that were not true, this algebraic formalization would be inappropriate.

We call the element formed as the outer product of three vectors a **trivector** or **3-blade** (the difference is explained in Section 2.9.3). To verify its interpretation, we may introduce an arbitrary basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$ in $\mathbb{R}^3$. Then the defining properties of the outer product yield

$$\begin{aligned}
\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} &= (a_1\mathbf{e}_1 + a_2\mathbf{e}_2 + a_3\mathbf{e}_3) \wedge (b_1\mathbf{e}_1 + b_2\mathbf{e}_2 + b_3\mathbf{e}_3) \wedge (c_1\mathbf{e}_1 + c_2\mathbf{e}_2 + c_3\mathbf{e}_3) \\
&= (a_1b_2c_3 - a_1b_3c_2 + a_2b_3c_1 - a_2b_1c_3 + a_3b_1c_2 - a_3b_2c_1) \, \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3.
\end{aligned} \tag{2.4}$$

Therefore, any trivector in space $\mathbb{R}^3$ is a multiple of the trivector $\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$. The proportionality is the determinant of the spanning vectors on the basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$, which we recognize as the (relative) volume and its sign as the orientation relative to $\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$. In linear algebra, we would write that scalar as the determinant $\det([[\mathbf{a}\mathbf{b}\mathbf{c}]])$ of the matrix, with $\mathbf{a}$, $\mathbf{b}$, and $\mathbf{c}$ as columns. So the properties of a volume in the 3-D space $\mathbb{R}^3$ may be characterized by a scalar, at least if we have agreed upon some convention about the order of the basis elements (i.e., a handedness of the basis). That is indeed how it is done classically.

In subtle difference, our algebra of the outer product permits us to treat a volume element as a single trivector. This is tidier, since it requires no bookkeeping of an extraneous convention: as the handedness of the basis changes, the trivector coefficient automatically changes its orientation appropriately. It is also clearly different from a scalar, even in 3-D space, because it has the geometrical unit volume as part of its value. We can therefore clearly express what happens when that is chosen differently (for instance, with a left-handed rather than right-handed orientation). Moreover, this representation of volume elements as the outer product of three vectors carries over unchanged to spaces of arbitrary dimensionality, and those will be surprisingly important, even for computations on 3-D space.

### 2.4.3 Visualization of Trivectors

In our geometric verification of associativity, we met the obvious visualization of a 3-blade $\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}$, relating it to its vector factors $\mathbf{a}$, $\mathbf{b}$, and $\mathbf{c}$.

Of course, this amount of oriented volume may be sheared (similar to what we did to bivectors) as long as you do not change magnitude or orientation. If you have a basis, it is sometimes convenient to align it with the basis vectors. If there are no vectors available, just a trivector, you could draw it as a spherical volume, with some convention on how to denote its orientation.

In $\mathbb{R}^3$, the algebraic addition of trivectors is just a matter of adding their signed scalar magnitudes. Since that has no aspects of geometrical attitude, explicit visualization of trivector addition in 3-D is not really useful.

---

## 2.5 Quadvectors in 3-D Are Zero

In the 3-D space $\mathbb{R}^3$ the outer product of any four vectors $\mathbf{a}$, $\mathbf{b}$, $\mathbf{c}$, $\mathbf{d}$ is zero. This is an automatic consequence of the outer product properties, and easily shown.

In $\mathbb{R}^3$, only three vectors can be independent, and therefore the fourth ($\mathbf{d}$) must be expressible as a weighted sum of the other three:

$$\mathbf{d} = \alpha \mathbf{a} + \beta \mathbf{b} + \gamma \mathbf{c}.$$

Associativity, distributivity, and antisymmetry then make the outer product of these four vectors zero:

$$\begin{aligned}
\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} \wedge \mathbf{d} &= \mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} \wedge (\alpha \mathbf{a} + \beta \mathbf{b} + \gamma \mathbf{c}) \\
&= \mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} \wedge (\alpha \mathbf{a}) + \mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} \wedge (\beta \mathbf{b}) + \mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} \wedge (\gamma \mathbf{c}) \\
&= 0.
\end{aligned}$$

So the highest-order element that can exist in the subspace algebra of $\mathbb{R}^3$ is a trivector. It should be clear that this is not a limitation of the outer product algebra in general: if the space had more dimensions, the outer product would create the appropriate hypervolumes, each with an attitude, orientation, and magnitude.

It is satisfying that the geometric uselessness of the construction of elements of higher dimension than $n$ in $\mathbb{R}^n$ is reflected in the automatic algebraic outcome of $0$. Geometrically, we should interpret that element $0$ as the empty subspace of any dimensionality. So this one element $0$ is the zero scalar, the zero vector, the zero bivector, and so on. There is no algebraic or geometric reason to distinguish between those, for the empty subspace has no attitude, orientation, or weight.

---

## 2.6 Scalars Interpreted Geometrically

We extend the new pattern of constructing subspaces downwards as well, to the lowest dimensional subspaces. In a consistent view, the set of points at the origin should be considered as a 0-D homogeneous subspace (just as lines through the origin were 1-D, and homogeneous planes were 2-D). The previous sections then suggest that it might be represented algebraically by an outer product of zero vector terms. The most general such element is a scalar (since only the scaling property of the outer product remains). So scalars are **0-blades** and can be used to represent homogeneous points (i.e., points at the origin). Treating scalars as homogeneous points keeps our algebra and its geometrical interpretation nicely consistent, even though you may initially feel that we are stretching analogies a bit too far.

A 0-blade as a subspace has the properties of attitude, orientation, and magnitude.

- **Attitude.** The attitude (the locational aspect of the point) is not very interesting; all homogeneous points sit at the origin.

- **Orientation.** The orientation of the point is the sign of the scalar that represents it. This will be useful. For instance, in $\mathbb{R}^3$, the point of intersection of a homogeneous line and a homogeneous plane can be assigned a different sign depending on whether the line enters the plane from the back or the front.

- **Weight.** A point has a weight, which can for instance be used to indicate the intersection strength of a line and a plane in $\mathbb{R}^3$ (we will see that a line almost parallel to a plane leads to a weaker intersection than one perpendicular to it).

Note that this inclusion of scalars among the subspaces reduces the artificial distinction between scalars in a field and vectors in a space that we had in the traditional vector space definition of Section 2.1. They are merely subspaces, just like all other subspaces distinguished by their dimensionality.

Striving towards a complete and consistent mathematical structure, we would like to have the outer product defined between any two elements, including scalars. So we extend the definition of the outer product to include scalars, in a straightforward manner, by defining

$$\alpha \wedge \mathbf{x} = \mathbf{x} \wedge \alpha = \alpha \mathbf{x}, \quad \text{and} \quad \alpha \wedge \beta = \alpha \beta \quad \text{for } \alpha, \beta \in \mathbb{R}. \tag{2.5}$$

In this view, the usual scalar multiplication in the vector space $\mathbb{R}^n$ definition of Section 2.1 is really the outer product in disguise. In this chapter, there has therefore in fact been only a single product in use.

By the way, beware of assuming that the outer product for scalars should have been antisymmetric to be consistent with the outer product for vectors. The outer product is not even antisymmetric for bivectors or 2-blades, for the property of associativity enforces symmetry. This is easily demonstrated:

$$\begin{aligned}
(\mathbf{a}_1 \wedge \mathbf{a}_2) \wedge (\mathbf{b}_1 \wedge \mathbf{b}_2) &= \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge \mathbf{b}_1 \wedge \mathbf{b}_2 \\
&= -\mathbf{a}_1 \wedge \mathbf{b}_1 \wedge \mathbf{a}_2 \wedge \mathbf{b}_2 \\
&= \mathbf{b}_1 \wedge \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge \mathbf{b}_2 \\
&= -\mathbf{b}_1 \wedge \mathbf{a}_1 \wedge \mathbf{b}_2 \wedge \mathbf{a}_2 \\
&= \mathbf{b}_1 \wedge \mathbf{b}_2 \wedge \mathbf{a}_1 \wedge \mathbf{a}_2 \\
&= (\mathbf{b}_1 \wedge \mathbf{b}_2) \wedge (\mathbf{a}_1 \wedge \mathbf{a}_2).
\end{aligned}$$

The general rule is given in Section 2.10: only for two elements of odd dimensionality is the outer product antisymmetric.

By (2.5), the algebraic fact that all scalars are a multiple of the number $1$ can be interpreted geometrically: the 0-vector $1$ represents the standard point at the origin, and all other weighted points at the origin are a multiple of it. Visualization of a scalar is therefore simply as a weighted point at the origin, and addition of such elements merely results in the addition of their weights. There is very little geometry in scalars, but they are part of the general pattern.

---

## 2.7 Applications

Having subspaces as elements of computation is only the beginning of geometric algebra, but it already allows us a slightly different perspective on the solutions to some common problems in linear algebra.

### 2.7.1 Solving Linear Equations

If you have a basis $\{\mathbf{a},\mathbf{b}\}$ in $\mathbb{R}^2$, any vector $\mathbf{x} \in \mathbb{R}^2$ can be written as

$$\mathbf{x} = \alpha \mathbf{a} + \beta \mathbf{b},$$

for some $\alpha$ and $\beta$, which need to be determined. With the outer product, you can solve such equations explicitly and draw a picture of the solution.

We proceed by taking the outer product of both sides with $\mathbf{a}$ and with $\mathbf{b}$, respectively. This yields two equations that simplify due to the antisymmetry of the outer product:

$$\begin{aligned}
\mathbf{x} \wedge \mathbf{a} &= \alpha \mathbf{a} \wedge \mathbf{a} + \beta \mathbf{b} \wedge \mathbf{a} = \beta \mathbf{b} \wedge \mathbf{a} \\
\mathbf{x} \wedge \mathbf{b} &= \alpha \mathbf{a} \wedge \mathbf{b} + \beta \mathbf{b} \wedge \mathbf{b} = \alpha \mathbf{a} \wedge \mathbf{b}.
\end{aligned}$$

Since the 2-blades occurring on both sides must reside in the same homogeneous plane, they are both scalar multiples of the same basic 2-blade characterizing that plane. Therefore, their ratio is well defined. We write it as a division (symbolically, for now; when we have the full geometric algebra in Chapter 6, this will be algebraically exact). Using this ratio, $\beta$ and $\alpha$ are immediately computable in terms of $\mathbf{x}$, $\mathbf{a}$, and $\mathbf{b}$. This gives the decomposition

$$\mathbf{x} = \frac{\mathbf{x} \wedge \mathbf{b}}{\mathbf{a} \wedge \mathbf{b}} \mathbf{a} + \frac{\mathbf{x} \wedge \mathbf{a}}{\mathbf{b} \wedge \mathbf{a}} \mathbf{b} \tag{2.6}$$

The geometrical interpretation of this decomposition is as follows: The blue parallelogram representing the bivector $\mathbf{x} \wedge \mathbf{a}$ is algebraically equivalent to various reshapings of the same amount of area. We reshape it by sliding the vector pointing to $\mathbf{x}$, along a line parallel to $\mathbf{a}$, until it points in the direction $\mathbf{b}$. That gives the other blue parallelogram, computationally fully identical to the first. Now the ratio of area of this blue parallelogram to the area of $\mathbf{b} \wedge \mathbf{a}$ (also indicated) is precisely the stretch of $\mathbf{b}$ required. The same holds for the green parallelogram $\mathbf{x} \wedge \mathbf{b}$, which should be divided by $\mathbf{a} \wedge \mathbf{b}$. Notice the implicit sign change between the two cases, inherent in the denominator.

The geometrical reshapeability of the bivector is precisely the feature that gives us the correct algebraic formula. Practice "seeing" this, as it gives you a new tool for finding compact expressions in a coordinate-free manner.

In elementary linear algebra, we would view the expression for $\mathbf{x}$ as two equations for $\alpha$ and $\beta$, in components:

$$\begin{aligned}
a_1 \alpha + b_1 \beta &= x_1 \\
a_2 \alpha + b_2 \beta &= x_2.
\end{aligned}$$

Then Cramer's rule specifies the solutions as the ratio of two determinants:

$$\alpha = \frac{\det\begin{pmatrix} x_1 & b_1 \\ x_2 & b_2 \end{pmatrix}}{\det\begin{pmatrix} a_1 & b_1 \\ a_2 & b_2 \end{pmatrix}}, \quad \beta = \frac{\det\begin{pmatrix} x_1 & a_1 \\ x_2 & a_2 \end{pmatrix}}{\det\begin{pmatrix} b_1 & a_1 \\ b_2 & a_2 \end{pmatrix}}.$$

When you realize that the ratio of bivectors in a common plane is simply the ratio of their weights, which can be expressed as determinants, you realize that our earlier solution is in fact Cramer's rule. Yet Cramer's rule is usually explained as algebra, not as the geometrical ratio of areas it really is. The fact that it uses coordinates in its formulation easily makes one lose sight of the geometry involved.

To solve equations involving $n$ basis vectors in $\mathbb{R}^n$, the same technique applies. You then need to take more outer products to get the parameters (see structural exercise 4).

### 2.7.2 Intersecting Planar Lines

Again in $\mathbb{R}^2$, consider the problem of intersecting a line $L$ with position vector $\mathbf{p}$ and direction vector $\mathbf{u}$, with a line $M$ with position vector $\mathbf{q}$ and direction vector $\mathbf{v}$.

Its similarity to the previous figure is clear. To find the intersection point $\mathbf{x}$, we need to add an amount of $\mathbf{u}$ and $\mathbf{v}$, so we are effectively decomposing $\mathbf{x}$ in that basis. We might wish to use (2.6), but that would contain the unknown $\mathbf{x}$ on the right-hand side in the bivectors $\mathbf{x} \wedge \mathbf{u}$ and $\mathbf{x} \wedge \mathbf{v}$, so this approach appears to fail.

However, we have another way of making precisely those bivectors, for they are reshapeable: $\mathbf{x} \wedge \mathbf{u} = \mathbf{p} \wedge \mathbf{u}$, and $\mathbf{x} \wedge \mathbf{v} = \mathbf{q} \wedge \mathbf{v}$. Therefore, the same geometrical method now solves the intersection point as

$$\mathbf{x} = \frac{\mathbf{q} \wedge \mathbf{v}}{\mathbf{u} \wedge \mathbf{v}} \mathbf{u} + \frac{\mathbf{p} \wedge \mathbf{u}}{\mathbf{v} \wedge \mathbf{u}} \mathbf{v}. \tag{2.7}$$

This procedure shows that the flexibility in the geometric reshapeability of the bivectors gives an enjoyable amount of algebraic freedom. Once you learn to see bivectors in your problems, solutions can become fairly immediate.

This was merely meant to be an illustrative example of the use of the outer product. Much later, in Section 11.7.1, we will revisit lines and their representation, and the above computation will be a specific case of the meet operation, which will remove its somewhat arbitrary nature. We will then also treat skew lines in 3-D.

---

## 2.8 Homogeneous Subspace Representation

Apart from these initial applications, we can also use this new algebraic instrument of the outer product to formalize some useful geometrical properties.

### 2.8.1 Parallelness

The outer product of two vectors $\mathbf{a}$ and $\mathbf{b}$ forms a 2-blade proportional to their spanned area in their common plane. When you keep $\mathbf{a}$ constant but make $\mathbf{b}$ increasingly more parallel to it (by turning it in the common plane), you find that the weight of the bivector becomes smaller, for the area spanned by the vectors decreases. When the vectors are parallel, the bivector is zero; when they move beyond parallel ($\mathbf{b}$ turning to the other side of $\mathbf{a}$) the bivector acquires the opposite orientation.

A 2-blade may thus be used as a measure of parallelness: $\mathbf{a} \wedge \mathbf{b}$ equals zero if and only if $\mathbf{a}$ and $\mathbf{b}$ are parallel (i.e., lie on the same 1-D subspace). Therefore $\mathbf{x} \wedge \mathbf{a} = 0$, considered as an equation in $\mathbf{x}$ for a given $\mathbf{a}$, defines the vectors $\mathbf{x}$ of the homogeneous line determined by $\mathbf{a}$. We cannot solve such equations yet (we will need a division for that, which we will only discuss in Chapter 6), but it is already easy to verify that $\mathbf{x} = \lambda \mathbf{a}$ is a solution (and in fact, the general solution). So we may surmise:

> $\mathbf{x}$ on line determined by $\mathbf{a}$ $\Leftrightarrow$ $\mathbf{x} = \lambda\mathbf{a}$ $\Leftrightarrow$ $\mathbf{x} \wedge \mathbf{a} = 0$

Therefore "2-blades being zero" produces homogeneous line equations. When used in this way only the attitude of the line characterization matters, since both orientation and weight are scalar factors that can be divided out.

To obtain an equation for a plane, recognize that a 3-blade is zero if and only if the three vectors that compose it lie in the same plane (2-D subspace). Geometrically, we would say that they do not span a volume; the corresponding algebraic expression conveys that they are linearly dependent. It follows that we can use a 2-blade $\mathbf{a} \wedge \mathbf{b}$ to represent a plane through the origin, by using it to detect the vectors that do not span a volume with it:

> $\mathbf{x}$ on plane determined by $\mathbf{a}$ and $\mathbf{b}$ $\Leftrightarrow$ $\mathbf{x} = \lambda\mathbf{a} + \mu\mathbf{b}$ $\Leftrightarrow$ $\mathbf{x} \wedge \mathbf{a} \wedge \mathbf{b} = 0$

Using both $\mathbf{a}$ and $\mathbf{b}$ is in fact a bit too specific, as we mentioned at the beginning of this chapter; the same plane could have been characterized by different vectors. It is better to talk only about the 2-blade $\mathbf{B}$ of the plane:

> vector $\mathbf{x}$ in plane of $\mathbf{B}$ $\Leftrightarrow$ $\mathbf{x} \wedge \mathbf{B} = 0$.

This 2-blade $\mathbf{B}$ even represents a directed plane, for we can say that a point $\mathbf{y}$ is at the positive side of the plane if $\mathbf{y} \wedge \mathbf{B}$ is a positive volume (i.e., a positive multiple of the standard volume $I_3 = \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$ for some standard basis $\{\mathbf{e}_i\}_{i=1}^{3}$ of the space).

### 2.8.2 Direct Representation of Oriented Weighted Subspaces

These constructions are easily extended. In general, if we have a $k$-dimensional homogeneous subspace $\mathcal{A}$ spanned by $k$ vectors $\mathbf{a}_1, \cdots, \mathbf{a}_k$, we can form the $k$-blade $\mathbf{A} = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k$. We call this blade $\mathbf{A}$ the **direct representation** of the homogeneous subspace $\mathcal{A}$ (as opposed to the dual representation, which we will meet later). By that we mean that any vector in $\mathcal{A}$ satisfies $\mathbf{x} \wedge \mathbf{A} = 0$, and that, vice versa, any vector $\mathbf{x}$ satisfying this equation is in $\mathcal{A}$.

> $\mathbf{A}$ is a direct representation of $\mathcal{A}$ : $( \mathbf{x} \in \mathcal{A} \Leftrightarrow \mathbf{x} \wedge \mathbf{A} = 0 )$

This will become such a useful construction that we will often identify the subspace $\mathcal{A}$ with the blade $\mathbf{A}$, and say that a vector is contained in a blade. Of course, there is an orientation and a weight involved in $\mathbf{A}$ that is not usually assumed for $\mathcal{A}$, so $\mathbf{A}$ is a more precise characterization of the geometry, with the properties defined on Table 2.1.

It is also convenient to lift this concept of containment from vectors to the level of blades. We will say that $\mathbf{A}$ is contained in $\mathbf{B}$, denoted $\mathbf{A}\subseteq\mathbf{B}$, if all vectors in $\mathbf{A}$ are also in $\mathbf{B}$. In formula:

$$\mathbf{a}_1 \wedge\cdots\wedge \mathbf{a}_k = \mathbf{A}\subseteq\mathbf{B} \quad \Leftrightarrow \quad \mathbf{a}_i \wedge \mathbf{B} = 0, \quad i = 1,\ldots, k. \tag{2.8}$$

Beware that this is not the same as $\mathbf{A} \wedge \mathbf{B} = 0$, since that would already hold if only one of the vectors in $\mathbf{A}$ was contained in $\mathbf{B}$.

### 2.8.3 Nonmetric Lengths, Areas, and Volumes

Nowhere in this chapter have we used a metric for our computations. The outer product, which is the product of spanning and weighting, does not need one. Yet the lengths, areas, and volumes that can be computed using the outer product appear to have a metric feeling to them. We must emphasize that the lengths measurable by the outer product are always length ratios along the same line through the origin, that the areas are ratios of areas in the same plane through the origin, and that volumes similarly are ratios of volumes in the same space. For such ratios of full-grade elements within the same subspace you do not need a metric measure.

It is only when comparing lengths, areas, and volumes from different homogeneous subspaces that you need to introduce a metric. The metric permits you to rotate one vector onto another to check that the lengths are identical or what their ratio is. We will do that in the next chapter, using a Euclidean metric.

Having said that, we already have some useful instruments. In an $n$-dimensional space $\mathbb{R}^n$ we can compare arbitrary hypervolumes. If we have $n$ vectors $\mathbf{a}_i$ ($i = 1,\ldots, n$), then the hypervolume of the parallelepiped spanned by them is proportional to a unit hypervolume in $\mathbb{R}^n$ by the magnitude of $\mathbf{a}_1 \wedge \ldots \wedge \mathbf{a}_n$. The hypervolume of a simplex in that space, which is the convex body containing the origin and the $n$ endpoints of the vectors $\mathbf{a}_i$ ($i = 1, \cdots, n$), is a fraction of that:

$$\frac{1}{n!} \mathbf{a}_1 \wedge\cdots\wedge \mathbf{a}_n.$$

The same formula also applies to a simplex in each $k$-dimensional subspace of the $n$-dimensional subspace, as

$$\frac{1}{k!} \mathbf{a}_1 \wedge\cdots\wedge \mathbf{a}_k.$$

This one formula computes the relative oriented volume of a tetrahedron in 3-D, of the relative oriented area of a triangle in 2-D, of the relative oriented length of a vector in 1-D, and it even works for the relative oriented weight of a scalar in 0-D.

---

## 2.9 The Graded Algebra of Subspaces

We have introduced the geometric algebra of the outer product step by step. This section makes an inventory of the general patterns we have uncovered and introduces descriptive terms for its algebraic aspects.

### 2.9.1 Blades and Grades

The outer product of $k$ vectors is called a **$k$-blade**. This name (from Hestenes) reflects its higher-dimensional nature and its flatness when used as a representation of a $k$-dimensional homogeneous subspace in a vector space model. A vector is a 1-blade, a bivector is a 2-blade (in 3-space), and a scalar may be referred to as a 0-blade.

The number $k$ is called the **grade** of the $k$-blade (though you may find the term *step* in some literature). Algebraically, it is the number of vector factors in a nonzero $k$-blade, and we denote it by the $\text{grade}()$ symbol:

$$\text{grade}(\mathbf{a}_1 \wedge\cdots\wedge \mathbf{a}_k) = k.$$

Geometrically, the grade is the dimensionality of the subspace that the $k$-blade represents, in the manner of Section 2.8.2. But we prefer to reserve the term *dimension* for the dimensionality $n$ of the space $\mathbb{R}^n$ that we are considering. In terms of blades and grades, the dimension is the highest grade that a nonzero blade may have in a chosen (sub)space.

The outer product construction connects blades and their grades:

$$\text{grade}(\mathbf{A} \wedge \mathbf{B}) = \text{grade}(\mathbf{A}) + \text{grade}(\mathbf{B}).$$

Since the outcome of the product $\mathbf{A} \wedge \mathbf{B}$ may be zero for arbitrary $\mathbf{A}$ and $\mathbf{B}$, the element $0$ must be allowed to have any appropriate grade. There is no algebraic reason to discriminate among the zero scalar, zero vector, and so on. Geometrically, the element $0$ of the subspace algebra represents the empty subspace—which can clearly be of any grade.

### 2.9.2 The Ladder of Subspaces

We have seen that the blades can be decomposed as a weighted sum of basis blades. If we construct $k$-blades in an $n$-dimensional space, because of the antisymmetry of the outer product for vectors there are $\binom{n}{k}$ elements in this basis. The $k$-blades therefore reside in a $\binom{n}{k}$-dimensional linear space $\bigwedge^k \mathbb{R}^n$. But we will soon see that not all elements of this linear space are $k$-blades. Plotting the numbers of basis $k$-blades for various $n$, we obtain an inventory of the ladder of $k$-blades of different grades as in Table 2.2; you may recognize Pascal's triangle.

**Table 2.2:** Pascal's triangle of the number of basis $k$-blades in $n$-dimensional space.

| $n$ \ $k$ | 0 | 1 | 2 | 3 | 4 | 5 |
|-----------|---|---|---|---|---|---|
| 0 | 1 |   |   |   |   |   |
| 1 | 1 | 1 |   |   |   |   |
| 2 | 1 | 2 | 1 |   |   |   |
| 3 | 1 | 3 | 3 | 1 |   |   |
| 4 | 1 | 4 | 6 | 4 | 1 |   |
| 5 | 1 | 5 | 10 | 10 | 5 | 1 |
| $\vdots$ | $\vdots$ | | | | | |

A blade of highest possible dimension is often called a **pseudoscalar** of the space. It obtained this name in algebraic recognition that it is like a scalar, in that it defines a 1-D hypervolume space in which all hypervolumes are multiples of each other. According to Table 2.2, it has a basis consisting of a single blade, as we saw in Section 2.4.2 for 3-blades in $\mathbb{R}^3$.

It is often sensible to appoint one $n$-blade as the **unit pseudoscalar**, both in magnitude and in orientation, relative to which the other volumes are measured. This is especially possible in a vector space with a nondegenerate metric, where we can introduce an orthonormal basis $\{\mathbf{e}_i\}_{i=1}^{n}$, and the natural choice is $I_n \equiv \mathbf{e}_1 \wedge\cdots\wedge \mathbf{e}_n$.

When we are focused on a specific subspace of the full $n$-dimensional space, we will often speak of the pseudoscalar of that subspace—again meaning the largest blade that can reside in that subspace. We will use $I_n$ for the chosen unit pseudoscalar of $\mathbb{R}^n$, and $I$ for the pseudoscalar of a subspace, or another $I$-like symbol.

### 2.9.3 $k$-Blades Versus $k$-Vectors

We have constructed $k$-blades as the outer product of $k$ vector factors. By derivations like we did for 2-blades in (2.3), it is easy to show that the properties of the outer product allow $k$-blades in $\mathbb{R}^n$ to be decomposed on an $\binom{n}{k}$-dimensional basis.

One might be tempted to reverse this construction and attempt to make $k$-blades as a weighted combination of these basis $k$-blades. However, this does not work, for such sums are usually not factorizable in terms of the outer product. The first example occurs in $\mathbb{R}^4$. If $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3, \mathbf{e}_4\}$ is a basis for $\mathbb{R}^4$, then the element $A = \mathbf{e}_1 \wedge\mathbf{e}_2 +\mathbf{e}_3 \wedge\mathbf{e}_4$ simply cannot be written as a 2-blade $\mathbf{a} \wedge \mathbf{b}$. We ask you to convince yourself of this in structural exercise 5.

We have no geometric interpretation for such nonblades in our vector space model. They are certainly not subspaces, for they contain no vectors; the equation $\mathbf{x}\wedge(\mathbf{e}_1 \wedge\mathbf{e}_2+\mathbf{e}_3 \wedge\mathbf{e}_4) = 0$ can be shown to have no vector solution (other than $0$). The geometrical role of such elements, if any, is different.

Yet it is very tempting to consider the linear space $\bigwedge^k \mathbb{R}^n$ spanned by the basis $k$-blades as a mathematical object of study, in which addition is permitted as a construction of new elements. A typical element constructed as a weighted sum of basis blades is called a **$k$-vector**; its grade aspect is often called *step*. You will find much mathematical literature about the algebraic properties of such constructions—though necessarily little about its geometric significance. Within the context of $k$-vectors, the blades are sometimes known as *simple $k$-vectors* (or some other term reflecting their factorizability).

The $k$-blades are elements of this space (remember this: $k$-blades are $k$-vectors), but it is not elementary to specify the necessary and sufficient conditions for a $k$-vector to be a $k$-blade. (This problem has only recently been solved, and the outcome is not easily summarized.) Only 0-vectors, 1-vectors, $(n - 1)$-vectors, and $n$-vectors are always also blades in $n$-dimensional space. As a consequence, in 3-D space all $k$-vectors are $k$-blades, but already in 4-D space one can make 2-vectors that are not 2-blades. Since we need 4-D and even 5-D vector spaces to model 3-D physical space, the distinction between $k$-blades and $k$-vectors will be important to us.

Because of the bilinear nature of the outer product, it is quite natural to extend it from $k$-blades to $k$-vectors by distributing the operation over the sum of blades. Following established mathematical tradition, it is tempting to give the most general form of any theorem, and supplant $k$-blades by $k$-vectors wherever we can, whether the result is geometrically meaningful or not. We do this every now and then, when we find a geometric reason for doing so. Yet some theorems we will encounter later are true for blades only, so we need a way to distinguish them notationally from the $k$-vectors.

In Part I of this book, we denote $k$-vectors by nonbold capital letters and $k$-blades by bold capital letters, possibly denoting the grade as a subscript (in Part II, we will need the distinction between bold and nonbold to denote something else). So $\mathbf{A}_k$ is a $k$-blade, but $A_k$ is a $k$-vector (which is not necessarily a blade). Vectors are always blades, and denoted by bold lowercase, such as $\mathbf{a}$. Scalars are blades, and denoted by lowercase Greek, such as $\alpha$. These conventions are summarized in Table 2.3.

**Table 2.3:** Notational Conventions for Blades and Multivectors for Part I of This Book.

| Notation | Meaning |
|----------|---------|
| $\alpha, \beta$, etc. | Scalar |
| $a_i, b_i$, etc. | Scalar components of vectors |
| $\mathbf{a}, \mathbf{b}$, etc. | Vector |
| $\mathbf{e}_i$ | Basis vector, typically in an orthonormal basis |
| $\mathbf{b}_i$ | Basis vector, nonorthonormal basis |
| $\mathbf{A},\mathbf{B}$, etc. | General blade |
| $\mathbf{A}_k,\mathbf{B}_k$, etc. | General blade of grade $k$ |
| $A_k, B_k$, etc. | A $k$-vector, not necessarily a blade |
| $A, B$, etc. | General multivector, not necessarily a $k$-vector or a blade |
| $I_n, I$, etc. | (Unit) pseudoscalars |
| $\mathbb{R}^n$ | $n$-Dimensional vector space over the field $\mathbb{R}$ |
| $\bigwedge^k \mathbb{R}^n$ | The linear space of $k$-vectors, in which $k$-blades also reside |
| $\bigwedge \mathbb{R}^n$ | The linear space of multivectors (Grassmann space) |
| $\text{grade}(\mathbf{A})$ | The grade of $\mathbf{A}$ |
| $\langle A \rangle_k$ | The $k$-grade part of a multivector $A$ |
| $\tilde{\mathbf{A}}$ | The reverse of $\mathbf{A}$, equal to $(-1)^{\text{grade}(\mathbf{A})(\text{grade}(\mathbf{A})-1)/2}\mathbf{A}$ |
| $\hat{\mathbf{A}}$ | The grade involution of $\mathbf{A}$, equal to $(-1)^{\text{grade}(\mathbf{A})}\mathbf{A}$ |

### 2.9.4 The Grassmann Algebra of Multivectors

The construction of $k$-vectors as a sum of $k$-blades makes sense algebraically, but since its elements are not necessarily subspaces, we cannot be assured of the geometrical significance. We will therefore exclude it from geometric algebra—at least until we know the corresponding geometry. Still, it is a well-studied structure with useful theorems, so we will discuss it briefly to give you access to that literature.

If we allow the addition of $k$-blades to make $k$-vectors, we obtain what mathematicians call a *graded algebra*, since each element has a well-defined grade (even though not each element is a product of $k$ vector factors). But they do not stop there. When they also allow the addition between elements of different grades, they obtain the most general structure that can be made out of addition $+$ and outer product $\wedge$. This results in a linear space of elements of mixed grade; these are called **multivectors**.

It is simple to extend the outer product to multivectors, using its linearity and distributivity. For instance:

$$(1 + \mathbf{e}_1) \wedge (1 + \mathbf{e}_2) = 1 \wedge 1 + 1 \wedge \mathbf{e}_2 + \mathbf{e}_1 \wedge 1 + \mathbf{e}_1 \wedge \mathbf{e}_2 = 1 + \mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_1 \wedge \mathbf{e}_2.$$

Mathematicians call the structure thus created the **Grassmann algebra** (or *exterior algebra*) for the **Grassmann space**, $\bigwedge\mathbb{R}^n$. The name pays homage to Hermann Grassmann (1809–1877), who defined the outer product to make subspaces into elements of computation. It is a somewhat ironic attribution, as Grassmann might actually have preferred not to admit the $k$-vectors (let alone the multivectors) in an algebra named after him, since they cannot represent the geometrical subspaces he intended to encode formally.

The Grassmann algebra of a 3-D vector space with basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$ is in itself a linear space of $2^3 = 8$ dimensions. A basis for it is

$$\underbrace{1}_{\text{scalars}}, \quad \underbrace{\mathbf{e}_1,\mathbf{e}_2,\mathbf{e}_3}_{\text{vector space}}, \quad \underbrace{\mathbf{e}_1 \wedge \mathbf{e}_2, \mathbf{e}_2 \wedge \mathbf{e}_3, \mathbf{e}_3 \wedge \mathbf{e}_1}_{\text{bivector space}}, \quad \underbrace{\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3}_{\text{trivector space}}. \tag{2.9}$$

In an $n$-dimensional space, there are $\binom{n}{k}$ basis elements of grade $k$. The total number of independent $k$-vectors of any grade supported by the vector space $\mathbb{R}^n$ is

$$\sum_{k=0}^{n} \binom{n}{k} = 2^n.$$

Therefore the Grassmann algebra of an $n$-dimensional space requires a basis of $2^n$ elements. This same basis is of course also useful for the decomposition of $k$-blades, so an algebra for blades also has $\binom{n}{k}$ basis blades of grade $k$, for a total of $2^n$ over all the blades. But we reiterate that when we list that basis for blades, we should only intend it for decomposition purposes, not as a linear space of arbitrary additive combinations. There is unfortunately no standard notation for the submanifold of the $k$-vector space $\bigwedge^k \mathbb{R}^n$ that contains the blades, so we will use the slightly less precise $k$-vector notation even when we mean $k$-blades only, and let the context make that distinction.

When we have multivectors of mixed grade, it is convenient to have the **grade operator** $\langle \cdot \rangle_k : \bigwedge\mathbb{R}^n \to \bigwedge^k \mathbb{R}^n$, which selects the multivector part of grade $k$ (note that this is not necessarily a $k$-blade). With that, we can express the outer product between arbitrary elements of the Grassmann algebra as

$$A \wedge B = \sum_{k=0}^{n} \sum_{l=0}^{n} \langle A \rangle_k \wedge \langle B \rangle_l.$$

The grade-raising property of the outer product can be stated in terms of the grade operator as

$$A \wedge B_k = \sum_{i=0}^{k} \langle A \rangle_i \wedge B_{k-i}. \tag{2.10}$$

The result of (2.10) may be $0$, so as before $0$ is a multivector of any grade. Within a Grassmann algebra, the multivector $0$ has the properties of the zero element of both outer product and addition:

$$0 \wedge A = 0 \quad \text{and} \quad 0 + A = A.$$

These sensible correspondences should be enough to "translate" the literature on Grassmann algebra, and peruse it for geometrically meaningful results.

### 2.9.5 Reversion and Grade Involution

In future computations, we often need to reverse the order of the vectors spanning a blade, and other monadic operations on blades. We introduce notations for them now, since we have all the necessary ingredients, and give some useful properties.

Define the **reversion** $\tilde{\phantom{A}}$ as an operation that takes a $k$-blade $\mathbf{A} = \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge\cdots \wedge \mathbf{a}_k$ and produces its reverse:

$$\text{reversion:} \quad \tilde{\mathbf{A}} \equiv \mathbf{a}_k \wedge \mathbf{a}_{k-1} \wedge\cdots\wedge \mathbf{a}_1, \tag{2.11}$$

which just has all vectors of $\mathbf{A}$ in reverse order. The notation by the tilde is chosen to be reminiscent of an editor's notation for an interchange of terms. (Some literature denotes it by $A^\dagger$ instead, since it is related to complex conjugation in a certain context.) This definition appears to require a factorization of $\mathbf{A}$, but its consequence is that a reversion just leads to a grade-dependent change of sign for $\mathbf{A}$. In (2.11), we can restore the terms in $\tilde{\mathbf{A}}$ to their original order in $\mathbf{A}$. This requires $\frac{1}{2} k(k - 1)$ swaps of neighboring terms, which provides an overall sign of $(-1)^{k(k-1)/2}$. So we may equivalently define, for a $k$-blade $\mathbf{A}_k$:

$$\text{reversion:} \quad \tilde{\mathbf{A}}_k = (-1)^{\frac{1}{2} k(k-1)}\mathbf{A}_k. \tag{2.12}$$

This is the preferred definition in computations. Note that this sign change exhibits a $+ + - - + + --\cdots$ pattern over the grades, with a periodicity of four.

By extension, we can apply a similar definition to the reversion of a general multivector consisting of a sum of elements of different grades in a Grassmann algebra. This is then simply defined as the monadic operation:

$$\bigwedge\mathbb{R}^n \to \bigwedge\mathbb{R}^n$$
$$\tilde{A} \equiv \sum_{k} (-1)^{\frac{1}{2} k(k-1)}\langle A \rangle_k.$$

The reversion has the following useful structural properties:

$$\widetilde{(\tilde{A})} = A \quad \text{and} \quad \widetilde{(A \wedge B)} = \tilde{B} \wedge \tilde{A}.$$

which, together with its action on scalars and vectors, actually may be used to define it algebraically. In mathematical terms, the reversion is often called an **anti-involution** because of these properties; it is an *involution* since doing it twice is the identity, and it is *anti* since it reverses order of the reverses.

By contrast, the useful **grade involution** is defined as the monadic operation $\hat{\phantom{A}}$: $\bigwedge^k \mathbb{R}^n \to \bigwedge^k \mathbb{R}^n$ that swaps the parity of the grade:

$$\text{grade involution:} \quad \hat{\mathbf{A}}_k = (-1)^k \mathbf{A}_k.$$

The grade involution is easily extended to multivectors, and has the properties

$$\hat{\hat{A}} = A \quad \text{and} \quad \widehat{(A \wedge B)} = \hat{A} \wedge \hat{B}.$$

These properties for the grade involution and the reversion above have nonbold $A$ and $B$, so these are formulated for multivectors. Of course they also hold for the special case of blades. You can always specialize the theorems of Grassmann algebra in this manner. But do not reverse this process carelessly: only the linear and distributive properties of blades extend to multivectors!

---

## 2.10 Summary of Outer Product Properties

Assembling the elements of the definitions throughout this chapter, we now have enough to specify the outer product in the full generality of our needs in this book. We have compacted them a little; the scaling law now follows from associativity and the outer product with scalars, and so on.

In this list, $\alpha$ is a scalar, $\mathbf{a}$ and $\mathbf{b}$ are vectors, and $A$ and $B$ general multivectors of possibly mixed grade.

> **The outer product** is a dyadic product $\wedge : \bigwedge\mathbb{R}^n \times \bigwedge\mathbb{R}^n \to \bigwedge\mathbb{R}^n$, with the following properties:
> 
> **associativity:** $A \wedge (B \wedge C) = (A \wedge B) \wedge C$
> 
> **distributivity:** $A \wedge (B + C) = (A \wedge B) + (A \wedge C)$
> 
> **distributivity:** $(A + B) \wedge C = (A \wedge C) + (B \wedge C)$
> 
> **antisymmetry:** $\mathbf{a} \wedge \mathbf{b} = -\mathbf{b} \wedge \mathbf{a}$
> 
> **scalars:** $\alpha \wedge \mathbf{a} = \mathbf{a} \wedge \alpha = \alpha \mathbf{a}$

We will often use $\alpha A$ as the natural notation for $\alpha \wedge A$.

This set of rules enables computation of any outer product: the distributivity laws allow expansion to outer products of blades, associativity reduces those to outer products of vectors, and antisymmetry and scalar multiplication then permit full simplification to some standard form.

The antisymmetry property for vectors can be lifted to blades. For a $k$-blade $\mathbf{A}_k$ and an $l$-blade $\mathbf{B}_l$, it becomes

$$\mathbf{A}_k \wedge \mathbf{B}_l = (-1)^{kl} \mathbf{B}_l \wedge \mathbf{A}_k. \tag{2.13}$$

It is good practice in the properties of the outer product to prove this for yourself. Note that (2.13) implies that the outer product is only antisymmetric for two blades of odd grade (which of course includes vectors).

We repeat the important grade-raising property of the outer product:

$$\text{grade}(\mathbf{A} \wedge \mathbf{B}) = \text{grade}(\mathbf{A}) + \text{grade}(\mathbf{B}).$$

This explicitly shows how the outer product constructs the ladder of blades from mere vectors, and is in fact a mapping $\wedge : \bigwedge^k \mathbb{R}^n \times \bigwedge^l \mathbb{R}^n \to \bigwedge^{k+l}\mathbb{R}^n$ connecting blades of specific grades.

---

## 2.11 Further Reading

With only the outer product defined, it is a bit early to refer you to useful and productive literature. If you are interested in a bit of history, the idea to encode subspaces originated with Hermann Grassmann. There has been some recent recognition of the debt we owe him, as well as embarrassment at the historical neglect of his ideas in mainstream linear algebra. This makes for frustrating reading, for it makes you realize that we could have had these techniques in our tool kit all along.

---

## 2.12 Exercises

### 2.12.1 Drills

1. Compute the outer products of the following 3-space expressions, giving the results relative to the basis $\{1, \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3, \mathbf{e}_1 \wedge \mathbf{e}_2, \mathbf{e}_2 \wedge \mathbf{e}_3, \mathbf{e}_3 \wedge \mathbf{e}_1, \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3\}$. Show your work.
   - (a) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_1 + \mathbf{e}_3)$
   - (b) $(\mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3) \wedge (2\mathbf{e}_1)$
   - (c) $(\mathbf{e}_1 - \mathbf{e}_2) \wedge (\mathbf{e}_1 - \mathbf{e}_3)$
   - (d) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (0.5 \mathbf{e}_1 + 2\mathbf{e}_2 + 3\mathbf{e}_3)$
   - (e) $(\mathbf{e}_1 \wedge \mathbf{e}_2) \wedge (\mathbf{e}_1 + \mathbf{e}_3)$
   - (f) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3)$

2. Given the 2-blade $\mathbf{B} = \mathbf{e}_1 \wedge (\mathbf{e}_2 - \mathbf{e}_3)$ that represents a plane, determine if each of the following vectors lies in that plane. Show your work.
   - (a) $\mathbf{e}_1$
   - (b) $\mathbf{e}_1 + \mathbf{e}_2$
   - (c) $\mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3$
   - (d) $2\mathbf{e}_1 - \mathbf{e}_2 + \mathbf{e}_3$

3. What is the area of the parallelogram spanned by the vectors $\mathbf{a} = \mathbf{e}_1 + 2\mathbf{e}_2$ and $\mathbf{b} = -\mathbf{e}_1 - \mathbf{e}_2$ (relative to the area of $\mathbf{e}_1 \wedge \mathbf{e}_2$)?

4. Compute the intersection of the nonhomogeneous line $L$ with position vector $\mathbf{e}_1$ and direction vector $\mathbf{e}_2$, and the line $M$ with position vector $\mathbf{e}_2$ and direction vector $(\mathbf{e}_1 + \mathbf{e}_2)$, using 2-blades. Does the basis $\{\mathbf{e}_1,\mathbf{e}_2\}$ have to be orthonormal?

5. Compute $(2 + 3\mathbf{e}_3) \wedge (\mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3)$ using the grade-based defining equations of Section 2.9.4.

### 2.12.2 Structural Exercises

1. The outer product was defined for a vector space $\mathbb{R}^n$ without a metric, but it is of course still defined when we do have a metric space. In $\mathbb{R}^2$ with Euclidean metric, choose an orthonormal basis $\{\mathbf{e}_1,\mathbf{e}_2\}$ in the plane of $\mathbf{a}$ and $\mathbf{b}$ such that $\mathbf{e}_1$ is parallel to $\mathbf{a}$. Write $\mathbf{a} = \alpha \mathbf{e}_1$ and $\mathbf{b} = \beta (\cos \phi \, \mathbf{e}_1 + \sin \phi \, \mathbf{e}_2)$, where $\phi$ is the angle from $\mathbf{a}$ to $\mathbf{b}$. Evaluate the outer product. Your result should be:
   $$\mathbf{a} \wedge \mathbf{b} = \alpha\beta \sin \phi \, (\mathbf{e}_1 \wedge \mathbf{e}_2). \tag{2.14}$$
   What is the geometrical interpretation?

2. Reconcile (2.14) (which uses lengths $\alpha$ and $\beta$ and an angle $\phi$) with (2.2) (which uses coordinates).

3. The anticommutative algebra has unusual properties, so you should be careful when computing. For real numbers $(x + y)(x - y) = x^2 - y^2$, and for the dot product of two vectors (in a metric vector space) this corresponds simply to $(\mathbf{x} + \mathbf{y}) \cdot (\mathbf{x} - \mathbf{y}) = \mathbf{x} \cdot \mathbf{x} - \mathbf{y} \cdot \mathbf{y}$. Now for comparison compute $(\mathbf{x} + \mathbf{y}) \wedge (\mathbf{x} - \mathbf{y})$ and simplify as far as possible. You should get $-2\mathbf{x} \wedge \mathbf{y}$, which is a rather different result than the other products give! Verify with a drawing that this algebraic result makes perfect sense geometrically in terms of oriented areas.

4. Solve a 3-D version of the problem in Section 2.7.1:
   $$\mathbf{x} = \alpha \mathbf{a} + \beta \mathbf{b} + \gamma \mathbf{c},$$
   using an appropriate choice of outer products to selectively compute $\alpha$, $\beta$, $\gamma$. What is the geometry of the resulting solution?

5. Consider $\mathbb{R}^4$ with basis $\{\mathbf{e}_i\}_{i=1}^{4}$. Show that the 2-vector $B = \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_3 \wedge \mathbf{e}_4$ is not a 2-blade. (i.e., it cannot be written as the outer product of two vectors). (Hint: Set $\mathbf{a} \wedge \mathbf{b} = B$, develop $\mathbf{a}$ and $\mathbf{b}$ onto the basis, expand the outer product onto the bivector basis, and attempt to solve the resulting set of scalar equations.)

6. Show that $B = \mathbf{e}_1 \wedge\mathbf{e}_2 +\mathbf{e}_3 \wedge\mathbf{e}_4$ of the previous exercise does not contain any vector other than $0$ (see Section 2.8.2 for the definition of contain).

7. (The general case of the previous exercises.) Show that a non-zero $A$ contains precisely $k$ independent vectors if and only if $A$ is of the form $A = \mathbf{a}_1 \wedge \mathbf{a}_2 \wedge\cdots\wedge \mathbf{a}_k$ (i.e., if and only if $A$ is a $k$-blade). This shows that among the multivectors, only $k$-blades represent $k$-dimensional subspaces.

8. In some literature on Grassmann algebras, one defines the **Clifford conjugate** $\bar{\mathbf{A}}_k$ as
   $$\text{Clifford conjugate:} \quad \bar{\mathbf{A}}_k \equiv \widehat{\tilde{\mathbf{A}}}_k.$$
   Is it an involution or an anti-involution? Derive the sign-change for $\bar{\mathbf{A}}_k$ as an alternative definition of the Clifford conjugate.

9. Prove (2.13): $\mathbf{A}_k \wedge \mathbf{B}_l = (-1)^{kl} \mathbf{B}_l \wedge \mathbf{A}_k$.

---

## 2.13 Programming Examples and Exercises

At the end of nearly every chapter in Part I and Part II, we provide some C++ programming examples to make the material less abstract. Some examples simply provide interactive versions of figures that you may also find in the book, as alternatives to the GAViewer versions, that are closer to the way you would program them yourselves. Other examples illustrate some important concept that is introduced in the chapter. A few examples go further and actually compute something useful and applicable, like singularity detection or external camera calibration. Yet other examples benchmark the performance of certain techniques and compare efficiency of the solutions of geometric algebra with the classical way. In all, we have intended the examples to be a helpful starting point for your own programming work.

The source code package for the examples can be downloaded from the web site:
http://www.geometricalgebra.net

The package contains projects or makefiles for Windows (Visual Studio .NET) and Linux, Mac OS X, and Solaris (GCC, autotools). We refer you to the instructions provided with the package on how to install it. Our solutions to the programming exercises are provided in the package in a separate directory to help you when you are stuck.

The package comes with a library that we have entitled GA Sandbox. This library should make it easy to play around with geometric algebra as used in this book. All basic operations are implemented for the various models of geometry, along with several useful algorithms. The implementation is based on our geometric algebra implementation Gaigen 2.

Below is a list of peculiarities of the GA sandbox implementation to bear in mind when reading the source code listings. To learn more about using the sandbox implementation, see the documentation that comes with the package. To learn more about implementation of geometric algebra in general, see Part III of this book.

### Models

We use various models of geometry, and the sandbox provides an implementation for each of them:

- **e2ga**: The vector space model of 2-D Euclidean geometry (2-D algebra).
- **e3ga**: The vector space model of 3-D Euclidean geometry (3-D algebra).
- **h3ga**: The homogeneous model of 3-D Euclidean geometry (4-D algebra).
- **c3ga**: The conformal model of 3-D Euclidean geometry (5-D algebra).

Note that the number in the name of each implementation refers to the physical space that is modeled, not to the dimension of the vector space of algebra. Also note that using a particular algebra is only a matter of taste and simplicity. The conformal model c3ga embeds all the other models, so in principle we could use it to do everything; but as the book builds up to this model, so do the examples.

### General Multivectors Versus Specialized Multivectors

Gaigen 2 allows you to use both general multivectors and specialized multivectors. Examples of specialized multivector classes are `vector`, `bivector`, and `rotor`. These classes can store only the coordinates that are required to represent those types. The other coordinates are assumed to be 0 (for example, assigning a vector value to a bivector variable always results in 0, because the bivector cannot hold a vector value). Using specialized multivectors saves memory, and—more importantly—allows the implementation to be highly optimized.

However, sometimes you may need a variable that can hold any multivector value, because you may not know whether the variable will be a vector, a rotor, or any other value. For this purpose, the `mv` class is provided. It is slower than the specialized classes, but more generic.

### Underscore Constructors

Due to the internals of Gaigen 2, there are conversion functions that we have named "underscore constructors." The underscore constructor is not really a constructor in the C++ sense, but rather a regular function that converts an arbitrary multivector value to a specialized multivector variable. Using underscore constructors is required under certain conditions. For example, if you want to assign general multivector to a vector, you should write:

```cpp
mv X = e1;
vector v = _vector(X); // <— note the underscore constructor
```

We trust that you do not find the underscore constructors to be very distracting when reading the source code, since they actually help remind you of the type of function arguments. For example:

```cpp
mv X = e1;
mv Y = e2 ^ e3;
// call function float foo(vector v, bivector b):
float result = foo(_vector(X), _bivector(Y));
```

### Operator Bindings

The C++ operator bindings are listed in Table 2.4. Most of these will be defined only later in the book, but it is good to have them all in one table. The geometric product is denoted by a half-space in the book, but this would obviously cause confusion in the code, so we use `*`. This resembles the notation for the scalar product $*$ of Chapter 3. Since the scalar product is used only rarely in both book and code, this should not be a problem. The symbols for the contractions of Chapter 3 have been chosen to point at the elements of lowest grade (i.e., the left contraction points left). We will see how the vector inner product coincides with the contractions and the scalar product, so we need no special symbol for it. That is convenient, since "." is reserved for referencing the members of a class or structure in C++.

**Table 2.4:** C++ Operator Bindings.

| Code | Functionality | Book Symbol |
|------|--------------|-------------|
| `+` | Addition | $+$ |
| `-` | Subtraction (binary), negation (unary) | $-$ |
| `*` | Geometric product | (space) |
| `^` | Outer product | $\wedge$ |
| `<<` | Left contraction | $\rfloor$ |
| `>>` | Right contraction | $\lfloor$ |
| `%` | Scalar product | $*$ |
| `<<` or `%` or `>>` | Vector inner product | $\cdot$ |

### Coordinates

Although geometric algebra is coordinate-free at the level of application programming, its implementations make heavy use of coordinates internally. While we can avoid exposing ourselves to coordinates most of the time (and you should practice this!), occasionally we need to access them:

- The most common reason is to transfer multivector values to a library that is not based on geometric algebra. For example, to send a vertex to OpenGL, we would use:

```cpp
vector v = ...;
glVertex3f(v.e1(), v.e2(), v.e3());
```

The functions `e1()`, `e2()`, and `e3()` return the respective coordinates of the vector. You can also retrieve all coordinates as an array using the `getC()` function, so that you may act on them with matrices:

```cpp
vector v = ...;
const float *C = v.getC(vector_e1_e2_e3);
glVertex3fv(C); // <— this line is just an example of how to use 'C'
```

Constants such as `vector_e1_e2_e3` must be passed to `getC()` for two paternalistic reasons:

1. The constant improves readability: the reader immediately knows how many coordinates are returned, and what basis blades they refer to.

2. Gaigen 2 generates its implementation from specification. Someone could decide to reorder the coordinates of vector (e.g., e2 before e1), and regenerate the implementation. In that case, the constant would change from `vector_e1_e2_e3` to `vector_e2_e1_e3`. The result is that code based on the old `vector_e1_e2_e3` constant will not compile anymore. That is of course preferable to compiling but producing nonsense results at run-time.

- Sometimes we may need to transfer coordinates from one algebra model to another. This is not (yet) automated in Gaigen 2, so we do it by copying the coordinates one by one.

- There are algebraic ways of writing coordinates as components of projections involving scalar products or contractions. While those may be useful to see what is going on geometrically, they are an inefficient way of retrieving coordinates in a program in the rare cases that you really need them and know what you are doing. Therefore we permit you to retrieve them more directly. For instance, the following two lines produce identical results on an orthonormal basis:

```cpp
bivector B = ...;
float e1e2Coordinate_a = B.e1e2();
float e1e2Coordinate_b = _Float(reverse(e1 ^ e2)<<B);
```

Use this capability sparingly, especially when learning geometric algebra, or you will tend to revert to componentwise linear algebra throughout and not see the benefits of computing directly with the geometric elements themselves.

### The vector type

Because we experienced compilation problems with versions of GCC lower than 3.0, we had to explicitly qualify the vector type in all examples. For instance, we write `e3ga::vector` instead of just `vector` when we are in the e3ga model. This prevents old GCC versions from confusing `e3ga::vector` with `std::vector`, which is an array type provided by the C++ standard template library.

### 2.13.1 Drawing Bivectors

In this first example, we draw a grid of 2-D bivectors. We take two vectors `v1` and `v2`. Vector `v1` is fixed to `e1`, and `v2` is rotated 360 degrees in 24 steps of 15 degrees.

The vectors are rendered by the default multivector drawing function `draw()`. We provide two ways to draw the bivectors: as a parallelogram or as a disc. The discs are rendered by `draw()`, but the parallelograms we render ourselves. To switch between the two bivector drawing modes, click anywhere and select the mode from the popup menu.

```cpp
e3ga::vector v1, v2, v1_plus_v2;
bivector B;
float step = 2 * M_PI / (nbBivectorX * nbBivectorY);
for (float a = 0; a < 2 * M_PI; a += step) {
    // vector 1 is fixed to e1
    v1 = e1;
    // compute vector 2:
    v2 = cos(a) * e1 + sin(a) * e2;
    // compute the bivector:
    B = v1 ^ v2;
    // draw vector 1 (red), vector 2 (green)
    glColor3f(1.0f, 0.0f, 0.0f);
    draw(v1);
    glColor3f(0.0f, 1.0f, 0.0f);
    draw(v2);
    // draw outer product v1^v2:
    glColor3f(0.0f, 0.0f, 1.0f);
    if (!g_drawParallelogram) {
        draw(B);
    }
    else {
        v1_plus_v2 = v1 + v2;
        // draw QUAD with vertices
        // origin -> v1 -> (v1+v2) -> v2
        glBegin(GL_QUADS);
        glVertex2f(0.0f, 0.0f);
        glVertex2f(v1.e1(), v1.e2());
        glVertex2f(v1_plus_v2.e1(), v1_plus_v2.e2());
        glVertex2f(v2.e1(), v2.e2());
        glEnd();
    }
    // ...
}
```

### 2.13.2 Exercise: Hidden Surface Removal

In computer graphics, 3-D models are often built from convex polygons. Each polygon is defined by an ordered list of vertices. Most of the time, triangles (3 vertices) or quads (4 vertices) are used. When a solid model is rendered opaque, polygons that face away from the camera are invisible. Because these back-facing polygons are invisible, no time needs to be spent on rasterizing them if they can be singled out early on.

Back-facing polygons can be identified by computing the orientation of the projected (2-D) vertices of the polygon. The convention is that 3-D models are constructed such that the vertices of a polygon have a counterclockwise order when observed from the outside of the model. Back-facing polygons have a clockwise vertex order.

In the example, the surface is triangulated, so we need to find a way to determine the relative orientation of a triangle formed by the endpoints of three vectors $\mathbf{a}$, $\mathbf{b}$, $\mathbf{c}$ in 2-D. It is not $\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}$, for that would be zero. Instead, we should consider one of the vertices $\mathbf{a}$ as an anchor, and use the bivector spanned by the difference vectors $(\mathbf{b}-\mathbf{a})$ and $(\mathbf{c}-\mathbf{a})$ relative to the standard bivector $\mathbf{e}_1 \wedge \mathbf{e}_2$. After this hint, implementation should be straightforward.

We have provided the code that renders a 3-D model from 2-D vertices. As you can see, the code renders the model without back-face culling. The model is rendered as a wireframe so that you can see the back-facing polygons.

```cpp
// render model
for (unsigned int i = 0; i < g_polygons2D.size(); i++) {
    // get 2D vertices of the polygon:
    const e3ga::vector &v1 = g_vertices2D[g_polygons2D[i][0]];
    const e3ga::vector &v2 = g_vertices2D[g_polygons2D[i][1]];
    const e3ga::vector &v3 = g_vertices2D[g_polygons2D[i][2]];
    // Exercise:
    // Insert code to remove back-facing polygons here.
    // You can extract the e1^e2 coordinate of a bivector 'B' using:
    // float c = B.e1e2();
    // ...
    // draw polygon
    glBegin(GL_POLYGON);
    for (unsigned int j = 0; j < g_polygons2D[i].size(); j++)
        glVertex2f(
            g_vertices2D[g_polygons2D[i][j]].e1(),
            g_vertices2D[g_polygons2D[i][j]].e2());
    glEnd();
}
```

In the sample code, use the left mouse button to rotate the model. The middle and right mouse buttons pop up a menu that allows you to select another model.

If you wonder where the 2-D projected vertices originally came from, we used the OpenGL feedback mechanism to obtain the 2-D viewport coordinates of standard GLUT models. These models can be rendered using a simple call to `glutSolid...()`. GLUT provides functions for rendering teapots, cubes, spheres, cones, tori, dodecahedrons, octahedrons, tetrahedrons, and icosahedrons. See the `getGLUTmodel2D()` function at the bottom of the source file.

### 2.13.3 Singularities in Vector Fields

As a more advanced application of the outer product, we will show how to use it to locate singularities in a vector field. A vector field is defined by a function $V$ that assigns a vector to every point in space.

For this example, we will work in a 3-D space with a basis $\{\mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3\}$. So for every point $p$ in space characterized by a position vector $\mathbf{p} = x \mathbf{e}_1 + y \mathbf{e}_2 + z \mathbf{e}_3$, the function $V$ assigns a vector $V(\mathbf{p})$. A simple example of a vector field is the function

$$V(\mathbf{p}) = x \mathbf{e}_1 + 2y \mathbf{e}_2 + 4z \mathbf{e}_3. \tag{2.15}$$

A **singularity** in a vector field occurs at any point at which $V(\mathbf{p}) = 0$. In the vector field in (2.15), there is a singularity at $\mathbf{p} = 0$, since $V(\mathbf{0}) = 0$. In vector field analysis, it is important to find the locations of singularities. For arbitrary vector fields, that is much more difficult than for the field above.

Consider what happens if we place a box around a singularity and do the following:

- Evaluate the vector field $V(\mathbf{p})$ at all the points $\mathbf{p}$ on the surface of this box;
- Normalize each vector to $\mathbf{v}(\mathbf{p}) = V(\mathbf{p})/\|V(\mathbf{p})\|$ (this requires a metric);
- Place the tail of each vector at the origin.

We now find that the heads of these normalized vectors form a unit sphere at the origin, since they point in all directions. On the other hand, if we place a box around a region of space that does not contain a singularity and repeat the above process, then the tips of the vectors only form part of a sphere. Further, almost all points on this partial sphere have two vectors pointing to it.

While mathematically this process will either give us a sphere or a partial sphere, it requires evaluating the vector field at all points on the surface of the box. In practice, we can only sample the vector field at a small number of points and then test the sampled vectors to see if we approximately have a covering of a sphere.

This is where trivectors come in handy. To test if the sampled vector field approximately yields a sphere, we first triangulate the sample points, and then for each triangle of sample points $p_1p_2p_3$, we form the trivector $T_i = \frac{1}{6}\mathbf{v}(\mathbf{p}_1) \wedge \mathbf{v}(\mathbf{p}_2) \wedge \mathbf{v}(\mathbf{p}_3)$ of the normalized vector fields evaluated at those locations. This trivector $T_i$ has the same volume as the tetrahedron formed by the center of the sphere and the three normalized vectors. If we sum the trivectors formed by the normalized vectors of all the triangles of the sample points, the magnitude of the resulting trivector $T$ will approximately be the volume of the sphere if there is a singularity inside the cube that we sampled. If there is no singularity inside the sampling cube, then roughly speaking, each trivector appears twice in the sum, but with opposite sign, and thus $T$ will have a magnitude 0.

Typically, we normalize $T$ by the volume of the unit sphere, so the magnitude of $T$ should be close to 1 if there is a singularity inside the cube, and close to 0 otherwise.

```cpp
/*
Sum over face
The 'vf' array contains the pre-normalized vector field for the face.
The face is evaluated in a grid-like fashion
at ('gridSize'+1) X ('gridSize'+1) locations.
The resulting (trivector) volume is returned.
*/
trivector sumFace(const vector *vf, int gridSize) {
    trivector sum3d;
    for (int i1 = 0; i1 < gridSize; i1++) {
        for (int i2 = 0; i2 < gridSize; i2++) {
            // cvf = 'current vector field' and points into the vf array
            cvf = vf + i1 * (gridSize + 1) + i2;
            trivector a = _trivector(cvf[0] ^ cvf[gridSize + 2] ^ cvf[gridSize + 1]);
            trivector b = _trivector(cvf[0] ^ cvf[1] ^ cvf[gridSize + 2]);
            sum3d += a+b;
        }
    }
    return sum3d/6.0f;
}

/*
Visits each of the 6 faces of the cube, computes the volume.
Returns true is a singularity is detected
*/
bool testSingularity(const vector *cube[6], int gridSize) {
    // visit all 6 faces
    for (int i = 0; i < 6; i++) {
        sum3d += sumFace(cube[i], gridSize);
    }
    // normalize sum
    sum3d /= 4.0f * 3.14159f / 3.0f;
    // detect point singularity
    return ((norm_e(sum3d) > 0.9) && (norm_e(sum3d) < 1.1));
}
```

The algorithm can be improved and extended to find higher-order singularities and to find curves and surfaces consisting of singularities. A complex example is where the vector field is the gradient of the function $(x - \cos(z))^2 + (y - \sin(z))^2$, which produces a helix-shaped singularity.

---

## Summary Table

**Table 2.1:** Algebraic definition of the terms we use to denote the geometrical properties of a subspace as represented by a blade $\mathbf{A}$.

| Term | Definition |
|------|------------|
| Attitude | The equivalence class $\lambda\mathbf{A}$, for any $\lambda \in \mathbb{R}$ |
| (Relative) weight | The value of $\lambda$ in $\mathbf{A} = \lambda \mathbf{I}$ (where $\mathbf{I}$ is a selected standard subspace with the same attitude) |
| (Relative) orientation | The sign of the weight relative to $\mathbf{I}$ |
