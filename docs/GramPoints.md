# Gram Points, Phase Defect, and the Hardy Z-Function

## Definitions

The **Gram points** $\{g_n\}_{n \ge 0}$ are defined by

$$\vartheta(g_n) = n\pi,$$

where $\vartheta(t)$ is the Riemann--Siegel theta function

$$\vartheta(t) = \arg\!\left(\pi^{-it/2}\Gamma\!\left(\frac14+\frac{it}{2}\right)\right),$$

with asymptotic expansion

$$\vartheta(t) = \frac{t}{2}\log\frac{t}{2\pi} - \frac{t}{2} - \frac{\pi}{8} + \frac{1}{48t} + O(t^{-3}).$$

The Hardy $Z$-function is

$$Z(t) = e^{i\vartheta(t)}\zeta\!\left(\frac12+it\right),$$

and $Z(t)$ is real for real $t$.

**Gram's law** is the assertion

$$(-1)^n Z(g_n) > 0.$$

A **bad Gram point** is an index $n$ for which $(-1)^n Z(g_n) < 0$.

The classical zero-counting formula is

$$N(T) = \frac{1}{\pi}\vartheta(T) + 1 + S(T),$$

where $N(T)$ counts nontrivial zeros $\rho = \beta + i\gamma$ with $0 < \gamma \le T$, counted with multiplicity, and

$$S(T) = \frac{1}{\pi}\arg\zeta\!\left(\frac12+iT\right).$$

At a Gram point $g_n$ this becomes $N(g_n) = n+1+S(g_n)$, so the integer

$$\sigma_n := S(g_n) = N(g_n)-n-1$$

is the exact deviation of the zero-counting staircase from the smooth Gram-point count.

---

## Why the argument is an integer multiple of $\pi$

At a Gram point $g_n$, we have $e^{i\vartheta(g_n)} = e^{in\pi} = (-1)^n$, so

$$\zeta\!\left(\frac12+ig_n\right) = (-1)^n Z(g_n) \in \mathbb{R}.$$

The argument of a real number is $0$ or $\pi$ modulo $2\pi$. Therefore

$$\arg\zeta\!\left(\frac12+ig_n\right) = \sigma_n\pi, \qquad \sigma_n \in \mathbb{Z}.$$

The **value** $\zeta(1/2+ig_n)$ is a real number but is not a multiple of $\pi$; it is its **argument** that equals $\sigma_n\pi$.

---

## $\sigma_n$ is not multiplicity

The integer $\sigma_n = N(g_n)-n-1$ is not the multiplicity of any zero. It is the cumulative discrepancy between the actual zero count and the smooth count at the sampled point $g_n$.

A zero of multiplicity $m$ at height $\gamma$ causes $S(T)$ to jump by $m$ when $T$ crosses $\gamma$. But $\sigma_n = S(g_n)$ is the value of that running sum at the Gram grid point, not the local jump size. These are different objects.

---

## Phase jump between Gram points

Define the phase increment $\Delta\sigma_n = \sigma_n - \sigma_{n-1}$. Then

$$\Delta\sigma_n = N(g_n)-N(g_{n-1})-1.$$

If the interval $(g_{n-1},g_n]$ contains exactly $j_n$ zeros counted with multiplicity, then

$$\Delta\sigma_n = j_n - 1.$$

So the phase jump from one Gram point to the next is $(j_n-1)\pi$:

- $j_n=1$ (exactly one zero, the generic case): $\Delta\sigma_n=0$,
- $j_n=0$ (zero-free interval): $\Delta\sigma_n=-1$,
- $j_n=2$ (two zeros or one double zero): $\Delta\sigma_n=1$.

Gram's law does **not** say the phase advances by $\pi$ at each step. It says $\Delta\sigma_n=0$ at each good Gram point.

---

## The first-level phase defect

Define $\psi_1(t) = \vartheta(t)-t$. Sampled at the Gram grid:

$$X_1(n) := \psi_1(g_n) = n\pi - g_n.$$

For each integer $k \ge 1$ the $k$-th phase function is $\psi_k(t)=\vartheta(t)-kt$.

$\psi_k$ has a unique critical point at $t^*_k = 2\pi e^{2k}$ (global minimum) and a unique zero $t^{(k)}_0 > t^*_k$. For $k=1$: $t^*_1 = 2\pi e^2 \approx 46.83$ and $t^{(1)}_0 \approx 126.3$. The first bad Gram point occurs at $n=126$, coinciding with $\lfloor t^{(1)}_0 \rfloor = 126$.

The three related sequences are:

- $\psi_1(t) = \vartheta(t)-t$: continuous real-valued phase defect,
- $X_1(n) = n\pi - g_n$: its real-valued Gram-grid sample,
- $\sigma_n = N(g_n)-n-1$: the integer-valued discrepancy from the zero-counting staircase at the same grid.

In this sense $\sigma_n$ is the discrete arithmetic shadow of $\vartheta(t)-t$ on the Gram grid.

---

## The signed Hardy-function value

Define

$$V(n) := (-1)^n Z(g_n).$$

Gram's law is $V(n)>0$; a bad Gram point is $V(n)<0$. The magnitude $|V(n)|$ when $V(n)<0$ is the real-valued measure of the violation. It is not quantized.

For example, the first bad Gram point is $n=126$ with $V(126) \approx -0.02763$.

---

## Record small negative values at Gram points (OEIS A326891)

The successive negative record values of $\zeta(1/2+ig_n)$:

| rank | Gram index $n$ | $\zeta(1/2+ig_n)$ |
|-----:|---------------:|-------------------|
| 1 | 126 | $-0.02762949885719994$ |
| 2 | 134 | $-0.01690039090339079$ |
| 3 | 777 | $-0.00964626429746985$ |
| 4 | 1165 | $-0.008575843736423$ |
| 5 | 2808 | $-0.005747300941326$ |
| 6 | 3782 | $-0.000760294730822$ |
| 7 | 12174 | $-0.00045763304501$ |
| 8 | 14374 | $-0.00027891005688$ |
| 9 | 23149 | $-0.00007068683846$ |
| 10 | 60780 | $-0.0000398945276$ |
| 11 | 117807 | $-0.0000229487717$ |
| 12 | 126085 | $-0.0000077126884$ |

This is monotonically decreasing in absolute value by construction. Korolev (2014) proved unconditionally that for any $A>0$ there exist infinitely many Gram indices $n$ with

$$|\zeta(1/2+ig_n)| < (\log n)^{-A},$$

so the record negative values tend to zero, faster than any fixed inverse power of $\log n$.

---

## Simplicity of zeros and the phase integer

All formulas above are unconditional. The relation to zero simplicity is:

- if all zeros in $(g_{n-1},g_n]$ are simple, then $\Delta\sigma_n = j_n-1$ where $j_n$ is the number of zeros,
- if a zero of multiplicity $m$ lies in the interval, it contributes $m$ to $j_n$.

The simplicity of zeros of $\zeta$ is an open conjecture, independent of the Riemann Hypothesis. The best unconditional result is that at least 40.77% of nontrivial zeros are both simple and on the critical line (Conrey, 1989). Neither simplicity nor the Riemann Hypothesis is assumed in the Backlund formula or in the Gram-point analysis.

---

## Von Mangoldt representation at Gram points

The von Mangoldt series gives

$$\pi\sigma_n = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m}\sin(g_n\log m),$$

where $\Lambda(m)$ is the von Mangoldt function. Substituting $g_n = n\pi - X_1(n)$:

$$\pi\sigma_n = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m} \Bigl[\sin(n\pi\log m)\cos(X_1(n)\log m) - \cos(n\pi\log m)\sin(X_1(n)\log m)\Bigr].$$

So the phase integer $\sigma_n$ is a prime-power phase sum modulated by $X_1(n)$.

---

## Riemann--Siegel form at Gram points

The Riemann--Siegel formula at $t = g_n$ gives

$$(-1)^n Z(g_n) = 2 + 2\sum_{m=2}^{N_n} m^{-1/2}\cos(g_n\log m) + (-1)^n R(g_n),$$

where $N_n = \lfloor\sqrt{g_n/(2\pi)}\rfloor$ and $R(g_n) = O(g_n^{-1/4})$.

Substituting $g_n = n\pi - X_1(n)$:

$$\cos(g_n\log m) = \cos(n\pi\log m)\cos(X_1(n)\log m) + \sin(n\pi\log m)\sin(X_1(n)\log m).$$

Gram's law holds at index $n$ if and only if

$$2 + 2\sum_{m=2}^{N_n} m^{-1/2}\Bigl[\cos(n\pi\log m)\cos(X_1(n)\log m) + \sin(n\pi\log m)\sin(X_1(n)\log m)\Bigr] + (-1)^n R(g_n) > 0.$$

---

## Carrier hierarchy

The level-$k$ Gram grid $\{g^{(k)}_n\}$ satisfies $\psi_k(g^{(k)}_n) = n\pi$. The $k$-th carrier is

$$C_k(t;\lambda) = e^{i\lambda\psi_k(t)} = \exp\!\bigl(i\lambda(\vartheta(t)-kt)\bigr).$$

The $k$-th level process is $X_k(n) = \psi_k(g^{(k-1)}_n)$. At each level, the Dirichlet cosines decompose via angle-difference without introducing new frequencies: the phase modulation rotates Dirichlet phases within the existing prime-power spectrum.

---

## Band-limitedness

**Theorem.** Let $F(u) = Z(e^u)$. As a tempered distribution on $\mathbb{R}$,

$$\operatorname{supp}\widehat{F} \subset [-2,\,0].$$

**Proof sketch.** Under $t = e^u$, each direct Dirichlet term $m^{-1/2-it}$ contributes Fourier mass at frequency $-\log m$. The truncation $m \le \lfloor\sqrt{e^u/(2\pi)}\rfloor$ bounds these to $[-1,0]$ after normalization. The functional equation $\xi(s)=\xi(1-s)$ maps each direct term to a reflected term with normalized frequencies in $[-2,-1]$. The union is $[-2,0]$. Phase modulation by $X_k(n)$ at every level rotates within the existing spectrum without introducing frequencies outside $[-2,0]$.

---

## Prediction-theoretic interpretation

The band-limitedness of $F(u) = Z(e^u)$ places it in the Paley--Wiener space $PW_{[-2,0]}$. A function in a Paley--Wiener space is entire of exponential type and is determined by its values on any half-line. By the Szego--Kolmogorov theorem, the Paley--Wiener condition

$$\int_{-\infty}^{\infty} \frac{\log f(\omega)}{1+\omega^2}\,d\omega > -\infty$$

fails for $F$: the spectral measure is purely atomic (supported on $\{-\log m : m \ge 1\}$ and their reflections), so $\log f = -\infty$ on a set of infinite measure. Therefore the innovation variance is zero, and $F$ is deterministic in the Wold--Kolmogorov sense: any half-line sample determines the whole function.

The semigroup of translations $T_s F(u) = F(u+s)$ acts on $PW_{[-2,0]}$, which is invariant under it. The fluctuation structure of

$$S(T) = N(T) - \frac{1}{\pi}\vartheta(T) - 1$$

is the discrepancy between the zero-counting staircase and the smooth phase count. Selberg's central limit theorem states that under uniform sampling of $T$ in $[T_0, 2T_0]$, the distribution of

$$\frac{S(T)}{\sqrt{\frac{1}{2\pi}\log\log T_0}}$$

converges to the standard Gaussian as $T_0 \to \infty$. This Gaussian fluctuation arises from the quasi-independence of the prime-frequency phases $\{T\log p \bmod 2\pi\}$ across distinct primes $p$ when $T$ is drawn uniformly. The primes are the spectral atoms, and their phase quasi-independence under random sampling is the source of the distributional behavior of $S(T)$.

The residual connecting the deterministic signal $F(u)$ to the arithmetic of the zeros is $S(T)$ itself, expressed as the von Mangoldt prime-power phase sum. This object has not been analyzed within an explicit spectral factorization in the prediction-theoretic sense.

---

## Related OEIS entries

- **A114856**: indices of bad Gram points.
- **A002505**: nearest integer to the $n$-th Gram point.
- **A326890**: successive positive minima of $\zeta(1/2+ig_n)$.
- **A326891**: successive negative minima of $\zeta(1/2+ig_n)$.
- **A325932**: record negative maxima of $\zeta(1/2+ig_n)$.
