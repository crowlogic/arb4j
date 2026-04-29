# arb4j axioms

Invariants of the compiler. Each axiom is non-negotiable. Violations are bugs.

## A1. `generate()` does not mutate state

`Expression.generate()` and every method it transitively invokes during bytecode emission have exactly one effect: writing to the `MethodVisitor` and `ClassVisitor` instances they receive. They do not:

- mutate `referencedFunctions`, `referencedVariables`, `declaredVariables`, `intermediateVariables`, `declaredIntermediateVariables`, or any other field of any `Expression`,
- register, deregister, or rename anything in any `Context`,
- invoke `compile()`, `optimize()`, `parse()`, or `resolve()` on any expression, including the receiver, nested mappings, sibling functionals, or upstream expressions,
- construct, mutate, or splice `Node` instances into any AST,
- alter `FunctionMapping.expression`, `FunctionMapping.instance`, or any field of any mapping,
- write to `compileInProgress`, `optimized`, `variablesDeclared`, or any other compilation-phase flag.

Every fact `generate()` needs about the AST, the referenced sets, the field layout, the context's mappings, and the nested expressions it reads must already be final and consistent at the moment `compile()` reaches the call to `generate()` at Expression.java:1173. The verify pass at Expression.java:1172 is the last opportunity to detect inconsistencies. After that, the compiler reads only.

If a fact required by emission is not yet established at line 1173, the bug is at the parse/resolve site that should have established it, not at the emission site.
