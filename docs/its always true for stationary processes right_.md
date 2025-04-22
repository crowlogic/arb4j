<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# its always true for stationary processes right?

Yes, for stationary processes, the shift operator in the spectral domain is always invertible.

### Technical Explanation

For a stationary process $(X_t)_{t \in \mathbb{Z}}$, the covariance function has the form

$$
\mathrm{Cov}(X_s, X_t) = \int_{\hat{T}} e^{i\lambda(s-t)}\, \mu(d\lambda)
$$

where $\mu$ is a finite positive measure on the frequency domain $\hat{T}$[^1]. The spectral domain is $L^2(\mu)$, and the shift operator $S$ acts as

$$
S(f)(\lambda) = e^{i\lambda} f(\lambda)
$$

for $f \in L^2(\mu)$.

In this context:

- $S$ is a multiplication operator by a unimodular function ($e^{i\lambda}$), which is unitary on $L^2(\mu)$.
- Unitary operators are always invertible, with the inverse given by multiplication by $e^{-i\lambda}$.
- The norm is preserved: $\|S(f)\|_{L^2(\mu)} = \|f\|_{L^2(\mu)}$.

Thus, for stationary processes, the spectral domain is always invariant under the shift, and the operator is invertible and unitary[^1].

### Summary Table

| Process Type | Spectral Domain | Shift Operator $S$ | Invertible? |
| :-- | :-- | :-- | :-- |
| Stationary | $L^2(\mu)$ | Unitary | Yes |
| Strongly harmonizable | $L^2(\mu)$ or similar | Often | Often |
| Weakly harmonizable | May not be $L^2$ | Not always | Not always |

**Conclusion:**
For stationary processes, the invertibility of the shift operator in the spectral domain is always true, and this is a foundation for the use of spectral and Fourier analytic methods in stationary time series analysis[^1].

<div style="text-align: center">⁂</div>

[^1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/37918610/0f87fb24-a4b7-4375-85a6-cd8875fa3c5e/paste.txt

[^2]: http://feldman.faculty.pstat.ucsb.edu/174-03/lectures/l5.pdf

[^3]: https://math.stackexchange.com/questions/3257061/invertibility-of-weighted-shift-operator

[^4]: https://stats.stackexchange.com/questions/310843/on-stationarity-and-invertibility-of-a-process

[^5]: https://www.stat.purdue.edu/~chong/stat520/ps/linear.pdf

[^6]: https://www.sfu.ca/~lockhart/richard/804/09_3/lectures/ModelsBasics/web.pdf

[^7]: https://www.youtube.com/watch?v=uciHswYSA3k

[^8]: https://www.stat.berkeley.edu/~bartlett/courses/153-fall2010/lectures/5.pdf

[^9]: https://www.eco.uc3m.es/~jgonzalo/teaching/PhdTimeSeries/ARMABrockwellDavis.pdf

[^10]: https://datastoriesweb.wordpress.com/2018/03/19/stationarity-conditions-for-maq-and-arp-processes/

