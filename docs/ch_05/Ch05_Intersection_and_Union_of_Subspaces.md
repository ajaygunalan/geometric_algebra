# Chapter 5: Intersection and Union of Subspaces

Geometric algebra contains operations to determine the union and intersection of subspaces, the **join** and **meet** products.

These products are of course important in geometry, and it is therefore disappointing to learn that they are not very tidy algebraically. In particular, they are not (bi-)linear: a small disturbance in their arguments may lead to major changes in their outcome as geometric degeneracies occur. This will give their treatment a different flavor than the products we introduced so far.

But meet and join are still very useful. Even when applied to the subspaces at the origin, meet and join generalize some specific formulas from 3-D linear algebra into a more unified framework and extend them to subspaces intersecting in n-dimensional space. Their full power will be unleashed later, in Part II, when we can use them to intersect offset subspaces and even spheres, circles, and the like. Yet it is good to understand their algebraic structure first, and we now have all the tools to do so.

---

## 5.1 The Phenomenology of Intersection

When we intersect two planes through the origin in 3-D, the outcome is usually a line. In terms of subspaces as blades, two grade-2 elements produce a grade-1 element.

However, if the two planes happen to coincide, we would want the geometric outcome of their intersection to be that plane of coincidence, which is of grade 2. None of the products we have seen so far can do this grade switching in the result as a consequence of the geometric relationship of their arguments, so there must be something new going on algebraically. In fact, an incidence product encoding this geometry cannot be linear, since even a small disturbance of one of the input planes can lead to this discontinuity in the result.

That nonlinearity prohibits extending the intersection and union easily from blades (which represent subspaces) to general multivectors (which do not). That we cannot do this makes sense for geometrical reasons as well, because any definition of geometrical union and intersection should be based on containment of the result in the arguments, or vice versa, and this is only well defined for subspaces. Algebraically, we will therefore have to *limit intersection and union to blades*. These are the first products that must be constrained to operate within the limited algebra of subspaces, not in the full Grassmann algebra of multivectors.

But even then, an algebraic problem that we can foresee geometrically is that the desired outcome does not have all the properties of a blade, because it is not meaningful to assign a unique magnitude and orientation (i.e., a sign) to the blade representing the subspace of intersection. This is illustrated in Figure 5.1(a) and (b) for two planes represented by 2-blades. Since those 2-blades may be reshaped without changing their value as blades, both depictions are permitted—but they each suggest a different intersection magnitude. It is equally easy to change the orientation of the possible intersection line. Therefore, the outcome of the intersection of two blades is a subspace, but one of which only the attitude matters.

> **Figure 5.1:** The ambiguity of the magnitude of the intersection of two planes, $\mathbf{A}$ and $\mathbf{B}$. Both figures are acceptable solutions to the problem of finding blades representing the union $\mathbf{J}$ and intersection $\mathbf{M}$ of the subspaces represented by the same 2-blades $\mathbf{A}$ and $\mathbf{B}$.

We are going to design two products between blades to compute with intersections. They will be called **meet** and **join**, and denoted by $\cap$ and $\cup$ to signify that they are meant to represent the geometric intersection and union of two blades. The set-like notation will not be confusing (we hardly use sets in this book), and in fact is a helpful reminder that the resulting elements are not fully quantified blades and that the products are nonlinear.[^1]

[^1]: The reader should be warned that the terminology of "join" and "meet" is used in some literature in a different sense, directly corresponding to our outer product, and our operation of contraction with a dual, respectively. Those are then truly linear products, though they do not always compute the geometric union and intersection (they return zero in degenerate situations). To add to the confusion, that literature uses the notations $\vee$ for their "join" and $\wedge$ for their "meet."

---

## 5.2 Intersection Through Outer Factorization

Consider two blades $\mathbf{A}$ and $\mathbf{B}$, which happen to contain some common blade. To be precise, let $\mathbf{M}$ be the largest common divisor of $\mathbf{A}$ and $\mathbf{B}$ in the sense of the outer product. This is the algebraic formalization of their geometric intersection; we will call it their **meet** and denote it by $\mathbf{A} \cap \mathbf{B}$.

Algebraically, we should be able to factor out $\mathbf{M}$ from both $\mathbf{A}$ and $\mathbf{B}$, since it is contained in both. We do this in a particular order, writing

$$\mathbf{A} = \mathbf{A}' \wedge \mathbf{M} \quad \text{and} \quad \mathbf{B} = \mathbf{M} \wedge \mathbf{B}'. \tag{5.1}$$

If $\mathbf{A}$ and $\mathbf{B}$ are disjoint, then $\mathbf{M}$ is a scalar (a 0-blade).

$\mathbf{A}$ and $\mathbf{B}$ together reside within a blade $\mathbf{J}$, their smallest common multiple in terms of the outer product. This is a pseudoscalar of the subspace in which this meet intersection problem actually resides. We will call it their **join** and denote it by $\mathbf{A} \cup \mathbf{B}$, for it is the geometric union of the subspaces. It is clear that join and meet are related through the factorization, for we can write

$$\mathbf{A} \cup \mathbf{B} = \mathbf{A}' \wedge \mathbf{M} \wedge \mathbf{B}' \quad \text{and} \quad \mathbf{A} \cap \mathbf{B} = \mathbf{M}. \tag{5.2}$$

We already observed, when we discussed the geometry of Figure 5.1, that we should expect this factorization by $\mathbf{M}$ not to be unique. Indeed, in (5.1) we may multiply $\mathbf{M}$ by a scalar $\gamma$. Then $\mathbf{A}'$ must be multiplied by $1/\gamma$ to preserve $\mathbf{A}$, and similar for $\mathbf{B}'$. As a consequence, this would multiply the join result of (5.2) by $1/\gamma$. So we can always trade off a scalar factor between the meet and the join, of any weight or sign. This ambiguity need not be a problem in geometrical usage of the outcome. For instance, a projection of a vector $\mathbf{x}$ to the meet subspace $\mathbf{M}$ is given by $(\mathbf{x} \rfloor \mathbf{M}^{-1})\mathbf{M}$, and this is invariant to the scalar ambiguity since it involves both $\mathbf{M}$ and $\mathbf{M}^{-1}$.

The first use of meet and join in nonmetric projective geometry seems to have induced people to neglect the magnitude and sign completely. Yet this is a pity, for there are situations in which consistent use of relative magnitudes conveys useful geometric information (for instance, on the sines of intersection angles). To enable this, we will develop consistent formulas for meet and join based on the same factorization. We can then guarantee that meet and join of the same subspaces can be used consistently, and we will demonstrate how that can be applied. Of course you can always ignore this quantitative precision in any application where you do not need it—in that case, the order of the factors in (5.1) and (5.2) can be chosen arbitrarily.

---

## 5.3 Relationships Between Meet and Join

For practical use, we have to make the computational relationships between meet and join more explicit than merely relating them through their factorization. To do so, we first need formulas for $\mathbf{A}'$ and $\mathbf{B}'$. Neither contain any factors also in $\mathbf{M}$, so we can use the contraction to define them as the part of $\mathbf{A}$ not in $\mathbf{M}$ and the part of $\mathbf{B}$ not in $\mathbf{M}$. But to be quantitative, we have to be careful about the order of the arguments and about their normalization:

$$\mathbf{B}' = \mathbf{M}^{-1} \rfloor \mathbf{B}, \quad \text{and} \quad \mathbf{A}' = \mathbf{A} \lfloor \mathbf{M}^{-1}, \tag{5.3}$$

where we employed both contractions for simplicity of expression. If you are uncomfortable with using the contractions in this direct manner, you may derive the former more formally from the identity $\mathbf{B}' = \mathbf{M}^{-1} \rfloor (\mathbf{M} \wedge \mathbf{B}')$, which holds since a basis for $\mathbf{B}'$ can be chosen that is orthogonal to all of the factors of $\mathbf{M}^{-1}$ and hence of $\mathbf{M}$. The expression for $\mathbf{A}'$ can be derived in a similar manner. This shows why we need to use the inverse of $\mathbf{M}$ to achieve proper normalization.

But this means we can only proceed if $\mathbf{M}$ has an inverse. This may seem to restrict the kind of spaces in which we can do intersections, excluding those with null vectors, and that would be a serious limitation in practice. However, we will lift that apparent restriction in Section 5.7 (when we show that both join and meet are independent of the particular metric, as you may already suspect, since after all they are based on factorization by the nonmetric outer product). For now, assume that all blades are in the algebra of a Euclidean vector space.

Denoting the grades of the elements by the corresponding lowercase letters (where $j$ is the grade of the join $\mathbf{J}$), we have various simple relationships between them

$$a' = a - m, \quad b' = b - m, \quad j = a + b - m, \quad m + j = a + b, \tag{5.4}$$

and these help in keeping track of the various quantitative relationships we are going to derive. Together with consideration of order and normalization, all can then be remembered easily.

With (5.3), the join in terms of the meet can be written in two ways:

$$\mathbf{J} = \mathbf{A} \cup \mathbf{B} = \mathbf{A} \wedge (\mathbf{M}^{-1} \rfloor \mathbf{B}) = (\mathbf{A} \lfloor \mathbf{M}^{-1}) \wedge \mathbf{B}. \tag{5.5}$$

We can also solve for the meet in terms of the join. We first establish

$$1 = \mathbf{J} * \mathbf{J}^{-1} = (\mathbf{A} \wedge (\mathbf{M}^{-1} \rfloor \mathbf{B})) * \mathbf{J}^{-1} = \mathbf{A} * ((\mathbf{M}^{-1} \rfloor \mathbf{B}) \lfloor \mathbf{J}^{-1})$$

$$= (\mathbf{A}' \wedge \mathbf{M}) * (\mathbf{M}^{-1} \wedge (\mathbf{B}' \lfloor \mathbf{J}^{-1})) = \mathbf{A}' * (\mathbf{B}' \lfloor \mathbf{J}^{-1}).$$

Then 

$$1 = (\mathbf{B}' \lfloor \mathbf{J}^{-1}) * (\mathbf{A}' \lfloor \mathbf{M}^{-1}) = (\mathbf{M}^{-1} \wedge (\mathbf{B}' \lfloor \mathbf{J}^{-1})) * \mathbf{A} = (\mathbf{M}^{-1} \wedge (\mathbf{B}' \lfloor \mathbf{J}^{-1})) \rfloor \mathbf{A}.$$

Now 

$$\mathbf{M} = \mathbf{M} \wedge 1 = \mathbf{M} \wedge ((\mathbf{M}^{-1} \wedge (\mathbf{B}' \lfloor \mathbf{J}^{-1})) \rfloor \mathbf{A}) = (\mathbf{M}(\mathbf{M}^{-1} \wedge (\mathbf{B}' \lfloor \mathbf{J}^{-1}))) \rfloor \mathbf{A} = (\mathbf{B}' \lfloor \mathbf{J}^{-1}) \rfloor \mathbf{A},$$

so that we obtain:

$$\mathbf{M} = \mathbf{A} \cap \mathbf{B} = (\mathbf{B} \lfloor \mathbf{J}^{-1}) \rfloor \mathbf{A}. \tag{5.6}$$

This formula to compute $\mathbf{M}$ from $\mathbf{J}$ (given $\mathbf{A}$ and $\mathbf{B}$) is often used in applications, since when subspaces $\mathbf{A}$ and $\mathbf{B}$ are in general position it is easy to specify a blade $\mathbf{J}$ for their join.

The dual of this relationship shows the structure of the meet more clearly: taking the inner product with $\mathbf{J}^{-1}$ on both sides of (5.6), we obtain $\mathbf{M} \lfloor \mathbf{J}^{-1} = ((\mathbf{B} \lfloor \mathbf{J}^{-1}) \rfloor \mathbf{A}) \lfloor \mathbf{J}^{-1} = (\mathbf{B} \lfloor \mathbf{J}^{-1}) \wedge (\mathbf{A} \lfloor \mathbf{J}^{-1})$. So relative to the join, the dual meet is the outer product of the duals:

$$\mathbf{M} \lfloor \mathbf{J}^{-1} = (\mathbf{B} \lfloor \mathbf{J}^{-1}) \wedge (\mathbf{A} \lfloor \mathbf{J}^{-1}). \tag{5.7}$$

This is often compactly denoted as

$$\text{dual meet}: \quad (\mathbf{A} \cap \mathbf{B})^* = \mathbf{B}^* \wedge \mathbf{A}^*, \tag{5.8}$$

but then you have to remember that this is not the dual relative to the pseudoscalar $\mathbf{I}_n$ of the total space, but only of the pseudoscalar of the subspace within which the intersection problem resides (i.e., of the join $\mathbf{J} = \mathbf{A} \cup \mathbf{B}$).

Some more expressions relating the four quantities $\mathbf{A}$, $\mathbf{B}$, $\mathbf{M}$, and $\mathbf{J}$ are given in the structural exercises. It should be noted that such relationships between meet and join do not give us a formula or algorithm to compute either. In higher-dimensional subspaces, the search for a join of arbitrary blades requires care, for it can easily lead to an exponential algorithm. An $O(n)$ algorithm will be given in Section 21.7, but we cannot explain that at this point since it uses the geometric product of Chapter 6.

---

## 5.4 Using Meet and Join

In practice, the join is often more easily determined than the meet, since the most interesting intersections and unions of subspaces tend to occur when they are in general position within some subspace with a known pseudoscalar (two planes in space, a line and a plane in space, etc.). Then the join is just the pseudoscalar of that common subspace, and (5.6) gives the meet. A numerical example conveys this most directly.

> **Example:** We intersect two planes represented by the 2-blades $\mathbf{A} = \frac{1}{\sqrt{2}}(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_2 + \mathbf{e}_3)$ and $\mathbf{B} = \mathbf{e}_1 \wedge \mathbf{e}_2$. Note that we have normalized them to facilitate interpreting the relative quantitative aspects. These are homogeneous planes in general position in 3-D space, so their join is proportional to $\mathbf{I}_3 \equiv \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$. It makes sense to orient $\mathbf{J}$ with $\mathbf{I}_3$ so that we simply take $\mathbf{J} = \mathbf{I}_3$. This gives for the meet:
>
> $$\mathbf{A} \cap \mathbf{B} = \frac{1}{\sqrt{3}} \left((\mathbf{e}_1 \wedge \mathbf{e}_2) \lfloor (\mathbf{e}_3 \wedge \mathbf{e}_2 \wedge \mathbf{e}_1)\right) \rfloor \left((\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_2 + \mathbf{e}_3)\right)$$
>
> $$= \frac{1}{\sqrt{3}} \mathbf{e}_3 \rfloor \left((\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_2 + \mathbf{e}_3)\right)$$
>
> $$= -\frac{1}{\sqrt{3}} (\mathbf{e}_1 + \mathbf{e}_2) = -\sqrt{\frac{2}{3}} \left(\frac{\mathbf{e}_1 + \mathbf{e}_2}{\sqrt{2}}\right) \tag{5.9}$$
>
> (the last step expresses the result in normalized form). Figure 5.2 shows the answer; the sign of $\mathbf{A} \cap \mathbf{B}$ is the right-hand rule applied to the turn required to make $\mathbf{A}$ coincide with $\mathbf{B}$, in the correct orientation. We will show that the magnitude of the meet equals the sine of the smallest angle between them, so that in this example their angle is $\arcsin(-\sqrt{2/3})$, measured from $\mathbf{A}$ to $\mathbf{B}$.

> **Figure 5.2:** The meet of two oriented planes.

Classically, one would compute the intersection of two homogeneous planes in 3-space by first converting them to normal vectors and then taking the cross product. We can see that this gives the same answer in this nondegenerate case in 3-space, using the definition of the cross product (3.28) and our duality equations (3.20), (3.21), and remembering that the dual 2-blades are vectors:

$$\mathbf{A}^* \times \mathbf{B}^* = (\mathbf{A}^* \wedge \mathbf{B}^*)^* = -(\mathbf{B}^* \wedge \mathbf{A}^*)^* = (\mathbf{B}^* \wedge \mathbf{A}^*)^{-*} = \mathbf{B}^* \rfloor \mathbf{A} = \mathbf{A} \cap \mathbf{B} \tag{5.10}$$

So the classical result is a special case of (5.6) or (5.8). But formulas (5.6) and (5.8) are much more general: they apply to the intersection of subspaces of any grade, within a space of any dimension.

---

## 5.5 Join and Meet Are Mostly Linear

Once the join has been selected, the formula of (5.6) for the meet shows that the meet is linear in $\mathbf{A}$ and $\mathbf{B}$ since it can be expressed by contraction products, which are clearly linear. If we change $\mathbf{A}$ and/or $\mathbf{B}$ such that the join does not change, this remains true. In this sense, the meet is **mostly linear**. However, as soon as some degeneracy occurs or is resolved, the join changes in a nonlinear manner and the meet formula enters a new domain (within which it is again linear). You can tell that this happens when the meet with your selected join returns zero. That signals degeneracy and the need to pick another join.

As a geometric example, assume that in 3-D we have a homogeneous line $\mathbf{a}$ (a vector) and a homogeneous plane $\mathbf{B}$ (a 2-blade), as in Figure 5.3. As long as the line is not contained in the plane (so that they are in general position), the pseudoscalar $\mathbf{I}_3$ can be used as the join $\mathbf{J}$, and the meet varies nicely with both arguments.

$$\mathbf{M} = \mathbf{a} \cap \mathbf{B} = (\mathbf{B} \lfloor \mathbf{I}_3^{-1}) \rfloor \mathbf{a} = \mathbf{B}^* \cdot \mathbf{a} = \mathbf{b} \cdot \mathbf{a}.$$

This is a scalar, geometrically denoting the common point at the origin, with a magnitude proportional to the cosine of angle between the line $\mathbf{a}$ and the normal vector $\mathbf{b} \equiv \mathbf{B} \lfloor \mathbf{I}_3^{-1}$ of the plane; that is, proportional to the sine of the angle of line and plane (and weighted by their magnitudes). It changes sign as the line enters the plane from below rather than above, with above and below determined by the orientation of the plane $\mathbf{B}$ relative to the pseudoscalar chosen for the join (i.e., the orientation of the common space). This shows the use of the sign of the meet; it gives the sense of intersection and allows us to eliminate surface intersections of rays coming from inside an object (if we orient its boundary properly and consistently). It also shows why the sign of a scalar (i.e., the orientation of a point at the origin) can be important in the algebra of subspaces.

> **Figure 5.3:** A line meeting a plane in the origin in a point. If the join is taken to be the right-handed pseudoscalar, the intersection point is positive when the line pierces the oriented plane as shown. Other normal coordinates can be chosen to bear this out: Let $\mathbf{B} = \mathbf{e}_1 \wedge \mathbf{e}_2$, $\mathbf{a} = a_1\mathbf{e}_1 + a_2\mathbf{e}_2 + a_3\mathbf{e}_3$, then with $\mathbf{J} = \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$ you find $\mathbf{M} = \mathbf{a} \cap \mathbf{B} = \mathbf{B}^* \rfloor \mathbf{a} = a_3 = \|\mathbf{a}\| \sin\phi$, which is positive in the situation shown.

Precisely when the line becomes coincident with the plane, this expression for the meet becomes zero. This is the signal that it is actually no longer the proper meet, for the join must be changed to a normalized version $\mathbf{I}_2$ of the plane $\mathbf{B}$, which is now the smallest common subspace. The problem has essentially become 2-D. We find then find that the meet is the line $\mathbf{a}$, weighted:

$$\mathbf{M} = (\mathbf{B} \lfloor \mathbf{I}_2^{-1}) \rfloor \mathbf{a} = \beta \, \mathbf{a},$$

with $\beta \equiv \mathbf{B} \lfloor \mathbf{I}_2^{-1}$ the signed magnitude of the $\mathbf{B}$-plane. This expression is also linear in both arguments $\mathbf{a}$ and $\mathbf{B}$, as long as we vary them so that the join does not change (so we may only rotate and scale the line within the plane $\mathbf{I}_2$, and only change weight or orientation of the plane $\mathbf{B}$, not its attitude).

This example generalizes to $k$-spaces in $n$-dimensional space: the meet is linear as long as the join does not change, and it degrades gracefully to zero to denote that such a change of join becomes necessary.

---

## 5.6 Quantitative Properties of the Meet

If you normalize the join, you can interpret the value of the meet as proportional to the sine between $\mathbf{A}$ and its projection on $\mathbf{B}$ (or vice versa, depending on the relative grades). We encountered a particular instance of this in the example of Figure 5.2.

We can see that this holds in general, as follows. Focus on $\mathbf{A}$ relative to the space $\mathbf{B}$. The join should be proportional to the blade $\mathbf{J} = \mathbf{A} \wedge \mathbf{B}'$. Let the pseudoscalar of this space be $\mathbf{I}$, then normalizing the join to $\mathbf{I}$ implies division of $\mathbf{J}$ by the scalar $\mathbf{J} \lfloor \mathbf{I}^{-1} = \mathbf{J}^*$. This rescaling of the join implies that the meet should be rescaled to become $\mathbf{M} \mathbf{J}^*$, so proportional to the scalar $\mathbf{J}^*$. Now inspect $\mathbf{J}^* = (\mathbf{A} \wedge \mathbf{B}')^*$. This is proportional to the volume spanned by $\mathbf{A}$ and $\mathbf{B}'$—and we know from the previous chapters that the magnitude of a spanned volume involves the sine of the relative angle between the arguments. Alternatively, we can rewrite $\mathbf{J}^* = \mathbf{A}' \rfloor (\mathbf{B}'^*) = \mathbf{A}' * \mathbf{B}'^*$. This scalar product is proportional to the cosine of the angle between $\mathbf{A}'$ and the orthogonal complement of $\mathbf{B}'$. That can be converted to the sine of the complementary angle, retrieving the same interpretation:

> **The magnitude of the meet $\mathbf{A} \cap \mathbf{B}$ of normalized blades $\mathbf{A}$ and $\mathbf{B}$ within a normalized join denotes the sine of the angle from $\mathbf{A}$ to $\mathbf{B}$.**

The sine measure is quite natural as an indication of the relative attitudes of homogeneous spaces. In classical numerical analysis, the absolute value of the sine of the angle between subspaces is a well-known measure for the distance between subspaces in terms of their orthogonality: it is 1 if the spaces are orthogonal, and decays gracefully to 0 as the spaces get more parallel.

The sign of the sine is worth studying in more detail, for it indicates from which direction $\mathbf{A}$ approaches $\mathbf{B}$. However, we have to be careful with this interpretation: there may be a sign change depending on whether we compute $\mathbf{A} \cap \mathbf{B}$ or $\mathbf{B} \cap \mathbf{A}$. One should study this sign only relative to the choice of sign for the pseudoscalar for the space spanned by the join during normalization. Let us therefore compare $\mathbf{B} \cap \mathbf{A}$ with $\mathbf{A} \cap \mathbf{B}$ relative to the same join, by means of the dualization formula (5.8):

$$\mathbf{B} \cap \mathbf{A} = (\mathbf{A}^* \wedge \mathbf{B}^*)^{-*} = (-1)^{(j-a)(j-b)} (\mathbf{B}^* \wedge \mathbf{A}^*)^{-*} = (-1)^{(j-a)(j-b)} \mathbf{A} \cap \mathbf{B},$$

using (2.13) to swap the arguments of the outer product. Therefore, it depends on the grades of the elements whether the meet is symmetric or antisymmetric. Two lines through the origin in a plane ($a = b = 1$, $j = 2$) meet in antisymmetric fashion: $\mathbf{A} \cap \mathbf{B} = -\mathbf{B} \cap \mathbf{A}$. This makes sense, since if we swap the lines then we are measuring the sine of an opposite angle, and this is of opposite sign. On the other hand, a line and a plane through the origin in space ($a = 1$, $b = 2$, $j = 3$) meet symmetrically: $\mathbf{A} \cap \mathbf{B} = \mathbf{B} \cap \mathbf{A}$. There is still a sine involved, which changes sign as the relative orientation changes so that we can tell whether the line passes from the front or the back of the plane. But in the computation, it apparently does not matter whether the line meets the plane or vice versa.

This subtle interplay of signs of orientation of the join, the relative attitudes in space, and the order of arguments in the meet requires some experience to interpret properly. We give some examples of the ordering sign for common situations in Table 5.1.

### Table 5.1: Meet Order Sensitivity

The order of the arguments for a computed meet may affect the sign of the result. This table shows the signs for some common geometrical situations. A plus denotes no sign change, a minus a change. The vector space model in which all elements pass through the origin is denoted as **orig**. This is the algebra of the homogeneous subspaces in Part I.

For convenient referencing, we have also listed some results for the 4D homogeneous model (**hom**) and the 5D conformal model of 3-dimensional Euclidean space (**conf**), which will only be treated in Part II. In the bottom block, 'line' and 'plane' can always be substituted for 'circle' and 'sphere'. The order sensitivity does not depend on the model used, since only the 'co-dimensions' $(j - a)$ and $(j - b)$ matter.

| Elements in meet | join | Space | $a,b,j$ orig | $a,b,j$ hom | $a,b,j$ conf | Sign |
|---|---|---|---|---|---|---|
| Two origin points | Point | | 0,0,0 | 1,1,1 | 2,2,2 | + |
| Origin point and origin line | Line | | 0,1,1 | 1,2,2 | 2,3,3 | + |
| Two origin lines | Plane | | 1,1,2 | 2,2,3 | 3,3,4 | − |
| Two origin lines | Line | | 1,1,1 | 2,2,2 | 3,3,3 | + |
| Two origin planes | Space | | 2,2,3 | 3,3,4 | 4,4,5 | − |
| Origin line and origin plane | Space | | 1,2,3 | 2,3,4 | 3,4,5 | + |
| Origin line and origin plane | Plane | | 1,2,2 | 2,3,3 | 3,4,4 | + |
| Two parallel lines | Plane | | | 2,2,3 | 3,3,4 | − |
| Two intersecting lines | Plane | | | 2,2,3 | 3,3,4 | − |
| Two skew lines | Space | | | 2,2,4 | 3,3,5 | + |
| Two intersecting planes | Space | | | 3,3,4 | 4,4,5 | − |
| Two parallel planes | Space | | | 3,3,4 | 4,4,5 | − |
| Line and plane | Space | | | 2,3,4 | 3,4,5 | + |
| Line and plane | Plane | | | 2,3,3 | 3,4,4 | + |
| Point and line | Plane | | | 1,2,3 | 2,3,4 | + |
| Point and plane | Space | | | 1,3,4 | 2,4,5 | − |
| Point and circle | Sphere | | | | 1,3,4 | + |
| Point and sphere | Space | | | | 1,4,5 | + |
| Point pair and circle | Sphere | | | | 2,3,4 | + |
| Point pair and sphere | Sphere | | | | 2,4,4 | + |
| Circle and sphere | Space | | | | 3,4,5 | + |
| Circle and sphere | Sphere | | | | 3,4,4 | + |
| Circle and circle | Space | | | | 3,3,5 | + |
| Circle and circle | Sphere | | | | 3,3,4 | − |
| Tangent vector and sphere | Sphere | | | | 2,4,4 | + |
| Sphere and sphere | Space | | | | 4,4,5 | − |

---

## 5.7 Linear Transformation of Meet and Join

Even though the meet and join are not completely linear in their arguments, they do transform tidily under invertible linear transformations in a structure-preserving manner (by which we mean that the transform of the meet equals the meet of the transforms). This paradoxical result holds because such transformations cannot change the relative attitudes of the blades involved in any real way: if $\mathbf{A}$ was not contained in $\mathbf{B}$ before a linear transformation $f$, then $f[\mathbf{A}]$ will also not be contained in $f[\mathbf{B}]$ after the transformation. In that sense, the preservation of meet and join is a structural property of linear transformations. The proof of this fundamental property is not hard, since we know how the outer product and the contraction transform.

First, the join is made by a factorization in terms of the outer product. Since a linear transformation is an outermorphism, the linear mapping $f$ preserves the outer product factorization, and we obtain trivially that

$$f[\mathbf{A} \cup \mathbf{B}] = f[\mathbf{A}] \cup f[\mathbf{B}].$$

The meet also transforms in a structure preserving manner:

$$f[\mathbf{A} \cap \mathbf{B}] = f[\mathbf{A}] \cap f[\mathbf{B}].$$

The reason is simply that the defining relationships of (5.1) and (5.2) between $\mathbf{A}$, $\mathbf{B}$, $\mathbf{J} = \mathbf{A} \cup \mathbf{B}$ and $\mathbf{M} = \mathbf{A} \cap \mathbf{B}$ only involve the outer product; therefore a linear transformation $f$, acting as an outermorphism, preserves all these relationships between the transformed entities.

When converting the expression $f[\mathbf{A}] \cap f[\mathbf{B}]$ to a computational form involving the contraction analogous to (5.6), these outermorphic correspondences imply that one should use duality relative to the transformed join $f[\mathbf{J}]$, not the original join $\mathbf{J}$. So the transformation of (5.6) reads explicitly:

$$f[\mathbf{A} \cap \mathbf{B}] = \left(f[\mathbf{B}] \lfloor f[\mathbf{J}]^{-1}\right) \rfloor f[\mathbf{A}]$$

This is really different from $(f[\mathbf{B}] \lfloor \mathbf{J}^{-1}) \rfloor f[\mathbf{A}]$, since $f[\mathbf{J}]$ is in general not even proportional to $\mathbf{J}$. This dependence on the join dualization is a good reason to use the explicit (5.7) rather than the overly compact (5.8).

Since a linear transformation usually changes the metric measures of elements (except when it is an orthogonal transformation), the preservation of meet and join under general linear transformations shows that these are actually **nonmetric products**. For the join, that is perhaps not too surprising (since it is like an outer product), but the occurrence of the two contractions in the computation of the meet makes it look decidedly metric. The nonmetric nature of the result must mean that these two contractions effectively cancel in their metric properties. In that sense, we have merely used the contraction to write things compactly. Mathematicians encoding union and intersection for the nonmetric projective spaces have devised a special and rather cumbersome notation for the nonmetric duality that is actually involved here. (It is called the Hodge dual, and its proper definition requires the introduction of the $n$-dimensional space of 1-forms.) We will not employ it, and just use our metric contraction instead.

But it is relevant to note that **the precise form of the metric does not matter**. If we ever need to compute meet and join in spaces with unusual metrics, we can always assume that we are in a Euclidean metric if that simplifies our computations. This is why we had no compunction about using the inverses $\mathbf{M}^{-1}$ and $\mathbf{J}^{-1}$ in our derivations; they can always be made to exist by embedding the whole computation temporarily in a Euclidean metric. We will apply this principle in the algorithm to compute meet and join in Chapter 21.

---

## 5.8 Offset Subspaces

So far we have only treated subspaces containing the origin, and although we have been able to do that case in general, it is of course not the most relevant case in applications. We postpone the treatment of the intersection of subspaces offset from the origin to their proper formalization as elements of the homogeneous model in Chapter 11. There we will show that parallel lines have a finite meet and that skew lines in space meet in a scalar proportional to their orthogonal Euclidean distance.

More surprisingly still, in Chapter 13 we will introduce an operational model of Euclidean geometry in which the meet of spheres, circles, lines, and planes can be computed by straightforward application of the subspace intersection formulas of the present chapter.

---

## 5.9 Further Reading

The meet and join are strangely positioned within the literature on algebras for subspaces: they are either neglected (presumably because they are algebraically not very tidy), or an attempt is made to take them as axiomatic products replacing the outer product and contraction.

- The meet and join are treated seriously and extensively in Stolfi's classical book on oriented projective geometry [60]. It is richly illustrated, and sharpens the intuition of working with oriented subspaces. It also gives an algorithm for meet and join in terms of the matrix representation of subspaces. Unfortunately, it does not treat metric geometry.

- When meet and join are taken as basic products, they are linearized: the join is redefined as the outer product of its arguments, and the meet is defined through duality (our (5.8)). It is then called the regressive product. This alternative algebra of subspaces tends to be nonmetric, with nonmetric duality, and is not easily extended to geometric algebra. Still, the work is mathematically interesting; a rather complete account is [3].

- We noted that the outcomes of meet and join are not fully qualified subspaces, since there is an ambiguity about their absolute weight and orientation. Within the context of geometric algebra, they are perhaps more properly represented as projection operators than as blades. This has been explored in [8]. An interesting subalgebra results, which forms the basis of algorithms to compute meet and join.

- The fundamental nature of meet and join for the treatment of linear algebra is displayed in [27]. When reading that and other literature founded in geometric algebra, beware that the use of an inner product that is not the contraction (see Appendix B) tends to create seemingly exceptional outcomes for meet and join when scalars or pseudoscalars are involved. The contractions avoid those exceptions; this issue is explained in [17] as one of the reasons to prefer them.

---

## 5.10 Exercises

### 5.10.1 Drills

Compute join $\mathbf{A} \cup \mathbf{B}$ and meet $\mathbf{A} \cap \mathbf{B}$ for the following blades:

1. $\mathbf{A} = \mathbf{e}_1$ and $\mathbf{B} = \mathbf{e}_2$.
2. $\mathbf{A} = \mathbf{e}_2$ and $\mathbf{B} = \mathbf{e}_1$.
3. $\mathbf{A} = \mathbf{e}_1$ and $\mathbf{B} = 2\mathbf{e}_1$.
4. $\mathbf{A} = \mathbf{e}_1$ and $\mathbf{B} = (\mathbf{e}_1 + \mathbf{e}_2)/\sqrt{2}$.
5. $\mathbf{A} = \mathbf{e}_1$ and $\mathbf{B} = \cos\phi\,\mathbf{e}_1 + \sin\phi\,\mathbf{e}_2$.
6. $\mathbf{A} = \mathbf{e}_1 \wedge \mathbf{e}_2$ and $\mathbf{B} = \cos\phi\,\mathbf{e}_1 + \sin\phi\,\mathbf{e}_2$.
7. $\mathbf{A} = \mathbf{e}_1 \wedge \mathbf{e}_2$ and $\mathbf{B} = \mathbf{e}_2$.
8. $\mathbf{A} = \mathbf{e}_1 \wedge \mathbf{e}_2$ and $\mathbf{B} = \mathbf{e}_2 + 0.00001\,\mathbf{e}_3$.

### 5.10.2 Structural Exercises

1. There is an interesting reciprocal relationship between $\mathbf{A}$, $\mathbf{B}$, $\mathbf{J}$, and $\mathbf{M}$.
   
   $$(\mathbf{B} \lfloor \mathbf{J}^{-1}) * (\mathbf{A} \lfloor \mathbf{M}^{-1}) = 1$$
   
   Verify the steps in the following proof: $1 = \mathbf{M}^{-1} * \mathbf{M} = \mathbf{M}^{-1} * ((\mathbf{B} \lfloor \mathbf{J}^{-1}) \rfloor \mathbf{A}) = (\mathbf{M}^{-1} \wedge (\mathbf{B} \lfloor \mathbf{J}^{-1})) * \mathbf{A} = (\mathbf{B} \lfloor \mathbf{J}^{-1}) * (\mathbf{A} \lfloor \mathbf{M}^{-1})$. Then prove in a similar manner:
   
   $$(\mathbf{M}^{-1} \rfloor \mathbf{B}) * (\mathbf{J}^{-1} \rfloor \mathbf{A}) = 1$$

2. Find the error in this part of a 'proof' of the meet transformation formula of page 135 (from the first printing of this book):
   
   > Let us first establish how the inverse of the join transforms by transforming the join normalization equation $\mathbf{J}^{-1} * \mathbf{J} = 1$:
   > 
   > $$1 = f[1] = f[\mathbf{J}^{-1} * \mathbf{J}] = f^{-1}[\mathbf{J}^{-1}] * f[\mathbf{J}],$$
   > 
   > so that $f^{-1}[\mathbf{J}^{-1}] = f[\mathbf{J}]^{-1}$.

3. Compute meet and join of two vectors $\mathbf{a}$ and $\mathbf{b}$ in general position, and show that the magnitude of their meet (relative to their join) is the sine of their angle. Relate the sign of the sine to the order of intersection. In this case, the meet should be antisymmetric.

4. Compute the meet and join of two parallel vectors $\mathbf{u}$ and $\mathbf{v}$. The meet should now be symmetric. (Hint: Use one of them as the join.)

5. As an exercise in symbolic manipulation of the products so far, let us consider the meet of $\mathbf{a} \wedge \mathbf{B}$ and $\mathbf{a} \wedge \mathbf{C}$, where $\mathbf{a}$ is a vector and the blades $\mathbf{B}$ and $\mathbf{C}$ have no common factor. The answer should obviously be proportional to $\mathbf{a}$, but what precisely is the proportionality factor? (Hint: If you get stuck, the next exercise derives the answer as $(\mathbf{a} \wedge \mathbf{B} \wedge \mathbf{C})^*$.)

6. Verify the steps in the following computation of the answer to the previous exercise. They are rather ingenious; note the third step especially, and the conversion to a scalar product (check the grades involved!). The join for dualization should be a blade proportional to $\mathbf{a} \wedge \mathbf{B} \wedge \mathbf{C}$ (if it is zero our suppositions are wrong, and vice versa). Here goes:
   
   $$(\mathbf{a} \wedge \mathbf{B}) \cap (\mathbf{a} \wedge \mathbf{C}) = \left((\mathbf{a} \wedge \mathbf{C})^* \wedge (\mathbf{a} \wedge \mathbf{B})^*\right)^{-*} = \left((\mathbf{a} \rfloor \mathbf{C}^*) \wedge (\mathbf{a} \rfloor \mathbf{B}^*)\right)^{-*}$$
   
   $$= \left(\mathbf{a} \rfloor \left(\mathbf{C}^* \wedge (\mathbf{a} \rfloor \mathbf{B}^*)\right)\right)^{-*} = \left(\mathbf{a} \rfloor \left(\mathbf{C}^* \wedge (\mathbf{a} \wedge \mathbf{B})^*\right)\right)^{-*}$$
   
   $$= \left(\mathbf{a} \wedge \left(\mathbf{C}^* \lfloor (\mathbf{a} \wedge \mathbf{B})\right)\right) = \left(\mathbf{a} \wedge \left(\mathbf{C}^* * (\mathbf{a} \wedge \mathbf{B})\right)\right)$$
   
   $$= \left(\mathbf{a} \wedge \left((\mathbf{a} \wedge \mathbf{B}) * \mathbf{C}^*\right)\right) = \left(\mathbf{a} \wedge \left((\mathbf{a} \wedge \mathbf{B}) \lfloor \mathbf{C}^*\right)\right)$$
   
   $$= \mathbf{a} \wedge (\mathbf{a} \wedge \mathbf{B} \wedge \mathbf{C})^*.$$

7. Use the previous derivation to derive the general factorization of the meet:
   
   $$(\mathbf{A} \wedge \mathbf{B}) \cap (\mathbf{A} \wedge \mathbf{C}) = \mathbf{A} \left(\mathbf{A} \wedge \mathbf{B} \wedge \mathbf{C}\right)^*, \tag{5.11}$$
   
   where $\mathbf{A}$, $\mathbf{B}$, and $\mathbf{C}$ have no common factors.

---

## 5.11 Programming Examples and Exercises

### 5.11.1 The Meet and Join

This example allows you to interactively select and manipulate two multivectors. The multivectors can be vector-valued or 2-blade-valued. Either the meet or the join of the multivectors are drawn:

```cpp
// M1 and M2 are the two multivectors
mv X;
if (g_draw == DRAW_MEET) X = meet(M1, M2);
else X = join(M1, M2);
// ... (set color, scale)
draw(X);
```

Note that we use multivectors (class `mv`) here because neither the input nor the output has a fixed multivector type. As demonstrated in the next example, working with the `mv` class in general and the `meet()` and `join()` functions in particular is much slower than the specialized classes and the ordinary products.

To make it easier to produce degenerate cases—such as two parallel vectors—we round the coordinates of multivectors `M1` and `M2` to multiples of 0.2. This causes them to move in a stepwise fashion.

### 5.11.2 Efficiency

In Gaigen 2, the implementation of the meet and join is very slow compared to the other products. This example performs a benchmark to demonstrate this. It creates 1,000,000 pairs of random vectors and bivectors. It then times how long it takes to compute the outer product of these pairs, and how long it takes to compute the join of these pairs. In our benchmark the join is about 100 times slower than outer product. There are several reasons for this:

- To compute the meet and join, a specialized (factorization) algorithm is used, whereas computing the outer product is as simple as multiplying and summing coordinates in the right way. See Section 21.7 for a description of the meet and join algorithm used in this example.

- The algorithm uses the `mv` class instead of the specialized types such as `vector` and `bivector`. The `mv` class uses coordinate compression, which is slow.

- The ordinary subspace products are just very efficient in Gaigen 2.

It may be possible to optimize the meet and join to a level where they are about 10 times slower than the regular products. But in general, you should try to avoid the meet and join in your programs if you care about efficiency. If you know the relative position of elements involved, just use the formula $\mathbf{B}^* \rfloor \mathbf{A}$ in the appropriate subspace instead of $\mathbf{A} \cap \mathbf{B}$.

### 5.11.3 Floating Point Issues

As stated above, the meet and join are computed by a factorization algorithm. Before the factorization starts, the algorithm computes what the grade of the output should be. This involves comparing a condition number (similar to that of a matrix) to a small threshold value. Hence, the algorithm will flip-flop between grades in degenerate cases (e.g., near-parallel vectors).

This example (see Figure 5.4) searches for the point where the join of two (near-)parallel vectors changes from a vector to a 2-blade. It starts with a very small probe epsilon of $10^{-10}$, and tests if $\mathbf{e}_1 \cup (\mathbf{e}_1 + 10^{-10}\mathbf{e}_2)$ is a 2-blade. If not, it grows the probe epsilon, and loops. In the example, the flip-flop occurs when $\mathbf{b} = \mathbf{e}_1 + 1.007748 \times 10^{-7}\mathbf{e}_2$, which is to be expected, because the meet-join algorithm uses an epsilon of $10^{-7}$.

```cpp
// get two vectors, initialize 'a' to 'e1'
e3ga::vector a, b;
a = e1;
float probeEpsilon = 1e-10f;
while (true) {
    // the loop will be broken when the join is a bivector;
    // add a tiny bit of 'e2' to b:
    b = e1 + probeEpsilon * e2;
    
    // compute the join
    mv X = join(a, b);
    
    // get analysis of 'X'
    mvAnalysis AX(X);
    
    // check if blade, and if a blade, then is it a 2-blade or a vector?
    if (!AX.isBlade()) {
        // this should never happen
        printf("Error: the join of a and b is not a blade!\n");
        return -1;
    }
    else {
        // compute string "join(..., ...)"
        std::string str = "join(" + a.toString_e() + ", " + b.toString_e() + ")";
        if (AX.bladeSubclass() == mvAnalysis::BIVECTOR) {
            printf("%s is a 2-blade\n", str.c_str());
            return 0; // terminate
        }
        else printf("%s is a vector\n", str.c_str());
    }
    
    // Grow 'probeEpsilon' a little such that it won't take forever to reach
    // the point where join(a, b) is a 2-blade:
    probeEpsilon *= 1.01f;
}
```

> **Figure 5.4:** Searching for the point at which the join of two (near-)parallel vectors becomes a 2-blade (Example 3).
