# Stationary Dilations

::: definition
**Definition 1**. *Let $(\Omega, \mathcal{F}, P)$ and
$(\tilde{\Omega}, \tilde{\mathcal{F}},
  \tilde{P})$ be probability spaces. We say that
$(\Omega, \mathcal{F}, P)$ is a factor of
$(\tilde{\Omega}, \tilde{\mathcal{F}}, \tilde{P})$ if there exists a
measurable surjective map $\phi : \tilde{\Omega} \to \Omega$ such that:*

1.  *For all $A \in \mathcal{F}$, $\phi^{- 1} (A) \in
        \tilde{\mathcal{F}}$*

2.  *For all $A \in \mathcal{F}$, $P (A) = \tilde{P} (\phi^{- 1} (A))$*

*In other words, $(\Omega, \mathcal{F}, P)$ can be obtained from
$(\tilde{\Omega}, \tilde{\mathcal{F}}, \tilde{P})$ by projecting the
larger space onto the smaller one while preserving the probability
measure structure.*
:::

::: remark
In the context of stationary dilations, this means that the original
nonstationary process $\{X_t \}$ can be recovered from the stationary
dilation $\{Y_t \}$ through a measurable projection that preserves the
probabilistic structure of the original process.
:::

::: definition
**Definition 2** (Stationary Dilation). *Let $(\Omega, \mathcal{F}, P)$
be a probability space and let $\{X_t \}_{t
  \in \mathbb{R}_+}$ be a nonstationary stochastic process. A stationary
dilation of $\{X_t \}$ is a stationary process $\{Y_t \}_{t \in
  \mathbb{R}_+}$ defined on a larger probability space $(\tilde{\Omega},
  \tilde{\mathcal{F}}, \tilde{P})$ such that:*

1.  *$(\Omega, \mathcal{F}, P)$ is a factor of $(\tilde{\Omega},
        \tilde{\mathcal{F}}, \tilde{P})$*

2.  *There exists a measurable projection operator $\Pi$ such that:
    $$X_t = \Pi Y_t \quad \forall t \in \mathbb{R}_+$$*
:::

::: theorem
**Theorem 1** (Representation of Nonstationary Processes). *For a
continuous-time nonstationary process $\{X_t \}_{t \in \mathbb{R}_+}$,
its stationary dilation exists which has sample paths $t \mapsto X_t
  (\omega)$ which are continuous with probability one when $X_t$:*

-   *is uniformly continuous in probability over compact intervals:
    $$\lim_{s \to t} P (|X_s - X_t | > \epsilon) = 0 \quad \forall \epsilon >
          0, t \in [0, T], T > 0$$*

-   *has finite second moments:
    $$\mathbb{E} [|X_t |^2] < \infty \quad \forall t \in \mathbb{R}_+$$*

-   *has an integral representation of the form:
    $$X_t = \int_0^t \eta (s) ds$$ where $\eta (t)$ is a measurable
    random function that is stationary in the wide sense (with
    $\int_0^t \mathbb{E} [| \eta (s) |^2]  \hspace{0.17em} ds
        < \infty$ for all $t$)*

-   *and has a covariance operator $$R (t, s) =\mathbb{E} [X_t X_s]$$
    which is symmetric $(R (t, s) = R (s, t))$, positive definite and
    continuous*

*Under these conditions, there exists a representation:
$$X_t = M (t) \cdot S_t$$ where:*

-   *$M (t)$ is a continuous deterministic modulation function*

-   *$\{S_t \}_{t \in \mathbb{R}_+}$ is a stationary process*

*This representation can be obtained through the stationary dilation by
choosing: $$Y_t = \left( \begin{array}{c}
      M (t)\\
      S_t
    \end{array} \right)$$ with the projection operator $\Pi$ defined as:
$$\Pi Y_t = M (t) \cdot S_t$$*
:::

::: proposition
**Proposition 1** (Properties of Dilation). *The stationary dilation
satisfies:*

1.  *Preservation of moments:
    $$\mathbb{E} [|X_t |^p] \leq \mathbb{E} [|Y_t |^p] \quad \forall p \geq 1$$*

2.  *Minimal extension: Among all stationary processes that dilate
    $X_t$, there exists a minimal one (unique up to isomorphism) in
    terms of the probability space dimension*
:::

::: corollary
**Corollary 1**. *For any nonstationary process satisfying the above
conditions, the stationary dilation provides a canonical factorization
into deterministic time-varying components and stationary stochastic
components.*
:::
