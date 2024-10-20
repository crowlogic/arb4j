\documentclass{article}
\usepackage{amsmath}

\begin{document}

\section*{Theorem: Spectral Representation}
Let $K(t-s)$ be a stationary kernel function. Then $K(t-s)$ can be expressed in the form:

$$
K(t-s) = \int_{-\infty}^{\infty} h(\tau) h(t-\tau-s) d\tau
$$

where $h(t)$ is defined as:

$$
h(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \sqrt{S(\omega)} e^{i\omega t} d\omega
$$

and $S(\omega)$ is the spectral density function.

\section*{Proof}

1. Start with the spectral representation:
   $$
   K(t-s) = \frac{1}{2\pi} \int_{-\infty}^{\infty} S(\omega) e^{i\omega(t-s)} d\omega
   $$

2. Factor $S(\omega)$:
   $$
   K(t-s) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \sqrt{S(\omega)} e^{i\omega t} \cdot \sqrt{S(\omega)} e^{-i\omega s} d\omega
   $$

3. Define $h(t)$:
   $$
   h(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \sqrt{S(\omega)} e^{i\omega t} d\omega
   $$

4. Express $\sqrt{S(\omega)}$:
   $$
   \sqrt{S(\omega)} = \int_{-\infty}^{\infty} h(\tau) e^{-i\omega\tau} d\tau
   $$

5. Substitute into the kernel equation:
   $$
   K(t-s) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \left(\int_{-\infty}^{\infty} h(\tau) e^{-i\omega\tau} d\tau\right) e^{i\omega t} \cdot \left(\int_{-\infty}^{\infty} h(\sigma) e^{-i\omega\sigma} d\sigma\right) e^{-i\omega s} d\omega
   $$

6. Apply Fubini's theorem to change the order of integration:
   $$
   K(t-s) = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} h(\tau) h(\sigma) \left(\frac{1}{2\pi} \int_{-\infty}^{\infty} e^{i\omega(t-\tau-s+\sigma)} d\omega\right) d\tau d\sigma
   $$

7. Evaluate the inner $\omega$ integral:
   $$
   \frac{1}{2\pi} \int_{-\infty}^{\infty} e^{i\omega(t-\tau-s+\sigma)} d\omega = \delta(t-\tau-s+\sigma)
   $$

8. Apply the delta function:
   $$
   K(t-s) = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} h(\tau) h(\sigma) \delta(t-\tau-s+\sigma) d\tau d\sigma
   $$

9. Integrate with respect to $\sigma$:
\begin{align*}
   K(t-s) &= \int_{-\infty}^{\infty} h(\tau) \int_{-\infty}^{\infty} h(\sigma) \delta(t-\tau-s+\sigma) d\sigma d\tau \\
         &= \int_{-\infty}^{\infty} h(\tau) \cdot h(t-\tau-s) \cdot 1 d\tau \\
         &= \int_{-\infty}^{\infty} h(\tau) h(t-\tau-s) d\tau
\end{align*}

The key step is:
$$
\int_{-\infty}^{\infty} h(\sigma) \delta(t-\tau-s+\sigma) d\sigma = h(t-\tau-s)
$$

This equality holds because the delta function $\delta(t-\tau-s+\sigma)$ is non-zero only when $\sigma = t-\tau+s$. Therefore, the integral reduces to $h(t-\tau-s)$.

This completes the proof of the Spectral Representation Theorem.

\section*{Reverse Proof of Spectral Representation Theorem}

Starting from the final result:

$$K(t-s) = \int_{-\infty}^{\infty} h(\tau) h(t-\tau-s) d\tau$$

Expressing $h(t)$ in terms of the spectral density $S(\omega)$:

$$h(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \sqrt{S(\omega)} e^{i\omega t} d\omega$$

Substituting this into the final expression:

$$K(t-s) = \int_{-\infty}^{\infty} \left(\frac{1}{2\pi} \int_{-\infty}^{\infty} \sqrt{S(\omega_1)} e^{i\omega_1 \tau} d\omega_1\right) \left(\frac{1}{2\pi} \int_{-\infty}^{\infty} \sqrt{S(\omega_2)} e^{i\omega_2 (t-\tau-s)} d\omega_2\right) d\tau$$

Applying Fubini's theorem to change the order of integration:

$$K(t-s) = \frac{1}{(2\pi)^2} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \sqrt{S(\omega_1)} \sqrt{S(\omega_2)} e^{i\omega_1 \tau} e^{i\omega_2 (t-\tau-s)} d\omega_1 d\omega_2 d\tau$$

Combining the exponential terms:

$$K(t-s) = \frac{1}{(2\pi)^2} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \sqrt{S(\omega_1)} \sqrt{S(\omega_2)} e^{i(\omega_1 \tau + \omega_2 (t-\tau-s))} d\omega_1 d\omega_2 d\tau$$

Evaluating the inner integral with respect to $\tau$:

$$K(t-s) = \frac{1}{(2\pi)^2} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \sqrt{S(\omega_1)} \sqrt{S(\omega_2)} 2\pi \delta(\omega_1 - \omega_2) e^{i\omega_2 (t-s)} d\omega_1 d\omega_2$$

Applying the delta function property:

$$K(t-s) = \frac{1}{2\pi} \int_{-\infty}^{\infty} S(\omega) e^{i\omega (t-s)} d\omega$$

This matches the initial spectral representation of $K(t-s)$, completing the full reverse derivation of the Spectral Representation Theorem proof.

\end{document}