# Linear Transformations of Subspaces

Chapter 4 shows how linear maps extend to blades via **outermorphisms**: $f[a \wedge b] = f[a] \wedge f[b]$. This explains why normals transform differently than vectors, and how GA makes transformation rules explicit.

Three examples demonstrate this.

---

## Example 1 — Project a Vector onto a Plane

### What problem is being solved?

You have two non-parallel vectors $a, b \in \mathbb{R}^3$ that span a plane through the origin. Given a vector $x$, compute its **orthogonal projection onto that plane**:

$$x_{\parallel} \in \mathrm{span}\{a,b\}$$

This is everywhere in graphics, robotics, and numerical geometry: decomposing motion into "in-plane" vs "out-of-plane", constraint enforcement, etc.

### What would you use without GA?

Most people reach for a **plane normal**.

Let

$$n = \frac{a \times b}{|a \times b|}$$

Then the component of $x$ orthogonal to the plane is its projection onto $n$:

$$x_\perp = (x \cdot n) n$$

So the projection onto the plane is:

$$x_{\parallel} = x - (x \cdot n) n$$

This is the standard textbook trick: project onto the normal, subtract.

A minimal C++ version:

```cpp
struct Vec3 { float x,y,z; };

float dot(const Vec3& a, const Vec3& b) {
    return a.x*b.x + a.y*b.y + a.z*b.z;
}

Vec3 cross(const Vec3& a, const Vec3& b) {
    return { a.y*b.z - a.z*b.y,
             a.z*b.x - a.x*b.z,
             a.x*b.y - a.y*b.x };
}

float norm(const Vec3& v) { return std::sqrt(dot(v,v)); }

Vec3 mul(float s, const Vec3& v) { return {s*v.x, s*v.y, s*v.z}; }
Vec3 add(const Vec3& a, const Vec3& b) { return {a.x+b.x,a.y+b.y,a.z+b.z}; }
Vec3 sub(const Vec3& a, const Vec3& b) { return {a.x-b.x,a.y-b.y,a.z-b.z}; }

Vec3 normalize(const Vec3& v) {
    float inv = 1.0f / norm(v);
    return mul(inv, v);
}

Vec3 projectOntoPlane(const Vec3& x, const Vec3& a, const Vec3& b) {
    Vec3 n = normalize(cross(a, b));       // plane normal
    return sub(x, mul(dot(x, n), n));      // x - (x·n)n
}
```

This works. It's also very specific to **3D**, because it leans on the cross product. In higher dimensions you switch to QR/Gram–Schmidt or a projection matrix $A(A^TA)^{-1}A^T$.

### Now the GA way

GA says: don't convert a plane into a "normal vector" as an intermediate representation. Represent the plane *directly* as a bivector:

$$B = a \wedge b$$

Chapter 4's example uses the projection formula implemented with **left contraction**:

$$P_B(x) = (x \lrcorner B^{-1}) \lrcorner B$$

The code is exactly this:

```cpp
// compute bivector (*4 to make it a bit larger):
bivector B = _bivector(4.0f * g_vectors[0] ^ g_vectors[1]);

// project g_vectors[2] onto the bivector
// The symbol '<<' is the left contraction
e3ga::vector P = _vector((g_vectors[2] << inverse(B)) << B);
```

### What's actually different, and why should you care?

If you only ever do this in 3D, the classic $x - (x \cdot n)n$ formula is hard to beat for familiarity.

So here's the honest take:

- **Does GA make this projection "shorter"?** Not really. The GA one-liner is elegant *after* you know what contraction and blade inverse mean, but it's not "obviously simpler" to a newcomer.
- **Does GA make it "more general"?** Yes. You didn't use a 3D-only cross product. You projected onto a *subspace object* $B$. The same conceptual operation works for projecting onto lines, planes, volumes, and higher-dimensional subspaces with the same algebraic shape.
- **Does GA reduce ad-hoc representation choices?** Yes. In standard practice, you constantly switch between "plane as two spanning vectors", "plane as normal", "plane as implicit equation", "plane as projection matrix"… GA gives you a representation with stable geometric meaning: $a \wedge b$ *is the plane element*.

Example 1 is the "GA is a clean language for subspaces" pitch. It's not the killer feature yet.

The killer feature shows up when you want to *turn this into an operator* and reuse it efficiently.

---

## Example 2 — Projection as an Outermorphism Matrix (GA Meets Matrices)

### What problem is being solved?

You don't just project one vector once. You project millions of vectors (or you want something you can slot into an existing matrix pipeline). So you want:

- A **linear operator** you can cache
- A fast apply step, ideally "just multiply by a matrix"

### What would you use without GA?

You'd build a projection matrix.

If a subspace is the column space of $A$ (columns are a basis, not necessarily orthonormal), the orthogonal projection matrix is:

$$P = A(A^T A)^{-1}A^T$$

This is standard linear algebra.

For a plane spanned by $a, b$, you can take $A = [a \; b]$ (a $3 \times 2$ matrix), giving $P \in \mathbb{R}^{3 \times 3}$. Then:

$$x_\parallel = P x$$

C++ with Eigen (typical real-world code):

```cpp
#include <Eigen/Dense>
using Eigen::Matrix3f;
using Eigen::MatrixXf;
using Eigen::Vector3f;

Matrix3f projectionMatrixFromSpan(const Vector3f& a, const Vector3f& b) {
    MatrixXf A(3, 2);
    A.col(0) = a;
    A.col(1) = b;
    Matrix3f P = A * (A.transpose() * A).inverse() * A.transpose();
    return P;
}

Vector3f projectOntoPlane(const Vector3f& x, const Matrix3f& P) {
    return P * x;
}
```

This is completely fine. It's also what most skeptics mean when they say "I can already do this."

### Now the GA way

The GA move is subtle:

1. Define the projection as a GA expression (same as Example 1)
2. Apply it to the **basis vectors** $e_1, e_2, e_3$
3. Those images are the columns of the matrix representation

That is exactly how matrices represent linear maps in linear algebra too; GA just makes the *definition* of the map geometric first.

From the code:

```cpp
// compute bivector (*4 to make it a bit larger):
bivector B = _bivector(4.0f * g_vectors[0] ^ g_vectors[1]);

// we need the images of the 3 basis vectors under the projection:
e3ga::vector imageOfE1 = _vector((e1 << inverse(B)) << B);
e3ga::vector imageOfE2 = _vector((e2 << inverse(B)) << B);
e3ga::vector imageOfE3 = _vector((e3 << inverse(B)) << B);

// initialize the matrix representation
om M(imageOfE1, imageOfE2, imageOfE3);

// apply the matrix to the vector:
e3ga::vector P = _vector(apply_om(M, g_vectors[2]));
```

The `om` type builds outermorphism matrices (one per grade) from the basis-vector images, then you can apply them to blades efficiently.

### What's actually different, and why should you care?

Here's the blunt question a skeptic asks:

> "If GA just turns into a matrix, why not just write the matrix?"

Sometimes you should. If your world is "3D vectors only", the matrix formula is a direct solution.

But GA is doing two things here that plain matrix algebra doesn't give you *for free*:

**1) You get the matrix from a geometric definition, not from coordinates.**
In the GA code, the projection is defined as "projection onto the plane represented by $B = a \wedge b$". The matrix drops out as an implementation detail.

**2) You aren't just building a 3×3 matrix for vectors. You are building an operator on the whole algebra.**
The `om` type is an **outermorphism matrix**, which contains the induced matrices for bivectors, trivectors, etc.

**3) Performance: GA doesn't have to be slow.**
The example includes a benchmark and reports that using the precomputed outermorphism matrix was about twice as fast as applying the contraction formula directly (10 million projections). GA can *compile down* to the same kind of linear operator you'd hand-write.

So Example 2 is the bridge: you can think geometrically (GA), then execute numerically (matrices) without changing mental models.

Now we hit the place where GA stops being "nice" and becomes "this would have saved me bugs."

---

## Example 3 — Normal Transformation, and Why Normals Don't Transform Like Vectors

### What problem is being solved?

You apply a linear transform $M$ to a mesh (the example uses non-uniform scaling). You need correct normals for lighting, collision, plane tests, etc.

A common bug is: transform a normal like a direction vector, i.e. $n' = M n$. That is wrong under non-uniform scale (and shear). Shading breaks.

The question is: **what's the correct rule, and why?**

### What would you use without GA?

In standard graphics/linear algebra, the normal must transform by the **inverse transpose** of the linear transform:

$$n' \propto (M^{-1})^T n$$

and then you renormalize.

One derivation: a normal is defined by being perpendicular to every tangent vector. If tangents $t$ become $Mt$, then you want $n' \cdot (Mt) = 0$ whenever $n \cdot t = 0$. That leads to $n' = (M^{-1})^T n$.

This is so standard it has a name: the **normal matrix**.

Typical C++:

```cpp
Eigen::Matrix3f M = ...;            // linear part of model transform (no translation)
Eigen::Matrix3f N = M.inverse().transpose();
Eigen::Vector3f n_world = (N * n_obj).normalized();
```

In practice, people remember "inverse transpose" as a rule, but not *what a normal actually is*.

### Now the GA way

GA's answer is: the thing you *should* be transforming isn't a normal vector at all.

A face normal is (up to scale) the dual of an oriented tangent **bivector**:

$$B = u \wedge v$$

In 3D, the usual cross product $u \times v$ is exactly "dual of $u \wedge v$".

Under a linear map $f$ with matrix $M$, the outermorphism rule says:

$$f[B] = f[u \wedge v] = f[u] \wedge f[v] = (Mu) \wedge (Mv)$$

That is: **transform the tangent plane element**, not the normal.

Then recover the normal *after* the transform by dualizing:

$$n' \propto \mathrm{dual}(f[B])$$

That is exactly what the example does.

First, it stores for each polygon:

- `g_attitude3D[i]`: the unit bivector $B$ representing the face's oriented tangent plane element, computed as $(v_2 - v_1) \wedge (v_3 - v_1)$
- `g_normals3D[i]`: the "old" normal as `dual(attitude)`

Then, under a non-uniform scale outermorphism `M`, it computes:

```cpp
// compute the normals
e3ga::vector badNormal, goodNormal;

badNormal  = unit_e(apply_om(M, g_normals3D[i]));
goodNormal = unit_e(dual(apply_om(M, g_attitude3D[i])));
```

And when setting the OpenGL normal for lighting, it uses the *good* one (dual of transformed attitude):

```cpp
e3ga::vector normal = _vector(unit_e(dual(apply_om(M, g_attitude3D[i]))));
glNormal3fv(normal.getC(vector_e1_e2_e3));
```

### What's actually different, and why should you care?

This is where GA earns its keep.

Without GA, the situation is conceptually messy:

- A normal *looks* like a vector (3 numbers)
- But it doesn't transform like a vector
- So you invent a special rule ("inverse transpose") and a special data type ("normal" vs "vector") and hope nobody mixes them up

With GA, the story becomes structurally clean:

- A face orientation is fundamentally a **2D subspace element** $u \wedge v$ (a bivector). That is the thing that transforms naturally by outermorphism.
- A "normal vector" is just a *derived* dual representation (useful in 3D), not the primary geometric object.
- You stop memorizing a special-case transform and instead apply the same transform to everything of geometric meaning.

If you're skeptical, here's the practical payoff:

- **Fewer bugs.** The wrong code path (treating normals as ordinary vectors) is exactly what the example paints in red, and it's exactly what beginners write.
- **Better mental model.** Inverse transpose stops being a ritual and becomes "duals transform with the inverse transpose because they live in the dual space".
- **It generalizes beyond 3D.** Cross products don't. The wedge product does.

---

## So… Why Does Geometric Algebra Matter?

If you want the honest answer from these three examples, it's this:

GA matters when your codebase is full of "this looks like a vector but isn't really a vector" objects—normals, planes, oriented areas, rotations—and you're paying a tax in special cases, fragile conventions, and bugs.

- **Example 1** shows the core promise: planes are bivectors, projections are contractions, and you can write projection as a geometric expression instead of a coordinate recipe.
- **Example 2** shows you don't have to give up matrices or performance: a GA-defined linear map can be cached as an outermorphism matrix and applied efficiently, exactly like your existing linear algebra pipeline.
- **Example 3** is the punchline: GA explains the "normal matrix" rule as a consequence of representing geometry with the right grade objects (bivectors) and using duality consciously, instead of carrying around a magical inverse-transpose incantation.

### Where GA Doesn't Help (And You Should Admit It)

If your work is strictly "3D vectors + 4×4 transforms" and your team already has the standard formulas internalized, GA won't automatically make you faster. The learning curve is real, and GA notation can look alien. For Example 1 in particular, the classic dot/cross formula is more immediately readable to most engineers.

### Where GA Does Pay Back

When you're repeatedly forced to ask:

- "Is this a vector, or a normal, or a plane coefficient, or…?"
- "What's the correct transform for this thing again?"
- "Why did my shading break under a scale?"
- "How do I generalize this beyond 3D?"

GA gives you a single algebra where the answers are structural rather than memorized.

That's why it matters.

---

## References

- [Orthogonal Projections (UMass Lowell)](https://faculty.uml.edu/dklain/projections.pdf)
- [Projection (linear algebra) - Wikipedia](https://en.wikipedia.org/wiki/Projection_%28linear_algebra%29)
- [Normal (geometry) - Wikipedia](https://en.wikipedia.org/wiki/Normal_%28geometry%29)
- [Transforming Normals - Eric Lengyel](https://terathon.com/blog/transforming-normals.html)
