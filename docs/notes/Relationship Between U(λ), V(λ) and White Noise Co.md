<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Relationship Between U(λ), V(λ) and White Noise Components

The orthogonal processes U(λ) and V(λ) are **direct linear transformations** of the underlying white noise components, scaled by the square root of the power spectral density. This relationship embodies the fundamental connection between time-domain randomness and frequency-domain spectral structure.

## Mathematical Foundation

In the spectral representation theorem, a real-valued stationary Gaussian process has the form:

$X(t) = \int_0^{\infty} [\cos(\lambda t) \, dU(\lambda) + \sin(\lambda t) \, dV(\lambda)]$

The orthogonal increment processes U(λ) and V(λ) are constructed from **complex-valued white noise measures** as described in the literature[^1].

## Direct Construction Relationship

In the discrete implementation, the relationship is explicit:

**White Noise Components:**

- $W_k^{re} \sim \mathcal{N}(0,1)$ (real part)
- $W_k^{im} \sim \mathcal{N}(0,1)$ (imaginary part)
- Independent across frequencies and between real/imaginary parts

**Spectral Scaling:**
$Z_k = \sqrt{S(\lambda_k) \Delta\lambda} \cdot (W_k^{re} + i W_k^{im})$

**Orthogonal Process Increments:**

- $dU(\lambda_k) = \text{Re}(Z_k) = \sqrt{S(\lambda_k) \Delta\lambda} \cdot W_k^{re}$
- $dV(\lambda_k) = \text{Im}(Z_k) = \sqrt{S(\lambda_k) \Delta\lambda} \cdot W_k^{im}$


## Key Properties

**Isometry Preservation:** The white noise isometry property[^2] ensures that orthogonal white noise components map to orthogonal increments in U(λ) and V(λ). This means:

$E[dU(\lambda_i) dU(\lambda_j)] = E[dV(\lambda_i) dV(\lambda_j)] = 0 \text{ for } i \neq j$
$E[dU(\lambda_i) dV(\lambda_j)] = 0 \text{ for all } i,j$

**Independence Structure:** Since the underlying white noise components are independent Gaussians, and linear transformations preserve Gaussian distributions, the orthogonal increments maintain independence across frequencies[^3][^2].

**Spectral Coloring:** The power spectral density S(λ) acts as a **frequency-dependent amplification factor** that transforms white (flat spectrum) noise into colored noise with the desired spectral characteristics.

## Physical Interpretation

**U(λ) Process:** Captures the **cosine components** of the spectral decomposition. Each increment $dU(\lambda_k)$ represents the contribution of frequency $\lambda_k$ to the "even" or "symmetric" part of the process.

**V(λ) Process:** Captures the **sine components** of the spectral decomposition. Each increment $dV(\lambda_k)$ represents the contribution of frequency $\lambda_k$ to the "odd" or "antisymmetric" part of the process.

**Randomness Inheritance:** The statistical properties (Gaussianity, independence, zero mean) are **inherited directly** from the white noise, while the frequency-dependent variance structure comes from the spectral density.

## Computational Implementation

In the code implementation:

```java
// White noise generation (innovation)
element.re().set(random.nextGaussian());  // W_k^re
element.im().set(random.nextGaussian());  // W_k^im

// Spectral scaling (coloring)
complexSignal.get(k).set(element).mul(mag, bits);  // Z_k = sqrt(S(λ_k)) * W_k

// Orthogonal process extraction
uProcess[k] = complexSignal.get(k).re().doubleValue();  // dU(λ_k)
vProcess[k] = complexSignal.get(k).im().doubleValue();  // dV(λ_k)
```

This reveals that U(λ) and V(λ) are **not independent random processes**, but rather **deterministic linear functionals** of the same underlying white noise field, differentiated only by their real versus imaginary parts and their trigonometric roles in the spectral representation.

The white noise provides the fundamental **innovation** or **unpredictability**, while the spectral density determines how this innovation is **distributed across frequencies** to create the desired correlation structure in the time domain.

<div style="text-align: center">⁂</div>

[^1]: https://arxiv.org/pdf/2111.01084.pdf

[^2]: https://www.math.utah.edu/~davar/math7880/S15/Chapter6.pdf

[^3]: https://dsp.stackexchange.com/questions/35802/gaussian-white-noise-relation-between-distribution-and-correlation

[^4]: https://www.aanda.org/articles/aa/full_html/2016/08/aa28306-16/aa28306-16.html

[^5]: https://people.kth.se/~penqvist/LPbook.pdf

[^6]: https://journals.ametsoc.org/view/journals/apme/15/6/1520-0450_1976_015_0571_amftso_2_0_co_2.pdf

[^7]: https://www.sciencedirect.com/science/article/pii/S0888327017305149

[^8]: https://repository.ubn.ru.nl/bitstream/handle/2066/205110/205110.pdf

[^9]: https://www2.umbc.edu/photonics/Menyuk/Phase-Noise/kasdin_ProcIEEE_950501n.pdf

[^10]: https://proceedings.neurips.cc/paper/2020/file/6d79e030371e47e6231337805a7a2685-Paper.pdf

