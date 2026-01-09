# Chapter 8: Geometric Differentiation

Differentiation is the process of computing with changes in quantities. When the changes are small, those computations can be linear to a good approximation, and it is not too hard to develop a calculus for geometry by analogy to classical analysis.

When formulated with geometric algebra, it becomes possible to differentiate not only with respect to a scalar (as in real calculus) or a vector (as in vector calculus), but also with respect to general multivectors and $k$-blades. The differentiation operators follow the rules of geometric algebra: they are themselves elements that must use the noncommutative geometric product in their multiplication when applied to other elements. As you might expect, this has precisely the right geometric consequences for the differentiation process to give geometrically significant results.

This chapter is a bit of a sideline to the main flow of thought in this book. Although the later chapters occasionally use differentiation in their examples, it is not essential. You can easily skip it at first reading, and move on to Part II on the modeling of geometries. We include the subject because it is important for geometric optimization and differential geometry. These techniques are beginning to appear in practical applications of geometric algebra.

---

## 8.1 Geometrical Changes by Orthogonal Transformations

The geometrical elements we have constructed are of various types, and within the context of the geometry they can change in different ways. Each of these kinds of changes should find their place in a suitably defined calculus for geometric elements.

- **Orthogonal Transformations.** Elements of a geometry change when they are transformed, and the class of transformations that is permitted determines the kind of geometry one has. We are especially interested in Euclidean geometry and the accompanying transformations of rotation, reflection, and translation (and, by a stretch of the term Euclidean, scaling). We have already seen that rotations and reflections can be represented by versors, since they are orthogonal transformations. In Part II, we will show that it is possible to set up a model of Euclidean geometry so that translations and scaling are also representable by versors, which will unify the whole structure of operators.

  Orthogonal transformations represented by versors thus become central to doing geometric algebra. Among these, we are especially interested in rotors, since they cause the smooth continuous changes that are typical of motions. In their representation as exponents of bivectors, the calculus of rotors is surprisingly easy to treat: all differentiation reduces to computing commutators with the bivectors of the transformations. This has a natural connection with the Lie algebras that are used classically to compute the calculus of continuous transformation groups.

- **Parameterizations.** An element of the geometry is often parametrized in terms of other elements. A specific case is location-dependence, which is parameterization by the positional vector $\mathbf{x}$, or time-dependence on a scalar time parameter $\tau$. A more involved instance of parameterization is explicit geometric relational dependence, such as, for example, when an element $X$ is reflected using a plane mirror $\mathbf{a}$ to make $\mathbf{a} X \mathbf{a}^{-1}$. As the parameter element changes (for instance because it is transformed, such as when the mirror $\mathbf{a}$ rotates), the parametrized element changes as well. Geometric algebra provides a calculus to compute with such changes.

  This calculus consists of a scalar operator called the *directional derivative* to measure how the parametrized element reacts to a known change in the parameter (and the result is of the same type as the original), and of a *total geometric derivative* that specifies the change relative to any change in the parameter (and that returns an operator of a different type than its argument). The latter is more general (the directional derivative merely describes its components), and particularly useful in geometric integration theory (not treated in this book; see Section 8.8 for pointers).

In all of this, we have to be a bit careful about just copying the classical linear techniques, such as Taylor series definitions. Simply adding linear approximations of perturbations to a blade may not add up to a perturbed blade (but instead result in some nonfactorizable multivector), so we need to develop things in a structure-preserving manner. That is why we start with the calculus of versors, and develop the more classical derivatives in the remainder of the chapter.

---

## 8.2 Transformational Changes

First, let us consider an element $X$ that has been changed by a rotor $R$. In the Euclidean and Minkowski spaces that interest us, the rotor can be written as the exponential of a bivector $R = \exp(-B/2)$, and when we develop this in a power series in $B$, we get

$$e^{-B/2} X e^{B/2} = X + \frac{1}{2}(XB - BX) + \cdots \tag{8.1}$$

The first-order term involves a combination that we will encounter a lot in our considerations, so it pays to define it as a new and useful product in geometric algebra. We briefly introduce it and its properties in Section 8.2.1. Then we play around with variations of changes to this basic transformation equation.

- We study what kind of changes small rotors can effect in an element $X$ in Section 8.2.2. Once we have encoded motions as rotors (in Part II), those will be what we mean by "moving $X$ slightly." Those motions together form a Lie algebra, which we connect to geometric algebra in Section 8.2.3.
- Those small changes in $X$ can be propagated simply to other motions that $X$ may undergo, as we show in Section 8.2.4.
- The most involved change is when the parameters of a motion themselves get moved—for instance, when a rotation plane translates or a mirror starts rotating. We study that in Section 8.2.5.

Each of these cases can be described by a well-chosen commutator product, some exactly, some to first order in the magnitude of the change.

### 8.2.1 The Commutator Product

The commutator product of two general elements of geometric algebra is defined as the product $\times : \mathbb{R}_n \times \mathbb{R}_n \to \mathbb{R}_n$ defined by

$$X \times B \equiv \frac{1}{2}(XB - BX).$$

It is clearly bilinear and distributive, since it consists of a sum of geometric products, bilinear in the arguments. We have purposely not used the bold blade notation for its arguments, since its typical use involves more general multivectors.

This product is not associative. Instead of the identity $(A \times B) \times C = A \times (B \times C)$, so that $(A \times B) \times C - A \times (B \times C)$ would be zero, we have

$$(A \times B) \times C - A \times (B \times C) = B \times (C \times A),$$

which is more symmetrically expressed as the **Jacobi identity**:

$$(A \times B) \times C + (C \times A) \times B + (B \times C) \times A = 0. \tag{8.2}$$

You can prove this easily yourself in structural exercise 1.

Even though the commutator product can be defined for general multivectors, we will not need it in completely general form: in our calculus of rotors, one of the two arguments (say the second argument $B$) is always a bivector. This has a property of grade-preservation (as we soon show):

$$\text{grade}(X \times B) = \text{grade}(X) \quad \text{when} \quad \text{grade}(B) = 2.$$

When used in this way, the commutator product is a grade-preserving product $\times : \bigwedge^k \mathbb{R}^n \times \bigwedge^2 \mathbb{R}^n \to \bigwedge^k \mathbb{R}^n$, extended to the whole space $\mathbb{R}_n$. This property of grade-preservation is important geometrically, for clearly we want all terms in a Taylor series like (8.1), showing the perturbation of $X$, to be of the same grade as $X$.

We prove this grade-preserving property in a slightly roundabout way. We first note that the terms $XB$ and $BX$ contain the grades $x-2$, $x$, and $x+2$ (where $x = \text{grade}(X)$), since they are geometric products. The subtraction in the commutator product can kill some terms, so the whole range of grades may not be there. To investigate this, we take the reverse of the commutator to find

$$\widetilde{(X \times B)} = \frac{1}{2}(\tilde{B}\tilde{X} - \tilde{X}\tilde{B}) = \frac{1}{2}(\tilde{X}B - B\tilde{X}) = \tilde{X} \times B.$$

We observe that the commutator product gets the same overall sign under reversion as $X$ (namely $(-1)^{x(x-1)/2}$). Among the potential terms of grade $x-2$, $x$, and $x+2$, only the grade of $x$ has precisely that same grade-dependent sign for all grades. (This is due to the sign pattern of the reversion over the grades, which is $+ + - - + + - - + + \cdots$, so that two grades up or two grades down may have opposite signs from grade $x$, for general $x$.) Therefore $X \times B$ must be of grade $x$, and the commutator product with a bivector is grade-preserving.

As an aside, having the commutator product permits listing a pleasing series of equations, expressing the geometric product in terms of other products when one of the arguments is a scalar $\alpha$, a vector $\mathbf{a}$, or a bivector $A$ (not necessarily a 2-blade):

$$\begin{aligned}
\alpha X &= \alpha \wedge X \\
\mathbf{a} X &= \mathbf{a} \wedge X + \mathbf{a} \cdot X \\
A X &= A \wedge X + A \cdot X + A \times X
\end{aligned}$$

All equations hold for any multivector $X$.

You may have failed to notice the rather subtle difference between the commutator symbol $\times$ and the cross-product symbol $\times$. Fortunately, there is little danger of confusing them in formulas, since we will use the commutator product only when one of the arguments is a bivector (which is an uppercase symbol, only bold if we know that it is a 2-blade), and the cross product only when both arguments are 3-D vectors (which are always lowercase bold).

### 8.2.2 Rotor-Induced Changes

After this introduction of the commutator product, we resume our treatment of the geometrical changes. Using the commutator notation, the transformation of $X$ by the rotor $\exp(-B/2)$ can be developed in a Taylor series as

$$e^{-B/2} X e^{B/2} = X + X \times B + \frac{1}{2}(X \times B) \times B + \frac{1}{3!}((X \times B) \times B) \times B + \cdots \tag{8.3}$$

You can prove this yourself, guided by structural exercise 2. The series continues the pattern as the generalization of the earlier (7.22) for vectors only. Since the commutator product with the bivector is grade-preserving, $X$ remains of the same grade under this transformation (as it should, since the versor product is fully structure-preserving for all products).

Now suppose that the rotor is close to the identity. It is then the exponential of a small bivector $-\delta B/2$, with $\delta \approx 0$. We can write, in orders of $\delta$:

$$e^{-\delta B/2} X e^{\delta B/2} = X + X \times \delta B + O(\delta^2). \tag{8.4}$$

We read this as specifying the small change in an element $X$ under a small orthogonal transformation. Such a small transformation must be represented by an even versor, which we can normalize to a rotor. The transformation caused by an odd versor cannot be continuously connected to the identity (i.e., done in small steps); you can perform a small amount of rotation, but not a small amount of reflection. We call small changes caused by small transformations *perturbations*.

To preserve the geometric meaning of $X$, we must demand that any small change $\delta X$ to it must be writable as the application of a small rotor to it. These are the only kinds of small changes we should consider in our calculus. They are the proper generalization in geometric algebra of the additive change $\delta X$ in a quantity $X$, beyond the scalars and vectors of the classical framework. Any small changes that cannot be written in this form may disrupt the algebraic structure of $X$, and with that its geometric interpretation.

> **Elements of geometric algebra should only be perturbed by rotors.**

We found in (8.4) that to first order, such a change can be written as $X \times (\delta B)$, with $\delta B$ a small bivector.

Remembering that rotors represent orthogonal transformations, you can see how even for a Euclidean vector $\mathbf{x}$ a general additive change $\delta\mathbf{x}$ is not permitted. Orthogonal transformations must preserve the norm, and this can only happen if the change $\delta\mathbf{x}$ is perpendicular to $\mathbf{x}$. This must mean that $\mathbf{x} \cdot (\delta\mathbf{x}) = 0$. The general element of grade 1 and linear in $\mathbf{x}$ with that property is $\delta\mathbf{x} = \mathbf{x} \cdot \delta B$, with $\delta B$ a small general bivector (for indeed $\mathbf{x} \cdot (\mathbf{x} \cdot \delta B) = \mathbf{x} \rfloor (\mathbf{x} \cdot \delta B) = (\mathbf{x} \wedge \mathbf{x}) \cdot \delta B = 0$). And for vectors,

$$\delta\mathbf{x} = \mathbf{x} \cdot \delta B = \frac{1}{2}(\mathbf{x}\,\delta B - \delta B\,\mathbf{x}) = \mathbf{x} \times \delta B,$$

so that it indeed has the desired form of a commutator product.

This limitation of the changes may appear unnecessarily restrictive, since it even forbids a simple translational change $\delta\mathbf{x}$ to a vector $\mathbf{x}$. Indeed it does, for $\mathbf{x}$ denotes a 1-D direction, and that should only be turned by a rotor. But fortunately this limitation to rotors does not automatically mean that we cannot translate geometrical points in any direction. It merely necessitates us to find a way to represent that geometrical point in geometric algebra such that its translation is a rotor. In such a representation, any small translation would be permitted. We will present such a representation in Chapter 13. For now, please accept that the principle of allowing only rotor-type changes is not a geometrical limitation, but merely an algebraic structuring of the treatment of such changes.

### 8.2.3 Multiple Rotor-Induced Changes

When two small changes occur successively, by $\exp(-\delta_1 A/2)$ and $\exp(-\delta_2 B/2)$, respectively, the resulting total change is

$$e^{-\delta_2 B/2} e^{-\delta_1 A/2} X e^{\delta_1 A/2} e^{\delta_2 B/2} = X + X \times (\delta_1 A + \delta_2 B) + \frac{1}{2}\left((X \times \delta_1 A) \times \delta_1 A + 2(X \times \delta_1 A) \times \delta_2 B + (X \times \delta_2 B) \times \delta_2 B\right) + O(\delta^3).$$

To first order in the $\delta$s, the changes act independently and additively, but there is an interesting and asymmetrical structure in the second-order changes. This is most clearly seen when we attempt to undo the changes in opposite order. Many terms cancel (obviously those of first grade), and the Jacobi identity can be used to merge two terms, giving the result

$$e^{\delta_2 B/2} e^{\delta_1 A/2} e^{-\delta_2 B/2} e^{-\delta_1 A/2} X e^{\delta_1 A/2} e^{\delta_2 B/2} e^{-\delta_1 A/2} e^{-\delta_2 B/2} = X + X \times (\delta_1 A \times \delta_2 B) + O(\delta^3).$$

To the first relevant order, this changes $X$ by an additive commutator with a bivector. Therefore, the commutator combination of two changes together acts like a new versor-type change, according to the bivector $(\delta_1 A \times \delta_2 B)$:

$$e^{\delta_2 B/2} e^{\delta_1 A/2} e^{-\delta_2 B/2} e^{-\delta_1 A/2} X e^{\delta_1 A/2} e^{\delta_2 B/2} e^{-\delta_1 A/2} e^{-\delta_2 B/2} \approx e^{-\delta_1 \delta_2 A \times B/2} X e^{\delta_1 \delta_2 A \times B/2}$$

The new versor is of a smaller order than the two original changes ($\delta^2$ rather than $\delta$).

Studying this combination of changes in transformations gets us into **Lie algebra**, classically used to analyze small continuous transformations. It can for instance be employed (in control theory) to prove that a few standard transformations suffice to achieve any transformation. In geometric algebra, the Lie algebra computations reduce to making a bivector basis for the space of transformations. That amounts to choosing a few bivectors as basic and trying to make the others by commutator products, commutators of commutators, and so on. This is possible because the algebra of bivectors is closed under the commutator product. If you can make a basis for the whole bivector space, this proves that any motion can be achieved by doing commutators of motions.

As an example, let us consider the combination of two rotations in Euclidean 3-space, in the $A = \mathbf{e}_1 \wedge \mathbf{e}_2$ plane and the $B = \mathbf{e}_2 \wedge \mathbf{e}_3$ plane, and investigate if we can make any rotation by a combination of these basic rotations. The commutator of the bivectors is $A \times B = -\mathbf{e}_3 \wedge \mathbf{e}_1$, so that performing a small rotation over angle $\phi$ in the $A$ plane followed by a small rotation $\psi$ in the $B$ plane, and then reversing them, leads to a small rotation $\phi\psi$ in the $\mathbf{e}_1 \wedge \mathbf{e}_3$ plane. That rotation was not among our basic transformations, but it clearly completes the set of bivectors for rotors. It shows that with the two rotations we can make the third independent rotation. Directions in 3-D space are controllable with only two basic rotations.

By contrast, translations in 3-D really need three independent components to reach an arbitrary position. The reason is that translations commute, so that any commutator is zero. Geometrically, this implies that no independent translation can be created from two translations in a plane. (We will meet the bivectors of translations only later, in Chapter 13, but the argument is simple enough not to require precise representation.)

As a third example, consider the maneuvering of a car. You can only steer and drive (forward or backward), yet you can reach any position in any orientation. The car is obviously controllable. The basic parallel parking maneuver that allows a car to move sideways is actually a (simplified) sequence of two commutators of the steer and drive actions. For more details, see [16].

### 8.2.4 Transformation of a Change

In Section 8.2.2, we showed the nature of small changes in elements like $X$ caused by small rotors. Such changes can propagate through additional versors. For instance, if we have the transformation $X \to V X / V$, and $X$ is perturbed by a versor with characterizing bivector $A$, we can rewrite the result in terms of a perturbation of the original result:

$$V (e^{-\delta A/2} X e^{\delta A/2}) V^{-1} = (V e^{-\delta A/2} V^{-1}) (V X V^{-1}) (V e^{\delta A/2} V^{-1}).$$

Therefore, the result of the mapping gets perturbed by the mapped perturbation

$$V e^{-\delta A/2} V^{-1} = e^{-V \delta A V^{-1}/2},$$

by (7.21). You can simply substitute the error bivector $\delta A$ by $V \delta A / V$ to get the total error bivector of the perturbation on $V X / V$. No need for first-order approximations, the result is exact, and also holds for odd $V$.

### 8.2.5 Change of a Transformation

Things are somewhat more subtle when it is not $X$ that is perturbed in the mapping $X \to V X / V$, but the versor $V$ (which may be odd or even, though we temporarily drop the sign to show the structure of the argument more clearly). This happens, for instance, when you reflect in a plane that has some uncertainty in its parameters. When the versor $V$ becomes $e^{-\delta A/2} V e^{\delta A/2}$, the total perturbation is

$$(e^{-\delta A/2} V e^{\delta A/2}) X (e^{-\delta A/2} V^{-1} e^{\delta A/2}).$$

We need to express this in terms of a versor operation on the transformation result $V X / V$ to find out how that is perturbed. When we do so, the transformation versor on $V X / V$ can be rewritten to first order as

$$e^{-\delta A/2} V e^{\delta A/2} V^{-1} \approx (V + V \times \delta A) V^{-1} = 1 + (V \times \delta A)/V. \tag{8.5}$$

These are the first few terms of the Taylor series of the exponential $\exp((V \times \delta A)/V)$, considered as a function of $\delta A$. So we find for the versor operator computing the perturbed result to first order:

$$e^{-\delta A/2} V e^{\delta A/2} V^{-1} = e^{(V \times \delta A)/V}.$$

This should be written as the versor $e^{-\delta B/2}$, and that demand defines the bivector of the local perturbation $\delta B$ as

$$\delta B = -2(V \times \delta A)/V = \delta A - V \delta A / V. \tag{8.6}$$

This method of computation of a versor using only a first-order Taylor series is fine, as long as you remember that this is only valid to first order. The resulting versor is not the exact result valid for a big change to $V$. We can imagine the local validity of this technique when we rotate a mirror around a general axis. To a good approximation, the reflection rotates around the projection of the rotation axis onto the mirror, and that is described by the first-order rotor so that the reflection describes a circular arc. However, as the mirror rotates more, this projected axis changes and higher-order effects kick in; the circular arc was just a local second-order approximation to what is actually a caustic. (We will treat this application in Section 8.5.2.)

---

## 8.3 Parametric Differentiation

After this treatment of the transformational changes of an element, we study the second type of change we mentioned in the introduction.

Parametric differentiation is concerned with changes in elements in their dependence on their defining constituents. As such, it generalizes both the usual scalar differentiation and the derivative from vector calculus. All differentiation is based on functional dependence of scalar functions. In the usual approach, when these scalar functions are coordinate functions of a parameterized spatial curve or a vector field, the derivatives themselves can be reassembled into a geometric quantity such as the tangent vector to the curve or the divergence of the vector field. Such elements are truly geometric in that they do not depend on the coordinate functions that were introduced, but this is not always clear from either their derivation, their form, or their use.

Geometric algebra offers a way of computing with derivatives without using coordinates in the first place, by developing a calculus to apply them to its elements constructed using its products. However, proper coordinate-free definitions of the geometrical derivatives along these lines would require us to view them as a ratio of integrals. This would lead us a bit too far astray—you are referred to [26] for such a treatment. Here we will follow a more direct coordinate-based route, starting from scalar differentiation, but we quickly rise above that to attain truly geometric differentiation, expressed in coordinate-free formulas and techniques.

We construct our differentiation operators from specific to general, in the order of scalar differentiation, directional vector differentiation, total vector differentiation, and multivector differentiation. The final concept is the most general and contains the others, but we prefer to build up to it gradually.

---

## 8.4 Scalar Differentiation

Scalar differentiation of a multivector-valued function $F(\tau)$ relative to its scalar parameter $\tau$ is defined in the usual manner:

$$\frac{d}{d\tau} F(\tau) \equiv \lim_{\epsilon \to 0} \frac{F(\tau + \epsilon) - F(\tau)}{\epsilon}.$$

Geometric algebra has little to add to this form of differentiation, even though the function can now take values in the algebra. This type of differentiation is simply a scalar operator that commutes with all elements of the algebra. Therefore, it can be freely moved in a geometric product of multivector-valued functions, and obeys the product rule:

$$\frac{d}{d\tau}[F(\tau) G(\tau)] = \frac{d}{d\tau}[F(\tau)] G(\tau) + F(\tau) \frac{d}{d\tau}[G(\tau)]. \tag{8.7}$$

Yet we will see later that scalar differentiation is a particular instance of a more general multivector differentiation, and in preparation for that we denote it as $\partial_\tau$.

Since the function $F$ is typically defined using geometric algebra products, the differentiation result may also allow compact formulation using those products, so it is worth carrying out these differentiations symbolically. The following gives a simple example:

> Let a vector $\mathbf{x}$ follow a curve on an orbit parameterized as $\mathbf{x}(\tau)$ by the time parameter $\tau$. If we want to differentiate the scalar-valued vector function $\mathbf{x} \to \mathbf{x}^2$ (involving the geometric product) along the curve, this is done in careful detail as follows:
> 
> $$\begin{aligned}
> \partial_\tau \mathbf{x}(\tau)^2 &= \partial_\tau[\mathbf{x}(\tau) \mathbf{x}(\tau)] \\
> &= \partial_\tau[\mathbf{x}(\tau)] \mathbf{x}(\tau) + \mathbf{x}(\tau) \partial_\tau[\mathbf{x}(\tau)] \quad \text{(product rule)} \\
> &= 2\, \partial_\tau[\mathbf{x}(\tau)] \cdot \mathbf{x}(\tau) \quad \text{(inner product definition)} \\
> &= 2\, \dot{\mathbf{x}}(\tau) \cdot \mathbf{x}(\tau) \quad \text{(dot for time derivative)}
> \end{aligned}$$
> 
> The result of the scalar operator $\partial_\tau$ applied to the scalar-valued function $\mathbf{x}(\tau)^2$ is therefore a scalar, as you would expect. We will often leave the parameterization understood, and would then denote this in shorthand as $\partial_\tau \mathbf{x}^2 = 2\, \dot{\mathbf{x}} \cdot \mathbf{x}$.

The scalar differentiation can easily be applied to the constructions of geometric algebra. As an example, we show the scalar differentiation of a time-dependent rotor equation. Let the rotor be $R = e^{-I\phi/2}$, where the bivector angle $I\phi$ is a function of $\tau$ so that both rotation plane and rotation angle may vary. For constant $I$, scalar differentiation with respect to time gives (using chain rule and commutation rules)

$$\begin{aligned}
\partial_\tau X(\tau) &= \partial_\tau[e^{-I\phi/2} X_0 e^{I\phi/2}] \\
&= -\frac{1}{2} \partial_\tau[I\phi](e^{-I\phi/2} X_0 e^{I\phi/2}) + \frac{1}{2}(e^{-I\phi/2} X_0 e^{I\phi/2})\partial_\tau[I\phi] \\
&= \frac{1}{2}(X \partial_\tau[I\phi] - \partial_\tau[I\phi] X) \\
&= X \times \partial_\tau[I\phi].
\end{aligned} \tag{8.8}$$

This retrieves the commutator form of the change in a rotor transformation: $X$ changes in first order by its commutator with the derivative of the bivector of the change. This agrees with our analysis of changes in a rotor-based transformation as a commutator in (8.4). For the more general case of a variable $I$, see Structural Exercise 6.

The simple expression that results assumes a more familiar form when $X$ is a vector $\mathbf{x}$ in 3-space, the attitude of the rotation plane is fixed so that $\frac{d}{dt}I = 0$, and we introduce a scalar angular velocity $\omega \equiv \frac{d}{dt}\phi$. It is then common practice to introduce the vector dual to the plane as the angular velocity vector $\boldsymbol{\omega}$, so $\boldsymbol{\omega} \equiv (\omega I)^* = \omega I / I_3$. We obtain

$$\frac{d}{dt}\mathbf{x} = \mathbf{x} \times \frac{d}{dt}(I\phi) = \mathbf{x} \times (\omega I_3) = \mathbf{x} \cdot (\omega I_3) = (\mathbf{x} \wedge \boldsymbol{\omega}) I_3 = \boldsymbol{\omega} \times \mathbf{x},$$

where the final symbol $\times$ is the 3-D vector cross product. This shows the correspondence of our scalar differentiation with the classical way of expressing the change.

As before when we treated other operations, we find that an equally simple geometric algebra expression is much more general than the classical expression; here (8.8) describes the differential rotation of $k$-dimensional subspaces in $n$-dimensional space rather than merely of vectors in 3-D.

### 8.4.1 Application: Radius of Curvature of a Planar Curve

In the differential geometry of planar curves in the Euclidean plane $\mathbb{R}^{2,0}$, you often want a local description of a parameterized curve $\mathbf{r}(\tau)$ in terms of its local tangent circle. That characterizes the curve well to second order; the local curvature is the reciprocal of the radius of this tangent circle. The following derivation is a good example of a proper classical coordinate-free treatment, borrowed from [50], which we are then able to complete to a closed-form solution using geometric algebra.

Let the local tangent circle be characterized by its center $\mathbf{c}$ and its radius $\rho$. Then a point $\mathbf{r}$ lies on it if it satisfies $(\mathbf{c} - \mathbf{r})^2 = \rho^2$. Now we let $\mathbf{r}$ be the parameterized curve point $\mathbf{r}(\tau)$, which relative to its parameter $\tau$ has first derivative $\dot{\mathbf{r}}(\tau)$ and second derivative $\ddot{\mathbf{r}}(\tau)$. (This handy overdot notation of these "fluxions" is common in physics texts.) Taking derivatives of the defining equation, we get the following list of requirements on $\mathbf{c}$ and $\rho$:

$$\begin{aligned}
(\mathbf{c} - \mathbf{r})^2 &= \rho^2 \\
2(\mathbf{c} - \mathbf{r}) \cdot \dot{\mathbf{r}} &= 0 \\
-2\dot{\mathbf{r}} \cdot \dot{\mathbf{r}} + 2(\mathbf{c} - \mathbf{r}) \cdot \ddot{\mathbf{r}} &= 0
\end{aligned}$$

Our source [50] stops here, but we can continue because we have geometric algebra. The occurrence of $(\mathbf{c} - \mathbf{r})$ in an inner product with both $\dot{\mathbf{r}}$ and $\ddot{\mathbf{r}}$ makes us wonder what $(\mathbf{c} - \mathbf{r})(\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}})$ might be, since that contains both terms by (3.17). Because of the equations above, it is fortunately independent of both $\mathbf{c}$ and $\rho$:

$$(\mathbf{c} - \mathbf{r})(\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}}) = ((\mathbf{c} - \mathbf{r}) \cdot \dot{\mathbf{r}})\ddot{\mathbf{r}} - ((\mathbf{c} - \mathbf{r}) \cdot \ddot{\mathbf{r}})\dot{\mathbf{r}} = -(\dot{\mathbf{r}} \cdot \dot{\mathbf{r}})\dot{\mathbf{r}} = -\dot{\mathbf{r}}^3 \tag{8.9}$$

Moreover, since in 2-D any trivector is zero, so is $(\mathbf{c} - \mathbf{r}) \wedge (\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}})$. Therefore, the contraction in (8.9) can be replaced by a geometric product. Since that is invertible, we can perform right division and obtain

$$\mathbf{c} = \mathbf{r} - \frac{\dot{\mathbf{r}}^3}{\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}}}$$

as the closed-form solution for $\mathbf{c}$, and by substitution we obtain $\rho^2$:

$$\rho^2 = \left(\frac{\dot{\mathbf{r}}^3}{\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}}}\right)^2.$$

In both expressions, we recognize the occurrence of the reciprocal of the rejection of $\ddot{\mathbf{r}}$ by $\dot{\mathbf{r}}$—so only the component of $\ddot{\mathbf{r}}$ orthogonal to $\dot{\mathbf{r}}$ contributes to these geometric quantities (the other part is related to reparameterization, and is geometrically less interesting). The center of the tangent circle is clearly in the direction orthogonal to $\dot{\mathbf{r}}$.

The ensuing expression for the curvature requires a square root of a square of a vector; its sign should be related to choosing a positive direction for vectors orthogonal to $\dot{\mathbf{r}}$. Using the pseudoscalar $I_2$ of the plane for dualization, we use $\dot{\mathbf{r}}^*$ as the positive direction relative to $\dot{\mathbf{r}}$. Then the curvature is

$$\kappa = 1/\rho = \frac{(\dot{\mathbf{r}} \wedge \ddot{\mathbf{r}})^*}{\|\dot{\mathbf{r}}\|^3}.$$

This is easily converted to the familiar coordinate form by setting $\mathbf{r}(\tau) = x(\tau)\mathbf{e}_1 + y(\tau)\mathbf{e}_2$, with the parameter derivatives of the functions $x$ and $y$ denoted by overdots:

$$\kappa = \frac{\dot{x}\ddot{y} - \dot{y}\ddot{x}}{(\dot{x}^2 + \dot{y}^2)^{3/2}}.$$

This expression takes considerably more work to derive when using coordinates from the start.

---

## 8.5 Directional Differentiation

Let $F(\mathbf{x})$ be an element of geometric algebra dependent on a vector $\mathbf{x}$. (If $\mathbf{x}$ is the position vector, this would be a position-dependent quantity, such as a vector field or a bivector field in the space $\mathbb{R}^n$.) We may want to know how $F(\mathbf{x})$ changes at a particular value of $\mathbf{x}$ if we would move in the direction $\mathbf{a}$. It will clearly vary by an amount of the same grade type as $F$ itself, so such a directional differentiation is a scalar operator on $F(\mathbf{x})$. It is denoted by $(\mathbf{a} * \partial_\mathbf{x})$—we will explain why soon—and defined as

$$(\mathbf{a} * \partial_\mathbf{x}) F(\mathbf{x}) \equiv \lim_{\epsilon \to 0} \frac{F(\mathbf{x} + \epsilon\mathbf{a}) - F(\mathbf{x})}{\epsilon}.$$

Since it is a scalar operator, it commutes with all elements. You might expect that this implies that it acts very much like differentiation in real calculus, but that is incorrect: the geometric products in the functions it acts on make for rather different (but geometrically correct) results.

> As an example, the function $\mathbf{x} \to \mathbf{x}^2$ is defined everywhere, and gives a scalar field on the vector space $\mathbb{R}^n$. Its directional derivative is
> 
> $$\begin{aligned}
> (\mathbf{a} * \partial_\mathbf{x})[\mathbf{x}^2] &= \lim_{\epsilon \to 0} \frac{(\mathbf{x} + \epsilon\mathbf{a})^2 - \mathbf{x}^2}{\epsilon} \quad \text{(definition)} \\
> &= \lim_{\epsilon \to 0} \frac{\epsilon\mathbf{x}\mathbf{a} + \epsilon\mathbf{a}\mathbf{x} + \epsilon^2 \mathbf{a}^2}{\epsilon} \quad \text{(definition)} \\
> &= \mathbf{x}\mathbf{a} + \mathbf{a}\mathbf{x} \quad \text{(limit process)} \\
> &= 2\mathbf{a} \cdot \mathbf{x} \quad \text{(inner product definition)}
> \end{aligned}$$
> 
> You see the familiar result: there is no variation when $\mathbf{a}$ is perpendicular to $\mathbf{x}$, and maximum variation in the $\mathbf{x}$-direction.

Since the differentiation is a scalar operator, it can be moved freely through expressions, and obeys a product rule like (8.7).

### 8.5.1 Table of Elementary Results

We do some basic derivations and collect them in Table 8.1, which contains other results that follow the same pattern. (In our derivations here, we assume that all vectors reside in the same space, but the table is slightly more general and requires projection of the parameter vectors to the space of $\mathbf{x}$, hence the occurrence of $P[\mathbf{a}]$. We explain this in Section 8.6.)

- **The identity function** $F(\mathbf{x}) = \mathbf{x}$ has the derivative you would expect:

$$(\mathbf{a} * \partial_\mathbf{x})\mathbf{x} = \lim_{\epsilon \to 0} \frac{(\mathbf{x} + \epsilon\mathbf{a}) - \mathbf{x}}{\epsilon} = \mathbf{a}.$$

- **Scalar differentiation of the inner product** leads to a substitution of $\mathbf{x}$ by its change $\mathbf{a}$:

$$(\mathbf{a} * \partial_\mathbf{x})(\mathbf{x} \cdot \mathbf{b}) = \mathbf{a} \cdot \mathbf{b}.$$

- **The inner product with a vector-valued linear function** $f$ unexpectedly pulls in the adjoint function $\bar{f}$ of Section 4.3.2:

$$(\mathbf{a} * \partial_\mathbf{x})(f[\mathbf{x}] \cdot \mathbf{b}) = (\mathbf{a} * \partial_\mathbf{x})(\mathbf{x} \cdot \bar{f}[\mathbf{b}]) = \mathbf{a} \cdot \bar{f}[\mathbf{b}].$$

- **The scalar derivative of the inverse** $1/\mathbf{x} = \mathbf{x}^{-1}$ gives a surprising result:

$$\begin{aligned}
(\mathbf{a} * \partial_\mathbf{x})\mathbf{x}^{-1} &= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\frac{1}{\mathbf{x} + \epsilon\mathbf{a}} - \frac{1}{\mathbf{x}}\right) \\
&= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\frac{\mathbf{x} + \epsilon\mathbf{a}}{\mathbf{x}^2 + 2\epsilon\mathbf{a} \cdot \mathbf{x}} - \frac{1}{\mathbf{x}}\right) \\
&= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\frac{\mathbf{x}(1 + \epsilon\mathbf{x}^{-1}\mathbf{a})}{\mathbf{x}^2(1 + 2\epsilon\mathbf{a} \cdot \mathbf{x}^{-1})} - \frac{1}{\mathbf{x}}\right) \\
&= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\frac{\mathbf{x}}{\mathbf{x}^2}(1 + \epsilon\mathbf{x}^{-1}\mathbf{a})(1 - 2\epsilon\mathbf{a} \cdot \mathbf{x}^{-1}) - \frac{1}{\mathbf{x}}\right) \\
&= \mathbf{x}^{-1}(\mathbf{x}^{-1}\mathbf{a} - 2\mathbf{a} \cdot \mathbf{x}^{-1}) \\
&= -\mathbf{x}^{-1}\mathbf{a}\mathbf{x}^{-1}.
\end{aligned}$$

This clearly differs from the classical result in real analysis (ignoring all commutation restrictions, we would get the familiar $-\mathbf{a}/\mathbf{x}^2$). The construction can be immediately interpreted geometrically, as in Figure 8.1. When you realize that $\mathbf{x}^{-1}$ is the inversion of $\mathbf{x}$ in the unit sphere, you see that a change $\mathbf{a}$ in $\mathbf{x}$ is a $1/\mathbf{x}^2$-scaled version of the reflection of $\mathbf{a}$ relative to the plane perpendicular to $\mathbf{x}$, which is exactly what the differentiation result signifies.

- **For powers of the norm**, which are scalar functions, we retrieve a semblance of the usual calculus result.

$$\begin{aligned}
(\mathbf{a} * \partial_\mathbf{x})\|\mathbf{x}\|^k &= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\|\mathbf{x} + \epsilon\mathbf{a}\|^k - \|\mathbf{x}\|^k\right) \\
&= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\|\mathbf{x}\|^k(\sqrt{1 + 2\epsilon\mathbf{x}^{-1} \cdot \mathbf{a}})^k - \|\mathbf{x}\|^k\right) \\
&= \lim_{\epsilon \to 0} \frac{1}{\epsilon}\left(\|\mathbf{x}\|^k(1 + k\epsilon\mathbf{x}^{-1} \cdot \mathbf{a}) - \|\mathbf{x}\|^k\right) \\
&= k\,\mathbf{x} \cdot \mathbf{a}\,\|\mathbf{x}\|^{k-2}.
\end{aligned}$$

The other entries of Table 8.1 can be demonstrated using similar techniques.

---

**Table 8.1:** Directional derivatives and vector derivatives of common functions in an $m$-dimensional vector manifold $\mathbb{R}^m$ within a larger vector manifold $\mathbb{R}^n$. Here $\mathbf{x}$, $\mathbf{a}$ are vectors, $\mathbf{A}$ is a blade, $P[\,]$ is shorthand for the projection $P_{I_m}[\,]: \mathbb{R}^n \to \mathbb{R}^m$ locally mapping vectors onto the lower-dimensional manifold.

| Directional Derivatives | |
|:---|:---|
| $(\mathbf{a} * \partial_\mathbf{x})\mathbf{x}$ | $= P[\mathbf{a}]$ |
| $(\mathbf{a} * \partial_\mathbf{x})(\mathbf{x} \cdot \mathbf{b})$ | $= P[\mathbf{a}] \cdot \mathbf{b}$ |
| $(\mathbf{a} * \partial_\mathbf{x})\mathbf{x}^{-1}$ | $= -\mathbf{x}^{-1} P[\mathbf{a}] \mathbf{x}^{-1}$ |
| $(\mathbf{a} * \partial_\mathbf{x})\|\mathbf{x}\|^k$ | $= k(P[\mathbf{a}] \cdot \mathbf{x})\|\mathbf{x}\|^{k-2}$ |
| $(\mathbf{a} * \partial_\mathbf{x})\dfrac{\mathbf{x}}{\|\mathbf{x}\|^k}$ | $= \dfrac{P[\mathbf{a}] - k(P[\mathbf{a}] \cdot \mathbf{x})/\mathbf{x}}{\|\mathbf{x}\|^k}$ |

| Vector Derivatives | |
|:---|:---|
| $\partial_\mathbf{x} \mathbf{x}$ | $= m$ |
| $\partial_\mathbf{x} \cdot \mathbf{x}$ | $= m$ |
| $\partial_\mathbf{x} \wedge \mathbf{x}$ | $= 0$ |
| $\partial_\mathbf{x}(\mathbf{x} \cdot \mathbf{a})$ | $= P[\mathbf{a}]$ |
| $\partial_\mathbf{x}(\mathbf{x} \wedge \mathbf{a})$ | $= (m-1)P[\mathbf{a}]$ |
| $\partial_\mathbf{x}(\mathbf{x}\mathbf{A})$ | $= m\,P[\mathbf{A}]$ |
| $\partial_\mathbf{x}(\mathbf{x} \cdot \mathbf{A})$ | $= \text{grade}(\mathbf{A})\,P[\mathbf{A}]$ |
| $\partial_\mathbf{x}(\mathbf{x} \wedge \mathbf{A})$ | $= (m - \text{grade}(\mathbf{A}))\,P[\mathbf{A}]$ |
| $\partial_\mathbf{x}(\mathbf{A} \cdot \mathbf{x})$ | $= (m - 2\,\text{grade}(\mathbf{A}))\,P[\mathbf{A}]$ |
| $\partial_\mathbf{x}\|\mathbf{x}\|$ | $= \dfrac{\mathbf{x}}{\|\mathbf{x}\|}$ |
| $\partial_\mathbf{x}\|\mathbf{x}\|^k$ | $= k\|\mathbf{x}\|^{k-2}\mathbf{x}$ |
| $\partial_\mathbf{x}\dfrac{\mathbf{x}}{\|\mathbf{x}\|^k}$ | $= \dfrac{m-k}{\|\mathbf{x}\|^k}$ |
| $\partial_\mathbf{x}(f[\mathbf{x}] \cdot \mathbf{y})$ | $= P[\bar{f}[\mathbf{y}]]$ |

---

> **Figure 8.1:** *Directional differentiation of a vector inversion.* The small additive perturbation vector $\mathbf{a}$ is reflected in the plane with normal $\mathbf{x}$ to make $-\mathbf{x}\mathbf{a}\mathbf{x}^{-1}$, and the result scaled by $1/\mathbf{x}^2$ to produce $-\mathbf{x}^{-1}\mathbf{a}\mathbf{x}^{-1}$ as the correct difference (to first order) between $(\mathbf{x} + \mathbf{a})^{-1}$ and $\mathbf{x}^{-1}$.

### 8.5.2 Application: Tilting a Mirror

Consider the situation where we have a planar mirror in the origin with normal vector $\mathbf{n}$ (not necessarily a unit normal). The reflection of an element $X$ in this mirror is given by (see Section 7.1):

$$X \to \sigma_\mathbf{n}[X] \equiv \mathbf{n} X \mathbf{n}^{-1}.$$

We now perturb the mirror, for instance by a small rotation, and want to know what happens to the reflection result. Let us do this in two steps: first we see how any change in $\mathbf{n}$ affects the reflection result; then we relate the change in $\mathbf{n}$ to the parameters of the perturbing rotational action on the mirror.

- **For the first step**, we apply the directional derivative for an $\mathbf{a}$-change in $\mathbf{n}$:

$$\begin{aligned}
(\mathbf{a} * \partial_\mathbf{n})[\mathbf{n} X \mathbf{n}^{-1}] &= \mathbf{a} X \mathbf{n}^{-1} + \mathbf{n} X (-\mathbf{n}^{-1}\mathbf{a}\mathbf{n}^{-1}) \\
&= (\mathbf{a}\mathbf{n}^{-1})(\mathbf{n} X \mathbf{n}^{-1}) - (\mathbf{n} X \mathbf{n}^{-1})(\mathbf{a}\mathbf{n}^{-1}) \\
&= 2(\mathbf{a}\mathbf{n}^{-1}) \times (\mathbf{n} X \mathbf{n}^{-1}) \\
&= (\mathbf{n} X \mathbf{n}^{-1}) \times (2\mathbf{n}^{-1} \wedge \mathbf{a})
\end{aligned}$$

The final simplification holds because the scalar part $\mathbf{n}^{-1} \cdot \mathbf{a}$ of $\mathbf{n}^{-1}\mathbf{a}$ does not contribute to the commutator product result.

The result shows that it is the part of $\mathbf{a}$ perpendicular to $\mathbf{n}$ that causes changes to the reflection. This is, of course, just what we would have expected, since the magnitude of $\mathbf{n}$ does not affect the reflection $\sigma_\mathbf{n}[X]$ at all. A small orthogonal change to a vector is effectively a rotation, so the directional derivative is eminently suited to process the rotational change. But there is more: to first order, the change in the reflection $\sigma_\mathbf{n}[X]$ can be written as a commutator. Therefore, it can be represented (at least locally) as a rotor transformation. Comparing with (8.4), we see that the bivector $B$ of the transforming rotor equals $B = 2\mathbf{n}^{-1} \wedge \mathbf{a}$. So the reflected element $\sigma_\mathbf{n}[X]$ describes a rotation as the mirror normal changes by $\mathbf{a}$, in the plane $\mathbf{n}^{-1} \wedge \mathbf{a}$, by a rotation angle $\|\mathbf{n}^{-1} \wedge \mathbf{a}\|$. Recognizing this is in fact a local integration, since it reverses the differentiation process.

- **In the second step**, we need to relate the change $\mathbf{a}$ in the mirror normal $\mathbf{n}$ to an actual transformation. Let us rotate the mirror using a rotor $\exp(-I\phi/2)$, with $I$ the unit 2-blade of the rotation plane and $\phi$ a small angle. Then, according to (8.3), the normal vector $\mathbf{n}$ changes to first order by the vector $\mathbf{n} \times I\phi$. This is therefore what we should use as our $\mathbf{a}$.

- **Combining the two results**, the bivector of the total transformation in the reflected $X$ is

$$B = 2\mathbf{n}^{-1} \wedge \mathbf{a} = 2\phi\,\mathbf{n}^{-1} \wedge (\mathbf{n} \times I) = 2\phi\,\mathbf{n}^{-1} \wedge (\mathbf{n} \cdot I). \tag{8.10}$$

That result is valid in any number of dimensions. It gives the bivector of the resulting rotation of $\sigma_\mathbf{n}[X]$, which specifies both the rotation plane and its angle.

To get a better feeling for the geometry of (8.10) in 3-D, introduce the unit rotational axis of the mirror motion $\mathbf{m} = I^*$, normalize $\mathbf{n}$ to unity, and express the result as a rotational axis $\mathbf{b} = B^*$. Some manipulation gives

$$\mathbf{b} = 2\phi\,\mathbf{n} \rfloor (\mathbf{n} \wedge \mathbf{m}) = 2\phi\,(\mathbf{m} \wedge \mathbf{n})/\mathbf{n}.$$

This axis is the rejection of $\mathbf{m}$ by $\mathbf{n}$, or (if you prefer) the projection of the axis $\mathbf{m}$ onto the plane with normal vector $\mathbf{n}$. That projection obtains a factor $\sin\psi$ of the angle $\psi$ between $\mathbf{n}$ and $\mathbf{m}$. The rotation angle $\beta$ for the reflection $\sigma_\mathbf{n}[X]$ of $X$ under the rotation of $\phi$ around the $\mathbf{m}$ axis is the norm of $\mathbf{b}$, which evaluates as

$$\beta = 2\phi\sin(\psi). \tag{8.11}$$

This is a rather powerful result acquired with fairly little effort, only at the very last moment requiring some trivial trigonometry. Figure 8.2 sketches the situation. Two special cases make perfect sense: if $\psi = 0$, then $\mathbf{n}$ and $\mathbf{m}$ are aligned, and indeed no rotation over $\mathbf{m}$ changes the reflection of $X$; and if $\psi = \pi/2$, then $\mathbf{n}$ and $\mathbf{m}$ are perpendicular, and any rotation $\phi$ of the rotation plane becomes a $2\phi$ rotation of the reflection $\sigma_\mathbf{n}[X]$.

We will get back to this rotated reflection in its full generality in Section 13.7.

> **Figure 8.2:** *Changes in reflection of a rotating mirror.* The yellow mirror with normal $\mathbf{n}$ rotates around the $\mathbf{m}$ axis over an angle $\phi$, producing the green mirror plane. This changes the reflection $-\mathbf{n}\mathbf{x}\mathbf{n}^{-1}$ of a vector $\mathbf{x}$ to the gray vector. That change is to first order described as the rotation of $-\mathbf{n}\mathbf{x}\mathbf{n}^{-1}$ around an axis that is the projection of $\mathbf{m}$ on the $\mathbf{n}$ plane, over an angle $2\phi\sin\psi$, where $\psi$ is the angle between $\mathbf{n}$ and $\mathbf{m}$. This involved and geometrically quantitative figure is the result of only a few lines of coordinate-free computation in geometric algebra.

---

## 8.6 Vector Differentiation

In scalar differentiation, we consider a vector function as a changing in time (or some such scalar parameter). We may also want to consider $F(\mathbf{x})$ as a function of position as encoded by the vector variable $\mathbf{x}$, and differentiate directly relative to that variable. This is most easily defined by developing it on a basis, doing a directional differentiation with respect to each of the components, and reassembling the result in one quantity. It is the $\nabla$-operator of vector analysis, but we will denote it as $\partial_\mathbf{x}$. This explicitly specifies the variable relative to which we differentiate and prepares for a generalization beyond vectors and toward differential geometry. On a basis $\{\mathbf{e}_i\}_{i=1}^m$ for the space $\mathbb{R}^m$ in which $\mathbf{x}$ resides, let $x^i$ denote the coordinate functions of the vector $\mathbf{x}$ so that it can be written as

$$\mathbf{x} = \sum_{i=1}^{m} x^i \mathbf{e}_i.$$

We will be setting up this vector differentiation in a very general framework, in which the space $\mathbb{R}^m$ of $\mathbf{x}$ may reside on a manifold (curved subspace) within a larger space $\mathbb{R}^n$ (for instance, $\mathbf{x}$ may lie on a 2-D surface in 3-D space). The basis for $\mathbb{R}^m$ may then not be orthonormal, so we use the reciprocal basis of Section 3.8, and compute $x^i$ as $x^i = \mathbf{e}^i \cdot \mathbf{x}$. The directional derivative in the coordinate direction of $\mathbf{e}_i$ is simply the scalar derivative of the coordinate function:

$$(\mathbf{e}_i * \partial_\mathbf{x}) = \frac{\partial}{\partial x^i} = \partial_{x^i}.$$

As their notation suggests, we can assemble the results of each of these directional operators and consider them as the components of a more general vector derivative operation defined on this basis as

$$\partial_\mathbf{x} \equiv \sum_{i=1}^{m} \mathbf{e}^i (\mathbf{e}_i * \partial_\mathbf{x}) = \sum_i \mathbf{e}^i \frac{\partial}{\partial x^i}. \tag{8.12}$$

(When you study reciprocal frames, expressions like these are actually coordinate-free when they contain the upper and lower indices that cancel; in physics, lower-index vectors are called covariant and upper-index vectors contravariant, but we will not follow that terminology here.)

The operator $\partial_\mathbf{x}$ computes the total change in its argument when $\mathbf{x}$ changes in all possible ways, but it keeps track of those changes in a geometrical manner, registering the $\mathbf{e}_i$-related scalar change in the magnitude of the $\mathbf{e}^i$ component of the total change. Preserving this geometrical information is surprisingly powerful, and in advanced geometric calculus it is shown that this operator can be inverted by integration (see [26]).

You should interpret the grade of the operator $\partial_\mathbf{x}$ as a vector (i.e., as the grade of its subscript). As a geometrical vector operator, it should conform to the commutation rules for geometric products. We will not use the square application brackets here, for it is more productive to see this as a geometric element rather than as a linear operator, and to move it to other places in the sequence of symbols for computational purposes. The subscript $\mathbf{x}$ in $\partial_\mathbf{x}$ denotes which vector variable is being differentiated (and this is necessary when there is more than one).

> As an example, we apply the vector differentiation to the function $F(\mathbf{x}) = \mathbf{x}^2$, relative to its vector parameter $\mathbf{x}$:
> 
> $$\begin{aligned}
> \partial_\mathbf{x} \mathbf{x}^2 &= \sum_i \mathbf{e}^i \partial_{x^i}\left(\sum_{j,k} x^j x^k \mathbf{e}_j \cdot \mathbf{e}_k\right) \quad \text{(coordinate definition)} \\
> &= \sum_i \mathbf{e}^i \left(\sum_k x^k \mathbf{e}_i \cdot \mathbf{e}_k + \sum_j x^j \mathbf{e}_j \cdot \mathbf{e}_i\right) \quad \text{(coordinate independence)} \\
> &= 2 \sum_i \mathbf{e}^i (\mathbf{e}_i \cdot \mathbf{x}) \quad \text{(linearity)} \\
> &= 2\mathbf{x}.
> \end{aligned} \tag{8.13}$$
> 
> We obtain the result $2\mathbf{x}$, which you might have expected from pattern matching with scalar differentiation (though that is a dangerous principle to apply). The result is not a vector, but a vector field that has the value $2\mathbf{x}$ at a location $\mathbf{x}$. This vector field is in fact the gradient of the scalar function $\mathbf{x}^2$ (i.e., the direction in which it varies most, with a magnitude that indicates the amount of variation).

The recognition of the multiplication in $\partial_\mathbf{x} F(\mathbf{x})$ as the geometric product makes it quite natural to expand this in terms of the inner and outer product, simply applying (6.14):

$$\partial_\mathbf{x} F(\mathbf{x}) = \partial_\mathbf{x} \cdot F(\mathbf{x}) + \partial_\mathbf{x} \wedge F(\mathbf{x}).$$

For a vector-valued function $F$, the first term corresponds to the usual **divergence** operator $\text{div}[F(\mathbf{x})] \equiv \nabla \cdot F(\mathbf{x})$, and the second term is related to the **curl** operator $\text{rot}[F(\mathbf{x})] \equiv \nabla \times F(\mathbf{x})$, written in terms of the 3-D cross product; it is actually its dual. As with the other uses of the cross product, replacing the curl by an outer-product-based construction ensures validity in arbitrary dimensionality. If $F$ is scalar-valued, then only the $\partial_\mathbf{x} \wedge F(\mathbf{x})$ term remains, and is identical to the **gradient** operator $\text{grad}[F(\mathbf{x})] = \nabla F(\mathbf{x})$. For a symmetric vector function $F_+$ (equal to its adjoint), the part $\partial_\mathbf{x} \wedge F_+[\mathbf{x}]$ equals zero, for a skew-symmetric vector function $F_-$ (opposite to its adjoint), the part $\partial_\mathbf{x} \cdot F_-[\mathbf{x}]$ equals zero.

### 8.6.1 Elementary Results of Vector Differentiation

We have introduced the vector differentiation as the geometric algebra equivalent of the $\nabla$-operator from vector analysis. Although the definition as we have given it uses coordinates, the vector differentiation is a proper geometrical operation that is not dependent on any chosen coordinate system. When you apply it, you should avoid coordinates, and instead use results from a table of standard functions (combined with product rule and chain rule of differentiation). We give such a collection of useful elementary results in Table 8.1, and derive some of its more educational entries below.

- **Identity Function $\mathbf{x}$.** The identity function $F(\mathbf{x}) = \mathbf{x}$ has a derivative that depends on the dimensionality of the space $\mathbb{R}^m$ in which $\mathbf{x}$ resides.

$$\begin{aligned}
\partial_\mathbf{x} \mathbf{x} &= \sum_i \mathbf{e}^i \frac{\partial}{\partial x^i}\left[\sum_j x^j \mathbf{e}_j\right] \\
&= \sum_{i,j} \delta^j_i \mathbf{e}^i \mathbf{e}_j = \sum_i \mathbf{e}^i \mathbf{e}_i \\
&= \sum_i \mathbf{e}^i \cdot \mathbf{e}_i + \sum_i \mathbf{e}^i \wedge \mathbf{e}_i = \sum_i 1 + 0 = m.
\end{aligned}$$

(Here we used $\sum_i \mathbf{e}^i \wedge \mathbf{e}_i = 0$, given as (3.35).) This algebraic derivation gives a clue for the correct geometrical way to look at this: all changes in all directions are to be taken into account. In $m$-dimensional space, there are $m$ directions, and each of these provide a unit change in coordinates with each unit step, for a total of $m$.

Since the vector differentiation applies as a geometric product, you can split the result in an inner and outer product part that the computation above has shown to obey $\partial_\mathbf{x} \cdot \mathbf{x} = m$ and $\partial_\mathbf{x} \wedge \mathbf{x} = 0$. The outer product result $\partial_\mathbf{x} \wedge \mathbf{x} = 0$ shows that you can think of $\partial_\mathbf{x}$ as being like a vector in the $\mathbf{x}$ direction, and the inner product result then shows that it is like $m/\mathbf{x}$ (but view these as no more than mnemonics; $\partial_\mathbf{x}$ is of course not a vector but an operator).

- **Inner Product $\mathbf{x} \cdot \mathbf{a}$.** When we study the change in the scalar quantity $F(\mathbf{x}) = \mathbf{x} \cdot \mathbf{a}$ (geometrically the projected component of $\mathbf{x}$ onto a vector $\mathbf{a}^{-1}$), we should in general allow for the variations of $\mathbf{x}$ to be in its $m$-dimensional manifold (curved subspace), whereas $\mathbf{a}$ may be a vector of the encompassing space $\mathbb{R}^n$ (for instance, $\mathbf{x}$ on a sphere, $\mathbf{a}$ a general vector in 3-D space; $\mathbf{x} \cdot \mathbf{a}$ is well defined everywhere on the sphere, so it has a derivative).

Two things happen to the measured changes caused by variations in $\mathbf{x}$. First, even when $\mathbf{x}$ and $\mathbf{a}$ are in the same $m$-dimensional space, the quantity $\mathbf{x} \cdot \mathbf{a}$ can only pick up the changes in the direction $\mathbf{a}$, so summing over all directions only this 1-D variation remains. Second, $\mathbf{x}$ cannot really vary in the $\mathbf{a}$-direction, since it has to remain in its $m$-dimensional manifold, or more accurately, in the tangent space at $\mathbf{x}$ isomorphic to $\mathbb{R}^m$, for which $\{\mathbf{e}_i\}_{i=1}^m$ is the basis. It is the projection of the $\mathbf{a}$-direction onto this tangent space that must be the actual gradient.

The algebraic computation confirms this, with indices $i$ and $j$ ranging over coordinates for the space in which $\mathbf{x}$ resides, and $k$ over the space of $\mathbf{a}$, using a local coordinate basis for the total $n$-dimensional space in which the problem is defined:

$$\begin{aligned}
\partial_\mathbf{x}(\mathbf{x} \cdot \mathbf{a}) &= \sum_i \mathbf{e}^i \frac{\partial}{\partial x^i}\left[\sum_j \sum_k x^j a^k \mathbf{e}_j \cdot \mathbf{e}_k\right] \\
&= \sum_i \sum_k a^k \mathbf{e}^i (\mathbf{e}_i \cdot \mathbf{e}_k) \\
&= \sum_i a^i \mathbf{e}^i = P_{I_m}[\mathbf{a}],
\end{aligned}$$

since the summation of the $\mathbf{a}$ components is only done for the elements in the basis of the tangent space at $\mathbf{x}$ with pseudoscalar $I_m$. In tables, we will use $P[\mathbf{a}]$ as shorthand.

- **Outer Product $\mathbf{x} \wedge \mathbf{a}$.** When we compute the variation of the bivector $\mathbf{x} \wedge \mathbf{a}$, this can be rewritten as the variation of $\mathbf{x}\mathbf{a} - \mathbf{x} \cdot \mathbf{a}$. The variation over $\mathbf{x}$ in the first term causes a factor $m$ (the dimensionality of the space that $\mathbf{x}$ resides in), but of course it picks up only the part $P[\mathbf{a}]$ of $\mathbf{a}$. The second term we have seen above, and the total variation is now $\partial_\mathbf{x}(\mathbf{x} \wedge \mathbf{a}) = (m-1)P[\mathbf{a}]$.

- **Norm $\|\mathbf{x}\|$.** Geometrically, what would you expect the derivative of the norm to be? Since it is a scalar function, the vector derivative will be the gradient of the norm, i.e., the direction in which it increases most steeply weighted by the weight of increase. So the answer should be $\mathbf{x}/\|\mathbf{x}\|$, the unit vector in the $\mathbf{x}$ direction. The algebraic computation confirms that it is:

$$\begin{aligned}
\partial_\mathbf{x}\|\mathbf{x}\| &= \sum_i \mathbf{e}^i \partial_{x^i}\left(\sum_{j,k} x^j x^k \mathbf{e}_j \cdot \mathbf{e}_k\right)^{1/2} \\
&= \sum_i \mathbf{e}^i \left(\sum_k x^k \mathbf{e}_i \cdot \mathbf{e}_k + \sum_j x^j \mathbf{e}_j \cdot \mathbf{e}_i\right)/(2\|\mathbf{x}\|) \\
&= \sum_i \mathbf{e}^i (\mathbf{e}_i \cdot \mathbf{x})/\|\mathbf{x}\| \\
&= \mathbf{x}/\|\mathbf{x}\|.
\end{aligned}$$

This result depends on the metric through the norm $\|\mathbf{x}\|$.

- **Adjoint as Derivative.** When we introduced the adjoint $\bar{f}$ of a function $f$ in Section 4.3.2, we only had an implicit definition through $\mathbf{x} * \bar{f}[\mathbf{y}] = f[\mathbf{x}] * \mathbf{y}$. Using the vector derivative, we can define the adjoint explicitly as

$$\bar{f}[\mathbf{x}] \equiv \partial_\mathbf{y}(f[\mathbf{y}] * \mathbf{x}), \tag{8.14}$$

where both $\mathbf{x}$ and $\mathbf{y}$ are in the same space $\mathbb{R}^m$ (to avoid the need for a projection). You can prove it immediately by rewriting the argument of the differentiation using the earlier definition. This definition can also be applied to nonlinear functions, and it then computes a local adjoint, which may be different at every location $\mathbf{x}$.

### 8.6.2 Properties of Vector Differentiation

The vector differentiation operator is clearly linear. It also obeys a product rule, though we need to take care of its noncommutativity. Therefore, it becomes inconvenient to denote its application by square brackets; we need a more specific notation. Dropping the reference to $\mathbf{x}$ for readability, we express the product rule as

$$\partial(FG) = \dot{\partial} \dot{F} G + \dot{\partial} F \dot{G},$$

where in each term the accent denotes on what factor the scalar differentiation part of the $\partial$ should act—the geometric vector part is not allowed to roam, so we cannot simply say that the operator acts on the element just to the right of it. To give an example:

$$\partial_\mathbf{x}(\mathbf{x}\mathbf{x}) = \dot{\partial}_\mathbf{x} \dot{\mathbf{x}} \mathbf{x} + \dot{\partial}_\mathbf{x} \mathbf{x} \dot{\mathbf{x}} = \dot{\partial}_\mathbf{x} \dot{\mathbf{x}} \mathbf{x} + \dot{\partial}_\mathbf{x}(2(\dot{\mathbf{x}} \cdot \mathbf{x}) - \mathbf{x}\dot{\mathbf{x}}) = 2\dot{\partial}_\mathbf{x}(\dot{\mathbf{x}} \cdot \mathbf{x}) = 2\mathbf{x}.$$

Note that the subtle swap to get the elements into standard order precisely kills the term $\dot{\partial}_\mathbf{x} \dot{\mathbf{x}} \mathbf{x} = m\mathbf{x}$.

Because of the noncommutativity, there are other product rules, such as

$$F\partial G = \dot{F}\dot{\partial}G + F\dot{\partial}\dot{G},$$

with the accents again denoting how to match each differentiation with its argument.

There is also a **chain rule**, which looks a bit complicated. Let the coordinate $\mathbf{x}$ be hidden by a vector-valued function $\mathbf{y}$, so that the dependence of $F$ on $\mathbf{x}$ is $F(\mathbf{y}(\mathbf{x}))$. Then the chain rule of vector differentiation is

$$\partial_\mathbf{x} F(\mathbf{y}(\mathbf{x})) = \dot{\partial}_\mathbf{x}\left(\mathbf{y}(\dot{\mathbf{x}}) * \partial_\mathbf{y}\right) F(\mathbf{y}).$$

The two geometric products in this equation can be executed in either order due to associativity. If we start from the right, this states that we should first consider $F$ as a function of $\mathbf{y}$ and do a directional differentiation in the $\mathbf{y}(\mathbf{x})$-direction; that typically gives something involving both $\mathbf{y}(\mathbf{x})$ and $\mathbf{y}$. We should not substitute $\mathbf{x}$ in the latter, but differentiate the $\mathbf{x}$-dependence in the former. This can be confusing, so let us do an example.

> Let $G(\mathbf{y}) = \mathbf{y}^2$, and $\mathbf{y}(\mathbf{x}) = (\mathbf{x} \cdot \mathbf{a})\mathbf{b}$. If we would just evaluate $G$ as a function of $\mathbf{x}$ by substitution, we would get $G(\mathbf{x}) = (\mathbf{x} \cdot \mathbf{a})^2 \mathbf{b}^2$, so that $\partial_\mathbf{x} G(\mathbf{x}) = 2(\mathbf{x} \cdot \mathbf{a})\mathbf{a}\mathbf{b}^2$. The chain rule application should produce the same answer.
> 
> We first evaluate from the right, so we start with the directional differentiation of $G(\mathbf{y}) = \mathbf{y}^2$. For a general vector $\mathbf{z}$, the directional derivative $(\mathbf{z} * \partial_\mathbf{y})\mathbf{y}^2 = 2\mathbf{z} \cdot \mathbf{y}$, so with $\mathbf{z} = \mathbf{y}(\mathbf{x})$ the result is $2\mathbf{y}(\mathbf{x}) \cdot \mathbf{y} = 2(\mathbf{x} \cdot \mathbf{a})(\mathbf{b} \cdot \mathbf{y})$. Note that we kept $\mathbf{y}$. In the second step, this expression needs to be differentiated to $\mathbf{x}$, giving $\partial_\mathbf{x}[2(\mathbf{x} \cdot \mathbf{a})(\mathbf{b} \cdot \mathbf{y})] = 2\mathbf{a}(\mathbf{b} \cdot \mathbf{y})$. That is the answer, but we prefer it in terms of $\mathbf{x}$, so we should substitute the expression for $\mathbf{y}$ in terms of $\mathbf{x}$, giving the same result as before.
> 
> If instead we had evaluated from the left, we would first need to evaluate $\dot{\partial}_\mathbf{x}(\mathbf{y}(\dot{\mathbf{x}}) * \partial_\mathbf{y}) = \partial_\mathbf{x}((\mathbf{x} \cdot \mathbf{a})\mathbf{b}) * \partial_\mathbf{y} = \mathbf{a}(\mathbf{b} * \partial_\mathbf{y})$. Do not be bothered by the presence of $\partial_\mathbf{y}$ in this derivation; since it is not differentiating anything, it behaves just like a vector. Now we apply the resulting operator to $G(\mathbf{y}) = \mathbf{y}^2$, giving $2\mathbf{a}(\mathbf{b} \cdot \mathbf{y})$ as in the other evaluation order. Here, too, you would need to substitute the expression $\mathbf{y}(\mathbf{x})$ to get the result in terms of $\mathbf{x}$.
> 
> The operator we just evaluated can be rewritten using the definition of the adjoint of the function $\mathbf{y}(\mathbf{x}) = (\mathbf{x} \cdot \mathbf{a})\mathbf{b}$, which is $\bar{\mathbf{y}}(\mathbf{x}) = (\mathbf{x} \cdot \mathbf{b})\mathbf{a}$. We then recognize $\mathbf{a}(\mathbf{b} * \partial_\mathbf{y})$ as the adjoint of the $\mathbf{y}$-function applied on $\partial_\mathbf{y}$, i.e., $\bar{\mathbf{y}}[\partial_\mathbf{y}]$. We can also use the adjoint to write the actual answer for our differentiation of the squaring function $G$ as $2\bar{\mathbf{y}}(\mathbf{y}(\mathbf{x}))$, which actually holds for any function $\mathbf{y}$ used to wrap the argument $\mathbf{x}$.

The implicit understanding of how to deal with the substitutions in the equation is a bit cumbersome. A more proper notation for the process may be to keep the $\mathbf{x}$ in there at all steps:

$$\partial_\mathbf{x} G(\mathbf{y}(\mathbf{x})) = \dot{\partial}_\mathbf{x}\left(\mathbf{y}(\dot{\mathbf{x}}) * \partial_{\mathbf{y}(\mathbf{x})}\right) G(\mathbf{y}(\mathbf{x})) = \bar{\mathbf{y}}[\partial_{\mathbf{y}(\mathbf{x})}] G(\mathbf{y}(\mathbf{x})). \tag{8.15}$$

The final rewriting uses the differential definition of the adjoint of (8.14) (which also holds for nonlinear vector functions $\mathbf{y}$). This usage was motivated in the example. It means that we treat the differentiation operator $\partial_{\mathbf{y}(\mathbf{x})}$ just as the vector it essentially is. Then the differentiation with respect to $\mathbf{y}(\mathbf{x})$ should be understood as above, but the lack of an accent denotes that that particular $\mathbf{x}$-dependence should not be differentiated by $\dot{\partial}_\mathbf{x}$.

So in the end, the chain rule is essentially a transformation of the differentiation operator: *when an argument gets wrapped into a function, the differentiation with respect to that argument gets wrapped into the adjoint of that function*.

---

## 8.7 Multivector Differentiation

We can extend these forms of differentiation beyond vectors to general multivectors, though for geometric algebra, the extension to differentiation with respect to blades and versors is most useful. Another extension is the differentiation with respect to a linear function of multivectors, which finds uses in optimization. We will not treat that here, but refer to Chapter 11 in [15].

### 8.7.1 Definition

The definition of directional multivector differentiation is a straightforward extension of the idea behind the directional vector differentiation. You simply vary the argument $X$ of a function additively in its $A$-component, so that $A$ should at least be of the same grade as $X$ (as for instance when $X$ is perturbed by a transformation, to first order). The definition reflects this grade-matching in its use of the scalar product:

$$(A * \partial_X) F(X) \equiv \lim_{\epsilon \to 0} \frac{F(X + \epsilon A) - F(X)}{\epsilon}.$$

We emphasize that this is a scalar operator, since the grade of the result is the same as that of the original function.

As in the case of the vector derivative, we can see the directional multivector derivative as merely one component of a more general multivector derivative. We introduce coordinates now for the total $2^m$-dimensional space of multivectors in the tangent space $\mathbb{R}^m$ at $X$. To distinguish it clearly from the $m$-dimensional vector basis, let us denote this multivector basis by a running capital index: $\{e_I\}_{I=1}^{2^m}$. As with the vector basis in the vector derivative, this may not be orthonormal, so we also employ a reciprocal basis $\{e^I\}_{I=1}^{2^m}$; see also Section 3.8. Then the multivector derivative is defined as

$$\partial_X = \sum_I e^I (e_I * \partial_X),$$

where $e_I$ in principle runs over all $2^m$ elements $1$, $\mathbf{e}_i$, $\mathbf{e}_i \wedge \mathbf{e}_j$, and so on, and the scalar product selects only the basis elements that are components of $X$.

This clearly contains vector differentiation as a special case. But also scalar differentiation is included: if we let $X$ be a scalar $X = \tau$, only the basis element $e = 1$ is selected, so $\partial_\tau = 1(1 * \partial_\tau) = (1 * \partial_\tau) = \frac{d}{d\tau}$, conforming to our earlier definition of this symbol. For scalars, directional differentiation and multivector differentiation coincide.

As with the vector derivative, the coordinate-based definition should be used to derive elementary coordinate-free results, which should then be the basis of all actual computations. We have collected some in Table 8.2, including results on scalar functions that often occur in optimization problems. The pattern of derivation of these equations is completely analogous to that for vector differentiation.

---

**Table 8.2:** Elementary results of multivector differentiation. The multivector varies in the space $\mathbb{R}^m$, contained in the larger space $\mathbb{R}^n$. The map $P[\,]$ projects from the latter to the former.

| | |
|:---|:---|
| $(A * \partial_X) X$ | $= P[A]$ |
| $(A * \partial_X) \tilde{X}$ | $= P[\tilde{A}]$ |
| $(A * \partial_X) X^k$ | $= P[A]X^{k-1} + X P[A] X^{k-2} + \cdots + X^{k-1} P[A]$ |
| $\partial_X X$ | $= m$ |
| $\partial_X \|X\|^2$ | $= 2\tilde{X}$ |
| $\partial_X (X * A)$ | $= P[\tilde{A}]$ |
| $\partial_X (\tilde{X} * A)$ | $= P[A]$ |
| $\partial_X (X^{-1} * A)$ | $= P[-X^{-1} \tilde{A} X^{-1}]$ |
| $\partial_X \|X\|^k$ | $= k\|X\|^{k-2} \tilde{X}$ |

---

### 8.7.2 Application: Estimating Rotors Optimally

This example is taken from [36]. We are given $k$ labeled vectors $\mathbf{u}_i$, which have been rotated to become $k$ correspondingly labeled vectors $\mathbf{v}_i$. We want to try and retrieve that rotor from this data. If both sets of vectors are measured with some noise (as they usually are), we cannot exactly reconstruct the rotor $R$, but we have to estimate it. Let us use as our criterion for fit the minimization of the total squared distance between our estimated rotation vectors compared to where we measured them. This is an old problem, known in biometrics literature as the *Procrustes problem* and in astronautics as *Wahba's problem*.

So we need to find the rotor $R$ that minimizes

$$\Gamma(R) = \sum_{i=1}^{k} (\mathbf{v}_i - R\mathbf{u}_i\tilde{R})^2 = \sum_{i=1}^{k} (\mathbf{v}_i^2 + \mathbf{u}_i^2 - 2\langle\mathbf{v}_i R\mathbf{u}_i\tilde{R}\rangle_0). \tag{8.16}$$

Preferably, we would like to differentiate this with respect to $R$ and set the resulting derivative to zero to find the optimal solution. However, the rotor normalization condition $R\tilde{R} = 1$ makes this mathematically somewhat involved. It is easier to temporarily replace the rotor $R$ by a versor $V$ and consequently to replace $\tilde{R}$ by $V^{-1}$, and then to differentiate relative to the unconstrained $V$ to compute the optimum $V_*$. Clearly the terms without $R$ (or $V$) do not affect the optimum, so

$$V_* = \arg\max_V \sum_{i=1}^{k} \langle\mathbf{v}_i V \mathbf{u}_i V^{-1}\rangle_0.$$

Now we differentiate by $\partial_V$ and use the product rule. We can use some of the results from Table 8.2 once we realize that this is differentiation of a scalar product and use its symmetry and reordering properties (as (6.23)):

$$\begin{aligned}
\partial_V \Gamma(V) &= \sum_{i=1}^{k} \partial_V \langle\mathbf{v}_i V \mathbf{u}_i V^{-1}\rangle_0 \\
&= \sum_{i=1}^{k} \left(\dot{\partial}_V[\dot{V} * (\mathbf{u}_i V^{-1} \mathbf{v}_i)] + \dot{\partial}_V[(\dot{V}^{-1}) * (\mathbf{v}_i V \mathbf{u}_i)]\right) \\
&= \sum_{i=1}^{k} \left(\mathbf{u}_i V^{-1} \mathbf{v}_i - V^{-1}(\mathbf{v}_i V \mathbf{u}_i)V^{-1}\right) \\
&= 2V^{-1} \sum_{i=1}^{k} (V\mathbf{u}_i V^{-1}) \wedge \mathbf{v}_i.
\end{aligned}$$

Therefore the rotor $R_*$ that minimizes $\Gamma(R)$ must be the one that satisfies

$$\sum_{i=1}^{k} (R_* \mathbf{u}_i \tilde{R}_*) \wedge \mathbf{v}_i = 0. \tag{8.17}$$

This algebraic result makes geometric sense. For each $\mathbf{v}_i$, it ignores the components that are just scalings of the corresponding rotated $\mathbf{u}_i$; the rotation cannot affect those parts anyway. Only the perpendicular components matter, and those should cancel overall if the rotation is to be optimal—if not, a small extra twist could align the vectors better.

The result so far does not give us the optimal rotor $R_*$ explicitly; it has merely restated the optimization condition in a manner that shows what the essential components of the data are that determine the solution. Our reference [36] now cleverly uses vector differentiation to manipulate the equation to a form that can be solved by standard linear algebra. First, they observe that if we introduce the linear function

$$f[\mathbf{x}] = \sum_{i=1}^{k} \mathbf{u}_i (\mathbf{v}_i \cdot \mathbf{x}),$$

the condition (8.17) can be written as

$$\begin{aligned}
\partial_\mathbf{x} \wedge (R_* f[\mathbf{x}] \tilde{R}_*) &= \frac{1}{2} \sum_{i=1}^{k} \left(\partial_\mathbf{x}(\mathbf{v}_i \cdot \mathbf{x})(R_* \mathbf{u}_i \tilde{R}_*) - (R_* \mathbf{u}_i \tilde{R}_*)(\mathbf{v}_i \cdot \mathbf{x})\partial_\mathbf{x}\right) \\
&= -\sum_{i=1}^{k} (R_* \mathbf{u}_i \tilde{R}_*) \wedge \mathbf{v}_i = 0.
\end{aligned}$$

This kind of pulling out a differentiation operator is a good trick to remember. The resulting equation expresses the fact that $R_* f[\mathbf{x}] \tilde{R}_*$ is a symmetric function of $\mathbf{x}$. The function $f$ itself is therefore the $R_*$-rotated version of a symmetrical function.

We could proceed symbolically with geometric algebra to find the symmetric part of $R_*[f]$ (by adding the adjoint $\bar{f}[R_*]$ and dividing by two), and its inverse (using (4.16)), and taking that out of the function; what remains is then the rotation by the desired rotor. However, [36] at this point switches over to using numerical linear algebra. In linear algebra, any linear function $f$ has a *polar decomposition* in a symmetric function followed by an orthogonal transformation, and this can be computed using the singular value decomposition (SVD) of its matrix $[[f]]$ as $f \equiv [[U]][[S]][[V]]^T = ([[U]][[V]]^T)([[V]][[S]][[V]]^T)$. Using this result, the matrix of the optimal rotation $R_*$ is $[[V]][[U]]^T$, where $[[U]]$ and $[[V]]$ are derived from the SVD of $[[f]] \equiv \sum_{i=1}^{k} [[\mathbf{u}_i]][[\mathbf{v}_i]]^T$. This rotation matrix is easily converted back into the optimal rotor $R_*$, see Section 7.10.4.

This simple matrix computation algorithm is indeed the standard solution to the Procrustes problem. In the usual manner of its derivation, formulated in terms of involved matrix manipulations, one may have some doubts as to whether the SVD (with its inherent use of the Frobenius metric on matrices) is indeed the optimal solution to original optimization problem (which involved the Euclidean distance). In the formulation above, the intermediate result (8.17) shows that this is indeed correct, and that the SVD is merely used to compute the decomposition rather than to perform the actual optimization.

From a purist point of view, it is of course a pity that the last part of the solution had to revert temporarily to a matrix formulation to compute a rotor. We expect that appropriate numerical techniques will be developed soon completely within the framework of geometric algebra.

---

## 8.8 Further Reading

The main reference for further reading on geometric calculus is the classic book by Hestenes [33], which introduced much of it. It contains a wealth of material, including an indication of how geometric calculus could be used to rephrase differential geometry. His web site contains more material, including some new introductions such as [26].

The approach in Doran and Lasenby's book [15] is tailored towards physicists, and it has good and practical introductions to the techniques of geometric calculus. Read them for directed integration theory. They are practitioners who use it daily, and they give just the right amount of math to get applicable results.

---

## 8.9 Exercises

### 8.9.1 Drills

1. Compute the radius of the tangent circle for the circular motion $\mathbf{r}(\tau) = \exp(-I\tau)\mathbf{e}_1$ in the plane $I = \mathbf{e}_1 \wedge \mathbf{e}_2$, at the general location $\mathbf{r}(\tau)$.

2. Compute the following derivatives:
   1. $(\mathbf{a} * \partial_\mathbf{x})\mathbf{x}^3$
   2. $\partial_\mathbf{x} \mathbf{x}^3$
   3. $(\mathbf{a} * \partial_\mathbf{x})(\mathbf{x}\mathbf{b}/\mathbf{x})$
   4. $\partial_\mathbf{x}(\mathbf{x}\mathbf{b}/\mathbf{x})$
   5. $\dot{\mathbf{x}}\dot{\partial}_\mathbf{x}$
   6. $\dot{\mathbf{x}} \wedge \dot{\partial}_\mathbf{x}$
   7. $\dot{\mathbf{x}} \cdot \dot{\partial}_\mathbf{x}$

3. Show that the coordinate vectors are related to differentiation through $\mathbf{e}_k = \frac{\partial}{\partial x^k}\mathbf{x}$.

4. Show that the reciprocal frame vectors are the gradients of coordinate functions: $\mathbf{e}^k = \partial_\mathbf{x} x^k$.

### 8.9.2 Structural Exercises

1. Prove the Jacobi identity (8.2) and relate it to nonassociativity of the bivector algebra.

2. Derive the Taylor expansion of a rotor transformation:

$$e^{-B/2} X e^{B/2} = X + X \times B + \frac{1}{2}((X \times B) \times B) + \cdots$$

Do this by assuming that the first-order term is correct for small bivectors, it is easily derived by setting $\exp(-B/2) \approx 1 - B/2$. Now write a versor involving a finite $B$ as versors involving $B/2$, $B/4$, $B/8$, and so on and build up the total form through repeated application of the smallest bivector forms. That should give the full expansion.

3. The **Baker-Campbell-Hausdorff formula** writes the product of two exponentials as a third, and gives a series expansion of its value:

$$e^C = e^A e^B$$

with

$$C = A + B + A \times B + \frac{1}{3}(A \times (A \times B) + B \times (B \times A)) + \cdots$$

Show that these first terms of the series are correct. This formula again shows the importance of the commutator $A \times B$ in quantifying the difference with fully commuting variables. We should warn you that the general terms of the series are more complicated than the first few suggest.

4. **Directional differentiation of spherical projection.**
   
   Suppose that we project a vector $\mathbf{x}$ on the unit sphere by the function $\mathbf{x} \mapsto P[\mathbf{x}] = \mathbf{x}/\|\mathbf{x}\|$. Compute its directional derivative in the $\mathbf{a}$ direction, as a standard differential quotient using Taylor series expansion. Use geometric algebra to write the result compactly, and give its geometric meaning. (Hint: See Figure 8.3.)
   
   > **Figure 8.3:** *The directional derivative of the spherical projection.*

5. Justify the following form of Taylor's expansion formula of a function $F$ around the location $\mathbf{x}$:

$$F(\mathbf{x} + \mathbf{a}) = e^{\mathbf{a} * \partial_\mathbf{x}} F(\mathbf{x}),$$

where you can interpret the exponent in a natural manner as a symbolic expansion instruction.

6. For variable $I(\tau)$, the resulting $\partial_\tau X(\tau)$ of (8.8) can still be written as a commutator $X \times B$ with a bivector $B$. Derive the explicit expression for $B$:

$$B = I\partial_\tau[\phi] + \partial_\tau[I](e^{I\phi} - 1)/I.$$

Hint: One way is to use the result $B = -2\partial_\tau[R]\tilde{R}$ from [15].
