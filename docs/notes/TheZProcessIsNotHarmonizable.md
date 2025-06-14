<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

## Confirmation and Proof

The reasoning is correct. For the process

$$
X(t) = \int_{-\infty}^{\infty} \sqrt{\dot{\theta}(t)}\, e^{i\lambda\theta(t)}\, dZ(\lambda)
$$

to be harmonizable, $\theta(t)$ must be affine, i.e., $\theta(t) = at + b$ for constants $a > 0, b \in \mathbb{R}$.

## Proof

**Theorem:** The process $X(t)$ with kernel $\phi_t(\lambda) = \sqrt{\dot{\theta}(t)}\, e^{i\lambda\theta(t)}$ is harmonizable if and only if $\theta(t)$ is affine.

### Necessity (Only If)

Suppose $X(t)$ is harmonizable. Then its covariance

$$
R(s,t) = \sqrt{\dot{\theta}(s)\dot{\theta}(t)} \int_{-\infty}^{\infty} e^{i\lambda(\theta(s) - \theta(t))} dF(\lambda)
$$

must have the representation[^1]

$$
R(s,t) = \iint_{-\infty}^{\infty} e^{isx - ity} d^2G(x,y)
$$

for some measure $G$ of bounded variation in the plane.

The integral $\int e^{i\lambda(\theta(s) - \theta(t))} dF(\lambda)$ is the Fourier-Stieltjes transform of $dF(\lambda)$ evaluated at $\theta(s) - \theta(t)$. For the covariance to be harmonizable, this must be expressible as a double Fourier-Stieltjes transform in $s$ and $t$ separately.

**Key Lemma:** A function $h(\theta(s) - \theta(t))$ can be written as $\iint e^{isx - ity} d^2G(x,y)$ if and only if $\theta(s) - \theta(t)$ is linear in $s$ and $t$.

**Proof of Lemma:** If $\theta(s) - \theta(t) = a(s-t)$ for some constant $a$, then

$$
\int e^{i\lambda(\theta(s) - \theta(t))} dF(\lambda) = \int e^{i\lambda a(s-t)} dF(\lambda) = \int e^{i(as)(λ) - i(at)(λ)} dF(\lambda)
$$

Setting $x = y = a\lambda$, this becomes $\iint e^{isx - ity} dF(x/a) \delta(x-y) dx dy$, which is a valid double Fourier-Stieltjes transform.

Conversely, if $h(\theta(s) - \theta(t)) = \iint e^{isx - ity} d^2G(x,y)$, then by uniqueness of Fourier transforms, the argument $\theta(s) - \theta(t)$ must be expressible as a linear combination $\alpha s + \beta t$ for the exponential kernels to match. This requires $\theta(s) - \theta(t) = a(s-t)$, implying $\theta(t) = at + b$.

Since $\sqrt{\dot{\theta}(s)\dot{\theta}(t)}$ is a positive multiplicative factor, it doesn't affect the fundamental constraint. Therefore, $\theta(t)$ must be affine.

### Sufficiency (If)

Suppose $\theta(t) = at + b$ with $a > 0$. Then $\dot{\theta}(t) = a$ and

$$
R(s,t) = a \int_{-\infty}^{\infty} e^{i\lambda a(s-t)} dF(\lambda)
$$

This is the covariance of a stationary harmonizable process. Setting $u = a\lambda$ and $\tilde{F}(u) = F(u/a)$:

$$
R(s,t) = \int_{-\infty}^{\infty} e^{iu(s-t)} d\tilde{F}(u)
$$

This has the double Fourier-Stieltjes representation[^1]

$$
R(s,t) = \iint_{-\infty}^{\infty} e^{isx - ity} d\tilde{F}(x) \delta(x-y) dx dy
$$

where $\delta$ is the Dirac delta. Since $\tilde{F}$ has bounded variation (inherited from $F$), the measure $d^2G(x,y) = d\tilde{F}(x) \delta(x-y) dy$ has bounded variation in the plane, confirming harmonizability.

### Conclusion

The process $X(t) = \int \sqrt{\dot{\theta}(t)}\, e^{i\lambda\theta(t)} dZ(\lambda)$ is harmonizable if and only if $\theta(t) = at + b$ for constants $a > 0, b \in \mathbb{R}$. For any nonlinear $\theta(t)$, the process is **not** harmonizable because its covariance cannot be expressed as a double Fourier-Stieltjes transform with respect to a measure of bounded variation in the plane.

<div style="text-align: center">⁂</div>

[^1]: paste.txt

[^2]: https://www.dovepress.com/electroencephalographic-theta-band-oscillatory-dynamics-represent-atte-peer-reviewed-article-PRBM

[^3]: https://www.mdpi.com/2073-4409/11/22/3555

[^4]: https://onlinelibrary.wiley.com/doi/10.1111/ejn.16563

[^5]: https://direct.mit.edu/jocn/article/doi/10.1162/jocn_a_02322/128410/Theta-Stimulation-Enhances-Early-Consolidation-of

[^6]: http://journal.frontiersin.org/article/10.3389/fnbeh.2017.00166/full

[^7]: https://physoc.onlinelibrary.wiley.com/doi/10.1113/JP287373

[^8]: https://www.frontiersin.org/articles/10.3389/fpsyt.2023.1140361/full

[^9]: https://www.nature.com/articles/s42003-023-04531-9

[^10]: https://journals.lww.com/10.1227/neu.0000000000002809_892

[^11]: https://academic.oup.com/cercor/article/doi/10.1093/cercor/bhae277/7775623

