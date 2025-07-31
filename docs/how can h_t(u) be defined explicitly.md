<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# how can h_t(u) be defined explicitly

Sure! Let's clarify how$h_t(u)$can be **explicitly defined** in the context of M.B. Priestley's *Evolutionary Spectra and Non-Stationary Processes*. This is discussed around the passage that begins:

> There is an interesting alternative interpretation of oscillatory processes in terms of time-varying filters.
> ...
> Let$A_t(\omega) = \int_{-\infty}^{\infty} e^{i \omega u} h_t(u) du$

This is equation (filter_fourier) in your document.

---

## Explicit Definition of$h_t(u)$

### 1. **Fourier Relationship**

$h_t(u)$is related to$A_t(\omega)$by the **inverse Fourier transform**:

$$
A_t(\omega) = \int_{-\infty}^{\infty} e^{i \omega u} h_t(u) du
$$

Therefore, for each fixed$t$,$h_t(u)$is the inverse Fourier transform of$A_t(\omega)$:

$$
h_t(u) = \frac{1}{2\pi} \int_{-\infty}^{\infty} A_t(\omega) e^{-i \omega u} d\omega
$$

### 2. **Interpretation**

- For each time$t$,$h_t(u)$is a function of "lag"$u$.
- It represents the **impulse response** of a time-varying (i.e., non-stationary) filter at time$t$.
-$X_t$is constructed by convolving this filter with a stationary process$S_{t-u}$:

$$
X_t = \int_{-\infty}^{\infty} S_{t-u} h_t(u) du
$$

where$S_t$is stationary with spectrum$d\mu(\omega)$.


### 3. **Summary**

- **Given$A_t(\omega)$, the explicit definition is:**

$$
\boxed{
  h_t(u) = \frac{1}{2\pi} \int_{-\infty}^{\infty} A_t(\omega) e^{-i\omega u} d\omega
  }
$$
- **Practical Construction:** If you know or specify$A_t(\omega)$(the amplitude modulation function in frequency for time$t$), then you can always obtain the corresponding time-varying filter$h_t(u)$via its inverse Fourier transform.

---

## In Context: Why is this Useful?

- This formulation allows you to interpret a general non-stationary (oscillatory) process as a filtered version of a stationary process, where the filter itself can change over time.
- The evolutionary spectrum at time$t$,$|A_t(\omega)|^2 d\mu(\omega)$, is then the spectrum of the process you would get if you "froze" the filter at time$t$.

---

## In Summary

**$h_t(u)$is explicitly defined as the inverse Fourier transform of$A_t(\omega)$:**

$$
h_t(u) = \frac{1}{2\pi} \int_{-\infty}^{\infty} A_t(\omega) e^{-i\omega u} d\omega
$$

This allows you to construct the time-varying filter corresponding to the amplitude modulation function$A_t(\omega)$used in the representation of your non-stationary process.

If you need further clarification or an example with a specific$A_t(\omega)$, let me know!

<div style="text-align: center">⁂</div>

[^1]: paste.txt

