## Reproducing Kernel Hilbert Spaces

A reproducing kernel Hilbert space (RKHS) is a Hilbert space $$\mathcal{H}$$ of functions $$f: T \to \mathbb{C}$$, where $$T$$ is an arbitrary set, such that for every $$t \in T$$ the evaluation functional $$\delta_t : f \mapsto f(t)$$ is continuous on $$\mathcal{H}$$.  By the Riesz representation theorem, continuity of $$\delta_t$$ implies the existence of a unique element $$k_t \in \mathcal{H}$$ such that

$$
f(t) = \langle f, k_t \rangle_{\mathcal{H}} \quad \forall\, f \in \mathcal{H}.
$$

The function $$K: T \times T \to \mathbb{C}$$ defined by $$K(s,t) = \langle k_t, k_s \rangle_{\mathcal{H}}$$ is the reproducing kernel. [1] It is symmetric ($$K(s,t) = \overline{K(t,s)}$$) and positive-definite: for any finite collection $$\{t_1, \dots, t_n\} \subset T$$ and any $$\alpha_1, \dots, \alpha_n \in \mathbb{C}$$,

$$
\sum_{i,j=1}^{n} \alpha_i \overline{\alpha_j}\, K(t_i, t_j) \geq 0.
$$

The Moore–Aronszajn theorem states the converse: every symmetric positive-definite kernel $$K$$ on $$T \times T$$ determines a unique RKHS $$\mathcal{H}_K$$, constructed as the completion of the span of the functions $$\{K(\cdot, t) : t \in T\}$$ under the inner product $$\langle K(\cdot, s), K(\cdot, t)\rangle = K(s,t)$$. [1] No assumptions on $$T$$ are needed: it need not be a topological space, a compact set, or a measure space.

## Bochner's Theorem and Positive Definiteness

Bochner's theorem is the foundational characterization of continuous positive-definite functions on locally compact abelian groups. [2] In the case $$G = \mathbb{R}$$, it states: a continuous function $$\varphi: \mathbb{R} \to \mathbb{C}$$ is positive-definite if and only if it is the Fourier–Stieltjes transform of a finite positive Borel measure $$F$$ on $$\mathbb{R}$$:

$$
\varphi(\tau) = \int_{\mathbb{R}} e^{i\lambda \tau}\, dF(\lambda).
$$

More generally, on a locally compact abelian group $$G$$ with Pontryagin dual $$\widehat{G}$$, a normalized continuous positive-definite function $$f: G \to \mathbb{C}$$ corresponds uniquely to a probability measure $$\mu$$ on $$\widehat{G}$$ via $$f(g) = \int_{\widehat{G}} \xi(g)\, d\mu(\xi)$$. [2]

For a centered, wide-sense stationary process $$\{X(t)\}_{t \in \mathbb{R}}$$, the autocovariance $$R(\tau) = \mathrm{Cov}(X(t+\tau), X(t))$$ is a continuous positive-definite function of the lag $$\tau$$. Bochner's theorem then yields a unique finite positive measure $$F$$—the spectral measure—such that

$$
R(\tau) = \int_{\mathbb{R}} e^{i\lambda\tau}\, dF(\lambda).
$$

This is the spectral representation of the covariance. [2][3] The spectral measure $$F$$ encodes the entire second-order structure of the stationary process, and when $$F$$ is absolutely continuous with respect to Lebesgue measure, its Radon–Nikodym derivative is the power spectral density.

## Kolmogorov Existence Theorem

The Daniell–Kolmogorov extension theorem guarantees that a consistent family of finite-dimensional distributions determines a stochastic process. [4] Specifically: let $$T$$ be an arbitrary index set, and for each finite subset $$\{t_1, \dots, t_k\} \subset T$$, let $$\nu_{t_1 \dots t_k}$$ be a probability measure on $$\mathbb{R}^k$$ satisfying the two consistency conditions (invariance under permutation of indices, and the correct marginalization property). Then there exists a probability space $$(\Omega, \mathcal{F}, \mathbb{P})$$ and a stochastic process $$X: T \times \Omega \to \mathbb{R}$$ whose finite-dimensional distributions are exactly the given $$\nu_{t_1 \dots t_k}$$. [4]

For centered Gaussian processes, the finite-dimensional distributions are determined entirely by the covariance function $$R(s,t)$$. Positive definiteness of $$R$$ guarantees that every finite-dimensional covariance matrix is positive semidefinite, hence that the collection of multivariate Gaussians $$\mathcal{N}(0, [R(t_i,t_j)]_{i,j})$$ is a consistent family. The Kolmogorov theorem then yields the Gaussian process. Thus: a symmetric positive-definite kernel $$R$$ on $$T \times T$$ simultaneously (a) gives a Gaussian process via Kolmogorov, and (b) gives an RKHS $$\mathcal{H}_R$$ via Moore–Aronszajn. These are two constructions from the same datum, connected by the fact that $$\mathcal{H}_R$$ is the Cameron–Martin space of the Gaussian measure.

## Gelfand–Vilenkin Generalized Spectral Representation

The Gelfand–Vilenkin theory of generalized random processes provides the most general setting for spectral decomposition of second-order processes. [5][6] In this framework, a generalized stochastic process is a continuous linear functional on a nuclear space of test functions, and its spectral representation is obtained through the spectral theory of the associated covariance form viewed as a bilinear functional on that nuclear space. This is strictly more general than the Cramér or Priestley representations, which specialize to ordinary (pointwise-defined) processes with particular spectral structures.

## Cramér Spectral Representation: Stationary Case

For a centered, mean-square continuous, wide-sense stationary process $$\{X(t)\}_{t \in \mathbb{R}}$$, the Cramér spectral representation states that there exists a unique (up to modification) orthogonal random measure $$Z$$ on $$\mathbb{R}$$ such that

$$
X(t) = \int_{\mathbb{R}} e^{it\lambda}\, dZ(\lambda),
$$

where $$Z$$ has orthogonal increments satisfying $$\mathbb{E}[dZ(\lambda)\overline{dZ(\lambda')}] = \delta(\lambda - \lambda')\,dF(\lambda)$$, with $$F$$ the spectral measure from Bochner's theorem. [7][8] The covariance reproduces as

$$
R(s,t) = \mathbb{E}[X(s)\overline{X(t)}] = \int_{\mathbb{R}} e^{is\lambda} e^{-it\lambda}\, dF(\lambda) = \int_{\mathbb{R}} e^{i(s-t)\lambda}\, dF(\lambda),
$$

which is precisely the Bochner representation of the positive-definite function $$R(s-t)$$.

From the RKHS standpoint, define the synthesis operator $$T: L^2(F) \to \mathcal{H}_R$$ by

$$
(Tg)(t) = \int_{\mathbb{R}} e^{it\lambda}\, g(\lambda)\, dF(\lambda),
$$

and its adjoint, the analysis operator $$T^*$$, maps in the reverse direction. The reproducing kernel factors as

$$
R(s,t) = \langle e^{i(\cdot)t}, e^{i(\cdot)s}\rangle_{L^2(F)},
$$

so $$R$$ is the Gram kernel of the family $$\{\lambda \mapsto e^{it\lambda}\}_{t \in T}$$ in the spectral coefficient space $$L^2(F)$$. [7] This is the Cramér representation as a specialization of the Gelfand–Vilenkin theory to stationary processes with the harmonic exponentials as the spectral atoms.

## Priestley Evolutionary Spectra: The Oscillatory Process Class

Priestley's theory of evolutionary spectra generalizes the stationary spectral framework to nonstationary processes by replacing the time-invariant harmonic exponentials with time-dependent oscillatory functions. [9][10] An oscillatory process in the sense of Priestley is a centered second-order process admitting the representation

$$
X(t) = \int_{\mathbb{R}} A(t,\lambda)\, e^{it\lambda}\, dZ(\lambda),
$$

where $$Z$$ is an orthogonal random measure on $$\mathbb{R}$$ and $$A(t,\lambda)$$ is a deterministic, slowly varying (in $$t$$) modulating function. [10][9] The orthogonal random measure $$Z$$ satisfies

$$
\mathbb{E}[dZ(\lambda)\overline{dZ(\lambda')}] = \delta(\lambda - \lambda')\,d\mu(\lambda)
$$

for a positive measure $$\mu$$ on the frequency axis. When $$A(t,\lambda) \equiv 1$$, this reduces to the stationary Cramér representation. [11]

The covariance of the oscillatory process is

$$
R(s,t) = \mathbb{E}[X(s)\overline{X(t)}] = \int_{\mathbb{R}} A(s,\lambda)\,\overline{A(t,\lambda)}\, e^{i(s-t)\lambda}\, d\mu(\lambda).
$$

This is a Gram kernel: define $$\phi_t(\lambda) = A(t,\lambda)\,e^{it\lambda}$$, and then

$$
R(s,t) = \langle \phi_t, \phi_s \rangle_{L^2(\mu)} = \int_{\mathbb{R}} \phi_s(\lambda)\,\overline{\phi_t(\lambda)}\, d\mu(\lambda).
$$

Since $$R$$ is a Gram kernel, it is automatically positive-definite, and therefore it is the reproducing kernel of the RKHS $$\mathcal{H}_R$$ by Moore–Aronszajn. [1]

The synthesis operator for the Priestley class is

$$
(Tg)(t) = \int_{\mathbb{R}} A(t,\lambda)\, e^{it\lambda}\, g(\lambda)\, d\mu(\lambda),
$$

mapping spectral coefficients $$g \in L^2(\mu)$$ to time-domain functions. The adjoint analysis operator maps in the reverse direction. The integral covariance operator, when formed on any time-side $$L^2$$ space, factors as $$C_R = T T^*$$. The RKHS $$\mathcal{H}_R$$ is the range of $$T$$, equipped with the norm

$$
\|h\|_{\mathcal{H}_R} = \inf\{\|g\|_{L^2(\mu)} : Tg = h\}.
$$

This factorization is the correct general-level functional-analytic structure. It does not require $$T$$ to be a compact interval, does not require the covariance operator to be trace-class, and does not invoke Mercer's theorem. The covariance operator is understood through its factorization via the synthesis–analysis pair, not through eigenfunction expansion on a bounded domain.

## How the Parts Interlock

The logical chain is: a symmetric positive-definite kernel $$R(s,t)$$ on an arbitrary index set $$T$$ simultaneously determines, via Moore–Aronszajn, a unique RKHS $$\mathcal{H}_R$$, and via Kolmogorov, a centered Gaussian process with covariance $$R$$. [4] In the stationary case, Bochner's theorem forces $$R(s,t) = \varphi(s-t)$$ to have the Fourier–Stieltjes integral form, and the Cramér representation then realizes the process itself as a stochastic integral against the orthogonal random measure whose control measure is the Bochner spectral measure. [2][7] For the nonstationary oscillatory class, Priestley replaces the fixed exponentials $$e^{it\lambda}$$ with the time-dependent atoms $$A(t,\lambda)e^{it\lambda}$$, and the covariance remains a Gram kernel—hence a reproducing kernel—of these atoms in $$L^2(\mu)$$. [10][9] The RKHS norm in each case is the infimal spectral coefficient norm, the covariance operator factors as $$TT^*$$ through the synthesis operator $$T$$, and the entire structure rests on positive definiteness of $$R$$ without any compactness or trace-class hypotheses.

 
