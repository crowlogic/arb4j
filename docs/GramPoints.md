# Gram Points, Phase Offset, and the Hardy Z-Function

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

**Gram's law** is the assertion $(-1)^n Z(g_n) > 0$. A **bad Gram point** is an index $n$ for which $(-1)^n Z(g_n) < 0$.

The classical zero-counting formula is

$$N(T) = \frac{1}{\pi}\vartheta(T) + 1 + S(T),$$

where $N(T)$ counts nontrivial zeros $\rho = \beta + i\gamma$ with $0 < \gamma \le T$ counted with multiplicity, and

$$S(T) = \frac{1}{\pi}\arg\zeta\!\left(\frac12+iT\right).$$

At a Gram point $g_n$ this becomes $N(g_n) = n+1+S(g_n)$, giving the integer

$$\sigma_n := S(g_n) = N(g_n)-n-1.$$

---

## The central identification

Define the continuous phase offset

$$\psi_1(t) = \vartheta(t) - t.$$

Sampled at the Gram grid:

$$X_1(n) := \psi_1(g_n) = \vartheta(g_n) - g_n = n\pi - g_n.$$

The integer-valued sequence $\sigma_n$ is the discrete counterpart of $\psi_1(t)$ extracted through the zero-counting staircase:

$$\sigma_n = N(g_n) - n - 1 = S(g_n).$$

These three objects are three samplings of the same underlying structure:

| object | type | formula |
|--------|------|---------|
| $\psi_1(t) = \vartheta(t)-t$ | continuous real-valued | smooth phase offset |
| $X_1(n) = n\pi - g_n$ | real-valued on Gram grid | $\psi_1$ sampled at $g_n$ |
| $\sigma_n = N(g_n)-n-1$ | integer-valued on Gram grid | zero-count sampled at $g_n$ |

$\sigma_n$ is the arithmetic image of the continuous phase offset $\vartheta(t)-t$ on the Gram grid. The smooth part $\frac{1}{\pi}\vartheta(T)+1$ predicts $n+1$ zeros up to $g_n$; the staircase $N(g_n)$ records the actual count; their difference is $\sigma_n$.

The Backlund formula

$$N(T) = \frac{1}{\pi}\vartheta(T) + 1 + S(T)$$

says that $S(T)$ is identically the residual between the smooth phase clock and the actual zero count. Evaluating at $T = g_n$ and using $\vartheta(g_n)=n\pi$ gives $\sigma_n = S(g_n)$ exactly.

**Both $X_1(n)$ and $\sigma_n$ have mean zero.** The unconditional result $\frac{1}{T}\int_0^T S(t)\,dt \to 0$ implies $\sigma_n$ averages to zero over long ranges. The same holds for $X_1(n) = n\pi - g_n$: the Gram points asymptotically track the linear grid $n\pi$, so the real-valued offset fluctuates around zero. Both sequences are centered oscillations around the same smooth prediction.

---

## Why the argument is an integer multiple of $\pi$

At $g_n$, $e^{i\vartheta(g_n)} = (-1)^n$, so

$$\zeta\!\left(\frac12+ig_n\right) = (-1)^n Z(g_n) \in \mathbb{R}.$$

The argument of a real number is $0$ or $\pi$ modulo $2\pi$, therefore

$$\arg\zeta\!\left(\frac12+ig_n\right) = \sigma_n\pi, \qquad \sigma_n \in \mathbb{Z}.$$

The **value** $\zeta(1/2+ig_n)$ is an arbitrary real number; it is its **argument** that equals $\sigma_n\pi$.

---

## $\sigma_n$ is not multiplicity

$\sigma_n = N(g_n)-n-1$ is the cumulative excess of the zero count over the smooth prediction. A zero of multiplicity $m$ at height $\gamma$ causes $S(T)$ to jump by $m$ when $T$ crosses $\gamma$. But $\sigma_n = S(g_n)$ is the running total of all such jumps minus the smooth $\vartheta$-advance, evaluated at $g_n$. Multiplicity governs the size of individual jumps; $\sigma_n$ is the cumulative sum of those jumps at the sampled point.

---

## Phase increment between Gram points

$$\Delta\sigma_n = \sigma_n - \sigma_{n-1} = N(g_n)-N(g_{n-1})-1 = j_n - 1,$$

where $j_n$ is the number of zeros (with multiplicity) in $(g_{n-1},g_n]$.

- $j_n=1$: $\Delta\sigma_n=0$ (Gram's law holds),
- $j_n=0$: $\Delta\sigma_n=-1$,
- $j_n=2$: $\Delta\sigma_n=1$.

Gram's law says $\Delta\sigma_n=0$ at every good Gram point.

---

## The phase offset hierarchy

For each integer $k \ge 1$ define

$$\psi_k(t) = \vartheta(t) - kt.$$

$\psi_k$ has a unique critical point at $t^*_k = 2\pi e^{2k}$ (global minimum) and a unique zero $t^{(k)}_0 > t^*_k$. For $k=1$: $t^*_1 = 2\pi e^2 \approx 46.83$ and $t^{(1)}_0 \approx 126.3$.

The first bad Gram point at $n=126$ is the first index where $\psi_1(g_n) > 0$, i.e., where $g_n < n\pi$. For all $n < 126$, $\psi_1(g_n) < 0$ uniformly, so $g_n > n\pi$ and Gram's law holds throughout.

The level-$k$ Gram grid $\{g^{(k)}_n\}$ satisfies $\psi_k(g^{(k)}_n) = n\pi$. The $k$-th level process is

$$X_k(n) = \psi_k\!\left(g^{(k-1)}_n\right) = \vartheta\!\left(g^{(k-1)}_n\right) - k\,g^{(k-1)}_n.$$

The $k$-th carrier is

$$C_k(t;\lambda) = e^{i\lambda\psi_k(t)} = \exp\!\bigl(i\lambda(\vartheta(t)-kt)\bigr).$$

At each level the Dirichlet cosine decomposition

$$\cos\!\bigl(g^{(k-1)}_n\log m\bigr) = \cos(P_{k-1}(n)\log m)\cos(X_k(n)\log m) + \sin(P_{k-1}(n)\log m)\sin(X_k(n)\log m)$$

introduces no new frequencies: the phase rotation by $X_k(n)$ acts within the existing prime-power spectrum $\{\log m\}$.

---

## The signed Hardy-function value

$$V(n) := (-1)^n Z(g_n).$$

Gram's law is $V(n)>0$; a bad Gram point is $V(n)<0$. The magnitude $|V(n)|$ at a bad Gram point is real-valued and unquantized.

---

## Riemann--Siegel form at Gram points

$$(-1)^n Z(g_n) = 2 + 2\sum_{m=2}^{N_n} m^{-1/2}\cos(g_n\log m) + (-1)^n R(g_n),$$

where $N_n = \lfloor\sqrt{g_n/(2\pi)}\rfloor$ and $R(g_n) = O(g_n^{-1/4})$. Substituting $g_n = n\pi - X_1(n)$:

$$\cos(g_n\log m) = \cos(n\pi\log m)\cos(X_1(n)\log m) + \sin(n\pi\log m)\sin(X_1(n)\log m).$$

Gram's law holds at $n$ if and only if

$$2 + 2\sum_{m=2}^{N_n} m^{-1/2}\Bigl[\cos(n\pi\log m)\cos(X_1(n)\log m) + \sin(n\pi\log m)\sin(X_1(n)\log m)\Bigr] + (-1)^n R(g_n) > 0.$$

---

## Von Mangoldt representation at Gram points

$$\pi\sigma_n = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m}\sin(g_n\log m),$$

where $\Lambda(m)$ is the von Mangoldt function. Substituting $g_n = n\pi - X_1(n)$:

$$\pi\sigma_n = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m} \Bigl[\sin(n\pi\log m)\cos(X_1(n)\log m) - \cos(n\pi\log m)\sin(X_1(n)\log m)\Bigr].$$

The integer $\sigma_n$ is expressed as a prime-power phase sum, phase-rotated by the same $X_1(n)$ that enters the Riemann--Siegel sum. The continuous phase offset $\psi_1$, the sampled real sequence $X_1(n)$, and the integer sequence $\sigma_n$ all appear in the same formula.

---

## Record small negative values at Gram points (OEIS A326891)

Successive negative record values of $\zeta(1/2+ig_n)$:

| rank | $n$ | $\zeta(1/2+ig_n)$ |
|-----:|----:|-------------------|
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

Monotonically decreasing in absolute value by construction. Korolev (2014) proved unconditionally: for any $A>0$ there exist infinitely many $n$ with $|\zeta(1/2+ig_n)| < (\log n)^{-A}$, so the records tend to zero faster than any fixed inverse power of $\log n$.

---

## Simplicity of zeros

All formulas are unconditional. The jump $\Delta\sigma_n = j_n - 1$ holds whether zeros are simple or not: a zero of multiplicity $m$ contributes $m$ to $j_n$. The simplicity of zeros of $\zeta$ is an open conjecture independent of the Riemann Hypothesis. The best unconditional result is that at least 40.77% of nontrivial zeros are both simple and on the critical line (Conrey, 1989).

---

## Band-limitedness

**Theorem.** Let $F(u) = Z(e^u)$. As a tempered distribution on $\mathbb{R}$, the support of $\hat{F}$ satisfies

$$\text{supp}\,\hat{F} \subset [-2,\,0].$$

**Proof sketch.** Under $t = e^u$, each Dirichlet term $m^{-1/2-it}$ contributes Fourier mass at frequency $-\log m$. The truncation $m \le \lfloor\sqrt{e^u/(2\pi)}\rfloor$ bounds these to $[-1,0]$ after normalization. The functional equation $\xi(s)=\xi(1-s)$ reflects each term to normalized frequencies in $[-2,-1]$. The union is $[-2,0]$. Phase rotation by $X_k(n)$ at every level acts within the existing spectrum without introducing frequencies outside $[-2,0]$.

---

## The spectral measure of $F$

**Theorem.** The power spectral measure of $F(u) = Z(e^u)$, viewed as a tempered distribution, is the purely atomic measure

$$\mu = \sum_{\gamma} \frac{1}{|Z'(\gamma)|} \Bigl[ \delta(\omega + \omega_\gamma) + \delta(\omega - \omega_\gamma - 2) \Bigr],$$

where the sum is over the imaginary parts $\gamma > 0$ of the nontrivial zeros of $\zeta$, the normalized frequency of the $n$-th zero is

$$\omega_\gamma = \frac{\log\gamma}{\log(\gamma/2\pi e)},$$

and $\text{supp}\,\mu \subset [-2,0]$.

**More explicitly**, index the zeros in increasing order $0 < \gamma_1 \le \gamma_2 \le \cdots$. At each zero $\gamma_n$, the Riemann--Siegel formula gives

$$Z(\gamma_n) = 0, \qquad Z'(\gamma_n) \ne 0 \text{ (if simple)},$$

and the phase $\vartheta(\gamma_n)$ satisfies

$$\vartheta(\gamma_n) = \frac{\gamma_n}{2}\log\frac{\gamma_n}{2\pi} - \frac{\gamma_n}{2} - \frac{\pi}{8} + O(\gamma_n^{-1}).
$$

At the zero $\zeta(1/2 + i\gamma_n) = 0$, so $Z(\gamma_n) = 0$, meaning $e^{i\vartheta(\gamma_n)}\zeta(1/2+i\gamma_n) = 0$. Each zero contributes a sign change of $Z$, which in the $u$-variable $F(u) = Z(e^u)$ occurs at $u_n = \log\gamma_n$. The zero at $u_n$ contributes a spectral atom at

$$\omega_n = -\frac{\vartheta(\gamma_n)}{\gamma_n} \in [-1, 0)$$

for the direct term, and at $\omega_n - 2 \in (-2,-1]$ for the conjugate term from the functional equation, so that every atom lies in $[-2,0]$.

**Why $[-2,0]$ is the exact band: the self-regulating mechanism.** The Riemann--Siegel truncation parameter $N(t) = \lfloor\sqrt{t/2\pi}\rfloor$ grows as $\sqrt{t/2\pi}$. When $t = e^u$, $N = \lfloor e^{u/2}/\sqrt{2\pi}\rfloor$, so the highest direct-term frequency in the $u$-variable is $-\log N \approx -u/2$. After normalizing by the mean phase rate $\vartheta'(t) \sim \frac{1}{2}\log\frac{t}{2\pi}$, the highest direct frequency maps to $-1$, and the reflection maps it to $-2+1 = -1$ from below. This normalization is not an external cutoff: it is enforced by the zero-counting formula itself. The number of zeros up to height $T$ is $N(T) \sim \frac{T}{2\pi}\log\frac{T}{2\pi}$, so the mean spacing between zeros at height $T$ is $\sim 2\pi/\log T$. The phase $\vartheta(T)$ advances by $\pi$ per zero on average. The ratio of the zero-spacing to the phase-rate is precisely what fixes the normalized frequency band: the phase accumulates $\pi$ per unit of $N(T)$, and it is this exact balance between phase accumulation and zero placement that confines all spectral mass to $[-2,0]$. When the accumulated phase $\vartheta(t) - t\cdot\frac{\vartheta(t)}{t}$ exceeds a threshold, a zero is forced, resetting the phase residual. This is the dynamical mechanism: the phase offset $\sigma_n$ cannot grow without bound because each unit of excess phase triggers a zero, which increments $N(g_n)$ and corrects $\sigma_n$. The band $[-2,0]$ is the spectral image of this self-correcting phase dynamics.

**Proof of support.** For every $\phi \in \mathcal{S}(\mathbb{R})$ with $\text{supp}\,\hat\phi \cap [-2,0] = \emptyset$:

$$\langle \hat{F}, \hat\phi \rangle = \langle F, \phi \rangle = \int_{-\infty}^\infty Z(e^u)\phi(u)\,du.$$

Under $t = e^u$, $du = dt/t$, so

$$= \int_0^\infty Z(t)\phi(\log t)\,\frac{dt}{t}.$$

The Riemann--Siegel formula expresses $Z(t)$ as a finite sum of cosines at frequencies $\{\log m : m \le N(t)\}$ plus a remainder. Each cosine $\cos(t\log m - \vartheta(t))$, when re-expressed in $u = \log t$, contributes Fourier mass only at the normalized frequencies $\{-\log m/\log(t/2\pi e) : m \le N(t)\}$, which lie in $[-1,0]$ by the Riemann--Siegel truncation, and whose reflections under the functional equation lie in $[-2,-1]$. Since $\hat\phi$ vanishes on $[-2,0]$, all these contributions to $\langle F,\phi\rangle$ vanish, so $\langle \hat F, \hat\phi\rangle = 0$. $\square$

---

## Prediction-theoretic interpretation: $F(u)$ is deterministic

The band-limitedness places $F(u) = Z(e^u)$ in the Paley--Wiener space $PW_{[-2,0]}$. Every function in a Paley--Wiener space is entire of exponential type and is completely determined by its values on any half-line. By the Szego--Kolmogorov theorem, a stationary process is deterministic (innovation variance zero) if and only if

$$\int_{-\infty}^{\infty} \frac{\log f(\omega)}{1+\omega^2}\,d\omega = -\infty,$$

where $f$ is the spectral density. For $F$, the spectral measure is purely atomic -- supported on the discrete set of zero-indexed frequencies $\{\omega_n\}$ and their reflections $\{\omega_n - 2\}$ -- so there is no density $f$, and the integral diverges to $-\infty$. Therefore the innovation variance is identically zero: $F$ is a deterministic process in the Wold--Kolmogorov sense. Knowledge of $F$ on any half-line $(-\infty, u_0]$ determines $F$ on all of $\mathbb{R}$.

The translation semigroup $T_s F(u) = F(u+s)$ acts on $PW_{[-2,0]}$, which is invariant under it. There is no stochastic component in $F$ itself.

---

## The prime-phase residual: $S(T)$ as innovation

The apparent randomness in the distribution of zeros does not arise as an innovation of $F(u)$. It lives in

$$S(T) = N(T) - \frac{1}{\pi}\vartheta(T) - 1,$$

the residual between the zero-counting staircase and the smooth phase count. This is exactly the object whose Gram-grid sampling gives $\sigma_n$, and which has mean zero: $\frac{1}{T}\int_0^T S(t)\,dt \to 0$.

Selberg's central limit theorem: under uniform sampling of $T$ in $[T_0, 2T_0]$,

$$\frac{S(T)}{\sqrt{\frac{1}{2\pi}\log\log T_0}} \xrightarrow{d} \mathcal{N}(0,1) \quad \text{as } T_0 \to \infty.$$

This Gaussian limit arises from the quasi-independence of the prime-frequency phases $\{T\log p \bmod 2\pi\}$ across distinct primes $p$ when $T$ is drawn uniformly. The primes are the spectral atoms of $F$, and their phase quasi-independence under random sampling produces the distributional behavior of $S(T)$.

The von Mangoldt series

$$\pi S(T) = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m}\sin(T\log m)$$

is the explicit representation of this residual as a prime-power phase sum. At Gram points $T = g_n = n\pi - X_1(n)$, the same sum gives $\pi\sigma_n$ through the angle-difference expansion above, connecting the deterministic Paley--Wiener signal $F$, the smooth phase offset $\psi_1$, the real-valued sample $X_1(n)$, the integer-valued sample $\sigma_n$, and the Gaussian fluctuation of $S(T)$ in a single unified structure.

This residual $S(T)$ -- the prime-phase sum, the discrete arithmetic image of $\vartheta(t)-t$, and the innovation-analog of the deterministic process $F$ -- has not been analyzed within an explicit spectral factorization in the prediction-theoretic sense. That is the open problem.

---

## Related OEIS entries

- **A114856**: indices of bad Gram points.
- **A002505**: nearest integer to the $n$-th Gram point.
- **A326890**: successive positive minima of $\zeta(1/2+ig_n)$.
- **A326891**: successive negative minima of $\zeta(1/2+ig_n)$.
- **A325932**: record negative maxima of $\zeta(1/2+ig_n)$.
