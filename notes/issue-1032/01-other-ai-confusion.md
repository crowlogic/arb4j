# Essay 1: What the other AI session got wrong about issue #1032

## TL;DR

The "field-overwrite during recursion / use JVM local slots" diagnosis is wrong about the actual bug. There is no inner/outer recursive call sharing fields because there's only one Java object — `this.a == this`. The recursion goes through the same instance, not a separate "inner" one.

## Confusion 1 — "JVM local slots make recursion just work"

They don't. A JVM local slot holds a reference. A field holds a reference. Both point to the same `Real` heap object. If you ASTORE the field's current value into a slot, the slot and the field alias the same `Real`. Mutating through either is visible through both. The per-invocation nature of a stack frame doesn't clone the underlying objects — it only gives you private slot indices.

The thing that fixes the bug is making sure recursive calls go through a **different Java object**, not a different slot.

## Confusion 2 — Conflating storage class with allocation timing

The proposed "right fix" changes both at once and credits the wrong dimension. Where you put the reference (field vs local slot) is incidental to the bug. What matters is that the recursive call's receiver is a different object with its own scratch fields.

## Confusion 3 — "30 tests broke, therefore fields are wrong"

They admit they didn't investigate the failures. Then they upgrade that uninvestigated failure into a justification for ripping out field-based storage. That's not a diagnosis, it's a panic pivot.

## Confusion 4 — Inventing a phantom deeper-bug

"Compiler shouldn't store body-scope scratch in instance fields in the first place" is a separate aesthetic preference, not a correctness requirement. Per-call allocation IS NOT the fix to this bug. The fix is structural: don't re-enter the same object.

## What the actual fix is

`this.<self>` must not be `this`. Period. Not via injection, not via initialization fallback. The recursive call's receiver must be a separate Java object with its own scratch fields. That's how Chebyshev T already works (`T.T != T`), and how every other self-recursive sequence must work.
