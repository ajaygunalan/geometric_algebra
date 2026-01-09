# Chapter 2: Spanning Oriented Subspaces — Exercises

---

## Drill 1

### 1. Problem Statement

Compute several outer products in 3-space and express each result as a linear combination of the Grassmann basis:

$$\{1,\; \mathbf{e}_1, \mathbf{e}_2, \mathbf{e}_3,\; \mathbf{e}_1 \wedge \mathbf{e}_2,\; \mathbf{e}_2 \wedge \mathbf{e}_3,\; \mathbf{e}_3 \wedge \mathbf{e}_1,\; \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3\}$$

### 2. Fundamentals

**Core GA concept:** The **outer product** $(\wedge)$ is a bilinear, associative, antisymmetric product that constructs oriented subspaces (lines → planes → volumes).

**Relevant properties:**

1. **Distributivity:** $\mathbf{a} \wedge (\mathbf{b} + \mathbf{c}) = \mathbf{a} \wedge \mathbf{b} + \mathbf{a} \wedge \mathbf{c}$
2. **Scaling:** $\mathbf{a} \wedge (\beta \mathbf{b}) = \beta(\mathbf{a} \wedge \mathbf{b})$
3. **Antisymmetry (vectors):** $\mathbf{a} \wedge \mathbf{b} = -\mathbf{b} \wedge \mathbf{a}$, hence $\mathbf{a} \wedge \mathbf{a} = 0$
4. **Associativity:** $(\mathbf{a} \wedge \mathbf{b}) \wedge \mathbf{c} = \mathbf{a} \wedge (\mathbf{b} \wedge \mathbf{c})$

### 3. Hypothesis

- (a)–(d) are vector∧vector → expect **bivectors** (grade 2)
- (e)–(f) involve bivector∧vector → expect **trivectors** (grade 3) or zero if repeated basis vectors appear

### 4. Methodology

#### (a) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_1 + \mathbf{e}_3)$

Distribute:

$$(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_1 + \mathbf{e}_3) = \mathbf{e}_1 \wedge \mathbf{e}_1 + \mathbf{e}_1 \wedge \mathbf{e}_3 + \mathbf{e}_2 \wedge \mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3$$

Simplify using $\mathbf{e}_i \wedge \mathbf{e}_i = 0$:

$$= 0 + \mathbf{e}_1 \wedge \mathbf{e}_3 + \mathbf{e}_2 \wedge \mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3$$

Rewrite $\mathbf{e}_2 \wedge \mathbf{e}_1 = -\mathbf{e}_1 \wedge \mathbf{e}_2$:

$$= \mathbf{e}_1 \wedge \mathbf{e}_3 - \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3$$

Express $\mathbf{e}_1 \wedge \mathbf{e}_3 = -\mathbf{e}_3 \wedge \mathbf{e}_1$ to match basis:

$$= -\mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3 - \mathbf{e}_3 \wedge \mathbf{e}_1$$

#### (b) $(\mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3) \wedge (2\mathbf{e}_1)$

Pull out scalar:

$$(\mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3) \wedge (2\mathbf{e}_1) = 2\big((\mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3) \wedge \mathbf{e}_1\big)$$

Distribute:

$$= 2\big(\mathbf{e}_1 \wedge \mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_1 + \mathbf{e}_3 \wedge \mathbf{e}_1\big)$$

Simplify:

$$= 2\big(0 + \mathbf{e}_2 \wedge \mathbf{e}_1 + \mathbf{e}_3 \wedge \mathbf{e}_1\big)$$

$$= 2\big(-\mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_3 \wedge \mathbf{e}_1\big) = -2\,\mathbf{e}_1 \wedge \mathbf{e}_2 + 2\,\mathbf{e}_3 \wedge \mathbf{e}_1$$

#### (c) $(\mathbf{e}_1 - \mathbf{e}_2) \wedge (\mathbf{e}_1 - \mathbf{e}_3)$

Distribute:

$$(\mathbf{e}_1 - \mathbf{e}_2) \wedge (\mathbf{e}_1 - \mathbf{e}_3) = \mathbf{e}_1 \wedge \mathbf{e}_1 - \mathbf{e}_1 \wedge \mathbf{e}_3 - \mathbf{e}_2 \wedge \mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3$$

$$= 0 - \mathbf{e}_1 \wedge \mathbf{e}_3 - \mathbf{e}_2 \wedge \mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3$$

Convert to basis ordering:

$$= \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3 + \mathbf{e}_3 \wedge \mathbf{e}_1$$

#### (d) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (0.5\,\mathbf{e}_1 + 2\,\mathbf{e}_2 + 3\,\mathbf{e}_3)$

For $\mathbf{e}_1$:

$$\mathbf{e}_1 \wedge (0.5\,\mathbf{e}_1 + 2\,\mathbf{e}_2 + 3\,\mathbf{e}_3) = 0 + 2\,\mathbf{e}_1 \wedge \mathbf{e}_2 - 3\,\mathbf{e}_3 \wedge \mathbf{e}_1$$

For $\mathbf{e}_2$:

$$\mathbf{e}_2 \wedge (0.5\,\mathbf{e}_1 + 2\,\mathbf{e}_2 + 3\,\mathbf{e}_3) = -0.5\,\mathbf{e}_1 \wedge \mathbf{e}_2 + 0 + 3\,\mathbf{e}_2 \wedge \mathbf{e}_3$$

Add:

$$= \tfrac{3}{2}\,\mathbf{e}_1 \wedge \mathbf{e}_2 + 3\,\mathbf{e}_2 \wedge \mathbf{e}_3 - 3\,\mathbf{e}_3 \wedge \mathbf{e}_1$$

#### (e) $(\mathbf{e}_1 \wedge \mathbf{e}_2) \wedge (\mathbf{e}_1 + \mathbf{e}_3)$

Distribute:

$$(\mathbf{e}_1 \wedge \mathbf{e}_2) \wedge (\mathbf{e}_1 + \mathbf{e}_3) = (\mathbf{e}_1 \wedge \mathbf{e}_2) \wedge \mathbf{e}_1 + (\mathbf{e}_1 \wedge \mathbf{e}_2) \wedge \mathbf{e}_3$$

First term is zero (repeated $\mathbf{e}_1$):

$$= 0 + \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$$

#### (f) $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3)$

First part: $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_1 \wedge \mathbf{e}_2) = 0$ (both terms have repeated vectors)

Second part: $(\mathbf{e}_1 + \mathbf{e}_2) \wedge (\mathbf{e}_2 \wedge \mathbf{e}_3) = \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 + 0$

Sum: $= \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$

### 5. Final Answers

$$\boxed{\begin{aligned}
\text{(a)} &\quad -\mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3 - \mathbf{e}_3 \wedge \mathbf{e}_1 \\[4pt]
\text{(b)} &\quad -2\,\mathbf{e}_1 \wedge \mathbf{e}_2 + 2\,\mathbf{e}_3 \wedge \mathbf{e}_1 \\[4pt]
\text{(c)} &\quad \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_2 \wedge \mathbf{e}_3 + \mathbf{e}_3 \wedge \mathbf{e}_1 \\[4pt]
\text{(d)} &\quad \tfrac{3}{2}\,\mathbf{e}_1 \wedge \mathbf{e}_2 + 3\,\mathbf{e}_2 \wedge \mathbf{e}_3 - 3\,\mathbf{e}_3 \wedge \mathbf{e}_1 \\[4pt]
\text{(e)} &\quad \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 \\[4pt]
\text{(f)} &\quad \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3
\end{aligned}}$$

> [!tip] Geometric Interpretation
> (a)–(d) are oriented **area elements** (bivectors); (e)–(f) are oriented **volume elements** (trivectors). This illustrates how $\wedge$ "spans" higher-dimensional oriented subspaces.

---

## Drill 2

### 1. Problem Statement

Given the 2-blade $\mathbf{B} = \mathbf{e}_1 \wedge (\mathbf{e}_2 - \mathbf{e}_3)$, determine whether each vector lies in that plane by testing $\mathbf{x} \wedge \mathbf{B} = 0$.

### 2. Fundamentals

**Containment test:** $\mathbf{x}$ lies in the plane of $\mathbf{B}$ $\iff$ $\mathbf{x} \wedge \mathbf{B} = 0$

### 3. Methodology

First expand: $\mathbf{B} = \mathbf{e}_1 \wedge \mathbf{e}_2 - \mathbf{e}_1 \wedge \mathbf{e}_3$

#### (a) $\mathbf{x} = \mathbf{e}_1$

$$\mathbf{e}_1 \wedge \mathbf{B} = \mathbf{e}_1 \wedge (\mathbf{e}_1 \wedge (\mathbf{e}_2 - \mathbf{e}_3)) = (\mathbf{e}_1 \wedge \mathbf{e}_1) \wedge (\mathbf{e}_2 - \mathbf{e}_3) = 0$$

#### (b) $\mathbf{x} = \mathbf{e}_1 + \mathbf{e}_2$

We have $\mathbf{e}_1 \wedge \mathbf{B} = 0$ and:

$$\mathbf{e}_2 \wedge \mathbf{B} = \mathbf{e}_2 \wedge \mathbf{e}_1 \wedge (\mathbf{e}_2 - \mathbf{e}_3) = -\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 \neq 0$$

Hence $(\mathbf{e}_1 + \mathbf{e}_2) \wedge \mathbf{B} \neq 0$

#### (c) $\mathbf{x} = \mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3$

From above: $\mathbf{e}_2 \wedge \mathbf{B} = \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$

Similarly: $\mathbf{e}_3 \wedge \mathbf{B} = \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3$

Sum: $= 0 + \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 + \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 = 2\,\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 \neq 0$

#### (d) $\mathbf{x} = 2\mathbf{e}_1 - \mathbf{e}_2 + \mathbf{e}_3$

$$= 2(0) - \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 + \mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 = 0$$

### 4. Final Answers

$$\boxed{\begin{aligned}
\text{(a)} &\quad \mathbf{e}_1 \text{ lies in the plane} \\
\text{(b)} &\quad \mathbf{e}_1 + \mathbf{e}_2 \text{ does NOT lie in the plane} \\
\text{(c)} &\quad \mathbf{e}_1 + \mathbf{e}_2 + \mathbf{e}_3 \text{ does NOT lie in the plane} \\
\text{(d)} &\quad 2\mathbf{e}_1 - \mathbf{e}_2 + \mathbf{e}_3 \text{ lies in the plane}
\end{aligned}}$$

> [!tip] Geometric Interpretation
> $\mathbf{B} = \mathbf{e}_1 \wedge (\mathbf{e}_2 - \mathbf{e}_3)$ spans the plane $\text{span}\{\mathbf{e}_1, \mathbf{e}_2 - \mathbf{e}_3\}$. A vector is in that plane iff it spans **zero volume** with $\mathbf{B}$.

---

## Drill 3

### 1. Problem Statement

Compute the area of the parallelogram spanned by $\mathbf{a} = \mathbf{e}_1 + 2\mathbf{e}_2$ and $\mathbf{b} = -\mathbf{e}_1 - \mathbf{e}_2$ relative to $\mathbf{e}_1 \wedge \mathbf{e}_2$.

### 2. Methodology

$$\mathbf{a} \wedge \mathbf{b} = (\mathbf{e}_1 + 2\mathbf{e}_2) \wedge (-\mathbf{e}_1 - \mathbf{e}_2)$$

First term:

$$\mathbf{e}_1 \wedge (-\mathbf{e}_1 - \mathbf{e}_2) = -\mathbf{e}_1 \wedge \mathbf{e}_1 - \mathbf{e}_1 \wedge \mathbf{e}_2 = -\mathbf{e}_1 \wedge \mathbf{e}_2$$

Second term:

$$2\mathbf{e}_2 \wedge (-\mathbf{e}_1 - \mathbf{e}_2) = -2\mathbf{e}_2 \wedge \mathbf{e}_1 - 2\mathbf{e}_2 \wedge \mathbf{e}_2 = 2\mathbf{e}_1 \wedge \mathbf{e}_2$$

Sum:

$$\mathbf{a} \wedge \mathbf{b} = (-1 + 2)\,\mathbf{e}_1 \wedge \mathbf{e}_2 = \mathbf{e}_1 \wedge \mathbf{e}_2$$

### 3. Final Answer

$$\boxed{\mathbf{a} \wedge \mathbf{b} = \mathbf{e}_1 \wedge \mathbf{e}_2}$$

The **signed area** is $+1$, and the **unsigned area** is $|1| = 1$.

> [!tip] Geometric Interpretation
> The parallelogram spanned by $\mathbf{a}$ and $\mathbf{b}$ has the **same area and orientation** as the reference parallelogram $\mathbf{e}_1 \wedge \mathbf{e}_2$.

---

## Drill 4

### 1. Problem Statement

Using 2-blades, compute the intersection point $\mathbf{x}$ of:
- Line $L$: position $\mathbf{p} = \mathbf{e}_1$, direction $\mathbf{u} = \mathbf{e}_2$
- Line $M$: position $\mathbf{q} = \mathbf{e}_2$, direction $\mathbf{v} = \mathbf{e}_1 + \mathbf{e}_2$

Also determine if $\{\mathbf{e}_1, \mathbf{e}_2\}$ must be orthonormal.

### 2. Methodology

Use the intersection formula (Eq. 2.7):

$$\mathbf{x} = \frac{\mathbf{q} \wedge \mathbf{v}}{\mathbf{u} \wedge \mathbf{v}}\,\mathbf{u} + \frac{\mathbf{p} \wedge \mathbf{u}}{\mathbf{v} \wedge \mathbf{u}}\,\mathbf{v}$$

Compute bivectors:

$$\mathbf{u} \wedge \mathbf{v} = \mathbf{e}_2 \wedge (\mathbf{e}_1 + \mathbf{e}_2) = -\mathbf{e}_1 \wedge \mathbf{e}_2$$

$$\mathbf{v} \wedge \mathbf{u} = \mathbf{e}_1 \wedge \mathbf{e}_2$$

$$\mathbf{p} \wedge \mathbf{u} = \mathbf{e}_1 \wedge \mathbf{e}_2$$

$$\mathbf{q} \wedge \mathbf{v} = \mathbf{e}_2 \wedge (\mathbf{e}_1 + \mathbf{e}_2) = -\mathbf{e}_1 \wedge \mathbf{e}_2$$

Form ratios:

$$\frac{\mathbf{q} \wedge \mathbf{v}}{\mathbf{u} \wedge \mathbf{v}} = \frac{-\mathbf{e}_1 \wedge \mathbf{e}_2}{-\mathbf{e}_1 \wedge \mathbf{e}_2} = 1, \qquad \frac{\mathbf{p} \wedge \mathbf{u}}{\mathbf{v} \wedge \mathbf{u}} = \frac{\mathbf{e}_1 \wedge \mathbf{e}_2}{\mathbf{e}_1 \wedge \mathbf{e}_2} = 1$$

Substitute:

$$\mathbf{x} = 1 \cdot \mathbf{u} + 1 \cdot \mathbf{v} = \mathbf{e}_2 + (\mathbf{e}_1 + \mathbf{e}_2) = \mathbf{e}_1 + 2\mathbf{e}_2$$

### 3. Final Answer

$$\boxed{\mathbf{x} = \mathbf{e}_1 + 2\mathbf{e}_2}$$

$$\boxed{\text{No, orthonormality is NOT required.}}$$

> [!tip] Geometric Interpretation
> The computation uses only the **outer product** (no metric). Ratios of coplanar bivectors are scalar ratios of oriented areas, not dot products.

---

## Drill 5

### 1. Problem Statement

Compute $(2 + 3\mathbf{e}_3) \wedge (\mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3)$ using grade-based defining equations.

### 2. Methodology

Decompose into grade parts:

$$A = 2 + 3\mathbf{e}_3: \quad \langle A \rangle_0 = 2, \quad \langle A \rangle_1 = 3\mathbf{e}_3$$

$$B = \mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3: \quad \langle B \rangle_1 = \mathbf{e}_1, \quad \langle B \rangle_2 = \mathbf{e}_2 \wedge \mathbf{e}_3$$

Expand:

$$A \wedge B = \langle A \rangle_0 \wedge \langle B \rangle_1 + \langle A \rangle_0 \wedge \langle B \rangle_2 + \langle A \rangle_1 \wedge \langle B \rangle_1 + \langle A \rangle_1 \wedge \langle B \rangle_2$$

Compute each term:

1. $2 \wedge \mathbf{e}_1 = 2\mathbf{e}_1$
2. $2 \wedge (\mathbf{e}_2 \wedge \mathbf{e}_3) = 2(\mathbf{e}_2 \wedge \mathbf{e}_3)$
3. $(3\mathbf{e}_3) \wedge \mathbf{e}_1 = 3(\mathbf{e}_3 \wedge \mathbf{e}_1)$
4. $(3\mathbf{e}_3) \wedge (\mathbf{e}_2 \wedge \mathbf{e}_3) = 3\,\mathbf{e}_3 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 = 0$ (repeated $\mathbf{e}_3$)

### 3. Final Answer

$$\boxed{(2 + 3\mathbf{e}_3) \wedge (\mathbf{e}_1 + \mathbf{e}_2 \wedge \mathbf{e}_3) = 2\mathbf{e}_1 + 2\,\mathbf{e}_2 \wedge \mathbf{e}_3 + 3\,\mathbf{e}_3 \wedge \mathbf{e}_1}$$

---

## Structural Exercise 1

### Problem

In $\mathbb{R}^2$ with Euclidean metric, choose an orthonormal basis $\{\mathbf{e}_1, \mathbf{e}_2\}$ with $\mathbf{e}_1 \parallel \mathbf{a}$. Write:

$$\mathbf{a} = \alpha\,\mathbf{e}_1, \qquad \mathbf{b} = \beta(\cos\varphi\,\mathbf{e}_1 + \sin\varphi\,\mathbf{e}_2)$$

Evaluate $\mathbf{a} \wedge \mathbf{b}$.

### Solution

$$\mathbf{a} \wedge \mathbf{b} = (\alpha\mathbf{e}_1) \wedge \Big(\beta(\cos\varphi\,\mathbf{e}_1 + \sin\varphi\,\mathbf{e}_2)\Big)$$

$$= \alpha\beta\;\mathbf{e}_1 \wedge (\cos\varphi\,\mathbf{e}_1 + \sin\varphi\,\mathbf{e}_2)$$

$$= \alpha\beta\big(\cos\varphi\,\underbrace{\mathbf{e}_1 \wedge \mathbf{e}_1}_{=0} + \sin\varphi\,(\mathbf{e}_1 \wedge \mathbf{e}_2)\big)$$

$$\boxed{\mathbf{a} \wedge \mathbf{b} = \alpha\beta\sin\varphi\;(\mathbf{e}_1 \wedge \mathbf{e}_2)}$$

> [!tip] Geometric Interpretation
> The scalar $\alpha\beta\sin\varphi$ is the **signed area** of the parallelogram: length($\mathbf{a}$) × length($\mathbf{b}$) × sine of oriented angle.

---

## Structural Exercise 2

### Problem

Reconcile Eq. (2.14) $\mathbf{a} \wedge \mathbf{b} = \alpha\beta\sin\varphi\;(\mathbf{e}_1 \wedge \mathbf{e}_2)$ with Eq. (2.2) $\mathbf{a} \wedge \mathbf{b} = (a_1b_2 - a_2b_1)\;(\mathbf{e}_1 \wedge \mathbf{e}_2)$.

### Solution

Let $\mathbf{a} = a_1\mathbf{e}_1 + a_2\mathbf{e}_2$ and $\mathbf{b} = b_1\mathbf{e}_1 + b_2\mathbf{e}_2$ in orthonormal basis.

Using the identity:

$$(a_1b_2 - a_2b_1)^2 + (a_1b_1 + a_2b_2)^2 = (a_1^2 + a_2^2)(b_1^2 + b_2^2) = \alpha^2\beta^2$$

Since $a_1b_1 + a_2b_2 = \mathbf{a} \cdot \mathbf{b} = \alpha\beta\cos\varphi$:

$$(a_1b_2 - a_2b_1)^2 = \alpha^2\beta^2 - \alpha^2\beta^2\cos^2\varphi = \alpha^2\beta^2\sin^2\varphi$$

With proper orientation convention:

$$\boxed{\alpha\beta\sin\varphi = a_1b_2 - a_2b_1}$$

---

## Structural Exercise 3

### Problem

Compute and simplify $(\mathbf{x} + \mathbf{y}) \wedge (\mathbf{x} - \mathbf{y})$.

### Solution

$$(\mathbf{x} + \mathbf{y}) \wedge (\mathbf{x} - \mathbf{y}) = \mathbf{x} \wedge \mathbf{x} - \mathbf{x} \wedge \mathbf{y} + \mathbf{y} \wedge \mathbf{x} - \mathbf{y} \wedge \mathbf{y}$$

$$= 0 - \mathbf{x} \wedge \mathbf{y} + (-\mathbf{x} \wedge \mathbf{y}) - 0$$

$$\boxed{(\mathbf{x} + \mathbf{y}) \wedge (\mathbf{x} - \mathbf{y}) = -2\,\mathbf{x} \wedge \mathbf{y}}$$

> [!tip] Geometric Interpretation
> The vectors $\mathbf{x} + \mathbf{y}$ and $\mathbf{x} - \mathbf{y}$ are the diagonals of the parallelogram. The transformation matrix has determinant $-2$: area doubles, orientation reverses.

---

## Structural Exercise 4

### Problem

Solve $\mathbf{x} = \alpha\,\mathbf{a} + \beta\,\mathbf{b} + \gamma\,\mathbf{c}$ using outer products.

### Solution

Wedge with $\mathbf{b} \wedge \mathbf{c}$:

$$\mathbf{x} \wedge \mathbf{b} \wedge \mathbf{c} = \alpha\,\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c} + 0 + 0$$

Similarly for $\beta$ (wedge with $\mathbf{c} \wedge \mathbf{a}$) and $\gamma$ (wedge with $\mathbf{a} \wedge \mathbf{b}$):

$$\boxed{\alpha = \frac{\mathbf{x} \wedge \mathbf{b} \wedge \mathbf{c}}{\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}}, \quad \beta = \frac{\mathbf{x} \wedge \mathbf{c} \wedge \mathbf{a}}{\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}}, \quad \gamma = \frac{\mathbf{x} \wedge \mathbf{a} \wedge \mathbf{b}}{\mathbf{a} \wedge \mathbf{b} \wedge \mathbf{c}}}$$

> [!tip] Geometric Interpretation
> This is **Cramer's rule** via oriented volumes: each coefficient is the ratio of oriented volumes (trivectors).

---

## Structural Exercise 5

### Problem

Show that $B = \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_3 \wedge \mathbf{e}_4$ in $\mathbb{R}^4$ is **not** a 2-blade.

### Solution

Assume $\mathbf{a} \wedge \mathbf{b} = B$ for some vectors $\mathbf{a}, \mathbf{b}$.

Matching coefficients requires:

$$a_1b_2 - a_2b_1 = 1 \tag{E12}$$
$$a_3b_4 - a_4b_3 = 1 \tag{E34}$$

And all mixed terms = 0:

$$a_1b_3 - a_3b_1 = 0, \quad a_1b_4 - a_4b_1 = 0, \quad a_2b_3 - a_3b_2 = 0, \quad a_2b_4 - a_4b_2 = 0$$

From the zero constraints:

$$a_3(a_2b_1 - a_1b_2) = 0 \implies a_3(-1) = 0 \implies a_3 = 0$$

$$a_4(a_2b_1 - a_1b_2) = 0 \implies a_4(-1) = 0 \implies a_4 = 0$$

But if $a_3 = a_4 = 0$, then $a_3b_4 - a_4b_3 = 0 \neq 1$. **Contradiction.**

$$\boxed{B = \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_3 \wedge \mathbf{e}_4 \text{ is NOT a 2-blade}}$$

---

## Structural Exercise 6

### Problem

Show that $B = \mathbf{e}_1 \wedge \mathbf{e}_2 + \mathbf{e}_3 \wedge \mathbf{e}_4$ contains no vector other than $\mathbf{0}$.

### Solution

Let $\mathbf{x} = x_1\mathbf{e}_1 + x_2\mathbf{e}_2 + x_3\mathbf{e}_3 + x_4\mathbf{e}_4$.

$$\mathbf{x} \wedge (\mathbf{e}_1 \wedge \mathbf{e}_2) = x_3\,\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_3 + x_4\,\mathbf{e}_1 \wedge \mathbf{e}_2 \wedge \mathbf{e}_4$$

$$\mathbf{x} \wedge (\mathbf{e}_3 \wedge \mathbf{e}_4) = x_1\,\mathbf{e}_1 \wedge \mathbf{e}_3 \wedge \mathbf{e}_4 + x_2\,\mathbf{e}_2 \wedge \mathbf{e}_3 \wedge \mathbf{e}_4$$

$$\mathbf{x} \wedge B = x_3\,\mathbf{e}_{123} + x_4\,\mathbf{e}_{124} + x_1\,\mathbf{e}_{134} + x_2\,\mathbf{e}_{234}$$

These four basis 3-vectors are linearly independent, so $\mathbf{x} \wedge B = 0$ implies:

$$\boxed{x_1 = x_2 = x_3 = x_4 = 0 \implies \mathbf{x} = \mathbf{0}}$$

---

## Structural Exercise 7

### Problem

Prove: A non-zero $k$-vector $A$ contains precisely $k$ independent vectors **iff** $A$ is a $k$-blade.

### Solution

#### (⇒) If $A = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k$ is a blade:

- Each $\mathbf{a}_i \wedge A = 0$ (repeated vector), so $A$ contains all $\mathbf{a}_i$
- Any $\mathbf{x}$ with $\mathbf{x} \wedge A = 0$ must satisfy $\mathbf{x} \wedge \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k = 0$
- This happens iff $\mathbf{x} \in \text{span}\{\mathbf{a}_1, \ldots, \mathbf{a}_k\}$

So $A$ contains exactly the $k$-dimensional subspace.

#### (⇐) If $A$ contains $k$ independent vectors $\mathbf{a}_1, \ldots, \mathbf{a}_k$:

Using $\mathbf{a}_i \wedge A = 0$ for each $i$, expand $A$ in the blade basis and show that only terms containing all $\mathbf{a}_i$ survive. The unique such $k$-blade is $\mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k$.

$$\boxed{A \text{ contains } k \text{ independent vectors } \iff A = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k}$$

---

## Structural Exercise 8

### Problem

Define the **Clifford conjugate** $\overline{A_k} \equiv \widehat{\widetilde{A_k}}$. Derive the sign formula and determine if it's an involution/anti-involution.

### Solution

Using:
- Reversion: $\widetilde{A_k} = (-1)^{k(k-1)/2} A_k$
- Grade involution: $\widehat{A_k} = (-1)^k A_k$

$$\overline{A_k} = \widehat{\widetilde{A_k}} = (-1)^{k(k-1)/2} \cdot (-1)^k A_k = (-1)^{k(k-1)/2 + k} A_k$$

$$\frac{k(k-1)}{2} + k = \frac{k(k-1) + 2k}{2} = \frac{k(k+1)}{2}$$

$$\boxed{\overline{A_k} = (-1)^{k(k+1)/2} A_k}$$

**Involution check:** $\overline{\overline{A_k}} = (-1)^{k(k+1)} A_k = A_k$ since $k(k+1)$ is always even. ✓

**Anti-involution check:** $\overline{A \wedge B} = \overline{B} \wedge \overline{A}$ ✓

---

## Structural Exercise 9

### Problem

Prove the graded-commutativity rule: $A_k \wedge B_\ell = (-1)^{k\ell} B_\ell \wedge A_k$

### Solution

Let $A_k = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k$ and $B_\ell = \mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_\ell$.

$$A_k \wedge B_\ell = \mathbf{a}_1 \wedge \cdots \wedge \mathbf{a}_k \wedge \mathbf{b}_1 \wedge \cdots \wedge \mathbf{b}_\ell$$

To transform to $B_\ell \wedge A_k$, each $\mathbf{b}_i$ must pass all $k$ vectors $\mathbf{a}_j$.

- Moving $\mathbf{b}_1$ past $k$ vectors: $k$ swaps → factor $(-1)^k$
- Moving $\mathbf{b}_2$ past $k$ vectors: $k$ swaps → factor $(-1)^k$
- $\vdots$
- Total: $\ell$ vectors each crossing $k$ → $k\ell$ swaps

$$\boxed{A_k \wedge B_\ell = (-1)^{k\ell} B_\ell \wedge A_k}$$

> [!tip] Consequence
> - **Antisymmetric** when both grades are odd ($k\ell$ odd)
> - **Symmetric** otherwise ($k\ell$ even)
