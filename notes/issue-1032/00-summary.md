# Issue #1032 — summary

Generated self-recursive `evaluate()` was producing wrong results when re-entered, because `this.<self> == this` made every "recursive" call actually share the outer's scratch fields.

## Files

- `01-other-ai-confusion.md` — what the prior diagnosis got wrong (the "JVM local slot refactor" framing is incorrect)
- `02-this-a-equals-this-root-cause.md` — deterministic trace of how `this.a == this` got set
- `03-no-per-invocation-scratch.md` — the conceptual mistake (there is no per-invocation scratch on a single object)
- `04-realloc-in-evaluate-was-horrendous.md` — why per-call reallocation in `evaluate()` is the wrong fix

## Architecture (correct)

- Generated `evaluate()` is a method on a stateful object with mutable scratch fields.
- Scratch fields are allocated **once at construction** and stay allocated for the instance's lifetime.
- The object is **non-reentrant** — exactly one in-flight `evaluate()` per object.
- Recursive calls go through `this.<self>`, which is a **separate Java object** with its own scratch fields.
- The function-reference graph at runtime must be acyclic — no cycle leading back to `this` while `this` is mid-evaluation.

## Fix shape

- `Expression.instantiate()` — set `functionMapping.instantiateInProgress = true` before iAIRF, so a sub-expression's recursive `mapping.instantiate()` doesn't allocate a ghost instance that overwrites `Expression.instance`.
- `Context.injectFunctionReferences()` — skip `field.set(f, mapping.instance)` when `mapping.instance == f`. Self-injection would establish `this.<self> == this`, which is exactly the re-entry the architecture forbids.
- `Expression.generateSelfReference` — emit `if (this.<self> == null) this.<self> = new <Self>(); this.<self>.context = this.context;`. Allocate a separate instance with shared context.
- `Expression.generateInitializationCode` — emit self-ref BEFORE referenced-function wiring, so propagations like `this.operandF0001.<self> = this.<self>` see the freshly-allocated separate instance.
- `Context.classLoader` — lazy-init (default null, allocate on `getClassLoader()`). A chain of N self-recursive instances does not need N `ExpressionClassLoader`s; the throwaway Contexts allocated by the inner-recursion instances' generated `<init>` would otherwise pay for ClassLoaders they never use.
- `Context.log` — make the slf4j Logger `static`, so N chained Contexts don't do N LoggerFactory lookups.
