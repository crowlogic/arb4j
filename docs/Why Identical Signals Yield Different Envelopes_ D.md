<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Why Identical Signals Yield Different Envelopes: Demystifying Representation Dependence

The paradox arises because **the envelope isn’t determined solely by the observed signal $Y(t)$**—it depends on **hidden phase relationships** embedded in the system’s representation. Here’s why identical $Y(t)$ values can produce divergent envelopes:

---

## The Missing Ingredient: Phase Information

### Mathematical Reality Check

An oscillatory process $Y(t)$ is analogous to the shadow of a rotating vector—you see only the projection (real part), while the full motion depends on both amplitude **and phase**. The envelope $R(t)$ attempts to reconstruct the vector’s length from its shadow, but **multiple vectors can cast the same shadow** (Figure 1).

**Key equation**:

$$
Y(t) = R(t)\cos(\theta(t)) \quad \text{and} \quad \hat{Y}(t) = R(t)\sin(\theta(t))
$$

But if $Y(t)$ alone is given, both $R(t)$ and $\theta(t)$ are underdetermined.

---

## How Representations Inject Phase

### Spectral Freedom in Stationary Inputs

Consider two representations of $Y(t)$:

1. **Representation A**:

$$
Y(t) = \int h(t, u) X(u) du
$$

where $X(u)$ has spectral components $\xi_1, \xi_2, ...$ with phases $\phi_1, \phi_2, ...$.
2. **Representation B**:

$$
Y(t) = \int h'(t, u) X'(u) du
$$

where $X'(u)$ is an orthogonal transform of $X(u)$, altering phase relationships.

**Critical insight**: Both produce the same $Y(t)$ but differ in **how phase evolves across frequencies**, leading to distinct quadratures $\hat{Y}(t)$ and $\hat{Y}'(t)$.

---

## Concrete Example: Phase Mixing

### Setup

Let $Y(t) = \xi_1 \cos(t) + \xi_2 \sin(t)$ with $\xi_1, \xi_2 \sim N(0,1)$. Two representations:

- **Representation 1**: Standard basis

$$
\hat{Y}(t) = -\xi_1 \sin(t) + \xi_2 \cos(t)
$$
- **Representation 2**: Transformed basis (orthogonal mix)

$$
\hat{Y}'(t) = -\xi_2 \sin(t) + \xi_1 \cos(t)
$$

**Envelope comparison**:

- $R(t) = \sqrt{\xi_1^2 + \xi_2^2}$ (constant)
- $R'(t) = \sqrt{\xi_2^2 + \xi_1^2}$ (same value)

**Wait—they’re identical here!** But this symmetry breaks for **non-stationary** or **multi-frequency** systems.

---

## When Representations Diverge: A 3-Frequency Case

Let $Y(t) = \xi_1 \cos(t) + \xi_2 \cos(2t) + \xi_3 \sin(t) + \xi_4 \sin(2t)$. Apply Hasofer’s orthogonal transformation:

$$
\begin{bmatrix}  
\eta_1 \\  
\eta_2 \\  
\eta_3 \\  
\eta_4  
\end{bmatrix}  
=  
\frac{1}{2}  
\begin{bmatrix}  
1 & 1 & 1 & 1 \\  
-1 & -1 & 1 & 1 \\  
1 & -1 & -1 & 1 \\  
-1 & 1 & -1 & 1  
\end{bmatrix}  
\begin{bmatrix}  
\xi_1 \\  
\xi_2 \\  
\xi_3 \\  
\xi_4  
\end{bmatrix}
$$

Now express $Y(t)$ in the $\eta$-basis:

$$
Y(t) = (\eta_1 - \eta_2)\cos(t) + (\eta_3 + \eta_4)\sin(t) + (\eta_1 + \eta_2)\cos(2t) + (\eta_3 - \eta_4)\sin(2t)
$$

**Quadrature differences**:

- Original: $\hat{Y}(t)$ mixes $\xi_i$ with frequency-matched phases.
- Transformed: $\hat{Y}'(t)$ now couples $\eta_i$ across frequencies (e.g., $\cos(t)$ terms tied to $\eta_1, \eta_2$ and $\sin(2t)$).

**Result**: Cross-covariance $E[Y(t)\hat{Y}(s)] \neq E[Y(t)\hat{Y}'(s)]$, altering envelope statistics.

---

## Physical Interpretation: What’s "Real"?

### Case 1: Known System Dynamics

If $Y(t)$ comes from a **physically modeled system** (e.g., damped oscillator with known $h(t-u)$), the representation is fixed by the system’s impulse response. The envelope reflects true energy modulation.

### Case 2: Black-Box Signal Analysis

If $Y(t)$ is an observed signal with unknown genesis, the envelope becomes **analysis-method-dependent**. For example:

- **Hilbert transform**: Assumes linear phase relationships across all frequencies.
- **Wavelet transform**: Prioritizes time-localized phase coherence.

Both methods can produce valid but different envelopes for the same $Y(t)$.

---

## Pragmatic Takeaway

1. **For model-based systems** (e.g., structural vibrations with known equations):
    - Use the envelope from your **governing equations’ quadrature** (unique under Hasofer’s transient class).
2. **For empirical signals**:
    - Acknowledge that the envelope is **tool-dependent** (Hilbert, wavelets, etc.).
    - Validate against **physical gold standards** (e.g., strain gauges measuring true amplitude).
3. **In predictive tasks**:
    - Treat envelope non-uniqueness as a **hyperparameter**—test which representation best correlates with your target outcome.

---

## Bottom Line

The envelope isn’t an intrinsic property of $Y(t)$—it’s a **joint property of $Y(t)$ and your chosen method to represent its latent phase structure**. Different methods answer different questions about the signal’s behavior, much like how choosing RGB vs. HSV color spaces alters which features of an image you emphasize. To avoid "representation chaos," anchor your choice to what you **physically know** or **operationally need**.

