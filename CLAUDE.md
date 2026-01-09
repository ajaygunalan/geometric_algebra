# Agent Guidelines

## Project Context

This is a Geometric Algebra learning project based on the book "Geometric Algebra for Computer Science".

**Code Structure:**
- `src/ga_sandbox-1.0.7/chap*/EXERCISES.md` - **ALL exercises** from each chapter (152 total for Ch2-8)
- `src/ga_sandbox-1.0.7/chap*/ex*/` - C++ examples (some complete, some have TODOs)
- `src/ga_sandbox-1.0.7/solutions/` - Completed exercise solutions
- `docs/ch_*/` - Full chapter markdown with theory
- `data/figures/` - GAViewer scripts for interactive figures

**Exercise Types:**
- `Drill` - Computational practice
- `Structural` - Proofs/derivations (verify with code)
- `Programming` - Interactive visualizations
- `Calculation` - Math from text (code instead of pen/paper)

**User Goal:** Implement ALL exercises from chapters 2-8, including mathematical calculations as code.

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


**Adding New Dependencies:**
When discovering a domain-specific library via Exa, ask user: "Found [library]. Add to Ref as private repo for faster access?"
