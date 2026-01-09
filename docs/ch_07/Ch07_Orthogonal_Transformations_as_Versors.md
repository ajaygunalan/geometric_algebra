# Chapter 7: Orthogonal Transformations as Versors

Reflection in a line is represented by a sandwiching construction involving the geometric product. Though that may have seemed a curiosity in the previous chapter, we will show that it is crucial to the representation of operators in geometric algebra. Geometrically, all orthogonal transformations can be considered as multiple reflections. Algebraically, this leads to their representation as a geometric product of unit vectors.

An even number of reflections gives a rotation, represented as a **rotor**—the geometric product of an even number of unit vectors. We show that rotors encompass and extend complex numbers and quaternions, and present a real 3-D visualization of the quaternion product. Rotors transcend quaternions in that they can be applied to elements of any grade, in a space of any dimension.

The distinction between subspaces and operators fades when we realize that any subspace generates a reflection operator, which can act on any element. The concept of a **versor** (a product of vectors to be used as an operator in a sandwiching product) combines all these representations of orthogonal transformations. We show that versors preserve the structure of geometric constructions and can be universally applied to any geometrical element. This is a unique feature of geometric algebra, and it can simplify code considerably.

The chapter ends with a discussion of the difference between geometric algebra and Clifford algebra, and a preliminary consideration of issues in efficient implementation to convince you of the practical usability of the versor techniques in writing efficient code for geometry.

---

## 7.1 Reflections of Subspaces

We have seen in Section 6.4 how we can construct the reflection of a vector $\mathbf{x}$ in a line through the origin characterized by a vector $\mathbf{a}$ as

$$\text{reflection of } \mathbf{x} \text{ in } \mathbf{a}\text{-line}: \quad \mathbf{x} \to 2(\mathbf{x} \cdot \mathbf{a})\mathbf{a}^{-1} - \mathbf{x} = \mathbf{a}\mathbf{x}\mathbf{a}^{-1}$$

The magnitude or orientation of $\mathbf{a}$ are irrelevant to the outcome, since the inversion removes any scalar factor. Only the attitude of the line matters.

Since line reflection is a linear transformation on $\mathbf{x}$, we should be able to extend it from vectors to general blades $\mathbf{X}$ as an outermorphism. The result is

$$\text{reflection of } \mathbf{X} \text{ in } \mathbf{a}\text{-line}: \quad \mathbf{X} \to \mathbf{a}\mathbf{X}\mathbf{a}^{-1} \tag{7.1}$$

This is indeed relatively straightforward to prove by induction using $\mathbf{X}_k = \mathbf{x}_k \wedge \mathbf{X}_{k-1}$ and assuming that it holds for $\mathbf{X}_{k-1}$. Then

$$(\mathbf{a}\mathbf{x}_k\mathbf{a}^{-1}) \wedge (\mathbf{a}\mathbf{X}_{k-1}\mathbf{a}^{-1}) = \frac{1}{2}(\mathbf{a}\mathbf{x}_k\mathbf{a}^{-1}\mathbf{a}\mathbf{X}_{k-1}\mathbf{a}^{-1} + \mathbf{a}\mathbf{X}_{k-1}\mathbf{a}^{-1}\mathbf{a}\mathbf{x}_k\mathbf{a}^{-1})$$

$$= \frac{1}{2}(\mathbf{a}(\mathbf{x}_k\mathbf{X}_{k-1})\mathbf{a}^{-1} + \mathbf{a}(\mathbf{X}_{k-1}\mathbf{x}_k)\mathbf{a}^{-1})$$

$$= \mathbf{a}\left(\frac{1}{2}(\mathbf{x}_k\mathbf{X}_{k-1} + \mathbf{X}_{k-1}\mathbf{x}_k)\right)\mathbf{a}^{-1}$$

$$= \mathbf{a}(\mathbf{x}_k \wedge \mathbf{X}_{k-1})\mathbf{a}^{-1}$$

$$= \mathbf{a}\mathbf{X}_k\mathbf{a}^{-1}$$

and the induction basis is of course the trivial statement for scalars $\mathbf{a}\xi\mathbf{a}^{-1} = \xi$. See structural exercise 1 for another way of *not* proving this. As always, we can extend the linear transformation from blades $\mathbf{X}$ to general multivectors $X$ by linearity.

By the simple trick of swapping the sign in (7.1), we can modify the line reflection formula into a hyperplane reflection formula. For the reflection of a vector $\mathbf{x}$ in the plane $\mathbf{A}$ is equivalent to swapping the sign of the rejection of $\mathbf{x}$ by that plane (i.e., it is $\mathbf{x} - 2(\mathbf{x} \wedge \mathbf{A})/\mathbf{A}$). By inserting a pseudoscalar and its inverse and using duality, we can rewrite this as $\mathbf{x} - 2(\mathbf{x}\mathbf{a})/\mathbf{a}$, with $\mathbf{a} = \mathbf{A}^*$ the normal vector of the hyperplane. This can be rewritten as before in terms of a geometric product, yielding

$$\text{reflection of } \mathbf{x} \text{ in dual hyperplane } \mathbf{a}: \quad \mathbf{x} \to -\mathbf{a}\mathbf{x}\mathbf{a}^{-1}$$

Note that the precise sign of the dualization of the hyperplane $\mathbf{A}$ to produce $\mathbf{a}$ is not important, due to the absorption of any scalar factors by the subsequent inverse. Figure 7.1 compares the two kinds of reflections.

> **Figure 7.1:** Line and plane reflection of a vector $\mathbf{x}$ in a vector $\mathbf{a}$, used as line direction or as normal vector for the plane $\mathbf{A}$.

This hyperplane reflection is actually what we mean by a reflection—in 3-D, it reflects in a plane, which is like looking into a mirror. It extends to blades by outermorphism as the linear transformation $\partial: \bigwedge^k \mathbb{R}^n \to \bigwedge^k \mathbb{R}^n$ defined by

$$\text{reflection of } \mathbf{X} \text{ in dual hyperplane } \mathbf{a}: \quad \mathbf{X} \to \partial[\mathbf{X}] \equiv \mathbf{a}\hat{\mathbf{X}}\mathbf{a}^{-1} \tag{7.2}$$

where $\hat{\mathbf{X}} = (-1)^{\text{grade}(\mathbf{X})}\mathbf{X}$ is the grade involution.

To be a reflection, its determinant should be $-1$ in a space of any dimensionality. With the pseudoscalar of $n$-dimensional space denoted as $\mathbf{I}_n$, we can check this easily using definition (4.7) of a determinant in geometric algebra:

$$\det(\partial) = (\mathbf{a}\hat{\mathbf{I}}_n\mathbf{a}^{-1})\mathbf{I}_n^{-1} = \mathbf{a}(\hat{\mathbf{I}}_n\mathbf{a}^{-1})\mathbf{I}_n^{-1} = \mathbf{a}(-\mathbf{a}^{-1}\mathbf{I}_n)\mathbf{I}_n^{-1} = -1$$

Here we used the fact that $\mathbf{a}$ is contained in the space $\mathbf{I}_n$, and therefore $\mathbf{a} \wedge \mathbf{I}_n = 0$, so that $\mathbf{a}\mathbf{I}_n = -\mathbf{I}_n\mathbf{a}$. So the determinant is indeed $-1$. If you would repeat the determinant computation for the line reflection, you would find $(-1)^{n+1}$ for the determinant in $n$-dimensional space. This shows that in 3-D, a line reflection is actually not a reflection but a rotation (see structural exercise 3). By contrast, hyperplane reflections are indeed proper reflections in any dimension.

---

## 7.2 Rotations of Subspaces

Having reflections as a sandwiching product leads naturally to the representation of rotations. For by a well-known theorem, any rotation can be represented as an even number of reflections. In geometric algebra, this statement can be converted immediately into a computational form.

### 7.2.1 3-D Rotors as Double Reflectors

Two reflections make a rotation, even in $\mathbb{R}^3$ (see Figure 7.2). Since an even number of reflections absorbs any sign, we may make these reflections either both line reflections $\mathbf{a}\mathbf{x}\mathbf{a}^{-1}$ or both (dual) hyperplane reflections $-\mathbf{a}\mathbf{x}\mathbf{a}^{-1}$, whichever feels most natural or is easiest to visualize. The figure uses line reflections.

As the figure shows, first reflecting in $\mathbf{a}$, then in $\mathbf{b}$, gives a rotation over an axis perpendicular to the $\mathbf{a} \wedge \mathbf{b}$-plane, over an angle that is *twice* the angle from $\mathbf{a}$ to $\mathbf{b}$ (and this angle and plane also give the sense of rotation, clockwise or anticlockwise in the plane). In this construction, only the plane and relative angle of the vectors $\mathbf{a}$ and $\mathbf{b}$ matter. GAViewer or the programming example in Section 7.10.2 each provide an interactive version. We strongly recommend playing with either if you need to tune your intuition.

It is simple to convert this geometrical idea into algebra. The operation

$$\mathbf{x} \to \mathbf{b}(\mathbf{a}\mathbf{x}\mathbf{a}^{-1})\mathbf{b}^{-1} = \mathbf{b}\mathbf{a}^{-1}\mathbf{x}\mathbf{a}\mathbf{b}^{-1} = (\mathbf{b}/\mathbf{a})\mathbf{x}(\mathbf{b}/\mathbf{a})^{-1}$$

is the double reflection, and therefore produces the rotation in the $\mathbf{a} \wedge \mathbf{b}$ plane (we moved some scalar squared norms around to get a pleasant expression). We observe that this rotation is generated by an element $R = \mathbf{b}/\mathbf{a} = \mathbf{b}\mathbf{a}^{-1}$, as applied to a vector by the recipe

$$\text{rotation of } \mathbf{x}: \quad \mathbf{x} \to R\mathbf{x}R^{-1}$$

> **Figure 7.2:** A rotation in a plane is identical to two reflections in vectors in that plane, separated by half the rotation angle.

Note that this element $R$ is not necessarily a blade, since it is a geometric product. That is why we do not denote it by a bold symbol. It defines a linear transformation that we denote by $\mathsf{R}[\,]$.

Since rotation is a linear transformation, it can be extended as an outermorphism. You can easily show by mimicking the proof of (7.1) that a blade $\mathbf{X}$ rotates to $\mathsf{R}[\mathbf{X}]$ defined by

$$\text{rotation of } \mathbf{X}: \quad \mathbf{X} \to \mathsf{R}[\mathbf{X}] \equiv R\mathbf{X}R^{-1} \tag{7.3}$$

There are no extra signs in this transformation formula, unlike the reflection formula of (7.2); the double reflection has canceled them all. As a consequence, the determinant of a rotation is $+1$ in a space of any dimension:

$$\det(\mathsf{R}) = (R\mathbf{I}_nR^{-1})/\mathbf{I}_n = RR^{-1}\mathbf{I}_n\mathbf{I}_n^{-1} = 1$$

Geometrically, this means that there is no orientation change of the pseudoscalar.

Equation (7.3) can even be extended to arbitrary multivectors, for the rotation is linear. That means that we are now capable of rotating *any* multivector, not just a vector, with the same formula. In 3-D, this is already helpful: we can rotate a plane (represented as a 2-blade) directly without having to dualize it first to a normal vector (see Figure 7.3). On the other hand, if it had been given dually, we could rotate it in that form as well. These capabilities extend to higher-dimensional spaces and in Part II will permit us to rotate Euclidean circles, spheres, and other elements, all using the same operation.

> **Figure 7.3:** The same operation $R\mathbf{X}/R$ rotates a vector, a 2-blade, or any element of the algebra.

It is common practice to take out the scaling factor in $R = \mathbf{b}/\mathbf{a}$, reducing it to a unit element called a **rotor**. That obviously makes no difference to the application to a blade, since any scaling factor in $R$ is canceled by the reciprocal factor in $R^{-1}$. To compute the normalization of a rotor, we need to compute the scalar product of a mixed-grade multivector, which we have not done before. Using (6.22) and (6.23), it is straightforward:

$$\|R\|^2 = R * R = \langle\mathbf{b}\mathbf{a}^{-1}\mathbf{a}^{-1}\mathbf{b}\rangle_0 = \langle\mathbf{b}^2(\mathbf{a}^{-1})^2\rangle_0 = \|\mathbf{b}\|^2/\|\mathbf{a}\|^2$$

Therefore $\|R\| = \pm\|\mathbf{b}\|/\|\mathbf{a}\|$, and dividing it out produces a properly normalized rotor.

To construct a rotor to represent the rotation from $\mathbf{a}$ to $\mathbf{b}$, we can either do what we just did (start with general $\mathbf{a}$ and $\mathbf{b}$ and taking out the norm ratio), or just define it as the ratio of two unit vectors $\hat{\mathbf{b}}$ and $\hat{\mathbf{a}}$ from the start. When we do the latter, $R = \hat{\mathbf{b}}\hat{\mathbf{a}}^{-1} = \hat{\mathbf{b}}\hat{\mathbf{a}}$, and $R^{-1} = \hat{\mathbf{a}}\hat{\mathbf{b}} = \tilde{R}$. It follows that the inverse of a rotor is its reverse:

$$R\tilde{R} = 1$$

so that the rotation of $\mathbf{X}$ can be performed as $\mathsf{R}[\mathbf{X}] = R\mathbf{X}\tilde{R}$. Performing the normalization once is often better in practice than having to compute its inverse with each application, so we will use these normalized rotors constructed from unit vectors as the representation of rotations in this chapter.

### 7.2.2 Rotors Perform Rotations

It is natural to relate the rotor $\hat{\mathbf{b}}/\hat{\mathbf{a}}$ to the geometrical relationships of the two vectors: their common plane $\mathbf{a} \wedge \mathbf{b}$ and their relative angle. We can use those geometric elements to encode it algebraically, by developing the geometric product of the unit vectors in terms of their inner and outer product, and those in terms of angle and plane. Since $\hat{\mathbf{b}}$ and $\hat{\mathbf{a}}$ were assumed to be unit vectors, we have $\hat{\mathbf{b}}/\hat{\mathbf{a}} = \hat{\mathbf{b}}\hat{\mathbf{a}}$, and compute

$$R = \hat{\mathbf{b}}\hat{\mathbf{a}} = \hat{\mathbf{b}} \cdot \hat{\mathbf{a}} + \hat{\mathbf{b}} \wedge \hat{\mathbf{a}} = \cos(\phi/2) - \mathbf{I}\sin(\phi/2) \tag{7.4}$$

where $\phi/2$ is the angle from $\hat{\mathbf{a}}$ to $\hat{\mathbf{b}}$, and $\mathbf{I}$ is the unit 2-blade for the $(\mathbf{a} \wedge \mathbf{b})$-plane. This rotor involving the angle $\phi/2$ actually rotates over $\phi$ (as Figure 7.2 suggests, and as we will show below).

The action of a rotor may appear a bit magical at first. It is good to see in detail how the sandwiching works to produce a rotation of a vector $\mathbf{x}$ in a Euclidean space. To do so, we introduce notations for the various components of $\mathbf{x}$ relative to the rotation plane. What we would hope when we apply the rotor to $\mathbf{x}$ is that:

- The component of $\mathbf{x}$ perpendicular to the rotation plane (i.e., the rejection $\mathbf{x}^{\uparrow}$ defined by $\mathbf{x}^{\uparrow} \equiv (\mathbf{x} \wedge \mathbf{I})/\mathbf{I}$) remains unchanged;
- The component of $\mathbf{x}$ within the plane (i.e., the projection $\mathbf{x}_{\parallel} \equiv (\mathbf{x} \cdot \mathbf{I})/\mathbf{I}$) gets shortened by $\cos\phi$;
- A component of $\mathbf{x}$ perpendicular to the projection in the plane (i.e., $\mathbf{x}_{\perp} \equiv \mathbf{x}_{\parallel} \rfloor \mathbf{I} = \mathbf{x}_{\parallel}\mathbf{I}$) gets added, with a scaling factor $\sin\phi$.

It seems a lot to ask of the simple formula $R\mathbf{x}\tilde{R}$, but we can derive that this is indeed precisely what it does. The structure of the derivation is simplified when we denote $c \equiv \cos(\phi/2)$, $s \equiv \sin(\phi/2)$, and note beforehand that the rejection and projection satisfy the commutation relations $\mathbf{x}^{\uparrow}\mathbf{I} = \mathbf{I}\mathbf{x}^{\uparrow}$ and $\mathbf{x}_{\parallel}\mathbf{I} = -\mathbf{I}\mathbf{x}_{\parallel}$ (these relations actually define them fully, by the relationships of Section 6.3.1). Also, we have seen in (6.4) that in a Euclidean space $\mathbf{I}^2 = -1$, which is essential to make the whole thing work. Then

$$R\mathbf{x}\tilde{R} = R(\mathbf{x}^{\uparrow} + \mathbf{x}_{\parallel})\tilde{R}$$

$$= (c - s\mathbf{I})(\mathbf{x}^{\uparrow} + \mathbf{x}_{\parallel})(c + s\mathbf{I})$$

$$= c^2\mathbf{x}^{\uparrow} - s^2(\mathbf{I}\mathbf{x}^{\uparrow}\mathbf{I}) + cs(\mathbf{x}^{\uparrow}\mathbf{I} - \mathbf{I}\mathbf{x}^{\uparrow}) + cs(\mathbf{x}_{\parallel}\mathbf{I} - \mathbf{I}\mathbf{x}_{\parallel}) + c^2\mathbf{x}_{\parallel} - s^2(\mathbf{I}\mathbf{x}_{\parallel}\mathbf{I})$$

$$= (c^2 + s^2)\mathbf{x}^{\uparrow} + (c^2 - s^2)\mathbf{x}_{\parallel} + 2cs\,\mathbf{x}_{\parallel}\mathbf{I}$$

$$= \mathbf{x}^{\uparrow} + \cos\phi\,\mathbf{x}_{\parallel} + \sin\phi\,\mathbf{x}_{\perp}$$

which is the desired result. Note especially how the vector $\mathbf{x}_{\perp}$, which was not originally present, is generated automatically. It is very satisfying that the whole process is driven by the algebraic commutation rules that encode the various geometrical perpendicularity and containment relationships. This shows that we truly have an algebra capable of mimicking geometry.

The unit vectors in the directions $\mathbf{x}^{\uparrow}$, $\mathbf{x}_{\parallel}$, and $\mathbf{x}_{\perp}$ form an orthonormal basis for the relevant subspace of the vector space involved in this rotation. The rotor application has constructed this frame automatically from the vector $\mathbf{x}$ that needs to be rotated. This is in contrast to rotation matrices, which use a fixed frame for the total space that is unrelated to the elements to be processed. Such a fixed frame then necessitates a lot of coordinate coefficients to represent an arbitrary rotation. Even when the frame has been well chosen (so that for instance $\mathbf{e}_1 \wedge \mathbf{e}_2$ is the rotation plane), the sine and cosine of the angle occur twice in the rotation matrix:

$$[[R]] = \begin{bmatrix} \cos\phi & -\sin\phi & 0 & \cdots & 0 \\ \sin\phi & \cos\phi & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \end{bmatrix}$$

When multiplying rotations, this double occurrence causes needless double work that rotors avoid (like quaternions; we show the relationship in Section 7.3.5). So although it would seem like a waste to construct a new frame for each vector, the rotation representation we have shown can actually be more efficient than a rotation matrix implementation. After all, we never actually construct the frame; we merely perform $R\mathbf{x}\tilde{R}$.

There is a classical way of generating a 3-D rotation matrix that is also based on the construction $\mathbf{x}^{\uparrow} + \cos\phi\,\mathbf{x}_{\parallel} + \sin\phi\,\mathbf{x}_{\perp}$. It is **Rodrigues' formula**, which uses a unit vector $\mathbf{a}$ in the direction of the rotation axis to construct $\mathbf{x}^{\uparrow} = \mathbf{a}(\mathbf{a} \cdot \mathbf{x})$, $\mathbf{x}_{\parallel} = \mathbf{x} - \mathbf{a}(\mathbf{a} \cdot \mathbf{x})$, $\mathbf{x}_{\perp} = \mathbf{a} \times \mathbf{x}$, resulting in the rotation matrix

$$\text{Rodrigues' formula:} \quad [[R]] = [[\mathbf{a}]][[\mathbf{a}]]^T + \cos\phi\,([[1]] - [[\mathbf{a}]][[\mathbf{a}]]^T) + \sin\phi\,[[\mathbf{a}\times]]$$

where $[[\mathbf{a}\times]]$ is the matrix corresponding to the cross product operation. This is a coordinate-free specification of an operator based on geometric principles. The geometric principle may be the same as before, but note that this formula is an explicit construction rather than an automatic consequence. Unfortunately it only works in 3-D (as the use of the cross product betrays). Moreover, it constructs a matrix that only applies to vectors rather than a universal rotation operation.

We emphasize that for a rotation, the **bivector angle** $\mathbf{I}\phi$ contains all information: both the angle and the plane in which it should be measured. From this bivector angle, one can immediately construct the rotor performing the corresponding rotation. We will see a straightforward method for that in Section 7.4, and may write $R_{\mathbf{I}\phi}$ to foreshadow this.

### 7.2.3 A Sense of Rotation

Using the transformation formula $\mathbf{x} \to R\mathbf{x}\tilde{R}$, we see that a rotor $R$ and "minus that rotor" ($-R$) give the same resulting rotation. This does not necessarily mean that the representation of rotations by rotors is two-valued: these rotors can be distinguished when doing relative rotations of connected objects. Such relative rotations can be achieved in two ways: by going clockwise or counterclockwise. You may think that you cannot tell from the result which it was, but it is useful to discriminate them in some applications (it can prevent you from curling up the wires on your robot). Let us call this property the **sense** of a rotation. It comes for free with the rotor representation.

We derive the rotation angle for the negative rotor $-R_{\mathbf{I}\phi}$ by rewriting it into standard form:

$$-R_{\mathbf{I}\phi} = -\cos(\phi/2) + \mathbf{I}\sin(\phi/2)$$

$$= \cos\left(\frac{2\pi + \phi}{2}\right) - \mathbf{I}\sin\left(\frac{2\pi + \phi}{2}\right)$$

$$= R_{\mathbf{I}(2\pi + \phi)} \tag{7.5}$$

It is now obvious that $R_{\mathbf{I}\phi}$ and $-R_{\mathbf{I}\phi}$ lead to the same result on a vector since a rotation over $2\pi + \phi$ is the same as a rotation over $\phi$, see Figure 7.4. Yet the following real-life experiment called the **plate trick** shows that this is actually not true for connected objects.

> Hold out your hand in front of your shoulder, a hand-length away, palm upwards and carrying a plate. Now make a motion with your arm that rotates the plate horizontally in its plane over $2\pi$. After completion, you will have your elbow sticking up awkwardly in the air. Continue the plate rotation over another $2\pi$ (you may have to wriggle your body a little to keep the plate turning in its plane). Perhaps surprisingly, both you and the plate are now back in their original position: a $4\pi$ rotation equals the identity on coupled bodies. This is a more subtle result than the usual statement: a $2\pi$ rotation equals the identity for isolated elements (like a plate by itself).

> **Figure 7.4:** Sense of rotation.

The shortest way to achieve an angle of $2\pi + \phi$ for the plate (with the same position of the elbow) is to turn the other way over $4\pi - (2\pi + \phi) = 2\pi - \phi$. Therefore it makes sense to say that $-R_{\mathbf{I}\phi}$ is a rotation over that effective angle, but in the opposite direction. That geometrical insight is confirmed by evaluating the negated rotor by a different algebraic route:

$$-R_{\mathbf{I}\phi} = -\cos(\phi/2) + \mathbf{I}\sin(\phi/2)$$

$$= \cos((2\pi - \phi)/2) + \mathbf{I}\sin((2\pi - \phi)/2)$$

$$= R_{-\mathbf{I}(2\pi - \phi)}$$

This is indeed the rotation over the complementary angle $2\pi - \phi$, in the plane $-\mathbf{I}$ with opposite orientation, see Figure 7.4. Therefore we can uniquely assign the rotor's angles in the range $[0, 4\pi)$ to actual rotations of different magnitudes and senses, as in Figure 7.5.

Comparing this figure with the sign changes of the sine and cosine of half the rotation angle gives a clear test for which the rotation exactly is encoded by a given rotor $R$:

- The cosine $\cos(\phi/2) = \langle R \rangle_0$ changes sign as $|\phi/2|$ exceeds $\pi/2$, so exactly when the absolute value of the effective rotation angle $\phi$ exceeds $\pi$. A positive value of the scalar part of the rotor tells you that this is a rotation over the smallest angle (whether clockwise or counterclockwise).
- The sign of $\sin(\phi/2) = \langle R \rangle_2 \cdot \mathbf{I}$ gives the sense of rotation: positive indicates a rotation following the orientation of $\mathbf{I}$, negative follows the orientation of $-\mathbf{I}$.

> **Figure 7.5:** The unique rotor-based rotations in the range $\phi = [0, 4\pi)$.

The occurrence of $\mathbf{I}$ in the expression for the sense of rotation is necessary: since $\mathbf{I}$ defines what orientation we mean by (counter)clockwise, the sense of rotation should also change when we change the sign of $\mathbf{I}$.

Mathematically, it is often said that the rotors constitute a **double covering** of the rotation group—one physical rotation is being represented in two distinct ways ($R$ and $-R$). We now see how this sign actually conveys geometrically significant information about the rotation *process* rather than the rotation *result*. Hestenes calls the rotors **oriented rotations**, which is a good term to have. It is the half-angle representation that enables us to distinguish the various orientations.

---

## 7.3 Composition of Rotations

The composition of rotations follows automatically from their representation as a geometric product:

> **The rotor of successive rotations, first $R_1$ then $R_2$, is their geometric product $R_2R_1$.**

This is easily shown by associativity of the geometric product, since $R_2(R_1\mathbf{x}\tilde{R}_1)\tilde{R}_2 = (R_2R_1)\mathbf{x}\widetilde{(R_2R_1)}$. That the result is indeed a rotor follows from $(R_2R_1)\widetilde{(R_2R_1)} = R_2R_1\tilde{R}_1\tilde{R}_2 = 1$.

We expand this composition in detail in this section to sharpen our intuition, both algebraically and geometrically, and to relate it to other rotation representations such as complex numbers and quaternions.

### 7.3.1 Multiple Rotations in 2-D

If we rotate in a single plane with pseudoscalar $\mathbf{I}$, we are effectively dealing with rotations in a 2-D Euclidean subspace $\mathbb{R}^{2,0}$. Performing the 2-D rotation $R_{\mathbf{I}\phi_2}$ after $R_{\mathbf{I}\phi_1}$ results in the total rotation $R_{\mathbf{I}(\phi_2 + \phi_1)}$, as you would expect. This also shows that planar rotations commute.

The algebraic demonstration is straightforward:

$$R_{\mathbf{I}\phi_2}R_{\mathbf{I}\phi_1} = \left(\cos(\phi_2/2) - \mathbf{I}\sin(\phi_2/2)\right)\left(\cos(\phi_1/2) - \mathbf{I}\sin(\phi_1/2)\right)$$

$$= \cos(\phi_2/2)\cos(\phi_1/2) - \sin(\phi_2/2)\sin(\phi_1/2)$$

$$\quad - \mathbf{I}\left(\cos(\phi_2/2)\sin(\phi_1/2) + \sin(\phi_2/2)\cos(\phi_1/2)\right)$$

$$= \cos((\phi_2 + \phi_1)/2) - \mathbf{I}\sin((\phi_2 + \phi_1)/2)$$

$$= R_{\mathbf{I}(\phi_2 + \phi_1)}$$

Algebraically, this looks like the standard computation using a product of complex numbers, since $\mathbf{I}^2 = -1$. We prefer to view it as a calculation in the real geometric algebra of coplanar elements.

In 2-D, rotations do not actually require the rotor sandwiching product $R\mathbf{x}\tilde{R}$ to be applied. Since any vector $\mathbf{x}$ in the $\mathbf{I}$-plane satisfies the anticommutation relationship $\mathbf{x}\mathbf{I} = -\mathbf{I}\mathbf{x}$, we can bring a rotor to the other side:

$$R_{\mathbf{I}\phi}\mathbf{x}R_{-\mathbf{I}\phi} = \left(\cos(\phi/2) - \mathbf{I}\sin(\phi/2)\right)\mathbf{x}\left(\cos(\phi/2) + \mathbf{I}\sin(\phi/2)\right)$$

$$= \mathbf{x}\left(\cos(\phi/2) + \mathbf{I}\sin(\phi/2)\right)\left(\cos(\phi/2) + \mathbf{I}\sin(\phi/2)\right)$$

$$= \mathbf{x}\left(\cos\phi + \mathbf{I}\sin\phi\right) \tag{7.6}$$

$$= \left(\cos\phi - \mathbf{I}\sin\phi\right)\mathbf{x}$$

The two final lines show alternative forms for the one-sided planar rotation. We have met the final form, using left multiplication, when we did the motivating problem in Section 6.1.6.

> **In summary:** in a plane (and in a plane only!) the half-angle rotors in the sandwiching product can be converted to whole-angle, one-sided products using either left or right multiplication.

### 7.3.2 Real 2-D Rotors Subsume Complex Numbers

We have just shown how the rotation of a vector $\mathbf{x}$ in a plane $\mathbf{I}$ containing it can be simplified from the two-sided sandwiching form to a postmultiplication:

$$\mathbf{x} \to \mathbf{x}(\cos\phi + \mathbf{I}\sin\phi) \tag{7.7}$$

Because $\mathbf{I}^2 = -1$, this is reminiscent of complex numbers, a well-known tool to perform rotations in the complex plane. Yet our approach must be subtly different, for the vector $\mathbf{x}$ anticommutes with the 2-blade $\mathbf{I}$ (i.e., $\mathbf{x}\mathbf{I} = -\mathbf{I}\mathbf{x}$), whereas if $\mathbf{x}$ and $\mathbf{I}$ had been complex numbers they should have commuted with each other. Also, we are in a real plane, not in a complex plane at all. What is going on here? How can such different algebras lead to the same (or at least isomorphic) results?

The answer lies in the special role of the real axis in the complex plane. The selection of such a special reference direction destroys the geometrical symmetries of the plane and changes the algebra of the symbols. Let $\mathbf{e}$ be the unit vector in the direction of the real axis, then a complex number $X$ corresponding to the vector $\mathbf{x}$ in the plane denotes how to rotate and scale $\mathbf{e}$ to get to $\mathbf{x}$. In terms of geometric algebra, this is the ratio $X = \mathbf{x}/\mathbf{e}$ (see Section 6.1.6). So

> **A complex number is a geometric ratio of a vector to a fixed vector.**

To be specific, the complex number corresponding to a vector $\mathbf{a} = a_1\mathbf{e}_1 + a_2\mathbf{e}_2$ in the $\mathbf{I} \equiv \mathbf{e}_1 \wedge \mathbf{e}_2$-plane relative to the 'real axis' $\mathbf{e}_1$ is

$$A = \mathbf{a}/\mathbf{e}_1 = a_1 - a_2\mathbf{I} \tag{7.8}$$

The original vector addition can of course be lifted to these complex numbers by linearity of the geometric product:

$$A + B = (\mathbf{a}/\mathbf{e}_1 + \mathbf{b}/\mathbf{e}_1) = (\mathbf{a} + \mathbf{b})/\mathbf{e}_1 = (a_1 + b_1) - (a_2 + b_2)\mathbf{I}$$

Two such complex numbers multiply according to the geometric product:

$$AB = (a_1 - a_2\mathbf{I})(b_1 - b_2\mathbf{I}) = (a_1b_1 - a_2b_2) - (a_1b_2 + a_2b_1)\mathbf{I}$$

This product is obviously commutative. With sum and product thus defined, our complex numbers are clearly isomorphic to the usual complex numbers and their multiplication, if you set $i \equiv -\mathbf{I}$.

Yet we will not use complex numbers to do geometry in the plane, for they lose the distinction between vectors and operators; the vectors have effectively become represented as rotation/scaling operators. The capability to describe such operators compactly was part of the attraction of complex numbers when they were first introduced. But we really want both vectors and operators in our geometry, so we want all elements that can be made in the basis:

$$\{1, \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_1 \wedge \mathbf{e}_2 = \mathbf{I}\}$$

That is precisely what the geometric algebra of the plane provides, in an integrated manner that also contains the algebraic and geometrical relationships between vectors and operators. Complex numbers only use the basis $\{1, \mathbf{I}\}$. They are only half of what is required to do all of Euclidean planar geometry.

To show the power of this way of looking at complex numbers, programming exercise 7.10.5 computes the fractal Julia sets using only real vectors. That formulation makes their extension to n-dimensional space straightforward.

### 7.3.3 Multiple Rotations in 3-D

Let us investigate what happens in Euclidean 3-D space when we perform the rotor $R_{\mathbf{I}_2\phi_2}$ after $R_{\mathbf{I}_1\phi_1}$, with different planes $\mathbf{I}_2$ and $\mathbf{I}_1$. It is convenient to have a shorthand for the trigonometric functions involved; let us use $c'_i = \cos(\phi_i/2)$ and $s'_i = \sin(\phi_i/2)$, with the prime to remind us of the halving of the angle. The total rotor after multiplication has only grade 0 and grade 2 terms, since grade 4 cannot exist in 3-D space. The grade-2 term, which is in general a bivector, can be written as a 2-blade, since in the geometric algebra of a 3-D space, all bivectors are 2-blades. Thus in 3-D space, we compute for the rotor composition

$$c'_t - \mathbf{I}_t s'_t = (c'_2 - \mathbf{I}_2 s'_2)(c'_1 - \mathbf{I}_1 s'_1)$$

$$= c'_1c'_2 + s'_1s'_2\langle\mathbf{I}_2\mathbf{I}_1\rangle_0 - c'_2s'_1\mathbf{I}_1 - c'_1s'_2\mathbf{I}_2 + s'_1s'_2\langle\mathbf{I}_2\mathbf{I}_1\rangle_2$$

We have split the result in the scalar part (i.e., 0-blade) and 2-blade parts. Note how the geometric product generates five terms out of the product of two factors of two terms, since $\mathbf{I}_2\mathbf{I}_1$ has both a 0-grade part and a 2-grade part (and in more than 3-D, there would even be a 4-grade part).

$\mathbf{I}_1$ and $\mathbf{I}_2$ are standard rotations with rotor angles of $\pi/2$ in the planes of the rotations we want to compose (they correspond to 180 degree rotations). The scalar $\langle\mathbf{I}_2\mathbf{I}_1\rangle_0$ is the cosine $c_{\perp}$ of the angle $\phi_{\perp}$ between those planes, and $\langle\mathbf{I}_2\mathbf{I}_1\rangle_2$ is the oriented plane $\mathbf{I}_{\perp}$ perpendicular to both, weighted by the sine $s_{\perp}$ of the angle $\phi_{\perp}$ from $\mathbf{I}_1$ to $\mathbf{I}_2$. Substituting this, using nonprimed $c_{\perp}$ and $s_{\perp}$ for cosine and sine of a nonhalved angle, we get

$$c'_t - \mathbf{I}_t s'_t = (c'_1c'_2 + s'_1s'_2c_{\perp}) - (c'_2s'_1\mathbf{I}_1 + c'_1s'_2\mathbf{I}_2 - s'_1s'_2s_{\perp}\mathbf{I}_{\perp}) \tag{7.9}$$

That gives the total rotor; if you need its plane and angle separately you should take the normalized grade-2 part and use an arc tangent function on the scaling factors of the two parts to retrieve the angle. (We will encapsulate this later in the logarithm function for 3-D rotation, in Section 10.3.3.)

We emphasize that these computations do not need to be written out explicitly. In a program, the product of two rotors is just $R_2R_1$. We spelled them out in coordinates chiefly to convince you that this simple multiplication indeed implements all the correct details of the composition of rotations.

### 7.3.4 Visualizing 3-D Rotations

Consider the equation given by the scalar part of (7.9), and write it out in full detail:

$$\cos(\phi_t/2) = \cos(\phi_1/2)\cos(\phi_2/2) + \sin(\phi_1/2)\sin(\phi_2/2)\cos(\phi_{\perp})$$

This is precisely the **cosine law for sides** from spherical trigonometry, depicted in Figure 7.6(a). It means that we can imagine the multiplicative composition of rotors in 3-D as the *addition* of half-angle spherical arcs, as in Figure 7.6(b).

That is also confirmed by remembering that a rotation is a double reflection in a "vee" formed by two unit vectors in the rotation plane through the origin, separated by half the rotation angle as in Figure 7.2. The actual absolute orientation of these vectors in the plane is immaterial (as you may check; it must be rotationally invariant, since any vector out of the plane can be rotated by the construction!). Now, composing two rotations (in possibly different planes) is identical to composing two double reflections; it is natural to rotate the two vees of vectors so that the first and last vectors of both vees coincide. Then it is obvious that those two reflections cancel each other in the composition (algebraically, they are divided by themselves), while the other two remain to give the vee for the resulting rotation. To complete the visualization, surround these unit vectors by a sphere, and you see the characteristics of the rotation sphere representation: each vee of vectors determines an arc of half the rotation angle, and their composition is the completion of a spherical triangle.

> **Figure 7.6:** (a) A spherical triangle. (b) Composition of rotations through concatenation of rotor arcs. $R_2R_1$ is the composite rotor of doing first $R_1$, then $R_2$, and is the arc completing the spherical triangle.

The addition of freely sliding spherical arcs on great circles is such a simple means to compose rotations that it deserves to be better known, whether you use geometric algebra or not. Structural exercise 8 gives some practice in its geometry and the accompanying algebra.

### 7.3.5 Unit Quaternions Subsumed

The rotors in 3-D space are closely related to quaternions. In our view, **unit quaternions are rotors separated from their natural context** in the geometric algebra of real 3-D Euclidean space $\mathbb{R}^{3,0}$. Because of their mathematical origin, people view them as imaginary, and that makes them unfortunately much more mysterious than they need to be. Identifying them with rotors helps, since those are real operators in a real vector space, with (in 2-D and 3-D) a scalar part (related to the cosine of the angle) and a 2-blade part (containing sine and rotation plane). The 2-blades have a negative square, but that does not make them imaginary. The spherical arc visualization of rotors renders them completely real, in both the English and the mathematical senses of the word. The same real visualization works for unit quaternions.

Let us spell out the correspondence between rotors and unit quaternions precisely. A quaternion consists of two parts, a scalar part and a complex vector part:

$$\text{quaternion:} \quad q = q_0 + \vec{q}$$

We will consider only unit quaternions, characterized by $q_0^2 + \|\vec{q}\|^2 = 1$. The nonscalar part of a unit quaternion is often seen as a kind of vector that denotes the rotation axis, but expressed on a strange basis of complex vector quantities $\mathbf{i}$, $\mathbf{j}$, $\mathbf{k}$ that square to $-1$ and anticommute. For us, $\vec{q}$ and its basis elements are not vectors but basis 2-blades of the coordinate planes:

$$\mathbf{i} = -\mathbf{I}_3\mathbf{e}_1 = \mathbf{e}_3\mathbf{e}_2, \quad \mathbf{j} = -\mathbf{I}_3\mathbf{e}_2 = \mathbf{e}_1\mathbf{e}_3, \quad \mathbf{k} = -\mathbf{I}_3\mathbf{e}_3 = \mathbf{e}_2\mathbf{e}_1$$

Note that $\mathbf{ij} = \mathbf{k}$ and cyclic, and $\mathbf{ijk} = -1$. The three components of an element on this 2-blade basis represent not the rotation unit axis vector $\mathbf{e}$, but the rotation plane $\mathbf{I}$. The two are related simply by geometric duality (i.e., quantitative orthogonal complement) as

$$\text{axis } \mathbf{e} \text{ to 2-blade } \mathbf{I}: \quad \mathbf{e} \equiv \mathbf{I}^* = \mathbf{I}\mathbf{I}_3^{-1}, \quad \text{so } \mathbf{e}\mathbf{I}_3 = \mathbf{I}$$

and their coefficients are similar, though on totally different bases (basis vectors for the axis $\mathbf{e}$, basis 2-blades for the rotation plane $\mathbf{I}$).

The standard notation for a unit quaternion $q = q_0 + \vec{q}$ separates it into a scalar part and a supposedly complex vector part $\vec{q}$ denoting the axis. This naturally corresponds to a rotor $R = q_0 - \vec{q}\mathbf{I}_3$ having a scalar part and a 2-blade part:

$$\text{unit quaternion } q_0 + \vec{q} \quad \leftrightarrow \quad \text{rotor } q_0 - \mathbf{q}\mathbf{I}_3 \tag{7.10}$$

(The minus sign derives from the rotor definition (7.4).) In the latter, $\mathbf{q}$ is now a real vector denoting a rotation axis. When combining these quantities, the common geometric product naturally takes over the role of the rather ad hoc quaternion product. We embed unit quaternions as rotors, perform the multiplication, and transfer back:

$$\mathbf{q}\,\mathbf{p} = (q_0 + \vec{q})(p_0 + \vec{p}) \quad \text{(quaternion product!)}$$

$$\leftrightarrow (q_0 - \mathbf{q}\mathbf{I}_3)(p_0 - \mathbf{p}\mathbf{I}_3) \quad \text{(geometric product!)}$$

$$= q_0p_0 + \langle\mathbf{I}_3\mathbf{q}\mathbf{I}_3\mathbf{p}\rangle_0 - (qp_0 + q_0\mathbf{p} - \langle\mathbf{I}_3\mathbf{q}\mathbf{I}_3\mathbf{p}\rangle_2\mathbf{I}_3^{-1})\mathbf{I}_3$$

$$= q_0p_0 - \langle\mathbf{q}\mathbf{p}\rangle_0 - (\mathbf{q}p_0 + q_0\mathbf{p} + \langle\mathbf{q}\mathbf{p}\rangle_2\mathbf{I}_3^{-1})\mathbf{I}_3$$

$$= q_0p_0 - \mathbf{q} \cdot \mathbf{p} - (\mathbf{q}p_0 + q_0\mathbf{p} + \mathbf{q} \times \mathbf{p})\mathbf{I}_3$$

$$\leftrightarrow (q_0p_0 - \vec{q} \cdot \vec{p}) + (p_0\vec{q} + q_0\vec{p} + \vec{q} \times \vec{p}) \tag{7.11}$$

There is one conversion step in there that may require some extra explanation: $\langle\mathbf{qp}\rangle_2\mathbf{I}_3^{-1} = (\mathbf{q} \wedge \mathbf{p})\mathbf{I}_3^{-1} = \mathbf{q} \times \mathbf{p}$, by (3.28). The inner product and cross product in (7.11) are just defined as the usual combinations of the coefficients of the complex vectors.

With the above, we have retrieved the usual multiplication formula from quaternion literature, but using only quantities from the real geometric algebra of the 3-D Euclidean space $\mathbb{R}^{3,0}$. This shows that the unit quaternion product is really just the geometric product on rotors. The quaternion product formula betrays its three-dimensional origin clearly in its use of the cross product, whereas the geometric product formula is universal and works for rotors in $n$-dimensional space.

The geometric algebra method gives us a more natural context to use the quaternions. In fact, we don't use them, for like complex numbers in 2-D they are only half of what is needed to do Euclidean geometry in 3-D. We really need both rotation operators and vectors, separately, in a clear algebraic relationship. The rotation operators are rotors that obey the same multiplication rule as unit quaternions; the structural similarity between (7.9) and (7.11) should be obvious. This is explored in structural exercise 10. Of course, the rule must be the same, since both rotors and quaternions can effectively encode the composition of 3-D rotations.

We summarize the **advantages of rotors**: In contrast to unit quaternions, rotors can rotate $k$-dimensional subspaces, not only in 3-D but even in $n$-dimensional space. Geometrically, they provide us with a clear and real visualization of unit quaternions, exposed in the previous section as half-angle arcs on a rotation sphere, which can be composed by sliding and addition. It is a pity that the mere occurrence of some elements that square to $-1$ appears to have stifled all sensible attempts to visualization in the usual approach to quaternions, making them appear unnecessarily complex. Keep using them if you already did, but at least do so with a real understanding of what they are. This is explored in Structural Exercise 10.

---

## 7.4 The Exponential Representation of Rotors

In Section 7.3.1, we made a basic rotor as the ratio of two unit vectors, which is effectively their geometric product. Multiple applications then lead to:

> In a Euclidean space $\mathbb{R}^{n,0}$, a rotor is the geometric product of an even number of unit vectors.

The inverse of a rotor composed of such unit vectors is simply its reverse. This is not guaranteed in general metrics, which have unit vectors that square to $-1$. But if $R\tilde{R}$ would be $-1$, $R$ would not even produce a linear transformation, for it would reverse the sign of scalars. Therefore, we should prevent this and have as a definition for the more general spaces:

> **A rotor $R$ is the geometric product of an even number of unit vectors, such that $R\tilde{R} = 1$.**

Even within those more sharply defined rotors, mathematicians such as Riesz make a further important distinction between rotors that are "continuously connected to the identity" and those that are not. This property implies that some rotors can be performed gradually in small amounts (such as rotations), but that in the more general metrics there are also rotors that are like reflections and generate a discontinuous motion. Only the former are candidates for the proper orthogonal transformations that we hope to represent by rotors.

You can always attempt to construct rotors as products of vectors, but checking whether you have actually made a proper rotor becomes cumbersome. Fortunately, there is an alternative representation in which this is trivial, and moreover, it often corresponds more directly to the givens in a geometric problem. It is the **exponential representation**, which computes a Euclidean rotor immediately from its intended rotation plane and angle. That construction generalizes unchanged to other metrics.

### 7.4.1 Pure Rotors as Exponentials of 2-Blades

We have seen how in Euclidean 3-D space, a rotor $R_{\mathbf{I}\phi}$ can be written as the sum of a scalar and a 2-blade, involving a cosine and a sine of the scalar angle $\phi$. We can also express the rotor in terms of its bivector angle using the exponential form of the rotor:

$$R_{\mathbf{I}\phi} = \cos(\phi/2) - \mathbf{I}\sin(\phi/2) = e^{-\mathbf{I}\phi/2} \tag{7.12}$$

The exponential on the right-hand side is defined by the usual power series. The correctness of this exponential rewriting can be demonstrated by collecting the terms in this series with and without a net factor of $\mathbf{I}$. Because $\mathbf{I}^2 = -1$ in the Euclidean metric, that leaves the familiar scalar power series of sine and cosine. To show the structure of this derivation more clearly, we define $\psi = -\phi/2$.

$$e^{\mathbf{I}\psi} = 1 + \frac{\mathbf{I}\psi}{1!} + \frac{(\mathbf{I}\psi)^2}{2!} + \frac{(\mathbf{I}\psi)^3}{3!} + \cdots$$

$$= \left(1 - \frac{\psi^2}{2!} + \frac{\psi^4}{4!} - \cdots\right) + \mathbf{I}\left(\frac{\psi}{1!} - \frac{\psi^3}{3!} + \frac{\psi^5}{5!} - \cdots\right)$$

$$= \cos\psi + \mathbf{I}\sin\psi \tag{7.13}$$

After some practice, you will no longer need to use the scalar plus bivector form of the rotor $R_{\mathbf{I}\phi}$ to perform derivations but will be able to use its exponential form instead.

For instance, if you have the component $\mathbf{x}_{\parallel}$ of a vector $\mathbf{x}$ that is contained in $\mathbf{I}$, then $\mathbf{x}_{\parallel}\mathbf{I} = -\mathbf{I}\mathbf{x}_{\parallel}$. From this you should dare to state the commutation rule for the versor $R_{\mathbf{I}\phi}$ immediately as $\mathbf{x}_{\parallel}R_{\mathbf{I}\phi} = R_{-\mathbf{I}\phi}\mathbf{x}_{\parallel}$ and use it to show directly that

$$R_{\mathbf{I}\phi}\mathbf{x}_{\parallel}\tilde{R}_{\mathbf{I}\phi} = e^{-\mathbf{I}\phi/2}\mathbf{x}_{\parallel}e^{\mathbf{I}\phi/2} = (\mathbf{x}_{\parallel}e^{\mathbf{I}\phi/2})e^{\mathbf{I}\phi/2} = \mathbf{x}_{\parallel}e^{\mathbf{I}\phi}$$

or, if you would rather, $e^{-\mathbf{I}\phi}\mathbf{x}_{\parallel}$. So within the $\mathbf{I}$-plane, the formula $\mathbf{x} \to \mathbf{x}e^{\mathbf{I}\phi}$ performs a rotation. This result is (7.6), now with a more compact computational derivation.

Clearly, the exponential representation in (7.13) is algebraically isomorphic to the exponential representation of a unit complex number by the correspondence exposed in Section 7.3.2. The result,

$$e^{i\pi} + 1 = 0$$

famously involving "all" relevant computational elements of elementary calculus, is obtained from (7.12) by setting $i = -\mathbf{I}$ and $\phi = 2\pi$, as $e^{-\mathbf{I}\pi} = -1$. Its geometric meaning is that a rotation over $2\pi$ in any plane $\mathbf{I}$ has the rotor $-1$ (not $+1$; remember the plate trick!).

### 7.4.2 Trigonometric and Hyperbolic Functions

Though the motivation of the exponential form of a rotor was through Euclidean rotations, the Taylor series definition can be used in arbitrary metric spaces $\mathbb{R}^n$. When we write out the exponential $\exp(\mathbf{A})$ for a pure rotor (with $\mathbf{A}$ a 2-blade from $\mathbb{R}^n$) the even powers all become scalar, because a 2-blade $\mathbf{A}$ squares to a scalar in any metric (as all blades do). The odd powers become a multiple of $\mathbf{A}$ for the same reason.

In a Euclidean metric, a basic 2-blade squares to $-1$, and this generates the trigonometric functions sine and cosine we saw appear above. In general metrics, a 2-blade may have a positive square, or even a zero square (for a null 2-blade). Therefore, the computation will essentially reduce to some scalar power series out of the familiar list:

$$\exp x \equiv 1 + \frac{x}{1!} + \frac{x^2}{2!} + \cdots$$

$$\sinh x \equiv x + \frac{x^3}{3!} + \frac{x^5}{5!} + \cdots$$

$$\cosh x \equiv 1 + \frac{x^2}{2!} + \frac{x^4}{4!} + \cdots$$

$$\sin x \equiv x - \frac{x^3}{3!} + \frac{x^5}{5!} - \cdots$$

$$\cos x \equiv 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \cdots$$

With this preparation we obtain, for any blade $\mathbf{A} \in \mathbb{R}^n$:

$$\exp(\mathbf{A}) = \begin{cases} \cos\alpha + \mathbf{A}\dfrac{\sin\alpha}{\alpha} = \cos\alpha + \mathbf{U}\sin\alpha & \text{if } \mathbf{A}^2 = -\alpha^2 \\[1em] 1 + \mathbf{A} = 1 + \alpha\mathbf{U} & \text{if } \mathbf{A}^2 = 0 \\[1em] \cosh\alpha + \mathbf{A}\dfrac{\sinh\alpha}{\alpha} = \cosh\alpha + \mathbf{U}\sinh\alpha & \text{if } \mathbf{A}^2 = \alpha^2 \end{cases} \tag{7.14}$$

The alternative forms pull out the unit-blade $\mathbf{U}$ in the $\mathbf{A}$ direction (so that $\mathbf{A} = \mathbf{U}\alpha$, for positive $\alpha$). Note the particularly simple form for null-blades; hardly any term survives in the expansion.

We will need all of these expressions when we model Euclidean geometry in Part II. The trigonometry (for $\mathbf{A}^2 < 0$) describes the composition of Euclidean rotations, the null case ($\mathbf{A}^2 = 0$) will represent Euclidean translations, and the hyperbolic case ($\mathbf{A}^2 > 0$) will perform scalings.

### 7.4.3 Rotors as Exponentials of Bivectors

Pure rotors are exponentials of 2-blades, and we have just defined them for all metrics. As the exponential representation of the 3-D Euclidean rotation is such a convenient parameterization of the rotor, the question arises whether all rotors in all spaces can be written in such a form. Since 2-blades coincide with bivectors only in 2-D and 3-D, we will at least need to admit exponentials of bivectors (rather than just 2-blades) as the general form of rotors. Could this be the most general form?

Detailed investigation shows that matters are mathematically more complicated. It is unfortunately not true that any rotor in any space can be written as the exponential of a bivector. However, Riesz shows that in the Euclidean spaces $\mathbb{R}^{n,0}$ and $\mathbb{R}^{0,n}$ and in the Minkowski spaces $\mathbb{R}^{n-1,1}$ and $\mathbb{R}^{1,n-1}$ there exists a bivector $B$ such that every orthogonal transformation $\mathsf{L}[\mathbf{x}]$ continuously connected to the identity can be written as:

$$\mathsf{L}[\mathbf{x}] = e^{-B/2}\mathbf{x}e^{B/2} \tag{7.15}$$

So for those spaces, a rotor that is continuously connected to the identity can be expressed as the exponential of a bivector. We are fortunate that our main interests in this book are precisely these Euclidean and Minkowski spaces, for in no other spaces does this statement hold for all orthogonal transformations continuously connected to the identity, or their rotors.

Moreover, in these $n$-dimensional Euclidean and Minkowski spaces (and again only in those), an arbitrary bivector $B$ can be written as the sum of commuting 2-blades. This allows us to (de)compose the bivector exponential as

$$e^{-B/2} = e^{-(\mathbf{B}_k + \cdots + \mathbf{B}_1)/2} = e^{-\mathbf{B}_k/2} \cdots e^{-\mathbf{B}_1/2} \tag{7.16}$$

where the 2-blades $\mathbf{B}_i$ are orthogonal in the sense that they all commute. In effect, any rotor can then be made from pure rotors.

Even when you use noncommuting bivectors in the construction (7.16) of a rotor from pure rotors, the result will be a rotor (since rotors connected to the identity form a group under the geometric product). However, in general you are not allowed to add the exponents of successive exponentials in geometric algebra:

$$e^B e^A \neq e^{B+A}$$

for the series expansion of the left-hand side (which may change when $A$ and $B$ are swapped) is simply different than the expansion on the right (which is symmetric in $A$ and $B$). The terms to second order already show this:

$$e^B e^A = (1 + B + \tfrac{1}{2}B^2 + \cdots)(1 + A + \tfrac{1}{2}A^2 + \cdots)$$

$$= 1 + B + A + \tfrac{1}{2}(B^2 + 2BA + A^2) + \cdots$$

$$\neq 1 + (B + A) + \tfrac{1}{2}(B^2 + BA + AB + A^2) + \cdots$$

$$= 1 + (B + A) + \tfrac{1}{2}(B + A)^2 + \cdots$$

$$= e^{B+A}$$

So even to second order, $e^{B+A}$ would only equal $e^Be^A$ if $AB = BA$ (i.e., if $A$ and $B$ commute). However, when this condition holds, it can be shown that addition of the exponents is indeed permitted. Therefore,

$$e^{B+A} = e^B e^A \quad \text{if } AB = BA$$

It is not "only if" because of some accidental exceptions involving rotations over multiples of $\pi$ in properly chosen rotation planes (e.g., take $A = 3\pi\,\mathbf{e}_2 \wedge \mathbf{e}_3$ and $B = 4\pi\,\mathbf{e}_3 \wedge \mathbf{e}_1$; the 2-blades do not commute, but since $\exp(A) = -1$ is scalar, the exponentials do).

An alternative form to (7.16) is to write the exponential as a product of vectors:

$$e^{-B/2} = (\mathbf{b}_{2k}\mathbf{b}_{2k-1}) \cdots (\mathbf{b}_2\mathbf{b}_1)$$

in which the $\mathbf{b}_i$ are unit vectors (so that $\mathbf{b}_i^2 = \pm 1$), related to the 2-blades $\mathbf{B}_i$ of (7.16) by $\mathbf{B}_i = \mathbf{b}_{2i-1} \wedge \mathbf{b}_{2i}$. Still, there are subtle issues: if you use this to construct the exponential as a product of vectors, you may accompany an odd number of the $\mathbf{b}_i$ by a minus sign, resulting in the rotor $-e^{-B/2}$ rather than $e^{-B/2}$. This would still work well to represent the orthogonal transformation, since the sandwiching product in (7.15) leads to the same result. Indeed, in most spaces another bivector $C$ can be found so that $e^{-C/2} = -e^{-B/2}$ for those spaces, so this is in fact an identical construction. The only exceptions are the Minkowski spaces up to dimension 4. In $\mathbb{R}^{1,1}$, one can find no $C$ for any $B$; in $\mathbb{R}^{2,1}$ and $\mathbb{R}^{1,2}$, one can find no $C$ for $B$ such that $B^2 \geq 0$; and in $\mathbb{R}^{3,1}$ and $\mathbb{R}^{1,3}$, only for $B^2 = 0$ can no $C$ be found. The final case has some geometrical relevance in this book; it occurs as the conformal model of a 2-D Euclidean space.

In these small Minkowski spaces there apparently exist rotors that are not continuously connected to the identity. Generally, it is true that:

> **In Euclidean and Minkowski spaces, rotors connected to the identity are exponentials of bivectors.**

We have also shown the reverse statement, that in these spaces any exponential of a bivector is a rotor.

### 7.4.4 Logarithms

Since we have the exponential expression $R = e^{-B/2}$ to make a rotor from a bivector $B$, we also would like the inverse: given a rotor, extract the bivector that could generate it. This would be a logarithm function for bivector exponentials.

Having such a logarithm is very relevant for interpolation, for it would allow us to define the $N$th root of a rotor $R$ as

$$R^{1/N} = \exp(\log(R)/N)$$

The result is a rotor that performs the rotation from $\mathbf{X}$ to $R\mathbf{X}\tilde{R}$ as $N$ smaller rotations, which can be drawn as interpolation results:

$$R\mathbf{X}\tilde{R} = R^{1/N}\left(R^{1/N} \cdots \left(R^{1/N}\mathbf{X}\widetilde{R^{1/N}}\right) \cdots \widetilde{R^{1/N}}\right)\widetilde{R^{1/N}} \quad (N \text{ factors in total})$$

For 3-D rotations, we do this in Section 10.3.3. When rotors are used to represent general 3-D rigid body motions in Chapter 13, the rotor logarithm will allow us to interpolate such motions in closed form.

But in geometric algebra, logarithms are somewhat involved. One problem is that the logarithm does not have a unique value. For instance, even with a simple rotation in a single 2-blade, we have seen how $R_{\mathbf{I}\phi} = R_{\mathbf{I}(\phi + 4\pi k)}$, so that we can always add a multiple of $4\pi$ to the outcome. One usually takes one value (for instance the one with the smallest norm) as the **principal value** of the logarithm. We will do so implicitly (some denote that principal value as $\text{Log}(R)$, with a capital L, as a reminder, but we will just use the $\log R$ notation).

A second problem is finding a closed form formula. If the bivector is a 2-blade, its exponential expansion involves standard trigonometric or hyperbolic functions, and its principal logarithm can be found using the inverse functions $\arctan$ or $\text{arctanh}$ (we do this for rotors in $\mathbb{R}^{3,0}$ in Section 10.3.3). However, the general rotor is the exponent of a bivector, not a 2-blade. Since a bivector does not usually square to a scalar, there are now no simple expansions of the exponential, and many mixed terms result. If we want to get back to the basic trigonometric or hyperbolic functions (to get geometrically significant parameters like bivector angles, translation vectors, and scalings), we then need to factorize the total expression. That would effectively split the bivector into mutually commuting 2-blades with sensible geometric meaning, and would make the logarithm extractable in closed form. Unfortunately this factorization is hard to do in general. In this book, we will derive specific formulas for specific transformations we encounter (Euclidean rotations, Euclidean rigid body motions, rigid body motions with positive scaling) in the appropriate chapters of Part II.

---

## 7.5 Subspaces as Operators

The rotations we have just treated so extensively are generated as an even number of hyperplane reflections. We now study the reflections in general subspaces. Like rotors, they also employ a sandwiching product, effectively using subspaces as operators on other subspaces. The analysis reveals that we need to keep track of how a blade represents a subspace (dually or directly) to process it correctly. Our understanding of general reflections then allows us to specify the conditions for containment and perpendicularity of subspaces in $n$-dimensional space as compact commutation relationships.

More patterns appear: projections to subspaces can also be written as sandwiching, but now use the contraction. And operators may be transformed like objects: the reflection of a rotation operator in the motivating example of Chapter 1 now finds its justification.

### 7.5.1 Reflection by Subspaces

If we have a blade $\mathbf{A}$ representing a subspace, the reflection in it should invert the rejection of a vector by that blade, so

$$\text{reflection of } \mathbf{x} \text{ in subspace } \mathbf{A}: \quad \mathbf{x} \to \mathbf{x} - 2(\mathbf{x} \wedge \mathbf{A})\mathbf{A}^{-1} = -\mathbf{A}\hat{\mathbf{x}}\mathbf{A}^{-1}$$

Extending this as an outermorphism, each grade in $\mathbf{X}$ contributes a factor $(-1)^{a+1}$, for a total formula that reads

$$\text{reflection of } \mathbf{X} \text{ in subspace } \mathbf{A}: \quad \mathbf{X} \to (-1)^{x(a+1)}\mathbf{A}\mathbf{X}\mathbf{A}^{-1}$$

with $x = \text{grade}(\mathbf{X})$ and $a = \text{grade}(\mathbf{A})$. We can use a subspace in this manner as a reflector.

The resulting equation does not match our earlier formula for the hyperplane in (7.2), since we characterized that by its dual $\mathbf{a} = \mathbf{A}^*$. So let us derive the formula for such a reflection in a dually represented blade as well, setting $\mathbf{D} = \mathbf{A}\mathbf{I}_n^{-1}$.

$$(-1)^{x(a+1)}\mathbf{A}\mathbf{X}\mathbf{A}^{-1} = (-1)^{x(a+1)}\mathbf{D}\mathbf{I}_n\mathbf{X}\mathbf{I}_n^{-1}\mathbf{D}^{-1}$$

$$= (-1)^{x(n+a+2)}\mathbf{D}\mathbf{X}\mathbf{D}^{-1}$$

$$= (-1)^{xd}\mathbf{D}\mathbf{X}\mathbf{D}^{-1}$$

since $d = \text{grade}(\mathbf{D}) = \text{grade}(\mathbf{A}\mathbf{I}_n^{-1}) = n - \text{grade}(\mathbf{A}) = n - a$. We have thus found

$$\text{reflection of } \mathbf{X} \text{ in dual subspace } \mathbf{D}: \quad \mathbf{X} \to (-1)^{xd}\mathbf{D}\mathbf{X}\mathbf{D}^{-1}$$

This matches (7.2) when $\mathbf{D}$ is a vector. It is an instance of the general sandwiching formula involving geometric products, since we could have written the dual blade as a geometric product of orthogonal factors using the Gram-Schmidt orthogonalization procedure. Incidentally, this also shows geometrically why a blade should square to a scalar: double reflection must be the identity, and that is represented by a scalar rotor.

> **Figure 7.7:** A plane acting as a reflector of oriented subspaces. The reflection of a direct blade $\mathbf{X}$ in a subspace $\mathbf{A}$ is $(-1)^{x(a+1)}\mathbf{A}\mathbf{X}/\mathbf{A}$. This formula gives a different sign for the red vector $\mathbf{x}$ and the yellow bivector $\mathbf{B}$. The reflection of a dual element $\mathbf{Y}$ in $\mathbf{A}$ is $(-1)^{(y+1)(a+1)}\mathbf{A}\mathbf{Y}/\mathbf{A}$. This implies that the blue normal vector $\mathbf{b} = \mathbf{B}^*$ reflects differently from the regular vector $\mathbf{x}$ to correctly remain the normal vector of the reflected $\mathbf{B}$.

These reflections of oriented subspaces are illustrated in Figure 7.7. The difference in the formulas for the different characterizations (direct or dual) of the mirrors imply that our software will apparently need to realize whether a mirroring blade is given in its direct representation or in its dual representation when we perform a reflection. The same is true for the blade $\mathbf{X}$ that gets reflected, if you want duality relative to the original pseudoscalar rather than to the reflected pseudoscalar. We ask you to derive the proper expressions yourself in structural exercise 11. The set of equations that results for the reflection operator is collected in Table 7.1.

**Table 7.1:** Reflection of an oriented subspace $\mathbf{X}$ in a subspace $\mathbf{A}$. When either is represented dually rather than directly, the signs change as indicated. When the dual representation $\mathbf{Y} = \mathbf{X}^*$ is the input, one usually desires to have the outcome also in dual form relative to the same original unreflected pseudoscalar. That result has been indicated, where $a = \text{grade}(\mathbf{A})$, $d = \text{grade}(\mathbf{D})$, $x = \text{grade}(\mathbf{X})$, $y = \text{grade}(\mathbf{Y})$. (Duality with respect to the reflected pseudoscalar is formula-preserving and would obey the first column with $\mathbf{X} \to \mathbf{Y}$ and $x \to y$.)

|  | $\mathbf{X}$ direct | $\mathbf{Y} = \mathbf{X}^*$ dual |
|---|---|---|
| $\mathbf{A}$ direct | $(-1)^{x(a+1)}\mathbf{A}\mathbf{X}\mathbf{A}^{-1}$ | $(-1)^{(y+1)(a+1)+(n-1)}\mathbf{A}\mathbf{Y}\mathbf{A}^{-1}$ |
| $\mathbf{D} = \mathbf{A}^*$ dual | $(-1)^{xd}\mathbf{D}\mathbf{X}\mathbf{D}^{-1}$ | $(-1)^{(y+1)d}\mathbf{D}\mathbf{Y}\mathbf{D}^{-1}$ |

That is how involved the geometry of reflection is when you want to keep track of the orientation of the spaces. However, realize the power inherent in these formulas: we can now *reflect any oriented subspace into any subspace within a space of any dimensionality*, and get a result of the correct attitude, magnitude, and orientation. That is worth a bit of precision in the administration. Of course, if you don't want to keep track of the orientation, the formulas all become identical to $\mathbf{A}\mathbf{X}\mathbf{A}^{-1}$.

### 7.5.2 Subspace Projection as Sandwiching

In the reflection formula

$$\mathbf{X} \to (-1)^{x(a+1)}\mathbf{A}\mathbf{X}\mathbf{A}^{-1}$$

the subspace $\mathbf{A}$ acts on the subspace $\mathbf{X}$ as a reflector. The subspace $\mathbf{A}$ is then effectively used as an operator, using the geometric product in its sandwiching.

In the same abstract sense, a subspace can act as an orthogonal projector. We have seen the formula for that in Section 3.6 as $(\mathbf{X} \rfloor \mathbf{A})\mathbf{A}^{-1}$. That formula can actually also be written in sandwich form, but now using the (nonassociative) contractions instead of the (associative) geometric product. This even includes the necessary orientation sign above, by courtesy of (3.19):

$$\mathbf{X} \to (\mathbf{X} \rfloor \mathbf{A})\mathbf{A}^{-1} = (-1)^{x(a+1)}(\mathbf{A} \lfloor \mathbf{X})\mathbf{A}^{-1} = (-1)^{x(a+1)}\mathbf{A} \lfloor (\mathbf{X} \rfloor \mathbf{A}^{-1})$$

In this sense, we can switch from a subspace used as a reflector to a subspace used as a projector by replacing the geometric products with the contractions. Both sandwiching operators are grade-preserving. The algebraic properties of geometric product and contraction lead to different properties on repetition, for the reflector is an **involution** (doing it twice is the identity), while the projector is **idempotent** (doing it twice is like doing it once).

### 7.5.3 Transformations as Objects

We just saw how subspaces can be operators acting through the sandwiching product. Conversely, operators transform as subspaces.

For instance, we may want to rotate the plane $\mathbf{I}$ of a rotation $R_1 = R_{\mathbf{I}\phi} = \cos(\phi/2) - \mathbf{I}\sin(\phi/2)$ to become a different rotation plane—such nested rotations are common in robotics and hierarchical modeling, where the shoulder rotates the elbow rotation, which in turn rotates the wrist rotation. What is the rotor of this new rotation of $R_2$ applied to $R_1$? It is not $(R_2R_1)$, for that would merely apply the rotation $R_2$ after we have applied $R_1$.

The clue is that the rotation $R_2$ should rotate the $\mathbf{I}$ plane of $R_1$ to become $R_2\mathbf{I}\tilde{R}_2$. That makes the new rotor

$$R'_1 = \cos(\phi/2) - (R_2\mathbf{I}\tilde{R}_2)\sin(\phi/2) = R_2\left(\cos(\phi/2) - \mathbf{I}\sin(\phi/2)\right)\tilde{R}_2 = R_2R_1\tilde{R}_2$$

where we used the commutativity of scalars to absorb all terms under the application of $R_2$. The result is that the rotor $R_1$ is rotated by $R_2$, precisely as the phrasing of the problem suggested. (Structural exercise 9 should illustrate this on the spherical image.) Comparing to (7.3), we see that rotors can be rotated just like subspaces or any other element of the algebra. We could actually have derived that immediately, by using the linearity of the outermorphism, but is good to have a geometrical argument for this algebraic result.

The same reasoning and derivation holds for reflections. We can even reflect rotation operators, as the example in Chapter 1 showed. The result of the reflection of a rotor $R_{\mathbf{I}\phi}$ in a hyperplane dually characterized by $\mathbf{n}$ is a rotation in the reflected plane:

$$\mathbf{n}R_{\mathbf{I}\phi}\mathbf{n}^{-1} = \mathbf{n}\left(\cos(\phi/2) - \mathbf{I}\sin(\phi/2)\right)\mathbf{n}^{-1}$$

$$= \cos(\phi/2) - (\mathbf{n}\mathbf{I}\mathbf{n}^{-1})\sin(\phi/2)$$

$$= R_{\mathbf{n}\mathbf{I}\mathbf{n}^{-1}\phi}$$

We may summarize these principles as

> **Concatenated transformations use the geometric product, but nested transformations use the sandwiching product.**

If you compare this to linear algebra, you know that concatenated rotations would be done by a total rotation matrix that is the product of the successive rotation matrices: $[[R_2]][[R_1]]$, whereas a nested transformation requires a sandwich: $[[R_2]][[R_1]][[R_2]]^{-1}$, so that is similar. One would then apply this to a vector $\mathbf{x}$ as $[[R]][[\mathbf{x}]]$, whereas in geometric algebra the application to a general element $X$ (vector, operator, etc.) would be $RX\tilde{R}^{-1}$. So in linear algebra, the application to an object obeys the same rule as concatenation of operators, whereas in geometric algebra it is like their nesting.

---

## 7.6 Versors Generate Orthogonal Transformations

We have seen a single reflection in a hyperplane, and how an even number of successive reflections generates a rotation. An odd number of reflections is a rotation-plus-reflection, sometimes called an **antirotation**. All are of the form $\mathbf{X} \to \pm V\mathbf{X}V^{-1}$. We call such a sandwiching a **versor product**, and the element $V$ a **versor**. Since these operations are so powerful, it pays to analyze them in more detail. We especially need to be careful about their signs (as the analysis of reflections already showed), and we are interested in their structural properties.

### 7.6.1 The Versor Product

The subsequent application of sandwiching products $\mathbf{x} \to -\mathbf{v}\mathbf{x}\mathbf{v}^{-1}$ using the vectors $\mathbf{v}_1, \mathbf{v}_2, \ldots, \mathbf{v}_k$ leads to an overall operation that is

$$\mathbf{x} \to (-1)^k \mathbf{v}_k \cdots \mathbf{v}_2\mathbf{v}_1\mathbf{x}\mathbf{v}_1^{-1}\mathbf{v}_2^{-1} \cdots \mathbf{v}_k^{-1}$$

Let us define a **$k$-versor** as an element of the geometric algebra $\mathcal{G}(\mathbb{R}^n)$ that can be obtained by multiplying $k$ vectors using the geometric product:

$$\text{versor}: \quad V = \mathbf{v}_k \cdots \mathbf{v}_2\mathbf{v}_1$$

Then we can write the total sandwiching product on the vector $\mathbf{x}$ as

$$\mathbf{x} \to \hat{V}\mathbf{x}V^{-1} \tag{7.17}$$

where $\hat{V}$ is the grade involution of $V$, equal to $+V$ if $k$ is even and $-V$ when $k$ is odd. The inverse of $V$ is of course simply obtained by the inverse vector factors in opposite order:

$$V = \mathbf{v}_k \cdots \mathbf{v}_2\mathbf{v}_1, \quad \text{then} \quad V^{-1} = \mathbf{v}_1^{-1}\mathbf{v}_2^{-1} \cdots \mathbf{v}_k^{-1}$$

For a unit $V$, the inverse is the reverse. Null vectors (which square to zero; see Section A.4 in Appendix A) cannot be used as factors in this operation, for they do not have inverses.

The operation of (7.17) is a linear transformation on $\mathbf{x}$, and it can be extended as an outermorphism to produce a general form that we call the **versor product** $\mathsf{V}: \bigwedge^k \mathbb{R}^n \to \bigwedge^k \mathbb{R}^n$ on a blade $\mathbf{X}$:

$$\text{versor product of } V \text{ on } \mathbf{X}: \quad \mathbf{X} \to \mathsf{V}[\mathbf{X}] \equiv (-1)^{xv}V\mathbf{X}V^{-1} \tag{7.18}$$

Here $x \equiv \text{grade}(\mathbf{X})$ and $v \equiv \text{grade}(V)$. The latter is a slight abuse of notation, since $V$ does not have a unique grade; it is allowed since only the parity of $v$ matters, and this is all odd or all even for a versor.

Linearity permits us to extend this definition beyond blades to a general multivector $X$, where we have to take the sum over the grade parts of $X$. If the grades are mixed, this cannot be simplified, but if the grades of $X$ are all odd or even (and this is typically the case), this is a simple generalization of (7.18): substitute the general $X$ for the blade $\mathbf{X}$.

Versors clearly multiply by the geometric product, since they are themselves constructed as the geometric product of vectors, and their corresponding versor transformations compose naturally:

$$V_2(V_1\mathbf{x}\tilde{V}_1)\tilde{V}_2 = (V_2V_1)\mathbf{x}\widetilde{(V_2V_1)} = \widehat{(V_2V_1)}\mathbf{x}(V_2V_1)^{-1}$$

And vice versa: the versor of a composition of operators is the geometric product of their versors. Thus versors reveal the true geometrical meaning of the algebraically introduced geometric product: **it multiplies geometrical operators**.

### 7.6.2 Even and Odd Versors

We have seen that some versors represent reflections and that two reflections make a rotation. The different geometrical feeling between these kinds of operations is how they treat handedness; rotations preserve it, while reflections manage to turn a right hand into a left hand. This is well represented in the signs of the determinants of their transformations if we view them as linear transformations, both in geometric algebra and classically. But the versor representation makes distinguishing them even simpler; the important difference is between **odd** and **even** versors (i.e., versors made up of an odd or even number of reflections). This is precisely the difference between an odd and even number of vector factors in the versor. And since the geometric product contains only all even or all odd terms, this corresponds to the oddness or evenness of their grades. All odd-grade versors are reflections, and all even-grade versors are rotations in their vector space $\mathbb{R}^n$. This is easily proved using (7.18):

$$\det(\mathsf{V}) = \mathsf{V}[\mathbf{I}_n]/\mathbf{I}_n = (-1)^{nv}V\mathbf{I}_nV^{-1}\mathbf{I}_n^{-1} = (-1)^{nv+(n+1)v}VV^{-1}\mathbf{I}_n\mathbf{I}_n^{-1} = (-1)^v$$

This result is independent of the metric of the space $\mathbb{R}^n$.

Because of this difference in properties, it makes sense to have the versor product for even and odd versors listed separately:

$$\text{even versors}: \quad \mathbf{X} \to V\mathbf{X}V^{-1} \tag{7.19}$$

$$\text{odd versors}: \quad \mathbf{X} \to V\hat{\mathbf{X}}V^{-1} \tag{7.20}$$

As before, these formulas even apply to arbitrary multivectors $X$. For even versors, this is the substitution of $\mathbf{X}$ by $X$; for odd versors, one should sum over the results for odd and even grades of $X$ separately—the grade involution takes care of the proper signs of the various grade parts of $X$.

### 7.6.3 Orthogonal Transformations Are Versor Products

Not every linear transformation can be written in the form of a versor product. In fact, the ones that can are precisely the **orthogonal transformations**. You may already suspect this from their determinants, but we can also show this more directly. The crucial property is to verify what happens to an inner product of vectors after transformation:

$$\mathsf{V}[\mathbf{x}] \cdot \mathsf{V}[\mathbf{y}] = (-\hat{V}\mathbf{x}V^{-1}) \cdot (-\hat{V}\mathbf{y}V^{-1})$$

$$= \langle\hat{V}\mathbf{x}V^{-1}V\mathbf{y}\tilde{V}^{-1}\rangle_0 = \langle\hat{V}\mathbf{x}\mathbf{y}\tilde{V}^{-1}\rangle_0 = \langle\mathbf{x}\mathbf{y}\tilde{V}^{-1}\hat{V}\rangle_0 = \langle\mathbf{x}\mathbf{y}\rangle_0$$

$$= \mathbf{x} \cdot \mathbf{y} = \mathsf{V}[\mathbf{x} \cdot \mathbf{y}]$$

The inner product is preserved, so this is an orthogonal transformation. The derivation is easily reversed to show that any such linear transformation can be written as a versor product.

Because the versor product is an orthogonal transformation, it transforms the contraction in a structure-preserving manner. (The adjoint equals the inverse, which is represented by the reverse of the versor, modulo an irrelevant scalar factor; see structural exercise 5.) And because the versor product is a linear transformation, it can be extended as an outermorphism—therefore it also preserves the outer product. In fact, **the versor product preserves the geometric product**. For even versors, this is a one-liner:

$$\mathsf{V}[A]\mathsf{V}[B] = VAV^{-1}VBV^{-1} = VABV^{-1} = \mathsf{V}[AB]$$

and for odd versors it is not much harder to prove once you realize that $\widehat{AB} = (\hat{A}\hat{B})$.

Since a versor product is also grade-preserving, all constructions that are made as grade selections of a geometric product are obviously preserved by the versor product. This includes all subspace products:

$$\mathsf{V}[AB] = \mathsf{V}[A]\mathsf{V}[B]$$

$$\mathsf{V}[A \wedge B] = \mathsf{V}[A] \wedge \mathsf{V}[B]$$

$$\mathsf{V}[A * B] = \mathsf{V}[A] * \mathsf{V}[B] \quad (= A * B)$$

$$\mathsf{V}[A \rfloor B] = \mathsf{V}[A] \rfloor \mathsf{V}[B]$$

$$\mathsf{V}[A \lfloor B] = \mathsf{V}[A] \lfloor \mathsf{V}[B]$$

Such structure-preservation properties easily extend to functions of multivectors, notably the exponential of bivectors:

$$\mathsf{V}[\exp(B)] = \exp(\mathsf{V}[B]) \tag{7.21}$$

So, **the transformation of a rotor can be found by transforming its bivector**. We will use this frequently, so it is good to convince you explicitly why this holds. Since $B$ is a bivector, we have no bothersome signs:

$$\exp(\mathsf{V}[B]) = 1 + VBV^{-1} + \frac{1}{2!}(VBV^{-1})^2 + \cdots$$

$$= 1 + VBV^{-1} + \frac{1}{2!}VBV^{-1}VBV^{-1} + \cdots$$

$$= 1 + VBV^{-1} + \frac{1}{2!}(VB^2V^{-1}) + \cdots$$

$$= V\left(1 + B + \frac{1}{2!}B^2 + \cdots\right)V^{-1}$$

$$= \mathsf{V}[\exp(B)]$$

so (7.21) is simply a consequence of the structure preservation of the geometric product by the versor product.

This property of structure preservation makes versor-based transformations easy to work with. In fact, we are going to make it the basis of all geometrical computations in geometric algebra by choosing a proper space to represent geometries in. We call these **operational models** of the geometries, and will especially develop the operational models $\mathbb{R}^{n+1,1}$ of a Euclidean space $\mathbb{E}^n$ in Chapters 13 and 16. In that model, all Euclidean transformations (including translations) are orthogonal transformations encoded by versors.

### 7.6.4 Versors, Blades, Rotors, and Spinors

We now have many elements that can be used in the versor-type sandwiching products:

- **Versor.** A versor is a geometric product of invertible vectors.
- **Rotor.** A rotor $R$ is a geometric product of an even number of unit vectors such that $R^{-1} = \tilde{R}$. It can be written as the exponential of a bivector in most spaces of interest (see Section 7.4.3 for the fine print).
- **Blade.** A blade is an outer product of vectors. If it is to be used in a reflection operation, it uses a sandwiching product, and therefore it should be invertible. Invertible blades can always be written as a geometric product of mutually orthogonal vectors (by the Gram-Schmidt procedure).

Therefore we have the following relationships:

> All invertible blades are versors (but few versors are blades).
>
> Rotors are even unit versors (whose inverse is their reverse), and vice versa.
>
> All even unit blades whose inverse is their reverse are rotors, but few rotors are blades.

A prototypical case of a blade acting in a versor product is the 2-blade $\mathbf{I} = \mathbf{e}_1 \wedge \mathbf{e}_2$ in $\mathbb{R}^{n,0}$. If it is the special case of a rotor (for rotor angle $-\pi$), it generates the rotation $\mathbf{x} \to \mathbf{I}\mathbf{x}\tilde{\mathbf{I}}$ over $-\pi$ in the $\mathbf{I}$-plane. The same blade could also be used as a reflector; then it would generate $-\mathbf{I}\mathbf{x}\tilde{\mathbf{I}}$.

In the literature of mathematical physics there are elements called **spinors**, traditionally associated with the description of rotations in quantum mechanics. These are closely related to rotors. It is useful to understand this link, since some of the spinor literature is relevant to geometry.

Spinors are not introduced as geometric products of vectors, but as elements that preserve grade under a sandwiching product in a Clifford algebra. Consider the set of elements $S$ that can transform a vector $\mathbf{x}$ into a vector by the operation $S\mathbf{x}\tilde{S}^{-1}$. (This is called the Clifford group.) When such elements are normalized to $S\tilde{S} = \pm 1$ and of even grades, they are called spinors, making up a **spin group** (though some authors appear to permit odd spinors as well).

The **special spin group** is the subgroup of the spin group consisting of the elements for which $S\tilde{S} = +1$. Its elements are most closely related to the rotors, but careful study shows that there are some special spinors that are not rotors. They consist of the weighted sum of a rotor and its dual, but they are rare (they only occur in spaces whose dimensionality mod 4 equals 0). So it is almost true that "special spinor" and "rotor" are equivalent terms. In summary:

> All rotors are special spinors; almost all special spinors are rotors.

This way of looking at rotors is interesting, for it casts a slightly different light on their exponential representation. Can we show that the exponential of a general bivector, when used in a versor product, is indeed a transformation from vectors to vectors? Let us expand the exponentials:

$$e^{-B/2}\mathbf{x}e^{B/2} = \left(1 - \tfrac{1}{2}B + \tfrac{1}{2}(B/2)^2 + \cdots\right)\mathbf{x}\left(1 + \tfrac{1}{2}B + \tfrac{1}{2}(B/2)^2 + \cdots\right)$$

$$= \mathbf{x} - \tfrac{1}{2}B\mathbf{x} + \tfrac{1}{2}\mathbf{x}B + \tfrac{1}{8}\left(B^2\mathbf{x} - 2B\mathbf{x}B + \mathbf{x}B^2\right) + \cdots$$

$$= \mathbf{x} + (\mathbf{x} \rfloor B) + \frac{1}{2!}((\mathbf{x} \rfloor B) \rfloor B) + \frac{1}{3!}(((\mathbf{x} \rfloor B) \rfloor B) \rfloor B) + \cdots \tag{7.22}$$

The result clearly produces a vector: each contraction of a vector with a bivector gives a vector, so the successive nestings keep producing vector terms. For a simple rotation represented by a Euclidean 2-blade $B = \mathbf{I}\phi$, we depict the series of terms in Figure 7.8; it generates increasingly accurate approximations for the rotation result, correct in magnitude and geometry. Each subsequent contraction by $\mathbf{I}$ rotates and scales the previous contribution. Note that only the first term $\mathbf{x}$ may contain a component $(\mathbf{x} \wedge \mathbf{B})/\mathbf{B}$ that is not contained in $\mathbf{B}$.

> **Figure 7.8:** The rotor product in Euclidean spaces as a Taylor series (a) in 2-D, and (b) in 3-D. The subsequent terms are denoted by the blue lines, converging to the rotation result.

---

## 7.7 The Product Structure of Geometric Algebra

### 7.7.1 The Products Summarized

We now have a number of products with geometrical meanings for subspaces and their operators. They are all based on the geometric product. We have the **outer product** to span subspaces. We have the **scalar product** to compute norms and angles between subspaces of the same grade. It is subsumed by the **contractions**, which extends this capability to different grades. Then there is the **versor product**, which can apply subspaces as operators acting on other subspaces to produce reflections and rotations. Sandwiching using the contractions produces projection operators. Finally, there is the **geometric product**, which acts as a multiplication of versor operators and as the foundation of the whole system. The basic principles by which these varied operators are constructed is always the geometric product and (anti-)commutation combined with addition or grade selection.

All these products are bilinear and distributive over addition. We have met two more products that are of geometrical significance, but which only have these properties in a piecewise manner: **meet** and **join**. To retain their meaning of "intersection" and "union", these can only be applied to blades, and should adapt themselves in a nonlinear manner to the geometric degeneracy of their arguments. This makes them algebraically less tidy than the basic products above.

With this collection of products, the foundation of geometric algebra is virtually complete (only one more operation and product will be introduced in the next chapter: differentiation and the associated commutator product with a bivector). Any element or operation from linear algebra can now be substituted by a corresponding element and coordinate-free operator from geometric algebra. For simplicity of structure and universality of code, this is always advantageous, though it may come at a computational price—we treat that issue briefly below (Section 7.7.3) and extensively in Part III.

The algebraic foundation by itself cannot be applied immediately to geometric problems in applications: a modeling step is required to identify the proper algebraic concepts to encode features of the situation. For Euclidean, affine, and projective geometry, there are standard recommended ways of modeling. These are explained in Part II, which is essential reading if you want to use geometric algebra effectively.

### 7.7.2 Geometric Algebra Versus Clifford Algebra

The consistency of our constructions so far allows us to express our opinion on the difference between geometric algebra and Clifford algebra. The following is by no means generally accepted, but we have found it a useful distinction for practical purposes, especially as a foundation for developing efficient implementations for the various admissible operations in Part III.

- **Clifford algebra** is defined in the same multivector space $\mathcal{G}(\mathbb{R}^n)$ of a metric space $\mathbb{R}^n$ as geometric algebra. It has the same definition of the geometric product to construct elements from other elements. It moreover permits us to construct elements by a universal addition, also defined between any two elements.

- By contrast, in our view of **geometric algebra** we only permit *exclusively multiplicative* constructions and combinations of elements. The obvious exceptions to this are the two basis elements in the whole construction: the vector space and its field $\mathbb{R}$, which were linear from the start, and their duals (since duality is an isomorphic construction). Thus the only elements in the geometric algebra $\mathcal{G}(\mathbb{R}^n)$ that we allow to be added constructively are of grade 0 (scalars), grade 1 (vectors), grade $(n-1)$ (covectors), and grade $n$ (pseudoscalars).

Of course, many of the products in geometric algebra are bilinear and allow generalization over addition through their distributivity. But we view that additive structure only as convenient for the decomposition of those products, never as a construction of new elements. The distributivity property is convenient in implementations, since it allows the representation of an arbitrary element on a basis. We then store the coefficients it has on that basis, and are allowed to reconstruct the element by recomposing the terms, but never should we play the game of making new elements by adding arbitrarily weighted basis elements, as in Clifford algebra. The reason is simply that we have no geometric interpretation for such elements.

By contrast, all elements produced by multiplication using any of our products do have a geometrical interpretation. The blades among them, from the subalgebra involving only the inner and outer products (and of course including duality, meet, and join) are clearly subspaces. They can even be drawn. The elements involving the geometric product are versors representing orthogonal transformations, and they act on the subspace elements through the versor product to again provide drawable elements. There is therefore never a doubt about the geometrical nature of any of the multiplicatively constructed elements.

A similar contrast exists between Grassmann algebra, which permits arbitrary addition, and what we called subspace algebra in our early chapters, permitting only the multiplicative constructions. Unfortunately, mathematics has developed the additive Grassmann and Clifford algebras to a much greater extent than their multiplicative parts. Much of that work is irrelevant to their geometrical usage. It may even be incomplete, for what would have been good and useful geometrical theorems may not be stated because they are not generally valid when addition is allowed, and therefore are considered less pure. When consulting the mathematical literature, be on the lookout for results on "simple" multivectors, which require factorizability by the outer product (and are therefore about blades) or the geometric product (and are thus about versors).

The sole exception we have been forced to make so far to our multiplicative principle involves exponentiation. When one multiplies two rotors, a rotor results. Starting from rotors that can be represented as the exponentials of 2-blades, we can construct the exponentials of general bivectors as geometrically significant operators. Permitting their logarithm as an operation in our algebra, we should therefore permit general addition of bivectors as a constructive operation—but the resulting elements may then subsequently only be used for exponentiation. As such, this is still our multiplicative principle, merely expressed in logarithmic form.

In the grade approach to geometric algebra, the multiplicative principle is much less easily formulated. The direct translation from the subspace product motivation would permit us only to use the grade parts that define those products; that is the limited set exposed in Section 6.3.2. Beyond that, there may be more geometrically relevant grades (such the minimum and maximum grade of a geometric product that we will meet in Section 21.7), but the general issue of admissible grades in the multiplicative principle has not yet been thoroughly explored.

The multiplicative principle is beginning to be acknowledged by mathematicians. It will be interesting to see whether this will unearth hitherto dormant results in Clifford algebra with patently geometrical applications. For now, we have made the multiplicative principle the basis of our implementation (and it is part of the reason why it is among the fastest known). We have not yet encountered geometrical situations that we cannot represent and process.

### 7.7.3 But—Is It Efficient?

The use of blades as elements of computation and of rotors as operators to perform orthogonal transformations on them permits us to encode a lot of geometry in a compact, coordinate-free, and universal manner. As a consequence, we need to distinguish fewer data types in geometric constructions. That in turn simplifies the flow of algorithms. The resulting code looks a lot more compact and readable, since all operators can be encoded in terms of geometrical elements of the application, rather than in unrelated coordinate systems. But is that code also more efficient?

This question is not easily answered. There are many facets to the issue because there are many different kinds of operations in a geometry, and the balance may differ per application. When we do a practical comparison for a ray tracer in Part III (see Table 22.1), the fastest implementation of geometric algebra is 25 percent slower than an optimized, explicitly written-out classical implementation. That cost of geometric algebra is about the same as the performance that can be achieved by the currently commonly used homogeneous coordinates and quaternions (which provide much less universality than geometric algebra). We believe a 5 to 10 percent overhead for the use of geometric algebra should be achievable in such applications. This would be an acceptable price to pay for the much cleaner structure of the code, with a much reduced number of data types and an elimination of the corresponding special operations that need to be explicitly defined on them.

Let us briefly discuss some of the relevant issues in making an efficient implementation of geometric algebra, with special emphasis on the orthogonal transformation of blades, which will be the structural backbone of geometric modeling in Part II.

- **For the composition of orthogonal transformations, rotors are superior in up to 10 dimensions.** The geometric algebra of an $n$-dimensional space has a general basis of $2^n$ elements. Rotors, which are only even-dimensional, in principle require $2^{n-1}$ parameters for their specification (though typical rotors use only a part of this). Linear transformations specified by matrices need $n \times n$ matrices with $n^2$ parameters (and typically need them all). Rotors are therefore more efficient for storage of transformations in less than 7 dimensions (and for the practical dimensionalities of 3, 4, 5 about twice as efficient). Composing transformations as rotors takes $2^n$ operations, and composing them as matrices requires $n^3$ operations. Therefore in fewer than 10 dimensions, rotors are more efficient than matrices (in the practical dimensions 3, 4, 5 about four times more). The reason for this gain by rotors in composition is partly that they do not represent general linear transformations, just the orthogonal transformations, and that they can really exploit that algebraic limitation, whereas matrices cannot. Unit quaternions are rotors in 3-D, and of course well known to be efficient for the composition of rotations.

- **For the linear transformation of vectors, matrices are always superior.** To perform an $n \times n$ matrix on an $n$-dimensional vector (orthogonal or not) takes $n^2$ operations. A general rotor could require as much as $2^{n-1} \times n \times 2^{n-1} = n\,2^{2(n-1)}$ in a straightforward implementation of its two-sided product. This is always more, in the practical dimensions about four times more. Part of the computations can be saved by realizing that grade-preservation of the rotor operation must mean that some terms cancel (so that they do not need to be computed). Other techniques may reduce the computation further, but not enough to make the direct rotor approach competitive. The conversion of a rotor to a matrix may therefore be an advantageous way to apply it to a vector. This is what one typically does for the unit quaternions, which are 3-D rotors; we treat their conversion matrix in Sections 7.10.3 and 7.10.4.

- **For the linear transformation of general blades, outermorphism matrices beat vector matrices and rotors.** A general $k$-blade is specifiable on a $\binom{n}{k}$-dimensional basis. When we want to transform a $k$-blade by an orthogonal transformation, we have three possibilities: rotors, outermorphism matrices (see Section 4.5), or matrices on the constituent vectors followed by recomposition. These take, respectively, $\binom{n}{k}2^{n/2}$ operations (using grade preservation-based reduction), $\binom{n}{k}^2$ operations, and $kn^2 + k\binom{n}{k}$ operations (the final term is an estimate of the complexity of the outer product construction). Of those three, the outermorphism matrix is cheapest (even for $k = 1$, when it reverts to the vector matrix of the previous item). Thus the generalized linear algebra that geometric algebra offers pays off in a different form.

- **For optimal orthogonal transformation, use rotors in a code generator.** Although outermorphism matrices are relatively cheap to use on $k$-blades, they are not the optimum. They do not employ all the structure of the computation, for they use neither the fact that the element to be transformed is a $k$-versor or a $k$-blade (rather than a general $k$-vector), nor can they use our knowledge that the transformation is orthogonal. Therefore they can still be improved by explicitly spelling out the products involved for each specific type of multivector. If you can predict the grade of the elements beforehand, such grade-based accelerations can be built in at compile time. But even at run time it may be worth testing the multivector type of an element and jumping to some specialized part of the code. This engenders no overhead at all if you can predict and specify the multivector type for each variable in your code. In this approach, the rotor multiplication formula is crucial, since it can be used by the symbolic code generator to derive all required formulas in a unified manner.

**The bottom line is:** geometric algebra works, the structural simplicity it brings can be used directly in high-level programming, and the computational overhead can be kept low (in the order of 5-10 percent). But the actual low implementational level on which the computations take place needs to be carefully designed, for a literal implementation of the geometric algebra products can rapidly become too expensive. We devote Part III of this book completely to these implementational issues.

---

## 7.8 Further Reading

In this chapter, most of the literature on the foundations of geometric algebra has become accessible, and you might even read some of the mathematical literature on Clifford algebra.

The obviously geometrically relevant literature on rotors (and spinors) has been absorbed into geometric algebra so you can read about it in the language of this book. The basic sources are [33] and [15], who also relate it to Lie groups in much more detail than we do in this book. Other references about the actual use of rotors in geometric applications will be supplied with the appropriate chapters in Part II.

For an entry to the more mathematical literature, we can recommend *Clifford Algebras and Spinors* [41]. Together with [52] and [51], it gives the precise mathematics. Though all are short on actual geometry, they can be used to answer questions about the validity of perceived patterns that one may be tempted to use in implementations.

---

## 7.9 Exercises

### 7.9.1 Drills

1. Compute $R_1 \equiv R_{\mathbf{e}_1 \wedge \mathbf{e}_2,\,\pi/2}$ and apply to $\mathbf{e}_1$.

2. Compute $R_2 \equiv \exp(\mathbf{e}_3 \wedge \mathbf{e}_1\,\pi/4)$ and apply to $\mathbf{e}_2 \wedge \mathbf{e}_4$.

3. Compute $R_2R_1$ and apply to $\mathbf{e}_1 \wedge \mathbf{e}_2$.

4. Compute the axis and angle of $R_2R_1$.

5. Compute the product of the rotors $R_{\mathbf{e}_{14}\pi/2}$ and $R_{\mathbf{e}_{23}\pi/2}$ and apply to $\mathbf{e}_{12}$.

6. Reflect $(\mathbf{e}_1 + \mathbf{e}_2) \wedge \mathbf{e}_3$ in the plane $\mathbf{e}_1 \wedge \mathbf{e}_4$.

7. Reflect the dual plane reflector $\mathbf{e}_1$ in the plane $\mathbf{e}_1 \wedge \mathbf{e}_3$.

### 7.9.2 Structural Exercises

1. The generalization of the line reflection from $\mathbf{a}\mathbf{x}\mathbf{a}^{-1}$ to $\mathbf{a}\mathbf{X}\mathbf{a}^{-1}$ seems straightforward when we remember that a $k$-blade can be written as the geometric product of $k$ mutually orthogonal vectors: $\mathbf{X} = \mathbf{x}_1\mathbf{x}_2 \cdots \mathbf{x}_k$, and then simply compute the outermorphism as $(\mathbf{a}\mathbf{x}_1\mathbf{a}^{-1})(\mathbf{a}\mathbf{x}_2\mathbf{a}^{-1}) \cdots (\mathbf{a}\mathbf{x}_k\mathbf{a}^{-1}) = \mathbf{a}\mathbf{X}\mathbf{a}^{-1}$. The result is correct but the proof is wrong as it stands. Why? (*Hint:* Can you guarantee the factorization after reflection?)

2. We have seen that for a Euclidean unit 2-blade, $\mathbf{I}^2 = -1$. Interpret this geometrically in terms of versors.

3. Verify that a line reflection in 3-D can be performed as a rotation. Which rotation? Give the axis and angle. Verify that this reflection can be applied to any blade.

4. Show that the fact that the geometric product transforms naturally under application of a versor, together with linearity, implies that the contraction is preserved. (*Hint:* An intermediate step uses linearity to show that the outer product is preserved.)

5. Show from the definition of the adjoint (in Section 4.3.2) that the adjoint of a transformation that can be written as a versor product with a versor $V$ is a versor product with the versor $\tilde{V}^{-1}$. Relate this to the orthogonality of a versor-based transformation.

6. We can reflect mirrors into mirrors to compute the effective mirror of a total reflection. Why can you ignore all signs in that computation and therefore universally use $\mathbf{M}_2\mathbf{M}_1\mathbf{M}_2$ for the reflection of mirror 1 in mirror 2 regardless of whether they have been represented directly or dually?

7. Match the computation of the composition of 2-D rotations in Section 7.3.1 to that of the 3-D rotations in Section 7.3.3, both algebraically and in the geometric visualization.

8. To study the spherical image of rotation composition, take a rotation in the $\mathbf{e}_1\mathbf{e}_3$ plane over $\pi/2$, followed by a rotation in the $\mathbf{e}_3\mathbf{e}_2$ plane over $\pi/2$. As rotors, these are $(1 - \mathbf{e}_1\mathbf{e}_3)/\sqrt{2}$ and $(1 - \mathbf{e}_3\mathbf{e}_2)/\sqrt{2}$. Draw two great circles, with poses corresponding to the rotation planes $\mathbf{e}_1\mathbf{e}_3$ and $\mathbf{e}_3\mathbf{e}_2$. On these great circles, the rotations over $\pi/2$ are represented as oriented arcs of length $\pi/4$ (the corresponding rotor angle). These arcs are freely movable along their great circles. To compose the rotations, make them meet so that you can perform $R_1$ and then $R_2$. This is a depiction as in Figure 7.6. The arc completing the spherical triangle is in a skew plane with a length that looks like it might be $\pi/3$. Do an actual computation to confirm this value for the rotor angle and a plane of $(-\mathbf{e}_3\mathbf{e}_2 - \mathbf{e}_1\mathbf{e}_3 + \mathbf{e}_2\mathbf{e}_1)/\sqrt{3}$. The resulting rotation is over $-2\pi/3$ in this plane. Rewrite this using (7.10), and show that the rotation axis is $(-\mathbf{e}_1 - \mathbf{e}_2 + \mathbf{e}_3)$.

9. Draw the rotated rotor $R_2R_1\tilde{R}_2$ as an arc in the spherical image. (*Hint:* What would you expect it to be based on its geometric meaning? *Warning:* It is not simply the $R_1$ arc rotated over the $R_2$-arc!)

10. Establish the precise correspondence between the quantities in the rotor composition (7.9) and the quaternion product of (7.11). (*Warning:* This is a painful exercise in keeping things straight, and not very rewarding.)

11. Derive the formulas for the reflection of a dual blade $\mathbf{Y} = \mathbf{X}^*$ from the formulas for reflection of a directly represented blade $\mathbf{X}$. Derive the last column of Table 7.1 from the column before. Make sure you take the dual of both input and output relative to the same unreflected pseudoscalar $\mathbf{I}_n$.

12. A special case of reflection is when $\mathbf{A}$ is the scalar 1. Derive the algebraic outcome and interpret geometrically. Another special case is $\mathbf{A} = \mathbf{I}_n$; compute that and interpret. Why is the latter outcome not the dual of the former?

13. You can project onto a rotor and get a geometrically meaningful result. Give the geometric interpretation of the projection $P_R[\mathbf{x}] \equiv (\mathbf{x} \rfloor R)R^{-1}$. (*Hint:* Think "chord.") For rotors, it matters whether you put the inverse on the first or the last factor: what is $(\mathbf{x} \rfloor R^{-1})R$?

14. In $\mathbb{R}^{4,0}$ with the usual basis, perform a rotation in the $\mathbf{e}_1 \wedge \mathbf{e}_2$ plane followed by a rotation in the $\mathbf{e}_3 \wedge \mathbf{e}_4$ plane. Compute the rotor of the composition, and show that this is the exponent of a bivector, not of a 2-blade. (*Hint:* See structural exercise 5 of Chapter 2.) Note also that the rotor is not of the simple form "scalar plus 2-blade" of Section 7.4 (or even "scalar plus bivector").

---

## 7.10 Programming Examples and Exercises

### 7.10.1 Reflecting in Vectors

The code of the first example is a straightforward implementation of the line reflection equation:

```cpp
e3ga::vector reflectVector(const e3ga::vector &a,
                           const e3ga::vector &x) {
    return _vector(a*x* inverse(a));
}
```

The program allows you to interactively manipulate both `a` (red) and `x` (green). You can use the popup menu to switch to a mode that shows you that this also works for bivectors.

### 7.10.2 Two Reflections Equal One Rotation

This example displays an interactive version of Figure 7.2. The input vector (green) is successively reflected in two different (red) vectors. The end result is that the input vector is rotated, as expected. To reflect the input vector we invoke `reflectVector()` twice:

```cpp
// update the reflected/ rotated vectors
g_reflectedVector = reflectVector(g_reflectionVector1,
    g_inputVector);
g_rotatedVector = reflectVector(g_reflectionVector2,
    g_reflectedVector);
```

> **Figure 7.9:** Interactive version of Figure 7.2.

### 7.10.3 Matrix-Rotor Conversion 1

To connect to programs and libraries not based on geometric algebra (such as OpenGL), you may need to convert back and forth between rotors and matrices. This example provides the code for the 3-D case. The algorithms are based on geometric intuition—see the next exercise for more efficient solutions.

#### Rotor To Matrix Conversion

The columns of a (rotation) matrix are the images of the basis vectors under the transformation. To convert from rotor to matrix, we transform $\mathbf{e}_1$, $\mathbf{e}_2$, and $\mathbf{e}_3$ and copy them into the matrix. The implementation is straightforward:

```cpp
void rotorToMatrix(const rotor &R, float M[9]) {
    // compute images of the basis vectors:
    rotor Ri = _rotor(inverse(R));
    e3ga::vector image[3] = {
        _vector(R * e1 * Ri), // image of e1
        _vector(R * e2 * Ri), // image of e2
        _vector(R * e3 * Ri)  // image of e3
    };
    // copy coordinates to matrix:
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 3; j++)
            M[j * 3 + i] = image[i].getC(vector_e1_e2_e3)[j];
}
```

#### Rotation Matrix To Rotor Conversion

Conversion from matrix to rotor is more complicated. Again we start with the fact that the columns of the matrix are the images of the basis vectors. We should remember that rotors are ambiguous: we can always increase the angle by $4\pi$ to get another rotor that is equivalent. And since a rotation matrix does not specify the sense of rotation, $R$ and $-R$ are both acceptable solutions. We compute the smallest rotor (i.e., with the smallest angle) as our solution in three steps:

- First, compute the smallest rotor $R_1$ that rotates $\mathbf{e}_1$ to the image of $\mathbf{e}_1$ under the matrix transform.
- Then, compute the smallest rotor $R_2$ that rotates $R_1\mathbf{e}_2/R_1$ to its image of $\mathbf{e}_2$ under the matrix transform. Because of orthogonality, this rotor will leave $R_1\mathbf{e}_1/R_1$ unchanged.
- Finally, compute the full rotor: $R = R_2R_1$.

Because of orthogonality, $\mathbf{e}_3$ automatically transforms correctly to $R\mathbf{e}_3/R$. The code for this algorithm:

```cpp
// note: very imprecise in some situations; do NOT use this
// function in practice
rotor matrixToRotor(const float M[9]) {
    e3ga::vector imageOfE1(vector_e1_e2_e3,
        M[0 * 3 + 0], M[1 * 3 + 0], M[2 * 3 + 0]);
    e3ga::vector imageOfE2(vector_e1_e2_e3,
        M[0 * 3 + 1], M[1 * 3 + 1], M[2 * 3 + 1]);
    rotor R1 = rotorFromVectorToVector(_vector(e1), imageOfE1);
    rotor R2 = rotorFromVectorToVector(_vector(R1 * e2 * inverse(R1)),
        imageOfE2);
    return _rotor(R2 * R1);
}
```

There is a compact formula that computes the smallest rotor that rotates a unit vector $\mathbf{a}$ to another unit vector $\mathbf{b}$, in 3-D. It is

$$R = \frac{1 + \mathbf{b}\mathbf{a}}{2(1 + \mathbf{b} \cdot \mathbf{a})} \tag{7.23}$$

(We discuss it in more context in Section 10.3.2, but we use it now.) It is implemented in the function `rotorFromVectorToVector()`. The rotor formula is unstable when $\mathbf{a} \cdot \mathbf{b} \approx -1$, which happens near a rotation over 180 degrees (the rotation plane is then not accurately determined, neither geometrically nor algebraically). This also makes the code listed above unstable. We work around this limitation in two ways in the stable version of the function, shown in Figure 7.10. This first is to pick the first basis vector such that a 180-degree rotation is not required. This is tested using `if (M[0 * 3 + 0] > -0.9f) {/*...*/}`. The second is to provide a default rotation plane (2-blade) to be used by `rotorFromVectorToVector()`—this plane must be orthogonal to the image of the first basis vector. `rotorFromVectorToVector()` uses this plane in situations where the rotation is near 180 degrees to come up with a solution for this geometrically degenerate case.

```cpp
rotor matrixToRotorStable(const float M[9]) {
    e3ga::vector imageOfE1(vector_e1_e2_e3,
        M[0 * 3 + 0], M[1 * 3 + 0], M[2 * 3 + 0]);
    e3ga::vector imageOfE2(vector_e1_e2_e3,
        M[0 * 3 + 1], M[1 * 3 + 1], M[2 * 3 + 1]);
    e3ga::vector imageOfE3(vector_e1_e2_e3,
        M[0 * 3 + 2], M[1 * 3 + 2], M[2 * 3 + 2]);
    if (M[0 * 3 + 0] > -0.9f)
    {
        rotor R1 = rotorFromVectorToVector(_vector(e1), imageOfE1);
        rotor R2 = rotorFromVectorToVector(_vector(R1 * e2 * inverse(R1)),
            imageOfE2,_bivector(dual(imageOfE1)));
        return _rotor(unit_e(R2 * R1));
    }
    else if (M[1 * 3 + 1] > -0.9f)
    {
        rotor R1 = rotorFromVectorToVector(_vector(e2), imageOfE2);
        rotor R2 = rotorFromVectorToVector(_vector(R1 * e3 * inverse(R1)),
            imageOfE3,_bivector(dual(imageOfE2)));
        return _rotor(unit_e(R2 * R1));
    }
    else
    {
        rotor R1 = rotorFromVectorToVector(_vector(e3), imageOfE3);
        rotor R2 = rotorFromVectorToVector(_vector(R1 * e1 * inverse(R1)),
            imageOfE1,_bivector(dual(imageOfE3)));
        return _rotor(unit_e(R2 * R1));
    }
}
```

> **Figure 7.10:** Rotation matrix to rotor conversion.

### 7.10.4 Exercise: Matrix-Rotor Conversion 2

The conversion functions we presented above are (geometrically) intuitive, but they are not the most efficient solutions. A much better way is to perform the rotation on the unit basis vectors symbolically and encode the results. This is straightforward. On an orthonormal basis $\{\mathbf{e}_i\}$, with associated bivector basis $\mathbf{e}_{ij} \equiv \mathbf{e}_i \wedge \mathbf{e}_j$, let the rotor to be converted be

$$R = w + x\,\mathbf{e}_{23} + y\,\mathbf{e}_{31} + z\,\mathbf{e}_{12}$$

The normalization of the rotor implies that $w^2 + x^2 + y^2 + z^2 = 1$. Then one computes

$$R\mathbf{e}_1\tilde{R} = (w + x\,\mathbf{e}_{23} + y\,\mathbf{e}_{31} + z\,\mathbf{e}_{12})\mathbf{e}_1(w - x\,\mathbf{e}_{23} - y\,\mathbf{e}_{31} - z\,\mathbf{e}_{12})$$

$$= (w^2 + x^2 - y^2 - z^2)\mathbf{e}_1 + 2(-wz + xy)\mathbf{e}_2 + 2(wy + xz)\mathbf{e}_3$$

$$= (1 - 2(y^2 + z^2))\mathbf{e}_1 + 2(-wz + xy)\mathbf{e}_2 + 2(wy + xz)\mathbf{e}_3$$

The transformation of the other basis vectors is obtained by cyclicity (resubstituting the indices $1 \to 2 \to 3 \to 1$ and values $x \to y \to z \to x$). The result is the matrix that implements the linear transformation of applying the rotor $R$ to a vector:

$$[[R]] = \begin{bmatrix} 1 - 2y^2 - 2z^2 & 2yx + 2wz & 2zx - 2wy \\ 2xy - 2wz & 1 - 2z^2 - 2x^2 & 2zy + 2wx \\ 2xz + 2wy & 2yz - 2wx & 1 - 2x^2 - 2y^2 \end{bmatrix}$$

This basically is also how one converts a quaternion into a matrix. If you already have software for that, you can use it, though you may need to initialize a rotor from its (quaternion) coordinates, which is the implementation of the correspondence of (7.10):

```cpp
float w, x, y, z;
rotor R(rotor_scalar_e1e2_e2e3_e3e1, w, -z, -x, -y);
```

Here `w`, `x`, `y`, and `z` are the coordinates of a classic quaternion (which are not always defined in the same way, so beware what correspondence between the quaternion units $\mathbf{i}$, $\mathbf{j}$, $\mathbf{k}$, and the basis bivectors should be used!).

Implement this rotor to matrix conversion and test its speed when applied to vectors. The example code provides the basic framework for testing and timing. In our solution, this classic version was about four times faster than the geometric version.

The converse function, to convert a rotation matrix into a rotor, can also be sped up. Here we can use the standard conversion of a matrix to a unit quaternion. Consider the form of the matrix above and use combinations of the elements to retrieve the four parameters. Addition of selected off-diagonal elements gives products of two of the parameters; the diagonal elements can be added with appropriate signs to give the square of only one variable, which is enough to compute the rest. Any trusted site on quaternion computations gives the details.

### 7.10.5 Julia Fractals

Fractals are usually introduced using complex numbers. But with the subsumption of complex numbers into geometric algebra, as explained in Section 7.3.2, they are just as easily generated using vectors in a real geometric algebra. This has the additional advantage that they can be extended to more than two dimensions without changing the algorithm. We explore this for Julia fractals, based on [37].

In the classic computation of 2-D fractal images, the image space is considered to be a complex plane. Each pixel (indicated by its complex coordinates) is inside the fractal set if, under repeated application of some mathematical function, the result does not tend to infinity.

For the Julia set, the complex function is an iterative computation, computing the complex number $X_{k+1}$ as the $p$th power of the previous number and some additive constant complex number $C$:

$$X_{k+1} = X_k^p + C \tag{7.24}$$

The initial $X_0$ to which the function is applied is defined as

$$X_0 = x + iy \tag{7.25}$$

where $x$ and $y$ are the coordinates of the pixel in the image. The fractal picture is obtained by coloring the pixel according to the value of $X_{k+1}$ after a fixed number of iterations. By varying $C$, different images are obtained. The constant integer $p$ is commonly 2, but other values are possible.

The function above can be converted into geometric algebra and then just becomes an operation on the vectors of a real plane. We have seen in (7.8) that each complex number $X$ is associated with a vector as $X = \mathbf{x}/\mathbf{e}$, with $\mathbf{e}$ denoting the unit direction vector of the real axis.

Taking in particular the fractal with $p = 2$ involves using the complex square of $X_k$. With the substitution $X = \mathbf{x}/\mathbf{e}$, this can be computed by a geometric product involving only real vectors:

$$\mathbf{x}_{k+1}\mathbf{e}^{-1} = \mathbf{x}_k\mathbf{e}^{-1}\mathbf{x}_k\mathbf{e}^{-1} + \mathbf{c}\mathbf{e}^{-1}$$

which is equivalent to

$$\mathbf{x}_{k+1} = \mathbf{x}_k\mathbf{e}\mathbf{x}_k + \mathbf{c}$$

This is clearly a vector, proportional (by $\|\mathbf{x}_k\|^2$) to the reflection of the constant unit vector $\mathbf{e}$ in the previous vector $\mathbf{x}_k$, with $\mathbf{c}$ added. The initial complex number $X_0$ is replaced by the vector $\mathbf{x}$ in the image plane for which we want to compute the value of the fractal function.

With these substitutions, the fractals are computed in a real geometric algebra. Nothing in this new formulation refers to the plane of vectors, so fractals are easily extended to $n$-dimensional Euclidean space by taking the initial $\mathbf{x}$ and $\mathbf{c}$ as vectors in that space. In 3-D, this leads to what are known as quaternionic fractals, though without actually using quaternions. An example of a 3-D fractal is shown in Figure 7.13.

We have implemented the basic algorithm; see the code listing in Figure 7.11. An example of the output is shown in Figure 7.12. Note that we terminate the evaluation of the value in the inner loop after a maximum of `maxIter` iterations. This is done to make the example more responsive—you can zoom, translate, and change the value of `c` using the mouse buttons. By default `maxIter = 10`, but you can modify this value by pressing 1 to 9 on the keyboard.

```cpp
void computeFractal(const e2ga::vector &translation, const e2ga::vector &c,
    mv::Float zoom, int maxIter,
    std::vector<unsigned char> &rgbBuffer, int width, int height)
{
    int idx = 0;
    // we use e = e1 ('__e1_ct__' stands for 'e1 constant type')
    __e1_ct__ e;
    // for each pixel in the image, evaluate fractal function:
    for (int imageY = 0; imageY < height; imageY++) {
        for (int imageX = 0; imageX < width; imageX++) {
            float imageXf = (float)(imageX - width/2);
            float imageYf = (float)(imageY - height/2);
            e2ga::vector p(vector_e1_e2, imageXf, imageYf);
            e2ga::vector x = _vector(zoom * p - translation);
            for (int i = 0; i < maxIter; i++) {
                x = _vector(x * e * x + c); // p = 2
                if (_Float(norm_e2(x)) > 1e4f) break; //1e4 = 'infinity'
            }
            // convert to grey-scale value:
            float valF = _Float(norm_e(x)) /10.0f;
            unsigned char val = (valF > 255) ? 255 : (unsigned char)(valF + 0.5f);
            rgbBuffer[idx + 0] = rgbBuffer[idx + 1] = rgbBuffer[idx + 2] = val;
            idx += 3;
        }
    }
}
```

> **Figure 7.11:** 2-D Julia fractal code.

> **Figure 7.12:** A 2-D Julia fractal, computed using the geometric product of real vectors.

#### Exercise 5a

Experiment with changing the power $p$ in the fractal algorithm. You first need to derive the corresponding vector update equation!

#### Exercise 5b

If you are feeling adventurous, try implementing the $n$-D version.

> **Figure 7.13:** A 3-D Julia fractal. Image from [37], by courtesy of the Lasenby family.

### 7.10.6 Extra Example: Rotations Used in Our User Interface

The following code is used to orbit the scene in a lot of different examples:

```cpp
// Called by GLUT when mouse is dragged:
void MouseMotion(int x, int y) {
    e3ga::vector mousePos = mousePosToVector(x, y);
    e3ga::vector motion = _vector(mousePos - g_prevMousePos);
    
    // update rotor
    if (g_rotateModelOutOfPlane)
        g_modelRotor = _rotor(e3ga::exp(0.005f * (motion ^ e3ga::e3))
            * g_modelRotor);
    else g_modelRotor = _rotor(e3ga::exp(0.00001f * (motion ^ mousePos))
        * g_modelRotor);
    
    // remember mouse pos for next motion:
    g_prevMousePos = mousePos;
}
```

The function starts with determining the mouse motion relative to the previous mouse event. Since it ends with storing the current mouse position for the next mouse event, the interesting part must be in the middle.

The middle section of the function updates the `g_modelRotor` in one of two different ways, depending on the value of the boolean `g_rotateModelOutOfPlane`:

1. If `g_rotateModelOutOfPlane` is `false`, the rotation is in the screen plane. The updating rotor is formed by computing the exponent of the 2-blade spanned by the `motion` and the `mousePos`.

2. If `g_rotateModelOutOfPlane` is `true`, the rotation is outside the screen plane. The updating rotor is formed by computing the exponent of the 2-blade spanned by the `motion` and the vector `e3`, which is orthogonal to the screen plane.
