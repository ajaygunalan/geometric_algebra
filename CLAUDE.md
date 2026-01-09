# Agent Guidelines

## Project Context

This is a Geometric Algebra learning project based on the book "Geometric Algebra for Computer Science".

**Code Structure:**
```
src/
├── libgasandbox/          ← GA library (5 algebras: e2ga, e3ga, h3ga, c2ga, c3ga)
├── qhull-2003.1/          ← Convex hull library (for chap14)
└── chap1-16/              ← Chapter examples
    ├── EXERCISES.md       ← All exercises (152 total for Ch2-8)
    ├── ex*/               ← Example code
    └── solutions/         ← Completed solutions
```
- `docs/ch_*/` - Chapter notes (markdown)
- `docs/gasandbox_api.md` - API reference
- `figures/` - GAViewer .g scripts

**Exercise Types:**
- `Drill` - Computational practice
- `Structural` - Proofs/derivations (verify with code)
- `Programming` - Interactive visualizations
- `Calculation` - Math from text (code instead of pen/paper)

**User Goal:** Implement ALL exercises from chapters 2-8, including mathematical calculations as code.

## Build System

Uses CMake. To build:
```bash
cd build
cmake ../src
make -j$(nproc)
```

## Commit Messages
High-level, 2-3 lines max:
```
<What you did in one line>

<Why/how in 1-2 short sentences>
```

## Context Awareness
Your context window will be automatically compacted as it approaches its limit, allowing you to continue working indefinitely from where you left off. Therefore, do not stop tasks early due to token budget concerns. As you approach your token budget limit, save your current progress and state to memory before the context window refreshes. Always be as persistent and autonomous as possible and complete tasks fully, even if the end of your budget is approaching. Never artificially stop any task early regardless of the context remaining.

## MCP Tools (Documentation & Code Search)

**4 Tools, 2 MCPs:**

| Tool | Purpose | Use When |
|------|---------|----------|
| `web_search_exa` | Web search → URLs | Finding official docs, broad discovery |
| `get_code_context_exa` | Code snippets | "How do I...?" questions, API patterns |
| `ref_search_documentation` | GitHub/private docs | Searching repos, indexed private docs |
| `ref_read_url` | Read URL → markdown | **Always use this** to read URLs (not WebFetch) |

**Decision Flow:**
1. Need working code? → `get_code_context_exa` first
2. Need official docs? → `web_search_exa` to find URL
3. Found a URL? → `ref_read_url` to read it
4. Searching GitHub specifically? → `ref_search_documentation`

**Skip searches for:** generic libraries (numpy, matplotlib, pandas, IPython), self-documenting errors, simple syntax, or anything answerable from training. Save MCP calls for domain-specific queries.

**Tips:**
- `get_code_context_exa`: Adjust `tokensNum` (1000-50000) based on complexity
- `web_search_exa`: Use `livecrawl: "preferred"` for fresh content
- `ref_search_documentation`: Add `ref_src=private` for indexed private repos
- Always pass EXACT URLs (including #hash) to `ref_read_url`

## Private Repos (Ref Indexed)


## GA Sandbox API Cheatsheet

The library is in `src/libgasandbox/` (123 files, 70k+ lines). Full reference: `docs/gasandbox_api.md`

### Types
`vector`, `bivector`, `trivector`, `rotor`, `mv` (general multivector)

### Key Functions
```cpp
dual(x)      // Duality: dual(vector)→bivector, dual(bivector)→vector
inverse(x)   // Multiplicative inverse
unit_e(x)    // Normalize (Euclidean)
_vector(x)   // Cast mv to vector
_Float(x)    // Extract scalar value
```

### Operators
```cpp
a ^ b        // Outer product (wedge)
a << b       // Left contraction
a * b        // Geometric product
```

### Component Access
```cpp
v.e1(), v.e2(), v.e3()           // Vector components
B.e1e2(), B.e1e3(), B.e2e3()     // Bivector components
T.e1e2e3()                       // Trivector component
```

### Constants
`e1`, `e2`, `e3` (basis vectors), `I3`, `I3i` (pseudoscalar and inverse)
