# arb4j axioms

Invariants of the compiler. Each axiom is non-negotiable. Violations are bugs.

## A1. `Node.generate(MethodVisitor, Class<?>)` does not mutate state

Every node class's `generate(MethodVisitor mv, Class<?> resultType)` method has exactly one effect: writing bytecode to `mv`. A node's `generate` does not:

- mutate `referencedFunctions`, `referencedVariables`, `declaredVariables`, `intermediateVariables`, `declaredIntermediateVariables`, or any other field of any `Expression`,
- register, deregister, or rename anything in any `Context`,
- invoke `compile()`, `optimize()`, `parse()`, or `resolve()` on any expression, including the owning expression, nested mappings, sibling functionals, or upstream expressions,
- construct, mutate, or splice `Node` instances into any AST,
- alter `FunctionMapping.expression`, `FunctionMapping.instance`, or any field of any mapping,
- write to `compileInProgress`, `optimized`, `variablesDeclared`, or any other compilation-phase flag,
- call any helper that performs any of the above.

Every fact a node's `generate` needs — its operand types, its referenced names, its field descriptors, its slot assignments, its initializer registration — must already be final at the moment `Expression.generate()` reaches `rootNode.generate(mv, coDomainType)`. If a fact is not established by then, the bug is at the parse/resolve/optimize phase that should have established it, not at the emission site.

The per-`Node` `generate` is read-only on the AST and on every `Expression` reachable from it. The only objects it writes to are the `MethodVisitor` (and, transitively, the `ClassVisitor` only insofar as helpers it invokes write to it).
