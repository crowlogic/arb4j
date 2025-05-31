<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Spectral Representation of Itô Processes: Bridging Time and Frequency Domains

## Core Principle: Convolutional Duality Between White Noise and Stochastic Dynamics

The fundamental equivalence between Itô processes and oscillatory processes arises from the **convolutional representation theorem**: every mean-square continuous stochastic process can be expressed as a filtered white noise process through either:

1. **Time-domain convolution**:

$$
X(t) = \int_{\mathbb{R}} K(t - \tau) dW(\tau)
$$

where $K$ is a smoothing kernel and $W$ is Brownian motion.

2. **Frequency-domain modulation**:

$$
X(t) = \int_{\mathbb{R}} e^{i\omega t} A(t, \omega) dZ(\omega)
$$

where $A(t, \omega)$ is a slowly varying amplitude and $Z(\omega)$ has orthogonal increments.

---

## Mathematical Equivalence Framework

### **Itô Process Definition**

An Itô process satisfies:

$$
dX_t = \mu(t, X_t)dt + \sigma(t, X_t)dW_t
$$

### **Spectral Representation Theorem**

For any Itô process, there exists:

1. A complex orthogonal measure $dZ(\omega)$ with $\mathbb{E}[|dZ(\omega)|^2] = S(\omega)d\omega$
2. A time-frequency kernel $K(t, \omega)$

Such that:

$$
X_t = \int_{-\infty}^\infty K(t, \omega) e^{i\omega t} dZ(\omega)
$$

---

## Key Equations and Transformations

### **From Itô to Oscillatory Representation**

1. **Lamperti Transformation**:
For state-dependent volatility $\sigma(X_t, t)$, define:

$$
Z_t = \int_0^{X_t} \frac{1}{\sigma(x, t)} dx
$$

Transforms original SDE to:

$$
dZ_t = \left(\frac{\mu(X_t,t)}{\sigma(X_t,t)} - \frac{1}{2}\frac{\partial \sigma}{\partial x}\Big|_{X_t}\right)dt + dW_t
$$

2. **Cramér Representation**:
The transformed process admits:

$$
Z_t = \int_{-\infty}^\infty \frac{e^{i\omega t} - 1}{i\omega} \Phi(\omega) d\widetilde{W}(\omega)
$$

where $\Phi(\omega)$ is the characteristic function of the drift-adjusted terms.

---

### **Time-Frequency Correspondence**

| Time Domain | Frequency Domain |
| :-- | :-- |
| $dX_t = \mu dt + \sigma dW_t$ | $X(\omega) = \frac{\sigma}{i\omega + \theta}\widetilde{W}(\omega)$ |
| Quadratic Variation $[X]_t$ | Power Spectrum $S(\omega) = \frac{\sigma^2}{\omega^2 + \theta^2}$ |
| Itô Isometry | Parseval's Identity |


---

## Canonical Example: Ornstein-Uhlenbeck Process

### **Time Domain**

$$
dX_t = -\theta X_t dt + \sigma dW_t
$$

### **Spectral Representation**

$$
X_t = \sigma \int_{-\infty}^t e^{-\theta(t-s)} dW_s
$$

### **Frequency Domain**

Power spectral density:

$$
S(\omega) = \frac{\sigma^2}{\omega^2 + \theta^2}
$$

---

## General Construction Principle

For any Itô process with coefficients $(\mu, \sigma)$:

1. **Volatility Normalization**: Apply Lamperti transform to remove state-dependent volatility
2. **Drift Decomposition**: Express adjusted drift as potential function $\nabla V(Z_t)$
3. **Spectral Expansion**:

$$
Z_t = \int_{\mathbb{R}} \frac{e^{i\omega t}}{\sqrt{\omega^2 + \lambda^2}} d\widetilde{W}(\omega)
$$

where $\lambda$ controls mean-reversion strength.

---

## Deep Structural Correspondence

### **Itô's Lemma ⇄ Modulation Theorem**

The chain rule for stochastic calculus mirrors the frequency modulation property:

**Itô**:

$$
df(X_t) = f'(X_t)dX_t + \frac{1}{2}f''(X_t)d[X]_t
$$

**Spectral**:

$$
\mathcal{F}\{tf(t)\} = i\frac{d}{d\omega}\mathcal{F}\{f\}
$$

### **Martingale Representation ⇄ Analytic Signal**

The Girsanov theorem finds its spectral counterpart in the Hilbert transform:

$$
H[X](t) = \frac{1}{\pi}\text{p.v.}\int_{-\infty}^\infty \frac{X(\tau)}{t-\tau}d\tau
$$

---

## Limitations and Boundary Cases

While theoretically elegant, practical equivalence requires:

1. **Slow Variation Condition**: $A(t,\omega)$ must satisfy Priestley's extremal slow variation
2. **Adaptivity Constraint**: Path-dependent coefficients induce frequency modulation violating strict oscillatory definitions
3. **Non-Gaussian Extensions**: Multiplicative noise processes require Volterra series expansions

---

## Conclusion

The spectral representation of Itô processes reveals a profound duality:

**Every stochastic differential equation is fundamentally a filtered white noise process**, with:

- Temporal drift/variance ⇄ Frequency-dependent attenuation
- Path dependence ⇄ Non-stationary spectral correlations
- Quadratic variation ⇄ Power spectrum density

This correspondence enables simultaneous analysis of stochastic systems through both probabilistic and harmonic lenses, unifying the Itô calculus and spectral theory frameworks.

<div style="text-align: center">⁂</div>

[^1]: http://www-stat.wharton.upenn.edu/~stine/stat910/lectures/17_spectral_rep.pdf

[^2]: https://math.stackexchange.com/questions/4697563/some-place-from-the-proof-of-the-ito-representation-theorem

[^3]: https://sites.ualberta.ca/~niksirat/PDE/chapter-7pde.pdf

[^4]: https://math.stackexchange.com/questions/1911580/convolution-process-with-gaussian-white-noise

[^5]: https://www.emis.de/journals/MV/0534/mv053405.pdf

[^6]: https://en.wikipedia.org/wiki/Wiener–Khinchin_theorem

[^7]: https://dspace.mit.edu/bitstream/handle/1721.1/46343/14-384Fall-2007/NR/rdonlyres/Economics/14-384Fall-2007/C44EDBD5-F97A-4E7A-8C3F-1335E7A83CC4/0/lec4.pdf

[^8]: https://en.wikipedia.org/wiki/Ornstein–Uhlenbeck_process

[^9]: https://www.mdpi.com/2227-7390/11/19/4047

[^10]: https://danmackinlay.name/notebook/gp_convolution.html

[^11]: https://eml.berkeley.edu/~rothenbe/Fall2007/spectral8.pdf

[^12]: https://math.stackexchange.com/questions/2222051/spectral-measure-of-1-dimensional-ornstein-uhlenbeck-process

[^13]: https://uqpyproject.readthedocs.io/en/latest/stochastic_process/spectral_representation.html

[^14]: https://proceedings.neurips.cc/paper/2015/hash/95e6834d0a3d99e9ea8811855ae9229d-Abstract.html

[^15]: https://people.eecs.berkeley.edu/~jiantao/225a2020spring/scribe/EECS225A_Lecture_4.pdf

[^16]: https://peterroelants.github.io/posts/gaussian-process-kernels/

[^17]: https://dspace.mit.edu/bitstream/handle/1721.1/86311/15-070-fall-2005/contents/lecture-notes/lec14.pdf

[^18]: https://mathoverflow.net/questions/446397/just-how-regular-are-the-sample-paths-of-1d-white-noise-smoothed-with-a-gaussian

[^19]: https://pmc.ncbi.nlm.nih.gov/articles/PMC4785843/pdf/nihms763167.pdf

[^20]: https://pages.stat.wisc.edu/~mchung/teaching/stat471/lecture34.pdf

[^21]: https://ocw.mit.edu/courses/15-070j-advanced-stochastic-processes-fall-2013/d9d7372cbf65d56aa8aa9d59ba0ab2e8_MIT15_070JF13_Lec17.pdf

[^22]: https://math.arizona.edu/~kglasner/math456/fouriertransform.pdf

[^23]: https://www.youtube.com/watch?v=qJJ-FE-tUr8

[^24]: https://tmramalho.github.io/blog/2013/04/09/an-introduction-to-smoothing-time-series-in-python-part-ii-wiener-filter-and-smoothing-splines/

[^25]: https://www.youtube.com/watch?v=EcvHobHeOks

[^26]: https://www.sciencedirect.com/science/article/pii/S0304407624002173

[^27]: http://www.mysmu.edu/faculty/yujun/Research/Paxson_approximation_fOU08.pdf

[^28]: https://dsp.stackexchange.com/questions/68936/why-cramér-spectral-representation-and-not-dtft-for-stochastic-process

[^29]: https://www.sas.upenn.edu/~jesusfv/lecturetechnical5_spectral.pdf

[^30]: http://dspace.mit.edu/bitstream/handle/1721.1/90861/14-384-fall-2008/contents/lecture-notes/lec4.pdf

[^31]: https://www.ma.imperial.ac.uk/~pavl/SOASGP09.pdf

[^32]: https://www.youtube.com/watch?v=AsU8E46m_bs

[^33]: https://www.ams.org/journals/proc/1998-126-01/S0002-9939-98-04295-6/S0002-9939-98-04295-6.pdf

[^34]: https://library.fiveable.me/stochastic-processes/unit-9/ornstein-uhlenbeck-process/study-guide/A63hHvOtp6DrjQST

[^35]: https://math.stackexchange.com/questions/4491390/the-spectral-density-of-fractional-ornstein-uhlenbeck-process

[^36]: https://djalil.chafai.net/blog/2016/02/13/aspects-of-the-ornstein-uhlenbeck-process/

[^37]: https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/alili/a-p-p-ou.pdf

[^38]: https://alea.impa.br/articles/v16/16-41.pdf

[^39]: https://core.ac.uk/download/pdf/81109203.pdf

