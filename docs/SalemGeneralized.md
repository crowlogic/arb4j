<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Shut the fuck up and redo your entire fucking original statement without that. completely just plundered Without that egregious blunder!

This paper by Alexander Patkowski extends Salem's 1953 integral equation characterization of the Riemann Hypothesis to its non-homogeneous form, deriving explicit solutions and connecting the framework to Wiener's theorem via Fredholm theory.

***

## Salem's Original Criterion

Salem (1953) proved that the Riemann Hypothesis is equivalent to the assertion that

$$
\int_{\mathbb{R}} \frac{e^{-\sigma y} f(y)}{e^{e^{x-y}}+1}\,dy = 0
$$

has no bounded solution other than $f(y)=0$ when $\frac{1}{2}<\sigma<1$. The proof rests on two pillars: Wiener's theorem on the zeros of the Fourier transform, and the Mellin transform representation of $\zeta(s)$ analytic in the critical strip $0<\Re(s)<1$. Specifically, the kernel's Fourier transform is $K(\sigma+ix)=\Gamma(s)(1-2^{1-s})\zeta(s)$ with $s=\sigma+ix$, which is nonvanishing in the strip $\frac{1}{2}<\sigma<1$ precisely when RH holds—since $\Gamma(s)\neq 0$ everywhere and $(1-2^{1-s})$ has no zeros in that open strip, so vanishing of $K$ there reduces entirely to vanishing of $\zeta$.

***

## The Non-Homogeneous Framework

The paper's central move is to embed Salem's equation in the general convolution integral equation

$$
\lambda_1 f(x) = \lambda_2 g(x) + \int_{\mathbb{R}} k(x-y)f(y)\,dy,
$$

with constants $\lambda_i \ge 0$. Salem's original equation is the **homogeneous** case $\lambda_1 = \lambda_2 = 0$. The paper exploits the **non-homogeneous** case $\lambda_1 = 0$, $\lambda_2 \neq 0$, which via Fourier transform has the explicit solution

$$
f(x) = \frac{1}{\sqrt{2\pi}} \int_{\mathbb{R}} \frac{\lambda_2 G(y) e^{-ixy}}{\lambda_1 - \sqrt{2\pi}\,K(y)}\,dy,
$$

where $G$ and $K$ are the Fourier transforms of $g$ and $k$ respectively (Titchmarsh, *Fourier Integrals*, Theorem 148). Setting $\lambda_1=0$, $\lambda_2=-1$ reduces the denominator to $\sqrt{2\pi}\,K(y)$, so the solution is determined entirely by the Fourier transform of the kernel—and the RH enters through whether $\zeta(\sigma+iy)$ vanishes in the strip.

***

## The Fredholm Alternative as the Logical Bridge

The key structural theorem invoked is the **Fredholm Alternative**:

> If the homogeneous equation $\phi(x) = \int_{\mathbb{R}} k(x,y)\phi(y)\,dy$ has only the trivial solution $\phi=0$, then the non-homogeneous equation $\phi(x) = h(x) + \int_{\mathbb{R}} k(x,y)\phi(y)\,dy$ has a **unique** solution for every $h \in L_2(\mathbb{R})$. Conversely, a non-trivial solution of the homogeneous equation implies the non-homogeneous equation has either no solution or infinitely many.

This is exactly the logical lever: Salem's criterion (no nontrivial $f$ of the homogeneous equation) is equivalent to the non-homogeneous equation having a unique solution. The paper thus converts Salem's nonexistence statement into a uniqueness statement, which admits explicit Fourier-inversion formulas.

***

## Theorem 1 (Salem's Kernel)

**Statement.** Let $h \in L_2(\mathbb{R})$ with Fourier transform $H$. The RH is equivalent to

$$
h(x) = e^{\sigma x}\int_{\mathbb{R}} \frac{e^{-\sigma y}}{e^{e^{x-y}}+1}\,\phi(y)\,dy
$$

having a unique solution for each $h$ when $\frac{1}{2}<\sigma<1$. The explicit solution is

$$
\phi(x) = \frac{1}{2\pi}\int_{\mathbb{R}} \frac{H(y)\,e^{-ixy}}{\Gamma(\sigma+iy)(1-2^{1-\sigma-iy})\zeta(\sigma+iy)}\,dy,
$$

provided $H(y)/[\Gamma(\sigma+iy)(1-2^{1-\sigma-iy})\zeta(\sigma+iy)] \in L_2(\mathbb{R})$.

**Proof mechanism.** The Mellin transform identity

$$
\int_0^\infty \frac{y^{s-1}}{e^y+1}\,dy = \Gamma(s)(1-2^{1-s})\zeta(s), \qquad \Re(s)>0,
$$

identifies $K(\sigma+ix) = \Gamma(s)(1-2^{1-s})\zeta(s)$. Under RH, $\zeta(\sigma+iy)\neq 0$ for $\frac{1}{2}<\sigma<1$, so $K$ never vanishes there, the homogeneous equation has only $\phi=0$, and Fredholm gives uniqueness. If RH fails, a zero $\rho=\sigma+iy_0$ with $\frac{1}{2}<\sigma<1$ makes $K(\sigma+iy_0)=0$, producing a nontrivial homogeneous solution and destroying uniqueness. The injectivity of the Fourier transform on $L_1(\mathbb{R})$ (Knapp, Corollary 8.5) ensures that $h=0$ forces $H=0$ and hence $\phi=0$, recovering Salem's original statement exactly.

***

## Theorem 2 (Fractional-Part Kernel)

Using the Mellin transform formula (Titchmarsh, *Zeta Function*, eq. 2.1.5)

$$
\int_0^\infty \left\{\frac{1}{y}\right\} y^{s-1}\,dy = -\pi\frac{\zeta(s)}{s}, \qquad 0<\Re(s)<1,
$$

the paper produces a second RH-equivalent integral equation with kernel $e^{-\sigma(x-y)}\{e^{y-x}\}$:

$$
h(x) = e^{\sigma x}\int_{\mathbb{R}} e^{-\sigma y}\{e^{y-x}\}\,\phi(y)\,dy,
$$

with explicit solution

$$
\phi(x) = \frac{1}{2\pi}\int_{\mathbb{R}} \frac{(\sigma+iy)H(y)\,e^{-ixy}}{\zeta(\sigma+iy)}\,dy.
$$

The kernel's Fourier transform simplifies to $-\pi\zeta(s)/s$, so the denominator of the solution involves $\zeta$ alone without the $\Gamma$ factor, providing a structurally cleaner formula. The RH equivalence follows identically: $\zeta(\sigma+iy)\neq 0$ for $\frac{1}{2}<\sigma<1$ is the sole condition for uniqueness.

***

## Theorem 3 (Digamma Kernel)

A third variant uses the Mellin transform of the digamma-derived kernel (Titchmarsh, eq. 2.15.7)

$$
\int_0^\infty (\psi(y+1)-\log y)\,y^{s-1}\,dy = -\pi\frac{\zeta(1-s)}{\sin(\pi s)}, \qquad 0<\Re(s)<1,
$$

yielding the equation with kernel $e^{-\sigma(x-y)}(\psi(e^{x-y}+1)+y-x)$:

$$
h(x) = e^{\sigma x}\int_{\mathbb{R}} e^{-\sigma y}\bigl(\psi(e^{x-y}+1)+y-x\bigr)\phi(y)\,dy,
$$

with solution

$$
\phi(x) = -\frac{1}{2}\int_{\mathbb{R}} \frac{\sin(\sigma+iy)\,H(y)\,e^{-ixy}}{\zeta(1-\sigma-iy)}\,dy.
$$

The RH enters via the functional equation: nontrivial zeros come in pairs $\rho, 1-\bar\rho$, so $\zeta(1-\rho)=0$ whenever $\zeta(\rho)=0$. The nonvanishing of $\zeta(\sigma+iy)$ in the strip $\frac{1}{2}<\sigma<1$ is therefore equivalent to the nonvanishing of $\zeta(1-\sigma-iy)$ there, and the same uniqueness argument applies.

***

## Explicit Example via Mertens' Function

Taking $h(x) = e^{\sigma x}\bigl[\operatorname{Ei}(-e^x) - 2\operatorname{Ei}(-2e^x)\bigr]$ in Theorem 1, the paper computes $H(y)$ using the Mellin transform of the exponential integral:

$$
\int_0^\infty \operatorname{Ei}(-\beta y)\,y^{s-1}\,dy = -\frac{\Gamma(s)}{s\,\beta^s}, \qquad \Re(\beta)\ge 0,\ \Re(s)>0.
$$

Combining the two $\operatorname{Ei}$ terms yields a cancellation of the $\Gamma$ factor in the Theorem 1 formula, giving

$$
\phi(x) = -\frac{1}{2\pi}\int_{\mathbb{R}} \frac{e^{-ixy}}{(\sigma+iy)\zeta(\sigma+iy)}\,dy.
$$

By the **Mellin–Perron formula** for Mertens' function $M(x)=\sum_{n\le x}\mu(n)$,

$$
M(e^{-x}) = -\frac{1}{2\pi i}\int_{\sigma-i\infty}^{\sigma+i\infty} \frac{e^{-xs}}{s\,\zeta(s)}\,ds,
$$

the solution is $\phi(x) = -e^{\sigma x}M(e^{-x})$ for $x<0$, and $0$ for $x>0$. This is a concrete closed-form verification: the unique solution predicted by Theorem 1 under RH matches the known analytic formula for $M$.

***

## The Wiener–Fredholm Synthesis

The concluding section unifies everything through Wiener's Tauberian theorem: the non-homogeneous convolution equation with $\lambda_1=0$, $\lambda_2\neq 0$ has a unique $L_2$ solution for every $g$ if and only if the linear span of translates $\{k(\cdot - z_i)\}$ is dense in $L_1(\mathbb{R})$. Wiener's theorem identifies this density condition with the Fourier transform of $k$ being nowhere zero, and Fredholm's alternative converts it into uniqueness of solution. The three theorems are therefore instances of a single corollary: each kernel $k$ defines an RH-equivalent density condition, and the explicit $\phi$ formulas are the Fourier-inversion witnesses of that density.

The paper also notes that for $\epsilon>0$ and $f\in L_1(\mathbb{R})$, by Knapp's Corollary 6.17, there exist $z_i\in\mathbb{R}$ and constants $a_i$ such that

$$
\left\| g(x) - \sum_i a_i k(x-z_i) \right\|_p < \epsilon
$$

for $p=1$ or $p=2$, giving an approximation-theoretic reformulation of Salem's criterion in terms of translates of the kernel.

***

## Logical Architecture

The argument flows: RH $\Leftrightarrow$ $\zeta(\sigma+iy)\neq 0$ for $\frac{1}{2}<\sigma<1$ $\Leftrightarrow$ homogeneous Salem equation has only trivial solution $\Leftrightarrow$ non-homogeneous equation has unique solution for all $h\in L_2$ (Fredholm Alternative) $\Leftrightarrow$ translates of $k$ are dense in $L_1$ (Wiener). Theorems 1–3 instantiate this chain for three distinct kernels arising from three Mellin-transform representations of $\zeta(s)$ in the critical strip.

