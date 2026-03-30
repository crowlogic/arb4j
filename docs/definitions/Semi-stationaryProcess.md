<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# What is a semi-stationary process in the sense of Priestley as related to oscillatory processes?

Now I have the full primary source. I can compose a comprehensive, precise answer directly from Priestley's 1965 paper.

## Oscillatory Processes

Priestley begins by noting that the family of complex exponentials \$ e^{i\omega t} \$ used in the classical spectral representation of a stationary process cannot represent a non-stationary process while preserving the physical meaning of frequency [^1]. He replaces this family with **oscillatory functions**: for each fixed $\omega$, a function $\phi_t(\omega)$ of $t$ is oscillatory if it can be written as

$$
\phi_t(\omega) = A_t(\omega)\, e^{i\delta(\omega) t},
$$

where \$ A_t(\omega) \$ is an **envelope** whose (generalized) Fourier transform \$ dH_\omega(\beta) \$ has an absolute maximum at \$ \beta = 0 \$, meaning \$ A_t(\omega) \$ is slowly varying relative to the carrier \$ e^{i\delta(\omega)t} \$ [^1]. Reparametrizing so that $\delta(\omega) = \omega$, any oscillatory function takes the form $\phi_t(\omega) = A_t(\omega)e^{i\omega t}$ [^1].

An **oscillatory process** $\{X_t\}$ is then defined as one admitting a spectral representation in terms of such a family [^1]:

$$
X_t = \int_{-\infty}^{\infty} A_t(\omega)\, e^{i\omega t}\, dZ(\omega), \quad E|dZ(\omega)|^2 = d\mu(\omega), \tag{1}
$$

where $Z(\omega)$ is an orthogonal increment process [^1]. This reduces to the classical Cramér representation $X_t = \int e^{i\omega t} dZ(\omega)$ when $A_t(\omega) \equiv 1$, so every second-order stationary process is also an oscillatory process [^1]. The autocovariance takes the form

$$
R_{s,t} = \int_{-\infty}^{\infty} A_s(\omega)\, \overline{A_t(\omega)}\, e^{i\omega(s-t)}\, d\mu(\omega). \tag{2}
$$

Priestley also notes that $X_t$ can be viewed as the output of a time-varying filter applied to a stationary process $\xi_t$ with spectrum $d\mu(\omega)$, so the evolutionary spectrum at $t$ is precisely the spectrum that would be observed if the filter were held frozen at the state it occupied at time $t$ [^1][^2].

## Evolutionary Spectrum

For an oscillatory process with representation (1) relative to a chosen family $\mathcal{F} = \{A_t(\omega)e^{i\omega t}\}$, the **evolutionary (power) spectrum** at time $t$ is defined as [^1]

$$
dF_t(\omega) = |A_t(\omega)|^2\, d\mu(\omega). \tag{3}
$$

This quantity satisfies $\operatorname{Var}(X_t) = \int dF_t(\omega)$ for every $t$, independent of the choice of family $\mathcal{F}$, so it has the same physical interpretation as a stationary power spectrum — a local distribution of energy over frequency — but the distribution is time-dependent [^1]. The evolutionary spectral density $f_t(\omega)$ exists when $d\mu$ is absolutely continuous: $dF_t(\omega) = f_t(\omega)\,d\omega$ [^1].

## Semi-Stationary Processes

The notion of a semi-stationary process is introduced in Section 7 of Priestley (1965) precisely to formalize what it means for $A_t(\omega)$ to be "slowly varying," which is the regularity condition required for both the filter approximation theorem (Theorem 7.2) and spectral estimation (Section 8–9) to be valid [^1].

**Definition (semi-stationary family).** For a family $\mathcal{F} = \{A_t(\omega) e^{i\omega t}\}$ of oscillatory functions, define

$$
B_{\mathcal{F}}(\omega) = \int_{-\infty}^{\infty} |\beta|\, |dH_\omega(\beta)|, \tag{4}
$$

where $dH_\omega(\beta)$ is the (generalized) Fourier transform of $A_t(\omega)$ with respect to $t$. This quantity measures the spectral "width" of the envelope $A_t(\omega)$ in the time-frequency sense: a small $B_{\mathcal{F}}(\omega)$ means $A_t(\omega)$ changes slowly. The family $\mathcal{F}$ is **semi-stationary** if $B_{\mathcal{F}}(\omega)$ is bounded for all $\omega$, with **characteristic width** $B_{\mathcal{F}} = \sup_\omega B_{\mathcal{F}}(\omega) < \infty$ [^1].

**Definition (semi-stationary process).** $\{X_t\}$ is a **semi-stationary process** if there exists a semi-stationary family $\mathcal{F}$ in terms of which $\{X_t\}$ has a representation of the form (1) [^1].

Equivalently, in the discrete-parameter formulation used by subsequent authors, $x_{k,j}$ is semi-stationary if

$$
x_{k,j} - \mu_{k,j} = \int_{-\pi}^{\pi} e^{ik\omega}\, A_{k,j}(\omega)\, dZ_j(\omega), \tag{5}
$$

and the Fourier transform of $A_{k,j}(\omega)$ with respect to $k$ is **highly concentrated around zero** for each fixed $\omega$ [^3].

## Characteristic Width and Approximate Stationarity

The **characteristic width of the process** is defined as the supremum of the characteristic widths over all semi-stationary families in whose terms $\{X_t\}$ admits representation (1) [^1]:

$$
B_X = \sup_{\mathcal{F} \in \mathcal{C}} B_{\mathcal{F}}. \tag{6}
$$

Priestley interprets $B_X$ as the "maximum interval over which the process may be treated as approximately stationary" [^1]. For a stationary process, the complex exponential family $\{e^{i\omega t}\}$ is semi-stationary with infinite characteristic width ($B_{\mathcal{F}} = \infty$ since $A_t(\omega) = 1$ is perfectly concentrated at $\beta = 0$), so all stationary processes satisfy $B_X = \infty$ [^1]. The **natural representation** of $\{X_t\}$ is taken to be the family $\mathcal{F}^*$ achieving (or approaching) this supremum, because working in terms of $\mathcal{F}^*$ maximizes temporal resolution of the evolutionary spectrum [^1].

The canonical example of a semi-stationary process is the **uniformly modulated process** $X_t = c(t)\, X_t^{(0)}$, where $\{X_t^{(0)}\}$ is stationary and $c(t)$ has a Fourier transform concentrated at the origin [^1]. Here $\mathcal{F} = \{c(t)e^{i\omega t}\}$ is semi-stationary with $B_{\mathcal{F}}(\omega)$ independent of $\omega$, and the evolutionary spectrum is $dF_t(\omega) = |c(t)|^2\, dF(\omega)$ — all frequency components evolve identically in time [^1].

## Role in Filter Theory and Estimation

The semi-stationarity condition is the precise hypothesis under which the generalized transfer function $r_{t,\lambda}(\beta)$ of a filter reduces approximately to the ordinary transfer function $r(\beta)$ [^1]. Specifically, Theorem 7.2 states: if the filter $\{g(u)\}$ has width $B_g \leq \varepsilon B_{\mathcal{F}}$, then $|A_t(\lambda)|\, |r_{t,\lambda}(\beta) - r(\beta)| < \varepsilon$ for all $t, \lambda, \beta$ [^1]. This makes the evolutionary analogue of the input-output power relation

$$
dF_t^{(Y)}(\omega) \approx |r(\omega)|^2\, dF_t^{(X)}(\omega + \omega_0) \tag{7}
$$

valid up to order $B_g / B_X$, and is the mathematical justification for short-time spectral estimation [^1][^2]. The uncertainty principle Priestley identifies — that one cannot simultaneously achieve high resolution in both time and frequency — is precisely a consequence of the semi-stationarity constraint: the filter width $B_g$ must be small relative to $B_X$ to make (7) valid, which forces limited frequency resolution [^1][^2].
<span style="display:none">[^10][^11][^12][^13][^14][^15][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://academic.oup.com/jrsssb/article/27/2/204/7026825

[^2]: https://pure.mpg.de/rest/items/item_3335397/component/file_3335404/content

[^3]: https://pmc.ncbi.nlm.nih.gov/articles/PMC11314774/

[^4]: https://www.ams.org/journals/proc/1972-032-01/S0002-9939-1972-0307310-X/

[^5]: https://discovery.researcher.life/article/evolutionary-spectra-and-non-stationary-processes/c09710e97a283212a683b3530536fd63

[^6]: https://arxiv.org/pdf/1802.09053.pdf

[^7]: https://www.sciencedirect.com/science/article/pii/0022460X67901605

[^8]: https://www.ma.imperial.ac.uk/~gnason/Research/papers/Costationary2.pdf

[^9]: https://www.sciencedirect.com/science/article/abs/pii/0022460X67901605

[^10]: https://academic.oup.com/jrsssb/article-pdf/27/2/204/49094758/jrsssb_27_2_204.pdf

[^11]: https://projecteuclid.org/journals/bernoulli/volume-9/issue-5/Semigroup-stationary-processes-and-spectral-representation/10.3150/bj/1066418881.pdf

[^12]: https://pmc.ncbi.nlm.nih.gov/articles/PMC9355453/

[^13]: https://www.jstor.org/stable/pdf/2984191.pdf

[^14]: https://books.google.com/books/about/Spectral_Analysis_and_Time_Series_Multiv.html?id=_8QSAQAAMAAJ

[^15]: https://www.econbiz.de/Record/evolutionary-spectra-and-non-stationary-processes-priestley/10003654437

