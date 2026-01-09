# Chapter 4: Linear Transformations of Subspaces

## Programming Examples

| # | Command | Type | Description |
|---|---------|------|-------------|
| 1 | `./run_ex.sh 4 1` | Demo | Interactive projection of vector onto bivector plane |
| 2 | `./run_ex.sh 4 2` | Demo | Projection via matrix representation with benchmark |
| 3 | `./run_ex.sh 4 3` | Demo | Normal vector transformation under non-uniform scaling |

## ex1: Projection

Projects a vector onto a bivector plane using the left contraction formula `P = (x << B^-1) << B`. Drag the three vectors to see how the projection (gray) changes.

## ex2: Projection, Matrix Representation

Same projection as ex1, but computed using an outermorphism matrix. Benchmarks matrix vs direct GA computation (10M iterations) on startup.

## ex3: Transforming Normal Vectors

Shows why normal vectors must be transformed via the dual bivector attitude, not directly. Red normals (wrong) diverge from green normals (correct) under non-uniform scaling.
