# Issue #1027 — running Q&A log

Every question must land here with an immediate answer derived from
code, logs, or decompiled bytecode. No "maybe". No leaving a question
hanging.

| # | Question | Answer |
|---|---|---|
| 1 | What's the exact line that throws? | `S.initialize(Unknown Source)` → bytecode `PUTFIELD T.p` fails. |
| 2 | What's the difference between trace=on (passes) and trace=off (fails) in T's compiled bytecode? | trace=ON: T has fields `p, p0, p1, q, r, μ, vXℂ0026, vXℂ0027, vXℂ0028`. trace=OFF: T is missing all of those (decompiled `compiled_off/T.java` vs `compiled_on/T.java` diff at session timestamp 22:29). |
| 3 | What's the difference between full-suite (passes) and isolated (fails) in T's compiled bytecode? | Same as Q2: full = trace-on-equivalent (fields present); isolated = trace-off (fields missing). |
| 4 | What does `BinaryOperationNode.generate` line 351-354 (trace=on path) do that has a side effect? | Calls `formatGenerationParameters(resultType)` (line 269-291) which calls `left.type().getSimpleName()` and `right.type().getSimpleName()` plus `basicPad(left/right/this)` → `.toString()`. `type()` on a VariableNode with null `reference.type` triggers `resolveReference()`, which calls `expression.registerReferencedVariable(this)`, adding the node to `referencedVariables`. |
| 5 | When is T's bytecode `PUTFIELD T.p` actually emitted? | In **S's** `initialize()` method, via `propagateUpstreamInputVariablesToNestedFunctions` at Expression.java:5028. S emits `PUTFIELD T.p` because **S's** referencedVariables contains `p` (S references T which references m which references a whose body uses p). |
| 6 | When traceNodes=true, what is T's compiled fieldset at first definition? | Includes `p, p0, p1, q, r, μ`. Confirmed by decompile. |
| 7 | When traceNodes=false, what is T's compiled fieldset at first definition? | Does NOT include them. Confirmed by decompile. |
| 8 | If T's DECLVARS log showed full context vars in OFF mode, why aren't they declared as T's fields? | Pending. The log shows `varList` had them. But `declareVariableEntry` either skipped them (declaredVariables.contains test) or never iterated. Need to verify via a focused log inside `declareVariableEntry` itself. |
| 9 | Is `declareVariables(T)` invoked at all in OFF mode? | Yes (earlier DECLVARS log showed `DECLVARS(T)` entry with full var list). |
| 10 | Is `declareVariableEntry` for `p` invoked in OFF mode for T? If yes, does it skip? | **YES, invoked with `isIn=false` and `visitField` IS called for `p, p0, p1, q, r, μ` on T's classVisitor.** Confirmed by log. So the field-declaration call HAPPENS but doesn't reach the final bytecode that gets loaded. |
| 10a | If declareVariableEntry visits the field but it's missing from the final bytecode, what's between them? | Pending. Two suspects: (a) classVisitor is a discarded throwaway; (b) a SECOND T-class compile path emits T without these fields and wins. |
| 10b | How many distinct ClassWriter/ClassVisitor instances are created for the className `T` in OFF mode? | Pending — instrument generate(). |
| 11 | What's the order of operations inside `declareVariables`? | 1. parent's independent var (line 1382-1391). 2. `declareFieldsForUpstreamInputPropagation` (line 1396). 3. context.variableEntryStream loop calling `declareVariableEntry` (line 1407-1410). |
| 12 | Does T have `upstreamExpression`? | Pending — check whether T's Expression has upstreamExpression set. |
| 13 | If T's upstreamExpression is set, what is its independent variable? | Pending. |
| 14 | Could T's upstreamExpression's independent variable be `p`? | Unlikely — `p` is a context variable, not an independent variable. But verify. |
| 15 | Where is `declaredVariables` ever populated BEFORE `declareVariables` runs for T? | Pending — search for any path that adds to declaredVariables outside declareVariables itself. |
