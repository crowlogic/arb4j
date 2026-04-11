# Gram Points and the Phase-Modulation Mechanism of the Hardy Z-Function

## Definitions

The **Gram points** $\{g_n\}_{n \geq 0}$ are the solutions of

$$\vartheta(g_n) = n\pi, \qquad n = 0, 1, 2, \ldots$$

where $\vartheta(t)$ is the Riemann–Siegel theta function

$$\vartheta(t) = \arg\!\left(\pi^{-it/2}\,\Gamma\!\left(\frac{1}{4}+\frac{it}{2}\right)\right),$$

with asymptotic expansion

$$\vartheta(t) = \frac{t}{2}\log\frac{t}{2\pi} - \frac{t}{2} - \frac{\pi}{8} + \frac{1}{48t} + O(t^{-3}).$$

The Hardy $Z$-function is

$$Z(t) = e^{i\vartheta(t)}\,\zeta\!\left(\frac{1}{2}+it\right),$$

which is real-valued for real $t$.

**Gram's law** is the statement $(-1)^n = \operatorname{sgn}(Z(g_n))$, equivalently $(-1)^n Z(g_n) > 0$. A Gram point at which this fails is a **Gram exception**.

## The Phase Integer at Each Gram Point

Since $Z(g_n) = (-1)^n\zeta(1/2+ig_n)$ and $Z$ is real, $\zeta(1/2+ig_n)$ is real at every Gram point. Therefore the argument of $\zeta(1/2+ig_n)$ is an integer multiple of $\pi$. Define

$$\sigma_n = \frac{1}{\pi}\arg\zeta\!\left(\tfrac{1}{2}+ig_n\right) \in \mathbb{Z}.$$

From the zero-counting formula $N(T) = \frac{1}{\pi}\vartheta(T) + 1 + S(T)$ with $\vartheta(g_n) = n\pi$:

$$\sigma_n = S(g_n) = N(g_n) - n - 1,$$

where $N(g_n)$ is the number of zeros of $\zeta$ with imaginary part in $(0, g_n]$.

The phase at $g_n$ is $\sigma_n\pi$, and the phase jump from $g_{n-1}$ to $g_n$ is $(\sigma_n - \sigma_{n-1})\pi$, which is an integer multiple of $\pi$ but not always $\pi$.

The von Mangoldt representation gives

$$\pi\sigma_n = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m}\sin(g_n\log m),$$

where $\Lambda(m)$ is the von Mangoldt function ($\log p$ when $m = p^j$, zero otherwise).

## The First-Level Process

For each integer $k \geq 1$, define the $k$-th phase function

$$\psi_k(t) = \vartheta(t) - kt.$$

The **first-level process** is the restriction of $\psi_1$ to the Gram grid:

$$X_1(n) = \psi_1(g_n) = n\pi - g_n.$$

**Theorem.** $\psi_k$ has a unique critical point on $(0,\infty)$ at $t^*_k = 2\pi e^{2k}$, which is a global minimum. It has a unique zero $t^{(k)}_0 > t^*_k$. For $t < t^{(k)}_0$, $\psi_k(t) < 0$; for $t > t^{(k)}_0$, $\psi_k(t) > 0$.

For $k=1$: $t^*_1 = 2\pi e^2 \approx 46.83$ and $t^{(1)}_0 \approx 126.3$. The first Gram exception occurs at $n = 126$, coinciding with $\lfloor t^{(1)}_0 \rfloor = 126$.

## Phase-Modulation Form of the Riemann–Siegel Sum at Gram Points

The Riemann–Siegel formula gives, at any Gram point $g_n$:

$$(-1)^n Z(g_n) = 2 + 2\sum_{m=2}^{N_n} m^{-1/2}\cos(g_n\log m) + (-1)^n R(g_n),$$

where $N_n = \lfloor\sqrt{g_n/(2\pi)}\rfloor$ and $R(g_n) = O(g_n^{-1/4})$.

The $m=1$ term contributes the constant $+2$. Substituting $g_n = n\pi - X_1(n)$ into each cosine and applying the angle-difference identity:

$$\cos(g_n\log m) = \cos(n\pi\log m)\cos(X_1(n)\log m) + \sin(n\pi\log m)\sin(X_1(n)\log m).$$

The first-level process $X_1(n) = n\pi - g_n$ enters as a phase modulation applied to every Dirichlet term. Substituting into the von Mangoldt series:

$$\pi\sigma_n = -\sum_{m=2}^{\infty} \frac{\Lambda(m)}{m^{1/2}\log m}\Big[\sin(n\pi\log m)\cos(X_1(n)\log m) - \cos(n\pi\log m)\sin(X_1(n)\log m)\Big].$$

**Gram's law** $(-1)^n Z(g_n) > 0$ holds at index $n$ if and only if

$$2 + 2\sum_{m=2}^{N_n} m^{-1/2}\Big[\cos(n\pi\log m)\cos(X_1(n)\log m) + \sin(n\pi\log m)\sin(X_1(n)\log m)\Big] + (-1)^n R(g_n) > 0.$$

This is equivalent to $\sigma_n$ being even.

## The Carrier Hierarchy

The level-$0$ Gram grid is $\{g^{(0)}_n\} = \{g_n\}$. For $k \geq 1$, the **level-$k$ Gram grid** $\{g^{(k)}_n\}$ satisfies $\psi_k(g^{(k)}_n) = n\pi$.

The **$k$-th carrier** is

$$C_k(t;\lambda) = e^{i\lambda\psi_k(t)} = \exp\!\big(i\lambda(\vartheta(t)-kt)\big).$$

The **$k$-th level process** is the restriction of $\psi_k$ to the level-$(k{-}1)$ Gram grid:

$$X_k(n) = \psi_k\!\left(g^{(k-1)}_n\right) = \vartheta\!\left(g^{(k-1)}_n\right) - k\,g^{(k-1)}_n.$$

At the $k$-th level, each Dirichlet cosine $\cos(g^{(k-1)}_n\log m)$ decomposes as

$$\cos\!\big(g^{(k-1)}_n\log m\big) = \cos(P_{k-1}(n)\log m)\cos(X_k(n)\log m) + \sin(P_{k-1}(n)\log m)\sin(X_k(n)\log m),$$

where $P_{k-1}(n) = \vartheta(g^{(k-1)}_n) - (k-1)\,g^{(k-1)}_n$. The only frequencies in $m$ on both sides are $\{\log m\}$: the phase modulation by $X_k(n)$ rotates the Dirichlet phases without introducing new frequencies.

## Band-Limitedness

**Theorem.** Let $F(u) = Z(e^u)$. As a tempered distribution on $\mathbb{R}$,

$$\operatorname{supp}\widehat{F} \subset [-2,\,0].$$

**Proof sketch.** Under $t = e^u$, each direct Dirichlet term $m^{-1/2-it}$ contributes $u$-Fourier mass at frequency $-\log m$. The truncation $m \leq \lfloor\sqrt{e^u/(2\pi)}\rfloor$ bounds these to $-\log m \in [-\frac{1}{2}(u-\log 2\pi),\, 0]$, which normalizes to $[-1, 0]$. The functional equation $\xi(s) = \xi(1-s)$ maps each direct term to a reflected term contributing normalized frequencies in $[-2,-1]$. The union is $[-2, 0]$. At every level $k$, the phase modulation by $X_k(n)$ acts as a rotation within the existing Dirichlet spectrum, never introducing frequencies outside $[-2, 0]$. Therefore $\langle F, \psi\rangle = 0$ for every $\psi \in \mathcal{S}(\mathbb{R})$ with $\operatorname{supp}\widehat{\psi} \cap [-2,0] = \emptyset$.
