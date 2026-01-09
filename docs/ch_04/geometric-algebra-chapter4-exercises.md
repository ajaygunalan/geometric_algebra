# Chapter 4: Linear Transformations on Subspaces — Exercises

---

## Structural Exercise 1

### 1. Problem Statement

Show that a **mirror reflection in a plane** in 3D reverses the **orientation of volume 3-blades** (just like point mirroring / spatial inversion does).

### 2. Fundamentals

**Core GA concept:** Linear transformations extended as **outermorphisms**; behavior of **pseudoscalars / 3-blades** under transformations.

**Relevant properties:**

- Outermorphism: $f[A \wedge B] = f[A] \wedge f[B]$
- In 3D, any nonzero 3-blade is a scalar multiple of the pseudoscalar $I_3$
- Reflection in a plane keeps vectors in the plane fixed and flips the normal direction

### 3. Hypothesis

A mirror reflection should preserve the mirror plane but flip the "handedness" of 3D space, so we expect the 3D pseudoscalar (and hence any volume 3-blade) to pick up a **minus sign**: determinant $-1$ and orientation reversal.

### 4. Methodology

Let the mirror plane through the origin be represented by a nonzero 2-blade $B$. Let $a$ be a nonzero vector perpendicular to that plane (the hint suggests $a = B^{*}$, i.e., dual to the plane).

Define the mirror reflection $r$ (a linear map) by specifying its action on vectors:

- If $x$ lies in the plane, then $r[x] = x$. In particular, if $B = b_1 \wedge b_2$, then $r[b_1] = b_1$, $r[b_2] = b_2$, hence

$$r[B] = r[b_1 \wedge b_2] = r[b_1] \wedge r[b_2] = b_1 \wedge b_2 = B$$

by outermorphism.

- If $a$ is perpendicular to the plane, reflection flips it: $r[a] = -a$.

Now choose a "sensible" 3-blade built from the plane and its normal:

$$I_3 \equiv a \wedge B$$

Apply the outermorphism property:

$$r[I_3] = r[a \wedge B] = r[a] \wedge r[B] = (-a) \wedge B = -(a \wedge B) = -I_3$$

So the reflection negates the pseudoscalar.

**Why this generalizes:** In 3D, every 3-blade $V$ is $V = \lambda I_3$ for some scalar $\lambda$. Since $r[\lambda] = \lambda$ and $r[I_3] = -I_3$:

$$r[V] = r[\lambda I_3] = \lambda r[I_3] = -\lambda I_3 = -V$$

So *all* volume 3-blades reverse orientation.

### 5. Final Answer

$$\boxed{r[I_3] = -I_3 \quad \text{and hence} \quad r[V] = -V \text{ for every 3-blade } V}$$

> [!tip] Geometric Interpretation
> A mirror reflection preserves the mirror plane but reverses the handedness of 3D volume (orientation flip). This is captured cleanly because the reflection is extended as an **outermorphism**, so acting on $a \wedge B$ is just "reflect each factor and wedge."

---

## Structural Exercise 2

### 1. Problem Statement

In 2D with basis $\{b_1, b_2\}$, let $f[b_1] = x$ and $f[b_2] = y$, and expand:

$$x = x_1 b_1 + x_2 b_2, \qquad y = y_1 b_1 + y_2 b_2$$

Compute $\det(f)$ via the GA definition $f[I_2] = \det(f)\,I_2$, and show it matches the classical matrix determinant.

### 2. Fundamentals

**Core GA concept:** Determinant defined by action on pseudoscalar.

**Relevant properties:**

- $I_2 = b_1 \wedge b_2$
- Outermorphism: $f[b_1 \wedge b_2] = f[b_1] \wedge f[b_2] = x \wedge y$
- Bilinearity and antisymmetry: $b_i \wedge b_i = 0$, $b_2 \wedge b_1 = -b_1 \wedge b_2$

### 3. Methodology

Start from the determinant definition:

$$f[I_2] = \det(f)\,I_2$$

But $I_2 = b_1 \wedge b_2$, so:

$$f[I_2] = f[b_1 \wedge b_2] = f[b_1] \wedge f[b_2] = x \wedge y$$

Compute $x \wedge y$:

$$\begin{aligned}
x \wedge y &= (x_1 b_1 + x_2 b_2) \wedge (y_1 b_1 + y_2 b_2) \\
&= x_1 y_1\, b_1 \wedge b_1 + x_1 y_2\, b_1 \wedge b_2 + x_2 y_1\, b_2 \wedge b_1 + x_2 y_2\, b_2 \wedge b_2 \\
&= 0 + x_1 y_2\, b_1 \wedge b_2 + x_2 y_1(-b_1 \wedge b_2) + 0 \\
&= (x_1 y_2 - x_2 y_1)(b_1 \wedge b_2)
\end{aligned}$$

Thus $x \wedge y = (x_1 y_2 - x_2 y_1) I_2$. Comparing with $f[I_2] = \det(f) I_2$ gives:

$$\det(f) = x_1 y_2 - x_2 y_1$$

Now classical determinant: the matrix of $f$ in the basis $\{b_1, b_2\}$ has columns given by coordinates of $f[b_1] = x$ and $f[b_2] = y$:

$$[[f]] = \begin{pmatrix} x_1 & y_1 \\ x_2 & y_2 \end{pmatrix}$$

whose determinant is $x_1 y_2 - x_2 y_1$. ✓

### 4. Final Answer

$$\boxed{\det(f) = x_1 y_2 - x_2 y_1}$$

> [!tip] Geometric Interpretation
> $\det(f)$ is the signed area scaling of the pseudoscalar $I_2$. The match with the classical determinant happens because the determinant is fundamentally a property of the **linear map**, not of its matrix representation.

---

## Structural Exercise 3

### 1. Problem Statement

Why can't we define the "determinant of $f$ on a $k$-dimensional subspace" by simply replacing $I_n$ with a $k$-pseudoscalar $I_k$ in the definition $f[I_n] = \det(f) I_n$?

### 2. Fundamentals

**Key facts:**

- The space of $n$-blades in an $n$-D space is **1-dimensional**, so any pseudoscalar is a scalar multiple of any other. That's exactly why $f[I_n]$ must be proportional to $I_n$.
- For $k < n$, the space $\bigwedge^k \mathbb{R}^n$ has dimension $\binom{n}{k} > 1$.

### 3. Methodology

The determinant definition relies on this key step: since $\bigwedge^n \mathbb{R}^n$ is 1D, for any linear map $f$ we must have:

$$f[I_n] = \delta I_n$$

and that scalar $\delta$ is $\det(f)$.

If we try the same with $I_k$ for $k < n$, we would require:

$$f[I_k] \stackrel{?}{=} \delta I_k$$

for *a fixed* $k$-blade $I_k$.

But generically:

1. **The image subspace changes.** A $k$-blade encodes a specific oriented $k$-subspace. A general linear map sends that subspace to a different $k$-subspace. So $f[I_k]$ has a different attitude than $I_k$, hence cannot be a scalar multiple of $I_k$ unless the subspace is invariant.

2. **Even within $\bigwedge^k \mathbb{R}^n$, there is room to "mix."** Because $\dim(\bigwedge^k \mathbb{R}^n) > 1$, a linear map on vectors induces a linear map on $k$-vectors that can rotate/mix basis $k$-blades. Proportionality to a single chosen $I_k$ is *not forced*.

### 4. Final Answer

$$\boxed{\text{Replacing } I_n \text{ by } I_k \text{ fails because for } k < n,\ f[I_k] \text{ need not be proportional to } I_k}$$

> [!tip] Geometric Interpretation
> $\det(f)$ is special because it measures scaling of **top-dimensional volume**, where "volume elements" form a 1D space. For lower-grade blades, outermorphisms preserve grade but can change the *attitude* within that grade space, so no single scalar captures the action.

---

## Structural Exercise 4

### 1. Problem Statement

In the plane $a \wedge b$, a linear map is defined by:

$$f[a] = 5a - 3b, \qquad f[b] = 3a - 5b$$

1. Find eigenvectors and eigenvalues using classical linear algebra
2. Using GA, find $\det(f)$ and an eigen-2-blade with its eigenvalue
3. Interpret the geometry

### 2. Methodology

#### (A) Classical Eigenvectors/Eigenvalues

Relative to basis $\{a, b\}$, the matrix has columns given by $f[a]$ and $f[b]$:

$$A = \begin{pmatrix} 5 & 3 \\ -3 & -5 \end{pmatrix}$$

Characteristic polynomial:

$$\det(A - \lambda I) = (5-\lambda)(-5-\lambda) - (3)(-3) = \lambda^2 - 25 + 9 = \lambda^2 - 16$$

So $\lambda = \pm 4$.

**Eigenvector for $\lambda = 4$:** Solve $(A - 4I)v = 0$:

$$A - 4I = \begin{pmatrix} 1 & 3 \\ -3 & -9 \end{pmatrix}, \quad x + 3y = 0 \Rightarrow x = -3y$$

So one eigenvector is $v_{+} = -3a + b$.

**Eigenvector for $\lambda = -4$:** Solve $(A + 4I)v = 0$:

$$A + 4I = \begin{pmatrix} 9 & 3 \\ -3 & -1 \end{pmatrix}, \quad 9x + 3y = 0 \Rightarrow x = -\frac{y}{3}$$

So one eigenvector is $v_{-} = -a + 3b$.

#### (B) Determinant and Eigen-2-blade via GA

Let $I_2 = a \wedge b$. By outermorphism:

$$f[I_2] = f[a \wedge b] = f[a] \wedge f[b]$$

Compute:

$$\begin{aligned}
f[a] \wedge f[b] &= (5a - 3b) \wedge (3a - 5b) \\
&= 15(a \wedge a) - 25(a \wedge b) - 9(b \wedge a) + 15(b \wedge b) \\
&= 0 - 25(a \wedge b) + 9(a \wedge b) + 0 \\
&= -16\,I_2
\end{aligned}$$

Thus $\det(f) = -16$, and $I_2$ is an eigen-2-blade with eigenvalue $-16$.

### 3. Final Answers

$$\boxed{\lambda_1 = 4,\ v_{+} = b - 3a; \qquad \lambda_2 = -4,\ v_{-} = 3b - a}$$

$$\boxed{\det(f) = -16 \quad \text{and} \quad f[a \wedge b] = -16(a \wedge b)}$$

> [!tip] Geometric Interpretation
> Along one eigenline the map scales by $+4$; along the other it scales by $-4$ (scale by 4 plus a flip). The area element $a \wedge b$ is scaled by $-16$: area magnified by 16 and orientation reversed (negative determinant). The **outermorphism** turns the vector-level map into a clean statement about oriented area/volume elements.

---

## Structural Exercise 5

### 1. Problem Statement

Construct a non-identity linear map $f: \mathbb{R}^2 \to \mathbb{R}^2$ that has:

- An **eigenvector** with eigenvalue $1$, and
- An **eigen-2-blade** with eigenvalue $1$

### 2. Fundamentals

In 2D, an eigen-2-blade with eigenvalue $1$ means $\det(f) = 1$.

### 3. Methodology

Take a basis $\{e_1, e_2\}$ for $\mathbb{R}^2$. Define a **shear**:

$$f[e_1] = e_1, \qquad f[e_2] = e_2 + e_1$$

This is linear and nontrivial since $f[e_2] \neq e_2$.

**Eigenvector:** Clearly $e_1$ is an eigenvector with eigenvalue $1$, since $f[e_1] = 1 \cdot e_1$.

**Eigen-2-blade:** Let $I_2 = e_1 \wedge e_2$. Then:

$$f[I_2] = f[e_1 \wedge e_2] = f[e_1] \wedge f[e_2] = e_1 \wedge (e_2 + e_1) = e_1 \wedge e_2 + e_1 \wedge e_1 = I_2$$

So $I_2$ is an eigen-2-blade with eigenvalue $1$ (equivalently $\det(f) = 1$).

### 4. Final Answer

$$\boxed{f[e_1] = e_1, \quad f[e_2] = e_2 + e_1}$$

> [!tip] Geometric Interpretation
> This is a shear that fixes the $e_1$-direction and slides parallel to it. It preserves oriented area ($f[I_2] = I_2$) because the outermorphism preserves the wedge structure and the added $e_1$ term wedges to zero.

---

## Structural Exercise 6

### 1. Problem Statement

Explain why the rule $f[A * B] = A * B$ does **not** imply that every linear map preserves norms (i.e., does not imply $A * A^{\sim}$ is invariant). Give the correct formula for the squared norm of $f[A]$.

### 2. Fundamentals

- Scalar product transformation: $f[A * B] = A * B$
- Outermorphisms satisfy $f[\alpha] = \alpha$ for scalars $\alpha$
- Norm of a blade $A$ is $A * A^{\sim}$ (a scalar)

### 3. Methodology

The statement $f[A * B] = A * B$ is telling you: **if you first compute a scalar, $f$ does nothing to it** (since scalars are fixed).

But the squared norm of the transformed blade is:

$$|f[A]|^2 = f[A] * (f[A])^{\sim}$$

This is **not** the same scalar as $A * A^{\sim}$ in general.

**Counterexample:** Uniform scaling $f[x] = \alpha x$. Then:

$$f[x] * f[x] = (\alpha x) * (\alpha x) = \alpha^2(x * x)$$

So norms change unless $|\alpha| = 1$.

### 4. Final Answer

$$\boxed{|f[A]|^2 = f[A] * (f[A])^{\sim} \text{ (not generally equal to } A * A^{\sim}\text{)}}$$

> [!tip] Geometric Interpretation
> $f[A * B] = A * B$ only says "scalars are invariant under $f$." It does **not** say that the scalar produced by the *transformed* blades equals the scalar produced by the original blades. This is exactly why the chapter introduces the adjoint $\bar{f}$: to correctly describe how metric-dependent products behave under an outermorphism.

---

## Structural Exercise 7

### 1. Problem Statement

Rewrite the squared norm of the transformed blade $f[A]$ in the form:

$$|f[A]|^2 = A * g[A^{\sim}]$$

and determine $g$ in terms of $f$. Interpret $g$ as the induced metric mapping.

### 2. Fundamentals

- The **adjoint** $\bar{f}$ satisfies $\bar{f}[X] * Y = X * f[Y]$
- Reversion commutes with an outermorphism on blades: $(f[A])^{\sim} = f[A^{\sim}]$

### 3. Methodology

Start with the squared norm:

$$|f[A]|^2 = f[A] * (f[A])^{\sim}$$

Use reversion-commutation:

$$(f[A])^{\sim} = f[A^{\sim}]$$

So:

$$|f[A]|^2 = f[A] * f[A^{\sim}]$$

Using the adjoint identity with $U = f[A]$ and $Z = f[A^{\sim}]$:

$$f[A] * f[A^{\sim}] = A * \bar{f}[f[A^{\sim}]]$$

Thus:

$$|f[A]|^2 = A * (\bar{f} \circ f)[A^{\sim}]$$

So we can identify:

$$g = \bar{f} \circ f$$

### 4. Final Answer

$$\boxed{|f[A]|^2 = A * (\bar{f} \circ f)[A^{\sim}], \quad \text{so} \quad g = \bar{f} \circ f}$$

> [!tip] Geometric Interpretation
> $g$ is the "metric seen in the original coordinates after applying $f$." It is exactly the GA version of the familiar $G' = A^T G A$ idea: the outermorphism $f$ changes lengths/angles unless it is orthogonal, and $g = \bar{f} f$ captures that metric distortion in a coordinate-free way.

---

## Structural Exercise 8

### 1. Problem Statement

Show that for an orthogonal transformation, the metric mapping $g$ from Exercise 7 is the identity, so orthogonal transformations preserve norms and cosines of angles.

### 2. Fundamentals

- Orthogonal transformations satisfy $\bar{f} = f^{-1}$
- From Exercise 7: $g = \bar{f} \circ f$

### 3. Methodology

For orthogonal $f$:

$$\bar{f} = f^{-1}$$

Therefore the metric mapping:

$$g = \bar{f} \circ f = f^{-1} \circ f = \text{id}$$

Plugging into Exercise 7:

$$|f[A]|^2 = A * g[A^{\sim}] = A * A^{\sim}$$

So norms are preserved.

For angles: cosine between vectors $u, v$ is $\frac{u \cdot v}{|u||v|}$. Orthogonality gives $f[u] \cdot f[v] = u \cdot v$ and norms are preserved, so cosines of angles are preserved.

### 4. Final Answer

$$\boxed{\text{If } f \text{ is orthogonal, then } g = \bar{f} \circ f = \text{id}, \text{ so } |f[A]| = |A| \text{ and angles are preserved}}$$

> [!tip] Geometric Interpretation
> Orthogonal transformations are exactly those outermorphisms that also preserve the **metric products** (contractions/inner products), i.e., they are "innermorphisms" as well as outermorphisms.

---

## Structural Exercise 9

### 1. Problem Statement

In a non-degenerate metric space with basis $\{b_i\}_{i=1}^n$, show that the adjoint $\bar{f}$ can be written as:

$$\bar{f}[x] = \sum_{i=1}^n (x * f[b_i])\,b^i$$

where $\{b^i\}$ is the reciprocal frame.

### 2. Methodology

Start from the defining adjoint identity (vectors):

$$\bar{f}[x] * b = x * f[b] \quad \forall b$$

Choose $b = b_i$. Then:

$$\bar{f}[x] * b_i = x * f[b_i]$$

Now expand $\bar{f}[x]$ in the reciprocal frame:

$$\bar{f}[x] = \sum_{i=1}^n (\bar{f}[x] * b_i)\,b^i$$

Substitute the previous identity:

$$\bar{f}[x] = \sum_{i=1}^n (x * f[b_i])\,b^i$$

### 3. Final Answer

$$\boxed{\bar{f}[x] = \sum_{i=1}^n (x * f[b_i])\,b^i}$$

> [!tip] Geometric Interpretation
> This formula reconstructs the adjoint $\bar{f}$ from how $f$ acts on a basis, using only inner/scalar products—so it's the coordinate-free version of "the adjoint is the transpose."

---

## Structural Exercise 10

### 1. Problem Statement

Prove that an orthogonal transformation has determinant $+1$ or $-1$.

### 2. Fundamentals

- Determinant via pseudoscalar: $f[I_n] = \det(f) I_n$
- Adjoint: $\bar{f}[A] * B = A * f[B]$
- Orthogonal: $\bar{f} = f^{-1}$
- Also: $\det(f^{-1}) = 1/\det(f)$

### 3. Methodology

First show a general fact: $\det(\bar{f}) = \det(f)$.

Take scalar product with $I_n$ and use adjointness:

$$\bar{f}[I_n] * I_n = I_n * f[I_n]$$

Compute both sides:

- Left: $\bar{f}[I_n] * I_n = (\det(\bar{f}) I_n) * I_n = \det(\bar{f})(I_n * I_n)$
- Right: $I_n * f[I_n] = I_n * (\det(f) I_n) = \det(f)(I_n * I_n)$

Since the metric is nondegenerate, $I_n * I_n \neq 0$, so:

$$\det(\bar{f}) = \det(f)$$

Now for orthogonal $f$, we have $\bar{f} = f^{-1}$. Therefore:

$$\det(f) = \det(\bar{f}) = \det(f^{-1}) = \frac{1}{\det(f)}$$

So:

$$\det(f)^2 = 1 \quad \Rightarrow \quad \det(f) = \pm 1$$

### 4. Final Answer

$$\boxed{\text{If } f \text{ is orthogonal, then } \det(f) = \pm 1}$$

> [!tip] Geometric Interpretation
> Orthogonal maps preserve all metric structure, so they preserve $n$-dimensional hypervolume magnitude; the only remaining freedom is whether they preserve or reverse orientation (reflection factor). In outermorphism terms: they map the pseudoscalar to $\pm$ itself.

---

## Structural Exercise 11

### 1. Problem Statement

Give a formula for $\bar{f}[A \lrcorner B]$ (how the adjoint acts on a contraction), using the symmetry of the adjoint definition.

### 2. Fundamentals

Contraction transformation law for a linear map:

$$f[A \lrcorner B] = \bar{f}^{-1}[A] \lrcorner f[B]$$

Adjoint symmetry: $\overline{\bar{f}} = f$ and $\overline{f^{-1}} = (\bar{f})^{-1}$

### 3. Methodology

Apply the contraction transformation rule to the map $\bar{f}$ instead of $f$:

$$\bar{f}[A \lrcorner B] = \overline{\bar{f}}^{-1}[A] \lrcorner \bar{f}[B]$$

But $\overline{\bar{f}} = f$ (adjoint of adjoint gives the original). So:

$$\bar{f}[A \lrcorner B] = f^{-1}[A] \lrcorner \bar{f}[B]$$

### 4. Final Answer

$$\boxed{\bar{f}[A \lrcorner B] = f^{-1}[A] \lrcorner \bar{f}[B]}$$

> [!tip] Geometric Interpretation
> This mirrors the chapter's theme that the outer product transforms simply under an outermorphism, but the contraction needs the adjoint/inverse "metric correction." When the *adjoint map itself* acts on a contraction, the correction naturally involves $f^{-1}$ on the "extracting" blade and $\bar{f}$ on the "container" blade.

---

## Structural Exercise 12

### 1. Problem Statement

Find a linear transformation $f$ and vectors $a, b$ such that the "transformed normal" $f[a \times b]$ is **not parallel** to $f[a] \times f[b]$. Conclude that $f[a \times b]$ is not a valid normal vector to the transformed plane.

### 2. Fundamentals

The cross product is a **dual** of a bivector:

$$a \times b = (a \wedge b)^{*}$$

Duals do **not** transform by the same outermorphism as direct blades:

$$f^{*} = \det(f)\,\bar{f}^{-1}$$

Thus generally $f[a \times b] \neq f[a] \times f[b]$.

### 3. Methodology

Work in $\mathbb{R}^3$ with orthonormal basis $\{e_1, e_2, e_3\}$. Define a shear:

$$f[x] = x + s(x \cdot e_1)e_2 \quad (s \neq 0)$$

Compute the images of basis vectors:

$$f[e_1] = e_1 + se_2, \quad f[e_2] = e_2, \quad f[e_3] = e_3$$

Choose $a = e_1$ and $b = e_3$. Then:

$$a \times b = e_1 \times e_3 = -e_2$$

So:

$$f[a \times b] = f[-e_2] = -e_2 \quad \text{(since } e_2 \cdot e_1 = 0\text{)}$$

Now compute the cross product of the transformed vectors:

$$f[a] \times f[b] = (e_1 + se_2) \times e_3 = e_1 \times e_3 + s(e_2 \times e_3) = -e_2 + se_1$$

That is **not parallel** to $-e_2$ when $s \neq 0$.

Also verify "not a normal": check perpendicularity to $f[a]$:

$$(-e_2) \cdot (e_1 + se_2) = -s \neq 0$$

So $f[a \times b]$ is not perpendicular to the transformed plane.

### 4. Final Answer

$$\boxed{f[x] = x + s(x \cdot e_1)e_2,\ a = e_1,\ b = e_3 \Rightarrow f[a \times b] = -e_2 \not\parallel f[a] \times f[b] = -e_2 + se_1}$$

> [!tip] Geometric Interpretation
> $a \times b$ is a **dual** representation of the plane $a \wedge b$, so it should transform by the dual map $f^{*} = \det(f)\bar{f}^{-1}$, not by $f$ itself. Outermorphisms make direct blades transform cleanly, but dual objects require the adjoint/inverse (cofactor) correction.

---

## Structural Exercise 13

### 1. Problem Statement

For the shear $f_s[x] = x + s(x \cdot e_1)e_2$ (on the standard orthonormal basis of $\mathbb{R}^{n,0}$), compute:

1. The matrix $[[f_s]]$ acting on vectors
2. The matrix $[[f_s^{*}]]$ of the dual mapping $f_s^{*}$

Then verify the geometric meaning by considering a sheared line and its normal.

### 2. Methodology

#### (A) Compute $[[f_s]]$

Apply $f_s$ to basis vectors:

- $f_s[e_1] = e_1 + se_2$ (since $e_1 \cdot e_1 = 1$)
- $f_s[e_2] = e_2$ (since $e_2 \cdot e_1 = 0$)
- For $i \geq 3$: $f_s[e_i] = e_i$

Thus the matrix is:

$$[[f_s]] = \begin{pmatrix} 1 & 0 & 0 & \cdots & 0 \\ s & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \end{pmatrix}$$

It is lower triangular with all diagonal entries $1$, hence $\det(f_s) = 1$.

#### (B) Compute $[[f_s^{*}]]$

By definition: $f_s^{*} = \det(f_s)\,\bar{f}_s^{-1}$

Here $\det(f_s) = 1$, so $f_s^{*} = \bar{f}_s^{-1}$.

In Euclidean orthonormal basis, $[[\bar{f}_s]] = [[f_s]]^T$:

$$[[\bar{f}_s]] = \begin{pmatrix} 1 & s & 0 & \cdots & 0 \\ 0 & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \end{pmatrix}$$

Its inverse is:

$$[[f_s^{*}]] = [[\bar{f}_s]]^{-1} = \begin{pmatrix} 1 & -s & 0 & \cdots & 0 \\ 0 & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \end{pmatrix}$$

#### (C) Verification with a Line and Its Normal

In the $(e_1, e_2)$ plane: a line with direction $d = e_1$ has normal $n = e_2$.

- Sheared direction: $d' = f_s[d] = e_1 + se_2$
- Correctly transformed normal: $n' = f_s^{*}[n] = e_2 - se_1$

Check perpendicularity:

$$n' \cdot d' = (e_2 - se_1) \cdot (e_1 + se_2) = 0 - s + s - 0 = 0 \quad \checkmark$$

If you used the wrong rule $f_s[n] = e_2$, you'd get $e_2 \cdot (e_1 + se_2) = s \neq 0$ — a wrong "normal."

### 3. Final Answer

$$\boxed{[[f_s]] = \begin{pmatrix} 1 & 0 \\ s & 1 \end{pmatrix}, \qquad [[f_s^{*}]] = \begin{pmatrix} 1 & -s \\ 0 & 1 \end{pmatrix}}$$

> [!tip] Geometric Interpretation
> $f_s$ shears directions (direct blades transform by the outermorphism), but normals are dual objects and must transform by $f^{*} = \det(f)\bar{f}^{-1}$. This is exactly the "outermorphism vs dual transformation" message.

---

## Structural Exercise 14

### 1. Problem Statement

Verify that formula (4.18) produces the identity matrix when $f$ is the identity map.

### 2. Fundamentals

Matrix entries expressed via wedge and contraction with $I_n^{-1}$:

$$[[f]]^j{}_i = (b_1 \wedge \cdots \wedge b_{j-1} \wedge f[b_i] \wedge b_{j+1} \wedge \cdots \wedge b_n) \lrcorner I_n^{-1}$$

### 3. Methodology

Let $f = \text{id}$, so $f[b_i] = b_i$. Plug into (4.18):

$$[[f]]^j{}_i = (b_1 \wedge \cdots \wedge b_{j-1} \wedge b_i \wedge b_{j+1} \wedge \cdots \wedge b_n) \lrcorner I_n^{-1}$$

**If $i = j$:** The wedge is exactly $b_1 \wedge \cdots \wedge b_n = I_n$, so:

$$[[f]]^j{}_j = I_n \lrcorner I_n^{-1} = 1$$

**If $i \neq j$:** The wedge contains $b_i$ twice (once in its original position among the $b_k$, and once inserted at position $j$). Hence the wedge is $0$, so:

$$[[f]]^j{}_i = 0$$

Thus $[[f]]^j{}_i = \delta^j{}_i$.

### 4. Final Answer

$$\boxed{\text{For } f = \text{id}, \text{ formula (4.18) yields } [[f]] = I \text{ (i.e., } [[f]]^j{}_i = \delta^j{}_i\text{)}}$$

> [!tip] Geometric Interpretation
> (4.18) encodes "replace $b_j$ by $f[b_i]$ inside the pseudoscalar and compare to the original pseudoscalar." When $f$ is identity, only the "replace by itself" case ($i = j$) reproduces the full pseudoscalar; otherwise you get a repeated vector and hence zero.

---

## Structural Exercise 15

### 1. Problem Statement

Show that the classical inverse formula:

$$[[A]]^{-1} = \frac{\text{adj}([[A]])}{\det([[A]])}$$

is the same as the coordinate-free GA inverse formula:

$$f^{-1}[A] = \frac{f[A \lrcorner I_n^{-1}] \lrcorner I_n}{\det(f)}$$

### 2. Methodology

Work in a basis $\{b_1, \ldots, b_n\}$ with pseudoscalar $I_n = b_1 \wedge \cdots \wedge b_n$.

Apply (4.16) with $A = b_j$:

$$f^{-1}[b_j] = \frac{f[b_j \lrcorner I_n^{-1}] \lrcorner I_n}{\det(f)}$$

**Key observation:** $b_j \lrcorner I_n^{-1}$ is (up to sign) the $(n-1)$-blade obtained by removing $b_j$ from the wedge:

$$b_j \lrcorner I_n^{-1} = (-1)^{j-1} (b_1 \wedge \cdots \wedge \widehat{b_j} \wedge \cdots \wedge b_n)$$

Now apply $f$ as an outermorphism:

$$f[b_j \lrcorner I_n^{-1}] = (-1)^{j-1} f[b_1] \wedge \cdots \wedge \widehat{f[b_j]} \wedge \cdots \wedge f[b_n]$$

This $(n-1)$-blade is precisely the object whose coordinates are the $(n-1) \times (n-1)$ **minors** of $[[f]]$ obtained by deleting the $j$-th column.

Finally, contracting this $(n-1)$-blade into $I_n$ produces a **vector** whose components are exactly the **cofactors** associated with column $j$.

Thus:
- The numerator $f[b_j \lrcorner I_n^{-1}] \lrcorner I_n$ is the **cofactor column** (the $j$-th column of $\text{adj}([[f]])$)
- Dividing by $\det(f)$ gives the $j$-th column of the inverse

### 3. Final Answer

$$\boxed{\text{The GA inverse formula } f^{-1}[A] = \frac{f[A \lrcorner I_n^{-1}] \lrcorner I_n}{\det(f)} \text{ is exactly } [[f]]^{-1} = \frac{\text{adj}([[f]])}{\det([[f]])}}$$

> [!tip] Geometric Interpretation
> Minors/cofactors are not "mysterious algebra tricks"—they are the coordinates of $(n-1)$-dimensional **oriented hyperareas** formed by wedging "all but one" transformed basis vector, and then dualizing back to a vector via contraction with $I_n$.

---

## Structural Exercise 16

### 1. Problem Statement

Give a matrix expression for the dual mapping $f^{*} = \det(f)\,\bar{f}^{-1}$, and explain how this gives geometric meaning to the matrix of minors.

### 2. Methodology

From the dual mapping definition:

$$f^{*} = \det(f)\,\bar{f}^{-1}$$

Take matrices in an orthonormal Euclidean basis:

- $[[\bar{f}]] = [[f]]^T$
- So $[[\bar{f}^{-1}]] = ([[f]]^T)^{-1} = [[f]]^{-T}$

Therefore:

$$[[f^{*}]] = \det([[f]])\,[[f]]^{-T}$$

Now relate to minors. From the classical inverse formula:

$$[[f]]^{-1} = \frac{\text{adj}([[f]])}{\det([[f]])}$$

Multiply by $\det([[f]])$:

$$\det([[f]])\,[[f]]^{-T} = \text{adj}([[f]])^T$$

This is precisely the **cofactor matrix** whose entries are signed minors.

### 3. Final Answer

$$\boxed{[[f^{*}]] = \det([[f]])\,[[f]]^{-T}}$$

> [!tip] Geometric Interpretation
> The cofactor/minor matrix is the linear map that correctly transforms **dual objects** (normals, hyperplane representations, dual blades). Minors are not arbitrary—they encode how $(n-1)$-dimensional hyperarea elements (dual to normals) transform under the outermorphism.

---

## Structural Exercise 17

### 1. Problem Statement

In standard linear algebra, the orthogonal projection of $x$ onto the column space of $B = [b_1 \cdots b_k]$ is:

$$Px = B(B^T B)^{-1} B^T x$$

Show this equals the GA projection formula:

$$P_B[x] = (x \lrcorner B) \lrcorner B^{-1}$$

Then: how would you describe the **outermorphism extension** of this projection in standard linear algebra?

### 2. Methodology

#### (A) Express the GA projection in reciprocal-frame coordinates

Let $B = b_1 \wedge \cdots \wedge b_k$ be the blade spanning the subspace. The orthogonal projection onto $\text{span}\{b_i\}$ can be written using the reciprocal frame $\{b^i\}$ within the subspace:

$$P_B[x] = \sum_{i=1}^k (x \cdot b^i)\,b_i$$

Define the $k \times k$ Gram matrix $G = B^T B$ with $G_{ij} = b_i \cdot b_j$.

The reciprocal vectors satisfy:

$$b^i = \sum_{j=1}^k (G^{-1})_{ij}\,b_j$$

Therefore:

$$P_B[x] = \sum_{i=1}^k \left( \sum_{j=1}^k (G^{-1})_{ij}(x \cdot b_j) \right) b_i$$

In matrix form, the coefficient vector is $G^{-1} B^T x$, so:

$$P_B[x] = B\,G^{-1} B^T x = B(B^T B)^{-1} B^T x$$

which is exactly the standard linear algebra formula. ✓

#### (B) Outermorphism Extension in Standard Linear Algebra

In GA, once $P_B$ is known on vectors, its outermorphism extension is forced:

$$P_B[x_1 \wedge \cdots \wedge x_r] = P_B[x_1] \wedge \cdots \wedge P_B[x_r]$$

In standard linear algebra language, this is exactly the induced linear map on exterior powers:

$$\Lambda^r(P_B): \Lambda^r(\mathbb{R}^n) \to \Lambda^r(\mathbb{R}^n)$$

i.e., apply the projection matrix $P$ to each vector factor and take the wedge. Concretely, it is represented by the **$r$-th compound matrix** of $P$ acting on Plücker/Grassmann coordinates.

### 3. Final Answers

$$\boxed{B(B^T B)^{-1} B^T x = P_B[x] = (x \lrcorner B) \lrcorner B^{-1}}$$

$$\boxed{\text{The "outermorphism extension" in standard linear algebra is the induced map } \Lambda^r(P) \text{ on exterior powers}}$$

> [!tip] Geometric Interpretation
> The matrix projection and GA projection are the same linear map; GA just packages it in a coordinate-free blade formula. The outermorphism principle gives you projections of higher-dimensional subspaces automatically (no "break into basis vectors, project, re-wedge" bookkeeping).
