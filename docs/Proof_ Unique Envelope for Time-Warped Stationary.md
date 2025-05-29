<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Proof: Unique Envelope for Time-Warped Stationary Processes

## Theorem Statement

**Theorem**: Let $\{X(\tau), \tau \in \mathbb{R}\}$ be a stationary stochastic process and let $\theta: \mathbb{R} \to \mathbb{R}$ be a strictly monotonically increasing function. Then the time-warped process $Y(t) = X(\theta(t))$ has a unique envelope definition.

## Formal Proof

### Step 1: Envelope Uniqueness for Stationary Processes

**Lemma A**: Every stationary process $X(\tau)$ with spectral representation
$X(\tau) = \int_{-\infty}^{\infty} e^{i\lambda \tau} dZ(\lambda)$
has a unique envelope $R_X(\tau) = |X_a(\tau)|$ where $X_a(\tau) = X(\tau) + i\hat{X}(\tau)$ is the analytic signal and $\hat{X}(\tau)$ is the Hilbert transform of $X(\tau)$.

**Proof of Lemma A**:

- For stationary $X(\tau)$, the Hilbert transform $\hat{X}(\tau) = \mathcal{H}[X](\tau)$ is uniquely defined
- The analytic signal $X_a(\tau) = X(\tau) + i\hat{X}(\tau)$ is unique
- Therefore $R_X(\tau) = |X_a(\tau)| = \sqrt{X^2(\tau) + \hat{X}^2(\tau)}$ is unique □


### Step 2: Coordinate Transformation Lemma

**Lemma B**: Let $f: \mathbb{R} \to \mathbb{R}$ be strictly monotonic with inverse $f^{-1}$. If process $\{W(\tau)\}$ has unique envelope $R_W(\tau)$, then process $\{W(f(t))\}$ has unique envelope $R_{W \circ f}(t) = R_W(f(t))$.

**Proof of Lemma B**:
Suppose $\{W(f(t))\}$ has two different envelope definitions $E_1(t)$ and $E_2(t)$.

Define the pullback envelopes:
$\tilde{E}_1(\tau) := E_1(f^{-1}(\tau)), \quad \tilde{E}_2(\tau) := E_2(f^{-1}(\tau))$

Since $W(\tau) = W(f(f^{-1}(\tau)))$, both $\tilde{E}_1(\tau)$ and $\tilde{E}_2(\tau)$ are envelope definitions for the same process $\{W(\tau)\}$.

By uniqueness of $R_W(\tau)$: $\tilde{E}_1(\tau) = \tilde{E}_2(\tau) = R_W(\tau)$ almost surely.

Applying $f$ to both sides:
$E_1(t) = \tilde{E}_1(f(t)) = R_W(f(t)) = \tilde{E}_2(f(t)) = E_2(t)$

Therefore, the envelope is unique: $R_{W \circ f}(t) = R_W(f(t))$ □

### Step 3: Construction of Unique Envelope

**Main Proof**:
Given $Y(t) = X(\theta(t))$ where $X(\tau)$ is stationary and $\theta(t)$ is strictly increasing:

1) **Apply Lemma A**: The stationary process $X(\tau)$ has unique envelope $R_X(\tau)$
2) **Apply Lemma B**: With $f(t) = \theta(t)$ and $W(\tau) = X(\tau)$:
    - $\theta$ is strictly monotonic ✓
    - $X(\tau)$ has unique envelope $R_X(\tau)$ ✓
    - Therefore $Y(t) = X(\theta(t))$ has unique envelope $R_Y(t) = R_X(\theta(t))$
3) **Explicit Construction**:
    - Quadrature process: $\hat{Y}(t) = \hat{X}(\theta(t))$
    - Analytic signal: $Y_a(t) = Y(t) + i\hat{Y}(t) = X(\theta(t)) + i\hat{X}(\theta(t))$
    - Unique envelope:
$R_Y(t) = |Y_a(t)| = \sqrt{Y^2(t) + \hat{Y}^2(t)} = \sqrt{X^2(\theta(t)) + \hat{X}^2(\theta(t))} = R_X(\theta(t))$

### Step 4: Verification of Uniqueness

Suppose there exists another envelope definition $\tilde{R}_Y(t)$ for $Y(t)$.

By Lemma B's construction: $\tilde{R}_X(\tau) := \tilde{R}_Y(\theta^{-1}(\tau))$ would be an envelope for $X(\tau)$.

But $X(\tau)$ has unique envelope $R_X(\tau)$, so:
$\tilde{R}_X(\tau) = R_X(\tau) \implies \tilde{R}_Y(\theta^{-1}(\tau)) = R_X(\tau)$

Substituting $t = \theta^{-1}(\tau)$ (equivalently $\tau = \theta(t)$):
$\tilde{R}_Y(t) = R_X(\theta(t)) = R_Y(t)$

Therefore, any envelope definition must equal $R_Y(t) = R_X(\theta(t))$, proving uniqueness. □

## Conclusion

The time-warped stationary process $Y(t) = X(\theta(t))$ inherits envelope uniqueness from the underlying stationary process $X(\tau)$ through the bijective coordinate transformation $\theta(t)$. The unique envelope is explicitly given by:

$\boxed{R_Y(t) = R_X(\theta(t)) = \sqrt{X^2(\theta(t)) + \hat{X}^2(\theta(t))}}$

This result holds for any strictly monotonic time-warping function $\theta(t)$, regardless of whether the process satisfies Hasofer's transience conditions.

