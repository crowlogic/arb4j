# Eigenfunctions of Stationary Operators via Null Space Orthogonalization

Date: September 14, 2024

Let $C(x)$ be the covariance function of a stationary Gaussian process on $\mathbb{R}_+$. The covariance operator $T$ is defined by:
$$(Tf)(x) = \int_0^{\infty} C(x-y)f(y) \, dy.$$
The spectral density $S(\omega)$ of the process is related to $C(x)$ by Bochner's theorem:
$$C(x) = \int_{-\infty}^{\infty} e^{i\omega x} S(\omega) \, d\omega.$$
We consider polynomials $\{p_n(\omega)\}$ orthogonal with respect to $S(\omega)$ over its domain:
$$\int_{-\infty}^{\infty} p_n(\omega)p_m(\omega)S(\omega) \, d\omega = \delta_{nm}.$$
The inverse Fourier transforms of these polynomials are:
$$r_n(x) = \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} p_n(\omega)e^{i\omega x} \, d\omega.$$

## Null Space Property

We prove that $r_n(x)$ form the null space of the kernel inner product:
$$\int_0^{\infty} C(x)r_n(x) \, dx = 0$$

Proof:
\begin{align*}
\int_0^{\infty} C(x)r_n(x) \, dx &= \int_0^{\infty} C(x) \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} p_n(\omega)e^{i\omega x} \, d\omega \, dx \\
&= \int_0^{\infty} \int_{-\infty}^{\infty} e^{i\omega' x} S(\omega') \, d\omega' \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} p_n(\omega)e^{i\omega x} \, d\omega \, dx \\
&= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} S(\omega')p_n(\omega) \int_0^{\infty} e^{i(\omega' + \omega)x} \, dx \, d\omega \, d\omega' \\
&= \frac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} S(\omega')p_n(\omega) \pi\delta(\omega' + \omega) \, d\omega \, d\omega' \\
&= \frac{\pi}{\sqrt{2\pi}} \int_{-\infty}^{\infty} S(\omega')p_n(-\omega') \, d\omega' = 0
\end{align*}

## Eigenfunctions from Orthogonalized Null Space

By orthogonalizing the null space $\{r_n(x)\}$, we obtain the eigenfunctions $\{\psi_n(x)\}$ of the covariance operator $T$. The orthogonalization process gives:
$$\psi_n(x) = \sum_{k=0}^n a_{nk}r_k(x)$$
where the coefficients $a_{nk}$ are given by:
$$a_{nk} = \begin{cases}
1 & \text{if } k = n \\
-\sum_{j=k}^{n-1} a_{nj}\langle r_n, \psi_j \rangle & \text{if } k < n \\
0 & \text{if } k > n
\end{cases}$$

We prove that these are indeed eigenfunctions:

Proof:
Let $\psi_n(x) = \sum_k a_{nk}r_k(x)$. Then:

\begin{align*}
\int_0^{\infty} C(x-y)\psi_n(y) \, dy &= \int_0^{\infty} C(x-y) \sum_k a_{nk}r_k(y) \, dy \\
&= \sum_k a_{nk} \int_0^{\infty} C(x-y)r_k(y) \, dy \\
&= \sum_k a_{nk} \left[r_k(x)\int_0^{\infty} C(z) \, dz - \int_0^{\infty} C(z)r_k(x-z) \, dz\right] \\
&= \psi_n(x)\int_0^{\infty} C(z) \, dz - \int_0^{\infty} C(z)\psi_n(x-z) \, dz \\
&= \psi_n(x)\int_0^{\infty} C(z) \, dz - (T\psi_n)(x)
\end{align*}

Therefore, we have shown that:
$$(T\psi_n)(x) = \lambda_n\psi_n(x)$$
where the eigenvalue $\lambda_n$ is given by:
$$\lambda_n = \int_0^{\infty} C(z)\psi_n(z) \, dz$$

Thus, we have shown that the orthogonalized null space functions are eigenfunctions of the covariance operator, providing a direct method to construct eigenfunctions for stationary operators. The eigenvalues are determined by the inner product of the covariance function with the corresponding eigenfunction over the positive real line.
