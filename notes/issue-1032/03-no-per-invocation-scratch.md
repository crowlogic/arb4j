# Essay 3: There is no such thing as "per-invocation scratch"

## What I imagined (wrong)

A mental model that looked like this:

- An expression body has scratch buffers (`vℝ0009`, `vXℂ0007`, …) that hold intermediate values during a computation.
- A call to `evaluate(k)` is a distinct invocation with a distinct frame.
- Each invocation logically owns its own scratch.
- Therefore, when a recursive call happens, the inner invocation needs its own scratch — separate from the outer's — because they are two distinct invocations.
- Therefore, the "right" answer is to give each invocation its own scratch view via per-call realloc, save/restore, or JVM local slots.

**Every one of those approaches is an answer to a question that was never asked.**

## Why it's wrong

There is no "invocation" that owns scratch. There is one Java object. That object has scratch fields. Those scratch fields hold values during whatever computation the object is currently doing. The object can do **exactly one computation at a time** — that is just what an object with mutable scratch fields means.

If you try to run two overlapping computations on the same object, of course they trash each other. That is not a feature of recursion. That is the elementary property of mutable state: **you cannot have two writers to the same memory at the same time and expect either to be correct.**

A recursive function-call graph that reaches back into the same Java object is exactly two overlapping computations on the same object. Trying to make that work by giving each entrant its own private view is fixing the wrong end of the problem.

## What "per-invocation scratch" really is

It's a separate Java object with its own scratch fields. The recursive call goes through `this.a`, which **must** be a different instance — never `this`. The inner instance has its own intermediate fields. When the inner instance's body writes to its scratch, the outer instance's scratch is untouched because they are different objects.

Per-invocation scratch IS per-instance scratch on a chain of separate instances. There is no procedural mechanism (no save/restore, no realloc, no local slot dance) that gives one Java object the ability to safely re-enter itself. The architecture is: one in-flight computation per object.

## What this implies for the fix

- `this.<self>` must not be `this`.
- No mutual call chain from `this.evaluate` returns to `this.evaluate` before the outer call completes — not even indirectly through another method calling back into itself.
- Intermediate fields stay where they are: allocated once at construction, used by exactly one in-flight invocation per object, never touched concurrently.
- Deep recursion lives in a chain of objects, not a chain of stack frames on one object.

This is basic graph theory. The function-reference graph must be acyclic at runtime — no cycle leading back to `this` while `this` is mid-computation. Period.
