The arb4j UTF expression syntax is **declarative** — specifically, it is an **equational domain-specific language (DSL)** for mathematical function definition.

## Why Declarative

The user specifies **what** a function is, not **how** to compute it. An expression like:

```
T(n)=when(n=0,1,n=1,x,else,2x*T(n-1)-T(n-2))
```

is a mathematical definition — an equation stating the relationship between inputs and outputs. 
The compiler is entirely responsible for translating that specification into optimized JVM bytecode via AST construction and ASM code generation. 
The user never writes loops, manages state, sequences instructions, or specifies evaluation order. 

## More Precise Classification

Within the declarative family, it fits the **equational/functional** subcategory:

- **Equational**: Functions are defined by stating equalities — `f(x) = <expression>`. This mirrors standard mathematical notation directly.
- **Functional**: Definitions are compositional and referentially transparent. The `when` construct is a conditional *expression* (pattern-matching), 
not a control-flow *statement*. Recursion (`T(n-1)`, `T(n-2)`) replaces iteration.
- **Not imperative/procedural**: There are no mutable variables, no assignment statements, no sequenced commands, no explicit loops.

## The Unicode Notation Angle

The rich Unicode support (superscripts for exponents, ∑/∏ for summation/product, combining diacritical marks for derivatives, ∂ for partial derivatives, → for variable binding) reinforces the declarative nature — the syntax is designed to be isomorphic to standard written mathematical notation, which is itself declarative..

## Summary Classification

**Declarative, equational, functional (domain-specific) language ** — a mathematical notation language that compiles to imperative bytecode but whose surface semantics contain zero imperative constructs.
In this context, Java functions as an **imperative, object-oriented metalanguage** — the language in which the declarative object language's semantics are defined and mechanized.

## Metalanguage vs Object Language

In programming language theory, when one language is used to implement another, the implementor is the **metalanguage** and the implemented is the **object language**. Here:

- **Object language**: the UTF expression DSL (declarative, equational)
- **Metalanguage**: Java (imperative, object-oriented)

Java is not "just imperative" in this role — it is performing **generative metaprogramming**: the `Expression`, `Parser`, and `Node` hierarchy are imperative Java code that reads declarative specifications and emits new JVM bytecode at runtime via ASM. 

## Three Distinct Roles Java Plays

| Role | What it does | Classification |
|---|---|---|
| **Compiler implementation** | `Expression.generate()`, `Parser`, `Node.generate()` — traverses AST, emits bytecode | Imperative metaprogramming |
| **Target runtime** | Generated classes implement `Function<D,C>`, `AutoCloseable`, `Typesettable` — run on JVM | Imperative execution substrate |
| **Type system host** | `Expression<D,C,F>` generics enforce domain/codomain/function-type constraints at compile time | Static type-theoretic scaffolding |


## The Specific Metaprogramming Pattern

Java here is doing something more specific than general-purpose imperative programming. Each `Node` subclass contains a `generate()` method that knows how to emit its own bytecode — the AST is a self-compiling data structure. This is the **interpreter pattern elevated to a compiler pattern**: polymorphic dispatch over an algebraic data type (the Node hierarchy) where each variant produces target code rather than executing directly. 

The formal classification: **Java acts as an imperative object-oriented metalanguage performing staged, generative metaprogramming** — it translates declarative specifications into imperative bytecode, bridging the paradigm gap between what the user writes and what the machine executes. 

## Integral Syntax

There are two syntactic forms for integrals.

### Arrow Form (Unicode)

Definite integral: `∫var➔integrand dvar∈(lower,upper)` or `∫var➔integrand dvar∈{lower..upper}`

Indefinite integral: `∫var➔integrand dvar`

Examples:

```
x➔∫y➔1/sqrt(1-y^2)dy∈(-1,x)
t➔∫s➔w(s)ds∈{-1..t}
```

### Function Form

Definite integral: `int(integrand, var=lower…upper)`

Indefinite integral: `int(integrand, var)`

Examples:

```
int(sin(x),x)
int(x,x=2..4)
```

### Nested Integrals

Nested (iterated) integrals are supported. In the arrow form, the inner integral must be parenthesized so that the outer `d`-token is unambiguous:

```
x➔∫y➔(∫z➔(y*z)dz∈(0,1))dy∈(0,1)
```

This represents ∫₀¹∫₀¹ y·z dz dy. The parentheses around the inner `∫z➔(y*z)dz∈(0,1)` are required — without them, the parser cannot distinguish where the inner integrand ends and the outer `dy` begins.

More generally, whenever a bare variable name immediately precedes `d` followed by the integration variable name, the parser reads them as a single identifier. To avoid this ambiguity, ensure the integrand ends with a non-identifier character such as `)`, a digit, or a superscript. For example:

| Expression | Status | Reason |
|---|---|---|
| `∫y➔exp(y)dy∈(0,1)` | ✓ | integrand ends with `)` |
| `∫y➔y^2dy∈(0,1)` | ✓ | integrand ends with `2` |
| `∫y➔(y)dy∈(0,1)` | ✓ | integrand ends with `)` |
| `∫y➔ydy∈(0,1)` | ✗ | `ydy` is parsed as one identifier |

### Fubini/Tonelli Integration Order Exchange

When nested integrals have constant finite bounds and the integrand is the immediate child of the outer integral, `simplify()` may automatically exchange the order of integration via the Fubini–Tonelli theorem. This is implemented by `ExchangeabilityChecker` (structural analysis) and `IntegrabilityChecker` (analytic validity). The `@FubiniApplicable` annotation can be placed on a function class to assert that Fubini's theorem applies when the automatic heuristics are insufficient.

See [Issue #549](https://github.com/crowlogic/arb4j/issues/549).
