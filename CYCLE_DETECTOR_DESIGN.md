# Runtime field-graph cycle detector — design

## Predicate (verbatim from issue #1000)

> "In the field graph at runtime, are there two distinct instances of the same `FunctionMapping` reachable from the live root?"

A correct allocate-all-then-wire-all initialization produces a field graph in which every `FunctionMapping` in the strongly connected component is represented by **exactly one** instance, reachable from the root via potentially many paths. A broken initialization (the `if (peer == null) peer = new Peer()` pattern from #1000 point #3) produces **two or more** distinct instances of the same `FunctionMapping`, one per allocate-and-wire frame.

The verifier asserts the postcondition. It does not produce the postcondition.

## Where the verifier runs

`Expression.instantiate()` (Expression.java:3961) is the single entry point at which a fresh root is allocated and its referenced-function fields are wired. The current sequence is:

```
F freshInstance = newInstance();
instantiateAndInjectReferencedFunctions(freshInstance);   // recursive peer allocation + wire
injectReferences(freshInstance);                           // Context.injectReferences (var + func + ctx)
cloneNonReentrantReferencedFunctions(freshInstance);
populateSourceExpressionBackPointer(freshInstance);
instance = freshInstance;
return freshInstance;
```

The verifier inserts **one new step** between `injectReferences` and `cloneNonReentrantReferencedFunctions`:

```
verifyFieldGraphAcyclic(freshInstance);
```

Rationale for that position:

- **After** `injectReferences` — the registry-canonical wirings have been written. Every field that the registry can populate is populated. Any duplicate instance is now visible.
- **Before** `cloneNonReentrantReferencedFunctions` — the cloner *intentionally* makes copies of fields whose function class is `Cloneable`. Running the verifier after the cloner would produce false positives, since the cloner is the legitimate creator of additional instances. Running before the cloner means we're verifying the wiring postcondition and accepting the cloner's later edits as out-of-scope.

The verifier is also called from the same position in any path that ends in a fully-wired root. Currently there's only one such path (`instantiate()`); the design supports adding more by exposing a public hook.

## Algorithm

Pure runtime field-graph walk. No AST. No bytecode introspection. No reflection on private fields.

1. Maintain three structures, all local to a single verifier invocation:
   - `IdentityHashMap<Object, Boolean> visited` — instances already processed.
   - `IdentityHashMap<FunctionMapping<?,?,?>, Object> firstSeen` — first instance observed for each FunctionMapping.
   - `Deque<String> path` — the field-name breadcrumb stack used only to construct the error message when a cycle is detected.
2. Resolve the registry: `Context ctx = root.context` if accessible (the `context` field is injected by `Context.injectContextReference`), otherwise the verifier returns silently — there is nothing to verify against.
3. Walk:
   - Push the root with path `<root>`.
   - For the current instance, list its public fields whose declared type is assignable to `arb.functions.Function`.
   - For each such field, read the value via `Field.get`. If null, skip.
   - Identify which `FunctionMapping` this field corresponds to: look up the field's name in `ctx.functions`. If no entry, skip — the field is a non-registry function (e.g. an unrelated reference into a variable namespace, or a hand-written subclass field).
   - If `firstSeen.get(mapping) != null && firstSeen.get(mapping) != value`:
     - Build the cycle-path message and throw `CyclicFunctionReferenceException`.
   - Else `firstSeen.put(mapping, value)`.
   - If `!visited.containsKey(value)`, add `value` to `visited` and recurse, pushing the field name onto `path` for the duration of the recursive call.
4. Return normally.

The walk is O(|fields visited|) bounded by O(|edges in the live field graph|). The identity-keyed visited set bounds the recursion at the size of the instance graph regardless of cycle depth — no `StackOverflowError`, no `try/catch` on SOE, no symptom-catching.

## Field discovery — name + type

Field-by-name alone is wrong: the same name can be bound twice when an identifier appears on both the variable side and the function side of a `Context` (`Context.findAssignableField` already handles this for injection). The verifier uses the same predicate:

- A field qualifies for the walk iff:
  1. its declared type is assignable to `arb.functions.Function`, AND
  2. its name is a key of `ctx.functions`.

Fields of type `Real`, `Integer`, etc. are skipped — they hold variables, not function references, and the cycle in scope is exclusively a function-instance cycle.

## Self-references

A self-reference (the expression's `functionName` matches a field name) is permitted and not a cycle: by definition the registry's canonical `m` is reachable from `m` via the self-edge. The verifier's `firstSeen` map naturally accepts this — the second visit hits the same identity and proceeds without inserting again.

## What a violation looks like

For `a ↔ S` with the broken `if (peer == null) peer = new Peer()` pattern:

- Root: `a@1`. `firstSeen = {a→a@1}`.
- Walk into `a@1.S` → `S@2`. `firstSeen = {a→a@1, S→S@2}`. Mark visited.
- Walk into `S@2.a` → `a@3` (a fresh shell from the broken `new a()` path).
- `firstSeen.get(a) = a@1`, but the value is `a@3` — distinct identity, same FunctionMapping.
- Throw with message:

```
Two distinct instances of FunctionMapping 'a' are reachable from the root:
  first   : a@1 (root)
  second  : a@3 reachable via <root>.S.a
This indicates allocate-and-wire-per-frame initialization rather than the
required allocate-all-then-wire-all pattern; see issue #1000 point #3.
```

The exception type is new: `arb.exceptions.CyclicFunctionReferenceException extends arb.exceptions.CompilerException`. (`CompilerException` is the existing supertype used elsewhere in this package.)

## Failure mode contract

- Throws `CyclicFunctionReferenceException` from within `Expression.instantiate()` — i.e. **on construction**, before any `evaluate(...)` call can run.
- Never catches `StackOverflowError`. If the broken initialization SOEs before the verifier runs, the SOE propagates as it does today.
- Never returns a "best guess" or partial result. Either the field graph satisfies the predicate or the verifier throws.
- Idempotent under repeated invocation: the verifier holds no state across calls; the per-call structures are local.

## What this is NOT

- NOT an AST walker. Point #10 of #1000 names exactly that approach as already-reverted-because-wrong. The verifier walks instance fields, never `Expression.referencedFunctions` or any `Node` subtree.
- NOT a fix for the underlying allocate-and-wire-per-frame defect. The verifier reports the symptom precisely; the fix is point #3 of #1000 and is explicitly out of scope (per user: "Cycle detection only — do NOT implement the full two-phase init runtime fix").
- NOT a try/catch on `StackOverflowError`. No symptom-catching of any kind.
- NOT bypassable by `try { instantiate() } catch (CyclicFunctionReferenceException) {}` in production code, because it inherits from `CompilerException` (a `RuntimeException` subclass per existing use) and the framework propagates `CompilerException` to the caller.

## Test

`src/test/java/arb/expressions/CyclicFunctionReferenceTest.java`:

- A minimal mutually-recursive pair `f ↔ g` registered into a `Context` such that, with the current `injectReferences` and the current generated `initialize()` bytecode, two distinct instances of one mapping are produced.
- Asserts:
  - `instantiate()` throws `CyclicFunctionReferenceException`.
  - The exception message contains both function names and the field-path breadcrumb.
  - The throw happens **before** any `evaluate(...)` call — verified by registering an `evaluate` override that records calls; the test asserts the call counter is zero post-throw.
- A passing case: `h(x) = x + 1` — single function, no cycle. `instantiate()` returns normally, the verifier walks the (empty) referenced-function set, no exception.

## Files touched

| File | Change |
|---|---|
| `src/main/java/arb/exceptions/CyclicFunctionReferenceException.java` | NEW. `extends CompilerException`. |
| `src/main/java/arb/expressions/Expression.java` | Add `verifyFieldGraphAcyclic(F)` private helper; call it once in `instantiate()` between `injectReferences` and `cloneNonReentrantReferencedFunctions`. |
| `src/test/java/arb/expressions/CyclicFunctionReferenceTest.java` | NEW. Two test methods. |

No changes to `Context.java`, `FunctionMapping.java`, generated-bytecode emitters, or any walker that already exists. The verifier is additive.

## Build / commit

- `mvn test` — all 792 existing tests must remain green; the new test must pass.
- Single commit on master. Message:
  ```
  Runtime field-graph cycle detector per #1000

  Adds Expression.verifyFieldGraphAcyclic, called from instantiate() after
  injectReferences. Walks the live field graph keyed by
  (FunctionMapping, identityHashCode); throws
  CyclicFunctionReferenceException if any FunctionMapping has two distinct
  reachable instances. Closes the failure mode #1000 point #3 produces
  on construction rather than at evaluate-time SOE.

  Closes #995 (duplicate of #1000; the reflection helper named there is
  superseded by this verifier's deterministic on-construction check).
  ```
- `gh issue close 995 --repo crowlogic/arb4j --reason 'duplicate' --comment 'Superseded by #1000; addressed by commit <sha>.'`
