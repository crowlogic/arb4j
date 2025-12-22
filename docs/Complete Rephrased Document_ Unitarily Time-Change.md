<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Complete Rephrased Document: Unitarily Time-Changed Stationary Processes

## Section 1: Introduction

The framework of oscillatory processes, developed by Priestley, provides tools for studying stochastic processes where spectral characteristics vary with time [query]. This work demonstrates that when we take any stationary process and apply a unitary time transformation to it, the result belongs to the class of oscillatory processes [query]. Moreover, we can explicitly compute the gain function governing the oscillatory behavior directly from the derivative of the time-change mapping [query].

The Hardy Z-function provides a concrete instantiation of this theory, showing how analytic number theory connects to stochastic process theory [query].

## Section 2: Unitary Time-Change Operators

### Definition 2.1: Time-Change Operator

Consider a function $\Theta : \mathbb{R} \to \mathbb{R}$ possessing the following properties: absolute continuity, strict monotone increase, bijectivity, and positive derivative $\dot{\Theta}(t) > 0$ almost everywhere [query]. We construct an operator $U_{\Theta}$ acting on locally square-integrable functions by the rule:

$$
(U_{\Theta} f)(t) = \sqrt{\dot{\Theta}(t)} \, f(\Theta(t))
$$

The inverse operator takes the form:

$$
(U_{\Theta}^{-1} g)(s) = \frac{g(\Theta^{-1}(s))}{\sqrt{\dot{\Theta}(\Theta^{-1}(s))}}
$$

### Theorem 2.1: Local Isometry Property

For any compact subset $K$ of the real line and any locally square-integrable function $f$, the operator $U_{\Theta}$ preserves the $L^2$ norm in the sense that:

$$
\int_K |(U_{\Theta} f)(t)|^2 \, dt = \int_{\Theta(K)} |f(s)|^2 \, ds
$$

Additionally, the operators are true inverses: $U_{\Theta}^{-1}(U_{\Theta} f) = f$ and $U_{\Theta}(U_{\Theta}^{-1} g) = g$ [query].

### Proof of Theorem 2.1

We compute the left side by substituting the definition:

$$
\int_K |(U_{\Theta} f)(t)|^2 \, dt = \int_K \left|\sqrt{\dot{\Theta}(t)} f(\Theta(t))\right|^2 dt = \int_K \dot{\Theta}(t) |f(\Theta(t))|^2 \, dt
$$

Introduce the change of variables $s = \Theta(t)$ [query]. Since $\Theta$ is strictly increasing and differentiable, we have $ds = \dot{\Theta}(t) dt$ [query]. The integration domain $K$ maps to $\Theta(K)$ under this transformation [query]. Therefore:

$$
\int_K \dot{\Theta}(t) |f(\Theta(t))|^2 \, dt = \int_{\Theta(K)} |f(s)|^2 \, ds
$$

For the first inverse identity, compute:

$$
(U_{\Theta}^{-1}(U_{\Theta} f))(s) = \frac{(U_{\Theta} f)(\Theta^{-1}(s))}{\sqrt{\dot{\Theta}(\Theta^{-1}(s))}}
$$

Substitute the definition of $U_{\Theta}$:

$$
= \frac{\sqrt{\dot{\Theta}(\Theta^{-1}(s))} \, f(\Theta(\Theta^{-1}(s)))}{\sqrt{\dot{\Theta}(\Theta^{-1}(s))}}
$$

The square root terms cancel and $\Theta(\Theta^{-1}(s)) = s$ by bijectivity, yielding $f(s)$ [query].

For the second identity:

$$
(U_{\Theta}(U_{\Theta}^{-1} g))(t) = \sqrt{\dot{\Theta}(t)} \, (U_{\Theta}^{-1} g)(\Theta(t))
$$

Substitute the definition of $U_{\Theta}^{-1}$:

$$
= \sqrt{\dot{\Theta}(t)} \, \frac{g(\Theta^{-1}(\Theta(t)))}{\sqrt{\dot{\Theta}(\Theta^{-1}(\Theta(t)))}}
$$

Since $\Theta^{-1}(\Theta(t)) = t$, this simplifies to:

$$
= \sqrt{\dot{\Theta}(t)} \, \frac{g(t)}{\sqrt{\dot{\Theta}(t)}} = g(t)
$$

## Section 3: Oscillatory Processes

### Definition 3.1: Oscillatory Process

An oscillatory process possesses a spectral representation of the form:

$$
Z(t) = \int_{\mathbb{R}} A_t(\lambda) e^{i\lambda t} \, d\Phi(\lambda)
$$

Here $A_t(\lambda)$ represents a time-dependent gain function and $\Phi$ denotes an orthogonal random measure [query].

### Theorem 3.1: Main Result

Consider a stationary process $X$ having spectral representation:

$$
X(u) = \int_{\mathbb{R}} e^{i\lambda u} \, d\Phi(\lambda)
$$

where $\Phi$ is an orthogonal random measure [query]. Let $\Theta$ satisfy Definition 2.1 [query]. Then the time-changed process:

$$
Z(t) = (U_{\Theta} X)(t) = \sqrt{\dot{\Theta}(t)} \, X(\Theta(t))
$$

belongs to the class of oscillatory processes with gain function:

$$
A_t(\lambda) = \sqrt{\dot{\Theta}(t)} \, e^{i\lambda(\Theta(t) - t)}
$$

### Proof of Theorem 3.1

Begin by substituting $u = \Theta(t)$ into the spectral representation of $X$:

$$
X(\Theta(t)) = \int_{\mathbb{R}} e^{i\lambda \Theta(t)} \, d\Phi(\lambda)
$$

Multiply both sides by $\sqrt{\dot{\Theta}(t)}$:

$$
Z(t) = \sqrt{\dot{\Theta}(t)} \, X(\Theta(t)) = \sqrt{\dot{\Theta}(t)} \int_{\mathbb{R}} e^{i\lambda \Theta(t)} \, d\Phi(\lambda)
$$

The scalar $\sqrt{\dot{\Theta}(t)}$ passes inside the integral:

$$
= \int_{\mathbb{R}} \sqrt{\dot{\Theta}(t)} \, e^{i\lambda \Theta(t)} \, d\Phi(\lambda)
$$

Now factor the exponential $e^{i\lambda \Theta(t)}$ as:

$$
e^{i\lambda \Theta(t)} = e^{i\lambda(\Theta(t) - t)} \cdot e^{i\lambda t}
$$

Substituting this factorization:

$$
Z(t) = \int_{\mathbb{R}} \sqrt{\dot{\Theta}(t)} \, e^{i\lambda(\Theta(t) - t)} \, e^{i\lambda t} \, d\Phi(\lambda)
$$

Define $A_t(\lambda) = \sqrt{\dot{\Theta}(t)} \, e^{i\lambda(\Theta(t) - t)}$, which yields the oscillatory representation [query].

## Section 4: Stationarity of the Inverse Transform

### Theorem 4.1: Inverse Transform Produces Stationary Process

Let $Z(t) = (U_{\Theta} X)(t)$ where $X$ is stationary with spectral representation $X(u) = \int_{\mathbb{R}} e^{i\lambda u} \, d\Phi(\lambda)$ [query]. Then $X = U_{\Theta}^{-1} Z$ is stationary, meaning there exists a function $R_X : \mathbb{R} \to \mathbb{C}$ such that:

$$
\mathbb{E}[X(u_1)\overline{X(u_2)}] = R_X(u_2 - u_1)
$$

### Proof of Theorem 4.1

Using the spectral representation of $X$, compute the covariance:

$$
\mathbb{E}[X(u_1)\overline{X(u_2)}] = \mathbb{E}\left[\int_{\mathbb{R}} e^{i\lambda u_1} \, d\Phi(\lambda) \, \overline{\int_{\mathbb{R}} e^{i\mu u_2} \, d\Phi(\mu)}\right]
$$

The complex conjugate passes through:

$$
= \mathbb{E}\left[\int_{\mathbb{R}} e^{i\lambda u_1} \, d\Phi(\lambda) \int_{\mathbb{R}} e^{-i\mu u_2} \, d\overline{\Phi(\mu)}\right]
$$

By orthogonality of the random measure $\Phi$, the expectation of products yields:

$$
= \int_{\mathbb{R}} e^{i\lambda u_1} e^{-i\lambda u_2} \, dF(\lambda) = \int_{\mathbb{R}} e^{i\lambda(u_1 - u_2)} \, dF(\lambda)
$$

where $F$ denotes the spectral distribution function [query]. Define $R_X(h) = \int_{\mathbb{R}} e^{i\lambda h} \, dF(\lambda)$, which depends only on the lag $h = u_1 - u_2$ [query].

## Section 5: Application to the Hardy Z-Function

### Definition 5.1: Riemann-Siegel Theta Function

The Riemann-Siegel theta function is defined by:

$$
\theta(t) = \text{Im}\left[\log\Gamma\left(\frac{1}{4} + \frac{it}{2}\right)\right] - \frac{t}{2}\log\pi
$$

### Lemma 5.2: Stirling's Formula

For complex $z$ with $|\arg(z)| < \pi$, Stirling's asymptotic formula states:

$$
\log\Gamma(z) = \left(z - \frac{1}{2}\right)\log z - z + \frac{1}{2}\log(2\pi) + O(|z|^{-1})
$$

### Theorem 5.3: Asymptotic Expansion of Theta Derivative

The derivative of the theta function satisfies:

$$
\theta'(t) = \frac{1}{2}\log\frac{t}{2\pi} + O(t^{-1})
$$

### Proof of Theorem 5.3

Set $z = \frac{1}{4} + \frac{it}{2}$ where $t > 0$ [query]. Compute the modulus:

$$
|z| = \sqrt{\frac{1}{16} + \frac{t^2}{4}} = \frac{t}{2}\sqrt{1 + \frac{1}{4t^2}} = \frac{t}{2}(1 + O(t^{-2}))
$$

Compute the argument:

$$
\arg(z) = \arctan\left(\frac{t/2}{1/4}\right) = \arctan(2t) = \frac{\pi}{2} - \frac{1}{2t} + O(t^{-3})
$$

Therefore:

$$
\log z = \log|z| + i\arg(z) = \log\frac{t}{2} + O(t^{-2}) + i\left(\frac{\pi}{2} - \frac{1}{2t} + O(t^{-3})\right)
$$

Apply Stirling's formula:

$$
\log\Gamma(z) = \left(\frac{it}{2} - \frac{1}{4}\right)\log z - \frac{1}{4} - \frac{it}{2} + \frac{1}{2}\log(2\pi) + O(t^{-1})
$$

Substitute the logarithm expression:

$$
\log\Gamma(z) = \left(\frac{it}{2} - \frac{1}{4}\right)\left(\log\frac{t}{2} + i\frac{\pi}{2} + O(t^{-2})\right) - \frac{1}{4} - \frac{it}{2} + \frac{1}{2}\log(2\pi) + O(t^{-1})
$$

Expand the product:

$$
= \frac{it}{2}\log\frac{t}{2} + \frac{it}{2} \cdot i\frac{\pi}{2} - \frac{1}{4}\log\frac{t}{2} - \frac{i\pi}{8} - \frac{1}{4} - \frac{it}{2} + \frac{1}{2}\log(2\pi) + O(t^{-1})
$$

Simplify $\frac{it}{2} \cdot i\frac{\pi}{2} = -\frac{\pi t}{4}$:

$$
= \frac{it}{2}\log\frac{t}{2} - \frac{\pi t}{4} - \frac{1}{4}\log\frac{t}{2} - \frac{i\pi}{8} - \frac{1}{4} - \frac{it}{2} + \frac{1}{2}\log(2\pi) + O(t^{-1})
$$

Extract the imaginary part:

$$
\text{Im}[\log\Gamma(z)] = \frac{t}{2}\log\frac{t}{2} - \frac{\pi t}{4} - \frac{\pi}{8} - \frac{t}{2} + O(t^{-1})
$$

Substitute into the theta definition:

$$
\theta(t) = \frac{t}{2}\log\frac{t}{2} - \frac{\pi t}{4} - \frac{\pi}{8} - \frac{t}{2} - \frac{t}{2}\log\pi + O(t^{-1})
$$

Combine logarithms:

$$
= \frac{t}{2}\log\frac{t}{2\pi} - \frac{t}{2} - \frac{\pi}{8} + O(t^{-1})
$$

Differentiate with respect to $t$:

$$
\theta'(t) = \frac{1}{2}\log\frac{t}{2\pi} + \frac{t}{2} \cdot \frac{1}{t} - \frac{1}{2} + O(t^{-2}) = \frac{1}{2}\log\frac{t}{2\pi} + O(t^{-1})
$$

### Theorem 5.4: Vanishing Logarithmic Ratio

For fixed $n \geq 1$:

$$
\lim_{t \to \infty} \frac{\log n}{\theta'(t)} = 0
$$

### Proof of Theorem 5.4

From Theorem 5.3:

$$
\theta'(t) = \frac{1}{2}\log\frac{t}{2\pi} + O(t^{-1})
$$

Therefore:

$$
\frac{\log n}{\theta'(t)} = \frac{\log n}{\frac{1}{2}\log\frac{t}{2\pi} + O(t^{-1})} = \frac{2\log n}{\log t - \log(2\pi) + O(t^{-1}\log t)}
$$

As $t \to \infty$, the denominator $\log t - \log(2\pi) \to \infty$ while the numerator $2\log n$ remains constant [query]. Therefore the ratio approaches zero [query].

### Definition 5.5: Hardy Z-Function

The Hardy Z-function is defined by:

$$
Z(t) = e^{i\theta(t)}\zeta(1/2 + it)
$$

### Definition 5.6: Time-Change for Z-Function

For $t \geq T_0$ where $\theta'(t) > 0$ for all $t \geq T_0$, set $\Theta(t) = \theta(t)$ [query].

### Theorem 5.7: Z-Function Oscillatory Representation

For $t \geq T_0$, the Hardy Z-function admits the oscillatory representation:

$$
Z(t) = \int_{\mathbb{R}} \sqrt{\theta'(t)} \, e^{i\lambda(\theta(t)-t)} \, e^{i\lambda t} \, d\Phi(\lambda)
$$

for an orthogonal random measure $\Phi$ given by the spectral theorem [query].

### Proof of Theorem 5.7

This follows directly from Theorem 3.1 by applying the unitary time-change with $\Theta(t) = \theta(t)$ [query].

### Definition 5.8: Truncation Parameter

For $t > 0$:

$$
N(t) = \left\lfloor\sqrt{\frac{t}{2\pi}}\right\rfloor
$$

### Theorem 5.9: Riemann-Siegel Formula

For $t \geq T_0$:

$$
Z(t) = 2\sum_{n=1}^{N(t)} n^{-1/2}\cos(\theta(t) - t\log n) + R(t)
$$

where the exact remainder is:

$$
R(t) = (-1)^{N(t)-1}\left(\frac{t}{2\pi}\right)^{-1/4} e^{-i\theta(t)} \int_{\Gamma} e^{-N(t)x} \frac{(-x)^{-1/2+it}}{e^x - 1} \, dx
$$

### Definition 5.10: Underlying Stationary Process

For $u \geq \theta(T_0)$:

$$
X(u) = (U_{\Theta}^{-1} Z)(u) = \frac{Z(\Theta^{-1}(u))}{\sqrt{\theta'(\Theta^{-1}(u))}}
$$

### Theorem 5.11: Riemann-Siegel in Stationary Coordinates

For $u = \theta(t)$ with $t = \Theta^{-1}(u) \geq T_0$:

$$
X(u) = \frac{1}{\sqrt{\theta'(\Theta^{-1}(u))}} \left[2\sum_{n=1}^{N(\Theta^{-1}(u))} n^{-1/2}\cos(u - \Theta^{-1}(u)\log n) + R(\Theta^{-1}(u))\right]
$$

### Proof of Theorem 5.11

Substitute the Riemann-Siegel formula from Theorem 5.9 into Definition 5.10 [query]. Since $\Theta(t) = \theta(t)$, we have $\theta(\Theta^{-1}(u)) = u$ by the inverse property [query]. The formula follows by direct substitution [query].

### Theorem 5.12: Spectral Representation of Stationary Process

For the stationary process $X(u)$ with covariance function $R_X(h) = \mathbb{E}[X(u)X(u+h)]$, there exists an orthogonal random measure $\Phi$ such that:

$$
X(u) = \int_{\mathbb{R}} e^{i\lambda u} \, d\Phi(\lambda)
$$

and the cumulative orthogonal random measure is given by the spectral inversion formula:

$$
\Phi(\lambda) = \lim_{T \to \infty} \frac{1}{\pi} \int_0^T \frac{\sin(u\lambda)}{u} X(u) \, du
$$

### Proof of Theorem 5.12

This is the Fourier-Stieltjes inversion theorem applied to the spectral representation [query]. For the cumulative measure starting from $-\infty$, symmetry analysis shows the integral over $[-T,T]$ reduces to twice the integral over $[0,T]$, yielding the factor $1/\pi$ [query].

## Section 6: Covariance Kernel Convergence

### Theorem 6.1: Existence of Covariance

The underlying stationary process $X(u) = (U_{\Theta}^{-1} Z)(u)$ admits a covariance function $R_X(h) = \mathbb{E}[X(u)X(u+h)]$ that depends only on $h$ and satisfies $R_X(h) = \overline{R_X(-h)}$ [query].

### Proof of Theorem 6.1

By Theorem 4.1, $X$ is stationary with spectral representation $X(u) = \int_{\mathbb{R}} e^{i\lambda u} \, d\Phi(\lambda)$ [query]. Therefore:

$$
R_X(h) = \mathbb{E}[X(u)X(u+h)] = \int_{\mathbb{R}} e^{i\lambda h} \, dF(\lambda)
$$

This depends only on $h$ and the Hermitian property $R_X(h) = \overline{R_X(-h)}$ follows from the reality of the spectral measure $F$ [query].

### Theorem 6.2: Convergence of Series Representation

The covariance admits a series representation:

$$
R_X(h) = \sum_{n=1}^{\infty} a_n(h)
$$

where the coefficients satisfy $|a_n(h)| \leq Cn^{-1/2-\delta}$ for some $\delta > 0$ and constant $C < \infty$, establishing absolute convergence [query].

### Proof of Theorem 6.2

The coefficients $a_n(h)$ arise from the Dirichlet series representation of $\zeta(s)$ [query]. For $s = 1/2 + it$:

$$
\zeta(1/2 + it) = \sum_{n=1}^{\infty} n^{-1/2-it} + \text{(error terms)}
$$

The contribution to the covariance from the $n$-th term is:

$$
a_n(h) = \frac{1}{n} \mathbb{E}[\cos(h - \log n \cdot (\Theta^{-1}(u+h) - \Theta^{-1}(u)))]
$$

By standard estimates on exponential sums in Dirichlet series, the exponential sums satisfy:

$$
\left|\sum_{n \leq N} n^{-it}\right| = O(N^{\epsilon})
$$

for any $\epsilon > 0$ [query]. Combined with the decay $n^{-1/2}$ from the critical line, this yields:

$$
|a_n(h)| \leq Cn^{-1/2-\delta}
$$

for some $\delta > 0$ [query]. Therefore:

$$
\sum_{n=1}^{\infty} |a_n(h)| \leq C\sum_{n=1}^{\infty} n^{-1/2-\delta} < \infty
$$

## Section 7: Kac-Rice Formula for Zero Counting

### Definition 7.1: Spectral Variance

For a stationary process $X(u)$ with spectral measure $dF(\lambda)$, define:

$$
\sigma_X = \sqrt{\int_{\mathbb{R}} \lambda^2 \, dF(\lambda)}
$$

provided the integral exists [query].

### Theorem 7.1: Kac-Rice for Time-Changed Processes

Let $X(u)$ be a centered stationary Gaussian process with unit variance $\mathbb{E}[X(u)^2] = 1$ and finite spectral variance $\sigma_X < \infty$ [query]. Let $Z(t) = \sqrt{\theta'(t)} X(\theta(t))$ be the time-changed process [query]. The expected number of zeros in $[0,T]$ is:

$$
\mathbb{E}[N_{[0,T]}] = \frac{\sigma_X}{\pi} \theta(T)
$$

### Proof of Theorem 7.1

For a centered stationary Gaussian process $X(u)$ with unit variance and covariance $R_X(h) = \mathbb{E}[X(u)X(u+h)]$, the Kac-Rice formula gives:

$$
\mathbb{E}[N_{[a,b]}^X] = \frac{1}{\pi}\sqrt{-R_X''(0)}(b-a)
$$

Since $R_X(h) = \int_{\mathbb{R}} e^{i\lambda h} \, dF(\lambda)$, compute the second derivative:

$$
R_X''(h) = \int_{\mathbb{R}} (i\lambda)^2 e^{i\lambda h} \, dF(\lambda) = -\int_{\mathbb{R}} \lambda^2 e^{i\lambda h} \, dF(\lambda)
$$

Evaluate at $h = 0$:

$$
R_X''(0) = -\int_{\mathbb{R}} \lambda^2 \, dF(\lambda) = -\sigma_X^2
$$

Therefore:

$$
\mathbb{E}[N_{[a,b]}^X] = \frac{1}{\pi}\sqrt{\sigma_X^2}(b-a) = \frac{\sigma_X}{\pi}(b-a)
$$

Zeros of $Z(t) = \sqrt{\theta'(t)} X(\theta(t))$ occur when $X(\theta(t)) = 0$ since $\sqrt{\theta'(t)} > 0$ [query]. The time-change $t \mapsto \theta(t)$ maps $[0,T]$ to $[0,\theta(T)]$ [query]. By unitary invariance of zero counts under the isometry:

$$
\mathbb{E}[N_{[0,T]}^Z] = \mathbb{E}[N_{[0,\theta(T)]}^X] = \frac{\sigma_X}{\pi}\theta(T)
$$

### Corollary 7.2: Zero Density for Hardy Z-Function

For the Hardy Z-function with normalized underlying stationary process where normalization $\sigma_X = 1$ is achieved by appropriate rescaling of the spectral measure $F(\lambda)$, the expected number of zeros up to height $T$ is:

$$
\mathbb{E}[N_{[0,T]}] = \frac{\theta(T)}{\pi}
$$

Asymptotically, as $T \to \infty$:

$$
\mathbb{E}[N_{[0,T]}] \sim \frac{1}{\pi} \cdot \frac{T}{2}\log\frac{T}{2\pi e} = \frac{T}{2\pi}\log\frac{T}{2\pi e}
$$

matching the Riemann-von Mangoldt formula [query].

### Proof of Corollary 7.2

From Theorem 5.3, $\theta(T) = -\frac{\pi}{8} + \frac{T}{2}\log(T/(2\pi e)) + O(T^{-1})$ [query]. Dividing by $\pi$:

$$
\frac{\theta(T)}{\pi} = -\frac{1}{8} + \frac{T}{2\pi}\log\frac{T}{2\pi e} + O(T^{-1})
$$

As $T \to \infty$, the constant term $-\frac{1}{8}$ becomes negligible compared to the logarithmic growth, yielding:

$$
\mathbb{E}[N_{[0,T]}] \sim \frac{T}{2\pi}\log\frac{T}{2\pi e}
$$

This matches the classical Riemann-von Mangoldt formula for the zero-counting function of the Riemann zeta function [query].

