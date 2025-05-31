<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# can this time change be represented as a monotonically increasing function

Yes, the time change in the Lamperti representation can be represented as a monotonically increasing function. The search results provide several key insights into this monotonic property.

## **Mathematical Structure of the Time Change**

The Lamperti time change is defined through an additive functional. For a continuous-state branching process (CSBP), the time change is constructed as[^4]:

$U_i(t) = \int_0^t \mathbf{1}_{s<\tau_i} X_i(s)^2 ds$

where $X_i(s)$ represents the process value and $\tau_i$ is the hitting time to zero. The time change function $T_i$ is then defined as the inverse of this additive functional: $T_i = (U_i|_{[0,\tau_i)})^{-1}$[^4].

## **Monotonicity Properties**

The monotonic nature of the time change emerges from several fundamental properties:

**Increasing Additive Functional**: Since $X_i(s)^2 \geq 0$ for all $s$, the integral $U_i(t)$ is non-decreasing in $t$[^4]. This ensures that as time progresses, the accumulated "mass" of the process increases monotonically.

**Well-Defined Inverse**: The fact that $\lim_{t \to \tau_i} U_i(t) = +\infty$ almost surely guarantees that the inverse function $T_i$ exists and is well-defined[^4]. Moreover, for all $u \geq 0$, we have $T_i(u) < \tau_i$, and $\lim_{u \to \infty} T_i(u) = \tau_i$[^4].

## **General Formulation**

In the broader context of Lamperti transformations, the time change $\tau$ is defined as[^2]:

$\tau(t) = \inf\left\{u \geq 0: \int_0^u f(r)^\alpha dr > t\right\}$

where $f$ is a non-increasing càdlàg function and $\alpha \in \mathbb{R}$. This construction inherently produces a monotonically increasing function since it's defined as the inverse of an integral, which is itself monotonic when the integrand is non-negative.

## **Differentiability and Local Properties**

The time change function $\tau$ is left and right-differentiable everywhere on its domain, with derivatives given by $\tau'(t_\pm) = f(\tau(t)_\pm)^{-\alpha}$[^2]. This local rescaling property means that the time change corresponds to multiplying each infinitesimal time interval by a factor that depends on the current state, while preserving the overall monotonic structure.

The monotonic property is essential for the Lamperti representation to establish a bijective correspondence between continuous-state branching processes and spectrally positive Lévy processes, ensuring that the time transformation preserves the temporal ordering of events.

<div style="text-align: center">⁂</div>

[^1]: https://projecteuclid.org/journals/probability-surveys/volume-6/issue-none/Proofs-of-the-Lamperti-representation-of-continuous-state-branching-processes/10.1214/09-PS154.pdf

[^2]: https://www.math.univ-paris13.fr/~haas/BivMCSPA

[^3]: https://projecteuclid.org/journals/bulletin-of-the-belgian-mathematical-society-simon-stevin/volume-20/issue-3/On-the-remarkable-Lamperti-representation-of-the-inverse-local-time/10.36045/bbms/1378314508.pdf

[^4]: https://arxiv.org/pdf/2306.02158.pdf

[^5]: https://eudml.org/serve/233121/accessibleLayeredPdf/0

[^6]: https://www.sciencedirect.com/science/article/pii/S0167715222002231

[^7]: https://www.maths.univ-evry.fr/prepubli/324.pdf

[^8]: https://people.bath.ac.uk/ak257/book.pdf

[^9]: https://projecteuclid.org/journals/probability-surveys/volume-9/issue-none/On-temporally-completely-monotone-functions-for-Markov-processes/10.1214/11-PS179.pdf

[^10]: https://re.public.polimi.it/retrieve/efe1a5e3-4ba0-4377-a32f-1ba99ea8d24e/On a Class of Time-Fractional Continuous-State Branching Processes.pdf

