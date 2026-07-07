# Frequently Asked Questions

Engineering FAQ for `arb4j`. Topics that come up repeatedly in code review,
architectural discussions, and explanations to other AI agents touching the
compiler/runtime. New entries should be added at the end with a clear
question heading and a self-contained answer that references the actual
files and line numbers where the relevant code lives.

---

## How are mutually recursive sequences recognized and wired?

Mutual recursion needs no dedicated detection layer. The compiler resolves
every function reference by name through the shared `Context`, lazily and at
runtime, so a cycle wires itself the same way a DAG does:

1. **Lexical references.** While parsing, each expression records the set of
   function names that appear in its definition
   (`Expression.getReferencedFunctions()`), and
   [`Context.populateFunctionReferenceGraph()`](../src/main/java/arb/expressions/Context.java)
   stores them as `Dependency` edges in
   `functionReferenceGraph : Map<String, Dependency>` — used for
   deterministic code-generation ordering (`Utensils.sortDependencies`) and
   for the Expressor dependency-graph rendering.
2. **Deferred instantiation.** `compile(...)` defines a referenced class
   without instantiating it; `express(...)` instantiates last, per the
   compilation ordering rule. A cyclic cluster such as {σ, h, α, β} is
   forward-declared with `declare(...)`, compiled member by member, and the
   leaf is `express`ed, which cascades instantiation through the cluster.
3. **Runtime lookup for cycle edges.** When a generated `evaluate` reaches a
   referenced function whose field is still null,
   `Expression.constructReferencedFunctionInstanceIfItIsNull` emits
   `this.context.lookupFunctionInstance("<name>")` — the peer instance is
   fetched from the shared `Context` at the moment it is first needed, so
   the order in which cycle members were instantiated is irrelevant.
   Self-recursion is handled by `Expression.generateSelfReference`, which
   allocates a separate instance per recursion level.

### Multi-index (nested) sequences: freeze the index

For a two-index function such as `σ : j ➔ k ➔ …`, the outer evaluate does
not rewrite a shared field before each inner call. Instead
`Expression.generateFunctionalElement` constructs a **fresh inner instance
per call with the outer index copied into it by value** — the outer index is
frozen at construction. The outer sequence memoizes that inner instance per
outer-index value (`Expression.shouldCache`), so each frozen instance caches
by its single remaining index alone. There are no shared mutable fields
between distinct outer-index instances, hence no fill-order requirement and
no cache-warming step of any kind: caching is fully transparent, and a
top-down read of a cyclic cluster like α(j) = σ(j)(j+1)/h(j) descends into
already-frozen σ/h children rather than re-entering an in-flight instance.

#### Related code

| Concern | File / line |
|---|---|
| Graph construction (codegen order) | `src/main/java/arb/expressions/Context.java` — `populateFunctionReferenceGraph()` |
| Runtime peer lookup | `src/main/java/arb/expressions/Context.java` — `lookupFunctionInstance(name)` |
| Deferred wiring emission | `src/main/java/arb/expressions/Expression.java` — `constructReferencedFunctionInstanceIfItIsNull()` |
| Frozen-index inner instances | `src/main/java/arb/expressions/Expression.java` — `generateFunctionalElement()` |
| Per-index memoization | `src/main/java/arb/expressions/Expression.java` — `shouldCache()` |
| Separate-instance self-recursion | `src/main/java/arb/expressions/Expression.java` — `generateSelfReference()` |

#### Related issues and notes

- [#1027](https://github.com/crowlogic/arb4j/issues/1027) — S↔α
  `instantiate` ping-pong re-entrance guard.
- [#1032](https://github.com/crowlogic/arb4j/issues/1032) — self-recursive
  sequences use a separate instance per level (see also
  [`notes/issue-1032/`](../notes/issue-1032/) essays).
- [#1127](https://github.com/crowlogic/arb4j/issues/1127) — freeze-the-index:
  the cache-warming precondition and the SCC/Tarjan warming subsystem were
  removed once outer indices became frozen at construction.
