---
---

The exposition accurately establishes the following:

**(1) Oscillatory Representation:**\
Given a stationary Gaussian process $$X(t)$$ with spectral density
$$S(\lambda)$$, the time-changed process\
$$Z(t) = X(\theta(t))$$\
admits the spectral representation\
$$Z(t) = \int e^{i \lambda \theta(t)} d\Phi(\lambda)$$\
which matches Priestley's structure for oscillatory processes:\
$$\varphi_t(\lambda) = e^{i \lambda \theta(t)} = e^{i \lambda t} e^{i \lambda (\theta(t) - t)} = e^{i \lambda t} A_t(\lambda)$$\
with gain function\
$$A_t(\lambda) = e^{i \lambda (\theta(t) - t)}.$$

**(2) Covariance Kernel:**\
The covariance kernel is\
$$K(t,s) = \mathbb{E}[Z(t) Z(s)] = K_X(\theta(t) - \theta(s)) = \int e^{i (\theta(t) - \theta(s)) \lambda} S(\lambda) d\lambda$$\
which is that of an oscillatory process (nonstationary but parameterized
via the time change).

**(3) Zero-Crossing Rate:**\
Zero crossing rate for the original stationary Gaussian process $$X$$
is\
$$\nu = \frac{1}{\pi} \sqrt{\frac{\lambda_2}{\lambda_0}},$$\
where $$\lambda_k = \int \lambda^k S(\lambda) d\lambda$$.

Because $$\theta$$ is strictly monotonic, zero-crossings are mapped
bijectively:\
$$\mathbb{E}[N_{Z}(0, t)] = \nu \cdot (\theta(t) - \theta(0))$$\
matching precisely the Lebesgue measure under the time change.

**Summary:**\
The theorem and proof are correct and precise. Time-changing a
stationary (e.g., Gaussian) process via an injective differentiable map
yields an oscillatory process in the sense of Priestley, with explicit
spectral representation, covariance kernel, and predictable
zero-crossing statistics. No errors or omissions are evident. The logic
follows from standard properties of spectral representations and
monotonic transformations.
