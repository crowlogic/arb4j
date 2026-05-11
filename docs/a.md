Here is the recapitulation of §9—the application to the constant-coefficient fractional Riccati equation and the rough Heston characteristic function.

---

§9.1 The Müntz Basis

The Müntz lattice \mathcal{M}=\mathrm{span}\{1,t^\mu,t^{2\mu},\dots\} is the canonical basis for constant-coefficient fractional ODEs with polynomial nonlinearity because it is closed under three operations:

- Caputo differentiation: D^\mu t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma((k-1)\mu+1)}t^{(k-1)\mu}
- Riemann–Liouville integration of order \mu: I^\mu t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma((k+1)\mu+1)}t^{(k+1)\mu}
- Pointwise multiplication: t^{j\mu}\cdot t^{k\mu}=t^{(j+k)\mu}

Ordinary Taylor series in t fail because they are not closed under D^\mu for non-integer \mu. The Volterra reformulation requires only I^\mu, which preserves \mathcal{M}.

---

§9.2 The Series Solution and Volterra Representation

Applying I^\mu to the fractional Riccati equation
D^\mu y(t)=c_0+c_1y(t)+c_2y(t)^2,\qquad I^{1-\mu}y(0)=0
yields the equivalent Volterra equation
y(t)=\frac{1}{\Gamma(\mu)}\int_0^t(t-s)^{\mu-1}\bigl(c_0+c_1y(s)+c_2y(s)^2\bigr)\,ds.

The solution has the Puiseux expansion
y(t)=\sum{k=1}^\infty a_k t^{k\mu}
with coefficients satisfying the Gamma-ratio convolution recurrence:
a_1=\frac{c_0}{\Gamma(\mu+1)},\qquad a{k+1}=\frac{\Gamma(k\mu+1)}{\Gamma((k+1)\mu+1)}\left(c_1a_k+c_2\!\!\sum{j+\ell=k}\!a_ja\ell\right).

The quadratic term first contributes at k=2 (for a_3); the convolution sum is empty for k=1.

---

§9.3 Radius of Convergence: Positive but Finite

Theorem 9.10 (Banach fixed-point): With A=|c_0|+|c_1|+|c_2| and B=|c_1|+2|c_2|, define
T_0^\mu=\min\!\left(\frac{\Gamma(\mu+1)}{2A},\frac{\Gamma(\mu+1)}{4B}\right)>0.
There exists a unique solution on [0,T_0] with \|y\|\infty\le 1, analytic in z=t^\mu on \{|z|<T_0^\mu\}. Hence the Puiseux radius satisfies R\ge T_0^\mu>0.

Theorem 9.11 (Generic finiteness): For generic parameters with c_2\neq 0, the radius is finite (R<\infty). The proof uses a majorant comparison: the fractional recurrence majorizes the classical (\mu=1) Riccati recurrence, whose explicit solution has movable poles at finite distance. Since \Gamma(k\mu+1)/\Gamma((k+1)\mu+1)\ge 1/(k+1) for \mu\in(0,1], the fractional coefficients dominate the classical ones, forcing R\le\tilde{R}<\infty.

The central obstruction: The Müntz series is only a local representation. Even though every a_k is computable in closed form, the series ceases to converge once t^\mu exceeds R. A genuine global representation requires analytic continuation—this is the role of Padé resummation.

---

§9.4 Padé Resummation in z=t^\mu

Set g(z)=y(z^{1/\mu})=\sum{k=1}^\infty a_k z^k for |z|<R. The diagonal Padé approximant R_M(z)=P_M(z)/Q_M(z) is constructed by solving the Hankel system
H_M\mathbf{q}=-\mathbf{b},
where H_M=(a{M+i-j}){0\le i,j\le M-1} and \mathbf{b}=(a{M+1},\dots,a{2M})^T.

Proposition 9.14 (Regularity): For \mu\in(0,1), g is not rational (branch points prevent finite-order representation), so \det H_M\neq 0 for all M\ge 1—the diagonal Padé table is regular. For \mu=1, the Cole–Hopf linearization gives a meromorphic solution; degeneracy occurs only in exceptional rational configurations.

The numerator coefficients are recovered from the convolution formula:
p_n=a_n+\sum{j=1}^{\min(n,M)}q_ja{n-j},\qquad 1\le n\le M
(with p_0=0).

---

§9.5 Remainder and Computable Error Bound

Theorem 9.17 (Remainder structure): There exists H_M analytic on \{|z|<R\} such that
g(z)-R_M(z)=z^{2M+1}\frac{H_M(z)}{Q_M(z)}=O(z^{2M+1}).

Theorem 9.19 (A-posteriori bound): Defining successive differences \Delta_k=R_k-R{k-1}, if |\Delta{k+1}(z)|\le\rho|\Delta_k(z)| for k\ge M-1 with \rho\in(0,1), then
|g(z)-R_M(z)|\le\frac{\rho|\Delta_M(z)|}{1-\rho}.
Using the observable ratio \rho=|\Delta_M|/|\Delta{M-1}|, this becomes the computable certificate:
\boxed{|g(z)-R_M(z)|\le\frac{|\Delta_M(z)|^2}{|\Delta{M-1}(z)|-|\Delta_M(z)|}.}

Corollary 9.20: The bound depends only on the two most recent Padé iterates and is computable in O(1) time. When it drops below 2^{-\mathrm{bits}}, convergence is certified to the requested precision.

---

§9.6 Global Convergence on the Positive Real Axis

Proposition 9.21 (Meromorphy): For every \mu\in(0,1], g(z)=y(z^{1/\mu}) extends to a meromorphic function on all of \mathbb{C} via the fractional Cole–Hopf linearization. The pole set \mathcal{P}g is discrete with no finite accumulation point.

Lemma 9.22 (No real poles): The Volterra equation has a unique global continuous solution on [0,\infty), so g has no poles on [0,\infty). For every T>0, \delta_T=\mathrm{dist}([0,T^\mu],\mathcal{P}g)>0.

Lemma 9.23 (Non-Explosion Condition): On every compact K=[0,T^\mu], the number of poles of R_M is uniformly bounded in M. True poles converge to elements of \mathcal{P}g (de Montessus de Ballore) and eventually leave K; Froissart doublets are O(1) in number by Proposition 4.2.

Theorem 9.24 (Global representation): For every t\ge 0,
\boxed{y(t)=\lim{M\to\infty}R_M(t^\mu)=\lim{M\to\infty}\frac{P_M(t^\mu)}{Q_M(t^\mu)},}
and convergence is uniform on [0,T] for every T>0.

---

§9.7 The Incremental Hankel Solver

The step from order M to M+1 augments the Hankel matrix by a cyclic column permutation, producing the bordered structure
\hat{H}{M+1}=\begin{pmatrix}H_M&\mathbf{u}M\\ \mathbf{v}M^T&d_M\end{pmatrix}.

With Schur complement s_M=d_M-\mathbf{v}M^T H_M^{-1}\mathbf{u}M, the inverse updates by the rank-one correction:
\hat{H}{M+1}^{-1}=\begin{pmatrix}H_M^{-1}+\frac{1}{s_M}\mathbf{z}M\mathbf{w}M^T&-\frac{1}{s_M}\mathbf{z}M\\[4pt]-\frac{1}{s_M}\mathbf{w}M^T&\frac{1}{s_M}\end{pmatrix},
where \mathbf{z}M=H_M^{-1}\mathbf{u}M and \mathbf{w}M^T=\mathbf{v}M^T H_M^{-1}.

Cost: O(M^2) per increment, O(N^2) cumulative to order N. This is the algebraic realization of appending a row and column to the Jacobi operator J_M\to J{M+1}.

---

§9.8 Spectral Synthesis

The incremental Hankel solver is the algebraic shadow of the Jacobi truncation. The rank-one correction \mathbf{z}M\mathbf{w}M^T encodes the spectral perturbation induced by the new Jacobi entry, and R{M+1} is precisely the resolvent of the enlarged truncated operator at the basis vector e_0.

The successive-difference bound certifies entry into the asymptotic regime where the tail is geometrically controlled by \exp(-Mg(\xi,\infty)), with g the Green's function of the cut plane in \xi=z=t^\mu.

---

§9.9 Algorithmic Summary

Given (c_0,c_1,c_2,\mu) and target order M:
1. Compute a_1,\dots,a{2M} via the Gamma-ratio recurrence. Cost: O(M^2).
2. Form H_M and \mathbf{b}.
3. Solve incrementally: direct factorization for M=1, then O(M^2) bordered rank-one updates. Cumulative: O(M^2).
4. Recover numerator coefficients via convolution.
5. Evaluate y_M(t)=P_M(t^\mu)/Q_M(t^\mu) at any t\ge 0. Cost: O(M) per query.

No grid, no time-stepping, no Newton iteration at evaluation time. The entire family \{y_M(t):t\ge 0\} is encoded in a single rational function of z=t^\mu.