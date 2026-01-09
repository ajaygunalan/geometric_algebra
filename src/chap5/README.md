# Chapter 5: Intersection and Union of Subspaces

## Programming Examples

| # | Command | Type | Description |
|---|---------|------|-------------|
| 1 | `./run_ex.sh 5 1` | Demo | Interactive meet and join visualization for blades |
| 2 | `./run_ex.sh 5 2` | Demo | Performance comparison: outer product vs join |
| 3 | `./run_ex.sh 5 3` | Demo | Numerical precision limits of join for nearly-parallel vectors |

## ex1: Meet & Join

Interactive 3D visualization of meet (intersection) and join (union) operations on blades. Rotate red and green multivectors (vectors or bivectors) to see the resulting meet or join displayed in blue. Use the popup menu to switch between meet/join and change blade grades.

## ex2: Outer Product vs Join Timing

Benchmarks 1 million outer products against 1 million join operations. Demonstrates that join is computationally more expensive than the outer product, since join must handle the general case of blades that may share common subspaces.

## ex3: Join Numerical Precision

Explores when the join of two nearly-parallel vectors transitions from a vector (1-blade) to a bivector (2-blade). Starts with vectors a=e1 and b=e1+epsilon*e2, incrementally growing epsilon until the join is recognized as a 2-blade, revealing numerical precision thresholds.
