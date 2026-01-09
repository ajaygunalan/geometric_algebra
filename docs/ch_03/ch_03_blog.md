# Metric Products of Subspaces

Chapter 3 extends the outer product with metric-aware operations: the scalar product, left/right contraction, and duality. These let you do projections, decompositions, and reciprocal frames—all with the same algebraic machinery.

Four examples show how.

---

## Example 1: Gram–Schmidt Orthonormalization

### The Problem

You have a set of linearly independent vectors $v_1, v_2, v_3$ in $\mathbb{R}^3$. You want an **orthonormal** basis $u_1, u_2, u_3$ spanning the same subspace. This is everywhere: building camera frames, tangent frames for shading, local coordinate systems for robotics, QR decomposition, etc.

### Without GA: Classic Gram–Schmidt

$$u_1 = \frac{v_1}{|v_1|}$$

$$\tilde{u}_2 = v_2 - (u_1 \cdot v_2)\,u_1, \quad u_2 = \frac{\tilde{u}_2}{|\tilde{u}_2|}$$

$$\tilde{u}_3 = v_3 - (u_1 \cdot v_3)\,u_1 - (u_2 \cdot v_3)\,u_2, \quad u_3 = \frac{\tilde{u}_3}{|\tilde{u}_3|}$$

Here's a compact C++ implementation:

```cpp
#include <cmath>
#include <stdexcept>

struct Vec3 {
    double x, y, z;
    Vec3 operator+(const Vec3& o) const { return {x+o.x, y+o.y, z+o.z}; }
    Vec3 operator-(const Vec3& o) const { return {x-o.x, y-o.y, z-o.z}; }
    Vec3 operator*(double s) const { return {x*s, y*s, z*s}; }
};

static inline double dot(const Vec3& a, const Vec3& b) {
    return a.x*b.x + a.y*b.y + a.z*b.z;
}

static inline double norm(const Vec3& v) {
    return std::sqrt(dot(v,v));
}

static inline Vec3 normalize(const Vec3& v) {
    double n = norm(v);
    if (n == 0.0) throw std::runtime_error("zero vector");
    return v * (1.0 / n);
}

void gramSchmidt(const Vec3 v[3], Vec3 u[3]) {
    u[0] = normalize(v[0]);

    Vec3 u2 = v[1] - u[0] * dot(u[0], v[1]);
    u[1] = normalize(u2);

    Vec3 u3 = v[2]
            - u[0] * dot(u[0], v[2])
            - u[1] * dot(u[1], v[2]);
    u[2] = normalize(u3);
}
```

This works, but notice what you're doing: you're manually subtracting projections one-by-one, and the formulas get longer as the dimension/basis size grows.

### The GA Way

In GA, orthonormalization uses **outer products** and **contractions**:

```cpp
void computeOrthoVectors(const e3ga::vector nonOrtho[3], e3ga::vector ortho[3]) {
    ortho[0] = unit_e(nonOrtho[0]);

    ortho[1] = unit_e(ortho[0] << (ortho[0] ^ nonOrtho[1]));

    ortho[2] = unit_e((ortho[1] ^ ortho[0]) <<
        (ortho[0] ^ ortho[1] ^ nonOrtho[2]));
}
```

To read this, you need three GA ideas:

1. $a \wedge b$ is the oriented **plane element** (bivector) spanning $a$ and $b$
2. $x \lrcorner B$ ("left contraction", `<<`) removes $x$ from blade $B$, producing the component "most unlike" $x$
3. The contraction of a vector into a bivector has a closed form (eq. 3.17):

$$x \lrcorner (a_1 \wedge a_2) = (x \cdot a_1)a_2 - (x \cdot a_2)a_1$$

Now watch what happens to the "Gram–Schmidt subtraction" step:

Take $u_1$ unit length. Compute:

$$u_1 \lrcorner (u_1 \wedge v_2) = (u_1 \cdot u_1)v_2 - (u_1 \cdot v_2)u_1 = v_2 - (u_1 \cdot v_2)u_1$$

That is *exactly* the classic "remove the component parallel to $u_1$" operation. No ad hoc projection formula—just "contract out the vector from the plane it spans with $v_2$".

### What's Actually Different?

> [!note] Honest Assessment
> **Numerically, GA is not inherently better than Gram–Schmidt.** Dependent vectors still cause trouble; normalization can still blow up.

So what's the gain?

GA turns "orthogonalization" into a **subspace operation**:

1. Form the subspace you care about with $\wedge$
2. Remove what you don't want with $\lrcorner$
3. Normalize

That scales conceptually (and syntactically) as the dimension and grade grow. In linear algebra, the "manual projection subtraction" viewpoint gets messier fast; in GA it stays the same operation applied to higher-grade blades.

---

## Example 2: The Cross Product via Duality

### The Problem

Given two vectors $a, b \in \mathbb{R}^3$, compute a vector perpendicular to both: $a \times b$. Used for normals, torques, angular velocities, intersections, etc.

### Without GA: Coordinate Formula

$$a \times b = \begin{bmatrix} a_y b_z - a_z b_y \\ a_z b_x - a_x b_z \\ a_x b_y - a_y b_x \end{bmatrix}$$

```cpp
Vec3 cross(const Vec3& a, const Vec3& b) {
    return {
        a.y*b.z - a.z*b.y,
        a.z*b.x - a.x*b.z,
        a.x*b.y - a.y*b.x
    };
}
```

Totally fine. Fast. Familiar.

### The GA Way

Chapter 3 defines the cross product as the **dual of the outer product** (eq. 3.28):

$$a \times b = (a \wedge b)^{*} = (a \wedge b) \lrcorner I_3^{-1}$$

The C++ implementation is a one-liner:

```cpp
e3ga::vector crossProduct(const e3ga::vector &a, const e3ga::vector &b) {
    return _vector(dual(a ^ b));
}
```

What does this mean geometrically?

- $a \wedge b$ is not a vector. It's a **bivector**: an oriented plane element with magnitude equal to the area of the parallelogram
- The dual operation maps that plane element to its **orthogonal complement**, which in 3D happens to be a vector (the normal)

> [!tip] Key Insight
> GA tells you: the "real" geometric object here is the **plane** $a \wedge b$. The cross product is what you get after applying a 3D-specific "dual" trick to turn a plane into a normal vector.

### What's Actually Different?

If all you ever do is compute normals in 3D, then honestly: **GA doesn't buy you much**. `dual(a ^ b)` is just a different spelling of the same arithmetic.

But GA changes the story in two important ways:

1. **It makes explicit** that the cross product is a compound concept: **span a plane** then **take an orthogonal complement**. That second step depends on the metric and on being in 3D.

2. **Downstream hacks disappear.** Normal vectors don't transform like ordinary vectors under general linear transforms (you need the inverse-transpose trick). That headache is tied to representing a plane by a vector normal. GA's "bivector is the plane" viewpoint makes those transformations behave more naturally.

**GA doesn't replace the cross product. It explains it, demotes it, and generalizes what you actually meant.**

---

## Example 3: Reciprocal Frames (Biorthogonal Bases)

### The Problem

You have a basis $\{b_1, b_2, b_3\}$ that is **not orthonormal**. You want to express a vector $x$ in that basis:

$$x = x^1 b_1 + x^2 b_2 + x^3 b_3$$

If the basis were orthonormal, you'd just do $x^i = x \cdot b_i$. But it isn't. So you need a **reciprocal basis** $\{b^1, b^2, b^3\}$ such that:

$$b_i \cdot b^j = \delta_i^j$$

and then:

$$x^i = x \cdot b^i$$

### Without GA: Matrix Inverse

Put the basis vectors into a matrix $B$ (as columns):

$$B = [\, b_1 \; b_2 \; b_3 \,]$$

Then coefficients are:

$$x = Bc \quad \Rightarrow \quad c = B^{-1}x$$

The reciprocal basis vectors are the rows of $B^{-1}$ (or columns of $B^{-T}$).

In 3D specifically, there's also the cross-product formula:

$$b^1 = \frac{b_2 \times b_3}{b_1 \cdot (b_2 \times b_3)}, \quad b^2 = \frac{b_3 \times b_1}{b_2 \cdot (b_3 \times b_1)}, \quad b^3 = \frac{b_1 \times b_2}{b_3 \cdot (b_1 \times b_2)}$$

That's already hinting at GA, because it's "orthogonal complement of the other two" plus normalization.

### The GA Way

For an $n$-D basis $b_1, \ldots, b_n$ with pseudoscalar $I = b_1 \wedge \cdots \wedge b_n$:

$$b^i = (-1)^{i-1} (b_1 \wedge \cdots \wedge \hat{b}_i \wedge \cdots \wedge b_n) \lrcorner I^{-1}$$

The hat means "omit $b_i$". Geometrically:

1. Take the subspace spanned by all vectors *except* $b_i$
2. Dualize it within the full spanned space to get a vector orthogonal to those others
3. Normalize it so it dots to 1 with $b_i$

The core algorithm:

```cpp
mv I = IF[0];
for (unsigned int i = 1; i < nbVectors; i++) I ^= IF[i];
if (_Float(norm_r2(I)) == 0.0)
    throw std::string("reciprocalFrame(): vectors are not independent");

mv Ii = inverse(I);

for (unsigned int i = 0; i < nbVectors; i++) {
    mv P = (i & 1) ? -1.0f : 1.0f; // = pow(-1, i)
    for (unsigned int j = 0; j < nbVectors; j++)
        if (j != i) P ^= IF[j];
    RF[i] = _vector(P << Ii);
}
```

### What's Actually Different?

> [!note] Performance Reality
> Computing $I^{-1}$ is basically doing the same algebra as a determinant/adjugate/inverse behind the scenes. In 3D, it's morally the same as the cross-product formula.

The difference is **what the formula is about**:

| Linear Algebra | Geometric Algebra |
|----------------|-------------------|
| "Invert the coordinate transform matrix" | "Each reciprocal vector is the orthogonal complement of the other vectors, normalized inside the spanned subspace" |

The GA viewpoint scales cleanly:
- Works in any dimension $n$
- Coordinate-free (derivable without ever writing components)
- Integrates naturally with other GA operations like projection and meet/join

---

## Example 4: Color Space Conversion Using Reciprocal Frames

### The Problem

Convert an RGB image into a different "RGB-like" coordinate system defined by **measured** color directions.

Scenario: you have red/green/blue LEDs whose captured RGB values are not pure axis-aligned colors. You sample their RGB vectors, treat those as basis vectors, and "unmix" each pixel into components along those measured directions.

### Without GA: Matrix Multiplication

Let the sampled LED colors be $c_R, c_G, c_B$. Put them into a matrix:

$$M = [\, c_R \; c_G \; c_B \,]$$

A pixel color $p$ is:

$$p = M \begin{bmatrix} r \\ g \\ b \end{bmatrix} \quad \Rightarrow \quad \begin{bmatrix} r \\ g \\ b \end{bmatrix} = M^{-1}p$$

So: compute $M^{-1}$ once, then for each pixel multiply and clamp.

### The GA Way

GA expresses this as "compute reciprocal basis, then take dot products."

1. Compute the reciprocal frame:

```cpp
reciprocalFrame(IFcolors, RFcolors, 3);
```

2. For each pixel, convert RGB to a GA vector, then compute coefficients by contracting with reciprocal vectors:

```cpp
e3ga::vector c(vector_e1_e2_e3,
               (float)source[i + 0],
               (float)source[i + 1],
               (float)source[i + 2]);

float red   = _Float(c << g_RFcolors[0]);
float green = _Float(c << g_RFcolors[1]);
float blue  = _Float(c << g_RFcolors[2]);
```

For vectors, the contraction is the dot product, so those are effectively:

$$r = c \cdot b^1, \quad g = c \cdot b^2, \quad b = c \cdot b^3$$

Which is exactly what reciprocal bases are for.

### What's Actually Different?

This is the clearest example where GA is **not** doing something fundamentally new. This is linear algebra "change of basis / unmixing" written in GA clothes.

So why care?

> [!tip] The Value Proposition
> A single mechanism (reciprocal frames) gives you coordinate extraction everywhere, not just in geometry.

Once you have reciprocal vectors, "solve the system" becomes "three inner products per pixel." Invert once (build reciprocal frame), then dot-product forever.

Example 4 also shows GA treating "orthogonal complement subspace" as something you can compute robustly:

```cpp
e3ga::vector white = _vector(unit_e(e1 + e2 + e3));
e3ga::vector O[2];
factorizeBlade(dual(white), O);
```

---

## Summary: Why Does Geometric Algebra Matter?

After these four examples, the pattern should be obvious:

> [!summary] The Pattern
> GA gives you a **unified set of operations on geometric objects**, not just on coordinate arrays.

| Example | Linear Algebra View | GA View |
|---------|---------------------|---------|
| **Gram–Schmidt** | Manual projection subtraction | Contract a vector out of a blade you just spanned |
| **Cross Product** | Magical 3D formula | Dual of an oriented plane element |
| **Reciprocal Bases** | Adjugate/inverse matrix lore | Orthogonal complements normalized by pseudoscalar |
| **Color Conversion** | Invert a mixing matrix | Compute reciprocal frame; coefficients are dot products |

### The Honest Conclusion

**If your world is mostly 3D Euclidean vectors and rigid transforms and you already have stable matrix/quaternion tooling, GA may not pay for itself immediately.** It can feel like extra abstraction, and it can be slower if implemented naively.

But if your world is "geometry-heavy" in the sense that you constantly juggle:

- Vectors *and* planes *and* volumes
- Projections/rejections and orthogonal complements
- Non-orthonormal frames
- Dimension changes (2D embedded in 3D, 3D embedded in higher models)
- And you're tired of special cases like "cross product here, inverse transpose there"

Then GA starts to look less like "a whole new algebra" and more like **the algebra your geometry code has been missing**.

> [!quote] Final Thought
> It's not that GA lets you do things you *couldn't* do before. It's that it lets you do them with the same few operators, in a way that keeps the geometry visible instead of burying it under coordinates.
