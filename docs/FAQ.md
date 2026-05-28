# Frequently Asked Questions

Engineering FAQ for `arb4j`. Topics that come up repeatedly in code review,
architectural discussions, and explanations to other AI agents touching the
compiler/runtime. New entries should be added at the end with a clear
question heading and a self-contained answer that references the actual
files and line numbers where the relevant code lives.

---

## How are mutually recursive sequences recognized as such?

Mutual recursion is detected by **Tarjan's strongly-connected-components
algorithm on the function reference graph**, with the SCC results cached in
`Context.sccByName`. Self-recursion is the easy case (one vertex, one
self-edge); mutual recursion is the harder case (two or more vertices
forming a cycle through each other's definitions), and it's exactly what SCC
analysis is built for.

### Step 1 — build the function reference graph

In [`Context.populateFunctionReferenceGraph()`](../src/main/java/arb/expressions/Context.java),
for each function name in the context:

1. Take its parsed expression's `getReferencedFunctions()` — the set of
   other (or same) function names that *textually appear inside the
   function definition* during parsing. This is collected by the parser as
   it walks the AST and encounters `FunctionNode` references like
   `f(...)`, `g(x)`, etc.
2. The set of names extracted from the definition becomes the outgoing
   edges of this vertex.
3. **Self-edges (a name referencing itself) are filtered out of the
   dependency graph** so that the later topological-sort step terminates —
   but the fact of self-reference is preserved in a separate
   `Context.selfReferential : Set<String>`.
4. Store as `Dependency(functionMapping)` keyed by name in the
   `functionReferenceGraph : Map<String, Dependency>`.

After this pass the graph is fully populated and `sccByName` is invalidated
(set to null) so the next access recomputes the SCC partition.

The crucial point is that this graph is **lexical**, not runtime. Whether
`f` references `g` is determined entirely by parsing the definition of
`f` — no execution, no instantiation, no actual recursion needs to
happen. By the time `Context` knows about both `f` and `g`, the graph
already encodes the mutual reference if the definition of `f` mentions
`g` and the definition of `g` mentions `f`.

### Step 2 — run Tarjan's SCC algorithm

[`Utensils.stronglyConnectedComponents(graph)`](../src/main/java/arb/utensils/Utensils.java)
is a textbook Tarjan implementation: depth-first traversal of the graph,
assigning each vertex an `index` (preorder number) and a `lowlink` (minimum
index reachable from this vertex via the DFS tree plus one back/cross
edge), pushing vertices onto a stack as they're discovered, and popping a
complete SCC off the stack whenever a vertex with `lowlink == index`
finishes — which means the DFS rooted at this vertex cannot reach any
earlier-discovered still-on-stack vertex, so everything popped down to it
forms one SCC.

The output is a `List<Set<String>>` of SCCs in **reverse topological
order** (sinks first). Each SCC is either:

- **A singleton with no self-loop** — a "trivial" SCC, just one
  non-recursive function.
- **A singleton with a self-loop** — a self-recursive sequence. But: the
  self-loop was filtered out of `dependsOn` to keep the topological sort
  terminating, so Tarjan sees this as a trivial singleton. This is why
  `selfReferential` exists as a separate set, queried by `isInCycle`.
- **A multi-vertex SCC** — a mutually recursive cluster: `{f, g}` for
  `f ↔ g`, `{f, g, h}` for a three-way cycle, etc.

The result is cached in `Context.sccByName : Map<String, Set<String>>`
using double-checked locking, so subsequent `sccOf(name)` calls are O(1).

### Step 3 — recognize the cycle

[`Context.isInCycle(name)`](../src/main/java/arb/expressions/Context.java)
returns true when **either** of these is true:

1. The SCC containing `name` has more than one vertex → mutual recursion.
2. `name` is in `selfReferential` → self-recursion.

The two branches reflect the asymmetry above: self-edges were filtered for
topological-sort termination, so they survive only in the auxiliary set;
mutual cycles survive in the SCC structure itself because Tarjan sees them
as non-trivial SCCs even after the filter.

### What this catches and what it misses

**Catches automatically:**

- **Direct self-recursion**: `a(n) = a(n-1) + 1` → singleton `{a}` plus
  `a ∈ selfReferential`.
- **Two-way mutual recursion**: `f(n) = g(n-1); g(n) = f(n-1) + 1` → SCC
  `{f, g}`.
- **N-way mutual recursion**: any closed cycle through arbitrarily many
  distinct function names → SCC of size N.
- **Indirect cycles through curried sequences**: e.g. the `σ`/`α`/`h`
  cluster in `RiccatiMuntzPadeFunctional` where `σ(j).evaluate(k)` calls
  `α` which references `h` which references `σ`. As long as each lexical
  definition contains the other name as a function reference, Tarjan
  finds the SCC.

**Misses (and would be wrong about) by design:**

- **Runtime-only cycles that don't exist lexically.** If `f` reads a
  function pointer out of a data structure at runtime and that pointer
  happens to point to `f`, Tarjan can't see it — because the graph is
  built from parsed names, not from runtime control flow. This is fine:
  the recursive-function compiler only generates `this.<name>.evaluate(...)`
  bytecode for cycles it can name at codegen time, so the runtime cycle
  is impossible by construction.
- **Mutual recursion through an external Java method.** If the
  definition of `f` calls a hand-coded Java method `Util.foo()` which
  happens to call back into `g` which references `f` — the call chain
  runs through native
  Java, not through the function reference graph, so Tarjan sees no
  cycle. This is the right behavior: if you escape to Java, you're
  outside the architecture's invariants and the codegen has nothing to
  do with you.

### Why this is the right detection mechanism

The whole point of using SCC analysis specifically — rather than, say,
walking the call graph during evaluation and tracking visited nodes — is
that **it is a purely static, ahead-of-time decision**. By the time
codegen needs to emit the recursive-call bytecode `this.g.evaluate(...)`,
it already knows whether `g` is in a cycle with `this`'s class. If it is,
`generateSelfReference` for the cycle members emits the separate-instance
allocation pattern. If it isn't, `g` gets the ordinary "instantiate
referenced function" treatment.

It is also what makes the issue #1034 A2/A4 back-fill correct. When `f`
is instantiated before `g` (because the topological order says so, and
the order is deterministic from the SCC graph), `f.g` cannot be wired
yet — `g`'s instance doesn't exist. So `f` proceeds with `f.g == null`.
Then when `g` is instantiated, `backfillMutuallyRecursiveReferences`
walks the SCC, finds every previously-instantiated peer (here `f`) whose
class has a field named `g`, and reflectively assigns the just-created
`g` instance into that slot. The back-fill is only attempted for names
in the same SCC — which Tarjan already identified for free.

### Summary

The recognition mechanism is **the function reference graph plus
Tarjan's algorithm, computed lazily and cached, with a separate sidecar
set for self-loops because the topological-sort step filters them out**.
Self-recursion is a special case handled by the sidecar; mutual
recursion is the general case handled by SCC sizes greater than one.
Both feed `isInCycle`, which gates `warmToBottomUp` and triggers the
separate-instance codegen and the back-fill.

#### Related code

| Concern | File / line |
|---|---|
| Graph construction | `src/main/java/arb/expressions/Context.java` — `populateFunctionReferenceGraph()` |
| Self-edge sidecar | `src/main/java/arb/expressions/Context.java` — `selfReferential : Set<String>` |
| SCC computation (Tarjan) | `src/main/java/arb/utensils/Utensils.java` — `stronglyConnectedComponents()` |
| SCC cache | `src/main/java/arb/expressions/Context.java` — `sccByName`, `sccOf(name)` |
| Cycle predicate | `src/main/java/arb/expressions/Context.java` — `isInCycle(name)` |
| Bottom-up warming gate | `src/main/java/arb/expressions/Context.java` — `warmToBottomUp(name, idx, bits)` |
| Mutual back-fill | `src/main/java/arb/expressions/Expression.java` — `backfillMutuallyRecursiveReferences()` |
| Separate-instance codegen | `src/main/java/arb/expressions/Expression.java` — `generateSelfReference()` |

#### Related issues and notes

- [#1027](https://github.com/crowlogic/arb4j/issues/1027) — S↔α
  `instantiate` ping-pong re-entrance guard.
- [#1032](https://github.com/crowlogic/arb4j/issues/1032) — self-recursive
  sequences use a separate instance per level (see also
  [`notes/issue-1032/`](../notes/issue-1032/) essays).
- [#1034](https://github.com/crowlogic/arb4j/issues/1034) — A1
  (self-recursion in `isInCycle`), A2/A4 (mutual back-fill), A3 (proper
  try-finally re-entrance guard on `evaluate`).
