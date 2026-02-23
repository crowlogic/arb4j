## Caputo Fractional Derivatives in arb4j

The Caputo fractional derivative of order $\alpha$ generalizes ordinary differentiation to non-integer orders. arb4j compiles expressions containing the Caputo operator directly to JVM bytecode, resolving closed-form results at compile time when the operand's structure permits, and falling back to the integral definition otherwise.

## Definition

$${}^{C}\!D^{\alpha} f(x) = \frac{1}{\Gamma(n - \alpha)} \int_0^x (x - t)^{n - \alpha - 1} f^{(n)}(t) dt$$

where $n = \lceil \alpha \rceil$. Currently $\alpha \in (0, 1]$ is supported, so $n = 1$ and the formula reduces to :

$${}^{C}\!D^{\alpha} f(x) = \frac{1}{\Gamma(1 - \alpha)} \int_0^x (x - t)^{-\alpha} f'(t) dt$$

## Syntax

Two equivalent notations are recognized in arb4j expressions :


| Syntax | Example | Meaning |
| :-- | :-- | :-- |
| `Đ^(α)(f)` | `Đ^(α)(t²)` | Caputo derivative of $t^2$ of order $\alpha$ |
| `ꟲD^(α)(f)` | `ꟲD^(α)(t³)` | Same operator, capital-C prefix notation |

The exponent $\alpha$ must be resolvable at compile time — either a literal constant, a constant expression (e.g., `1/2`), or a bounded `Real` variable whose $\lceil \text{upperBound} \rceil$ determines $n$ .

## Closed-Form Dispatch

The parser calls `operand.fractionalDerivative(α)`, which dispatches polymorphically. Each node subclass that has a known closed form overrides this method :


| Operand | Closed Form |
| :-- | :-- |
| Constant $c$ | $0$ |
| Independent variable $t$ | $\frac{\Gamma(2)}{\Gamma(2 - \alpha)} \, t^{1-\alpha}$ |
| Monomial $t^k$ | $\frac{\Gamma(k+1)}{\Gamma(k - \alpha + 1)} \, t^{k-\alpha}$ |
| Sum $f + g$ | ${}^{C}\!D^{\alpha} f + {}^{C}\!D^{\alpha} g$ (linearity) |
| Difference $f - g$ | ${}^{C}\!D^{\alpha} f - {}^{C}\!D^{\alpha} g$ (linearity) |
| Constant multiple $c \cdot f$ | $c \cdot {}^{C}\!D^{\alpha} f$ |
| Constant divisor $f / c$ | ${}^{C}\!D^{\alpha} f \, / \, c$ |

If no closed form applies, the base `Node.fractionalDerivative` creates a `CaputoFractionalDerivativeNode` that compiles the integral definition .

## Integral Form

When the operand has no closed-form fractional derivative, arb4j compiles two sub-expressions that implement the integral definition for $n = 1$ :

- **Integrand**: $g(x, t) = (x - t)^{-\alpha} \cdot f'(t)$
- **Result**: $\frac{1}{\Gamma(1 - \alpha)} \int_0^x g(x, t) \, dt$

These are full arb4j expressions compiled to bytecode with their own ASTs, sharing the parent expression's `Context` for access to $\alpha$ and any registered functions.

## Order Resolution

The integer ceiling $n = \lceil \alpha \rceil$ is resolved at compile time from one of three sources :

- **Bounded variable**: A `Real` variable with bounds set via `setBounds()` — the upper bound determines $n$.
- **Literal constant**: e.g., `0.5` → $n = 1$.
- **Constant expression**: e.g., a `Fraction` node like `1/2` is evaluated and ceiled.


## Semigroup Properties

The node exploits the semigroup structure of fractional calculus for symbolic differentiation and integration :

$$\frac{d}{dx}\!\left[{}^{C}\!D^{\alpha} f\right] = {}^{C}\!D^{\alpha+1} f \qquad \int {}^{C}\!D^{\alpha} f dx = {}^{C}\!D^{\alpha-1} f$$

Both operations re-enter the polymorphic `fractionalDerivative` dispatch, so a closed form is used whenever the new order permits one.

## Usage

```java
var context = new Context(Real.named("α").set("0.5", 128)
                                         .setBounds(0, false, 1, true));
var f       = RealFunction.express("Đ^(α)(t²)", context);
var result  = f.evaluate(new Real("2.0", 128), 1, 128, new Real());
// result ≈ 4.2553843242819 = Γ(3)/Γ(5/2) * 2^(3/2)
```

The `ꟲD` syntax is identical in behavior :

```java
var f = RealFunction.express("ꟲD^(α)(t³)", context);
// At α=1: Đ^(1)(t³) = 3t², recovering the ordinary derivative
```

<span style="display:none">[^1]</span>

<div align="center">⁂</div>

