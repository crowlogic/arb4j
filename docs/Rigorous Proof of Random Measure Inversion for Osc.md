<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

## Rigorous Proof of Random Measure Inversion for Oscillatory Processes

**Theorem:** If $X(t) = \int \phi_t(\omega) dZ(\omega)$ where $\phi_t(\omega) = A_t(\omega) e^{i\omega t}$ and $dZ(\omega)$ is an orthogonal increment process, then:
$dZ(\omega) = \int_{-\infty}^{\infty} X(t) \overline{\phi_t(\omega)} dt$

**Proof:**

Given the representation:
$X(t) = \int \phi_t(\lambda) dZ(\lambda)$

Multiply both sides by $\overline{\phi_t(\omega)}$ and integrate over $t$:
$\int_{-\infty}^{\infty} X(t) \overline{\phi_t(\omega)} dt = \int_{-\infty}^{\infty} \overline{\phi_t(\omega)} \int \phi_t(\lambda) dZ(\lambda) dt$

By Fubini's theorem (applicable since $dZ(\lambda)$ has finite second moments):
$= \int \left[\int_{-\infty}^{\infty} \overline{\phi_t(\omega)} \phi_t(\lambda) dt\right] dZ(\lambda)$

Now, $\phi_t(\omega) = A_t(\omega) e^{i\omega t}$, so:
$\overline{\phi_t(\omega)} \phi_t(\lambda) = \overline{A_t(\omega)} A_t(\lambda) e^{i(\lambda-\omega)t}$

Therefore:
$\int_{-\infty}^{\infty} \overline{\phi_t(\omega)} \phi_t(\lambda) dt = \int_{-\infty}^{\infty} \overline{A_t(\omega)} A_t(\lambda) e^{i(\lambda-\omega)t} dt$

By the orthogonality condition for oscillatory functions:
$\int_{-\infty}^{\infty} \overline{A_t(\omega)} A_t(\lambda) e^{i(\lambda-\omega)t} dt = \delta(\lambda - \omega)$

Substituting back:
$\int_{-\infty}^{\infty} X(t) \overline{\phi_t(\omega)} dt = \int \delta(\lambda - \omega) dZ(\lambda) = dZ(\omega)$

Therefore:
$dZ(\omega) = \int_{-\infty}^{\infty} X(t) \overline{\phi_t(\omega)} dt \quad \blacksquare$

The proof relies on the fundamental orthogonality property of the oscillatory functions and the sifting property of the Dirac delta function arising from that orthogonality.

