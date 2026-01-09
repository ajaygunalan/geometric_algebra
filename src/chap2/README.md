# Chapter 2: Spanning Oriented Subspaces

## Programming Examples

| # | Command | Type | Description |
|---|---------|------|-------------|
| 1 | `./run_ex.sh 2 1` | Demo | Visualize bivectors as parallelograms or discs |
| 2 | `./run_ex.sh 2 2` | Exercise | Implement back-face culling using bivector orientation |
| 2s | `./run_ex.sh 2 2s` | Solution | Solution for ex2 |
| 3 | `./run_ex.sh 2 3` | Demo | Detect singularities in 3D vector fields |

## ex1: Drawing Bivectors
Demonstrates the outer product of two vectors by visualizing bivectors. Shows a grid of bivectors where v1 is fixed to e1 and v2 rotates through angles 0 to 2pi. Toggle between parallelogram and disc representations via the menu.

## ex2: Hidden Surface Removal [EXERCISE]
Implement back-face culling for 3D models projected to 2D. Use the outer product of triangle edge vectors to compute a bivector and check its e1^e2 component sign to determine polygon orientation. Skip polygons facing away from the viewer.

## ex2s: Hidden Surface Removal [SOLUTION]
Shows the solution: compute `B = (v2 - v1) ^ (v3 - v1)` and skip polygons where `B.e1e2() <= 0`. This uses the signed area property of the bivector to determine front/back facing.

## ex3: Vector Field Singularity Detection
Visualizes 3D vector fields and detects singularities (points, lines, surfaces) using the HP index algorithm. Supports multiple field types including point sources, line sources, helices, and algebraic surfaces. Singularities are color-coded: red (points), green (lines), blue (surfaces).
