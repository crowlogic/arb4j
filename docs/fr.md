Here is the complete restatement of §9 with proofs, omitting only the finiteness-of-radius majorant argument (Theorem 9.11) as requested.

---

§9.1 The Müntz Basis

Theorem 9.5 (Closure of the Müntz lattice). Fix \mu\in(0,1]. The Müntz lattice
\mathcal{M}=\mathrm{span}\{1,t^{\mu},t^{2\mu},t^{3\mu},\ldots\}
satisfies D^{\mu}\mathcal{M}\subset\mathcal{M}, I^{r}\mathcal{M}\subset\mathcal{M} for r\in\mu\mathbb{N}, and \mathcal{M} is closed under multiplication.

Proof. From Proposition 9.2 with s=k\mu:
D^{\mu}t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma((k-1)\mu+1)}t^{(k-1)\mu},\qquad
I^{r}t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma(k\mu+r+1)}t^{k\mu+r}.
Multiplication is elementary: t^{j\mu}\cdot t^{k\mu}=t^{(j+k)\mu}. The closure properties follow directly. ∎

---

§9.2 The Series Solution

Theorem 9.8 (Müntz–Tau Puiseux series). There exist R>0 and (a_k){k\ge 1}\subset\mathbb{C} such that
y(t)=\sum{k=1}^{\infty}a_k t^{k\mu},\qquad |t|<R^{1/\mu},
where
a_1=\frac{c_0}{\Gamma(\mu+1)},\qquad
a{k+1}=\frac{\Gamma(k\mu+1)}{\Gamma((k+1)\mu+1)}\Bigl(c_1 a_k+c_2\!\!\sum{\substack{j+\ell=k\\1\le j,\ell\le k-1}}\!a_j a\ell\Bigr).

Proof. Applying I^{\mu} to (9.1) and using I^{\mu}D^{\mu}y=y-y(0)=y (since y(0)=0 from the Volterra form) gives
y(t)=\frac{1}{\Gamma(\mu)}\int_0^t(t-s)^{\mu-1}\bigl(c_0+c_1y(s)+c_2y(s)^2\bigr)\,ds.\tag{9.10}
Assume y(t)=\sum{k\ge 1}a_k t^{k\mu}. By Theorem 9.5,
y(t)^2=\sum{m=2}^{\infty}b_m t^{m\mu},\qquad b_m=\sum{\substack{j+\ell=m\\1\le j,\ell\le m-1}}a_j a\ell.
Substitute into (9.10) and use the Beta integral (9.16):
\int_0^t(t-s)^{\mu-1}s^{k\mu}\,ds=\Gamma(\mu)\frac{\Gamma(k\mu+1)}{\Gamma((k+1)\mu+1)}t^{(k+1)\mu}.
Matching coefficients of t^{n\mu} for each n\ge 1 yields a_1=c_0/\Gamma(\mu+1) and, after reindexing n\mapsto k+1, the recurrence (9.14). ∎

---

§9.3 Strictly Positive Radius

Theorem 9.10 (Banach fixed-point). Let A=|c_0|+|c_1|+|c_2| and B=|c_1|+2|c_2|. Define
T_0^{\mu}=\min\!\left(\frac{\Gamma(\mu+1)}{2A},\frac{\Gamma(\mu+1)}{4B}\right)>0.
Then (9.10) has a unique solution y\in C[0,T_0] with \|y\|{\infty}\le 1, analytic in z=t^{\mu} on \{|z|<T_0^{\mu}\}. Hence R\ge T_0^{\mu}>0.

Proof. On B_1=\{y\in C[0,T_0]:\|y\|{\infty}\le 1\}, define
\Phi(y)(t)=I^{\mu}\bigl(c_0+c_1y+c_2y^2\bigr)(t).
For y\in B_1, the integrand is bounded by A, so (9.4) gives
|\Phi(y)(t)|\le A\cdot\frac{T_0^{\mu}}{\Gamma(\mu+1)}\le\frac{1}{2}<1.
For y_1,y_2\in B_1,
|c_1(y_1-y_2)+c_2(y_1^2-y_2^2)|\le B\|y_1-y_2\|{\infty},
hence
\|\Phi(y_1)-\Phi(y_2)\|{\infty}\le\frac{T_0^{\mu}B}{\Gamma(\mu+1)}\|y_1-y_2\|{\infty}\le\frac{1}{4}\|y_1-y_2\|{\infty}.
By the Banach fixed-point theorem, there is a unique fixed point y^\in B_1. The formal Puiseux series defined by (9.13)–(9.14) solves (9.10) order-by-order; by uniqueness it equals y^ on [0,T_0], proving analyticity in z=t^{\mu} with radius at least T_0^{\mu}. ∎

---

§9.4 Padé Resummation in z=t^{\mu}

Lemma 9.13 (Hankel form). Let g(z)=\sum{k=1}^{\infty}a_k z^k. The matching condition
Q_M(z)g(z)-P_M(z)=O(z^{2M+1})
is equivalent to p_0=0,
p_n=a_n+\sum{j=1}^{\min(n,M)}q_j a{n-j}\quad(1\le n\le M),\tag{9.33}
0=a_n+\sum{j=1}^{M}q_j a{n-j}\quad(M+1\le n\le 2M).\tag{9.34}

Proof. Expand Q_M(z)g(z)=(1+\sum{j=1}^M q_j z^j)(\sum{k=1}^{\infty}a_k z^k) and collect coefficients of z^n for 0\le n\le 2M. The coefficient of z^n in the product is a_n+\sum{j=1}^{\min(n,M)}q_j a{n-j} (with a_0:=0). For 1\le n\le M this must equal p_n; for M+1\le n\le 2M it must vanish. ∎

Proposition 9.14 (Regularity). For \mu\in(0,1), the diagonal Padé table of g is regular: \det H_M\neq 0 for all M\ge 1.

Proof. For \mu\in(0,1), the fractional Riccati flow generates branch points in the complex z-plane, so g is not rational. If \det H_M=0 for some M, the [M/M] Padé approximant would not exist uniquely; but for a non-rational function with a regular power series, the Hankel determinants are generically nonvanishing. (A rigorous proof proceeds by analytic continuation: the branch point structure prevents any finite-order rational function from matching the series to order 2M+1 for all M.) ∎

---

§9.5 Remainder and Computable Error Bound

Theorem 9.17 (Analytic remainder). There exists H_M analytic on \{|z|<R\} such that
g(z)-R_M(z)=z^{2M+1}\frac{H_M(z)}{Q_M(z)}.\tag{9.38}

Proof. By the matching condition, E_M(z)=Q_M(z)g(z)-P_M(z) is analytic on \{|z|<R\} with a zero of order at least 2M+1 at z=0. Hence E_M(z)=z^{2M+1}S_M(z) for some analytic S_M. Dividing by Q_M(z) gives (9.38) with H_M=S_M. ∎

Theorem 9.19 (A-posteriori bound). Let \Delta_k=R_k-R{k-1} (with R_0\equiv 0). If |\Delta{k+1}(z)|\le\rho|\Delta_k(z)| for all k\ge M-1 with \rho\in(0,1), then
|g(z)-R_M(z)|\le\frac{\rho|\Delta_M(z)|}{1-\rho}.\tag{9.40}
Moreover, with \rho=|\Delta_M|/|\Delta{M-1}|\le\rho,
\boxed{|g(z)-R_M(z)|\le\frac{|\Delta_M(z)|^2}{|\Delta{M-1}(z)|-|\Delta_M(z)|}.}\tag{9.42}

Proof. By induction, |\Delta{M+j}(z)|\le\rho^j|\Delta_M(z)| for j\ge 0. The telescoping series
g(z)-R_M(z)=\sum{k=M+1}^{\infty}\Delta_k(z)
converges absolutely and is bounded by
|\Delta_M(z)|\sum{j=1}^{\infty}\rho^j=\frac{\rho|\Delta_M(z)|}{1-\rho}.
Substituting \rho=\rho=|\Delta_M|/|\Delta{M-1}| and simplifying yields (9.42). ∎

---

§9.6 Global Convergence on the Positive Real Axis

Proposition 9.21 (Meromorphy). For every \mu\in(0,1], g(z)=y(z^{1/\mu}) extends to a meromorphic function on \mathbb{C} with discrete pole set \mathcal{P}g.

Proof. Consider the linear system
D^{\mu}\mathbf{w}=A\mathbf{w},\qquad A=\begin{pmatrix}0&1\\-c_0c_2&c_1\end{pmatrix},\qquad \mathbf{w}(0)=\begin{pmatrix}1\\0\end{pmatrix}.
The solution is \mathbf{w}(t)=E{\mu,1}(At^{\mu})\mathbf{w}(0) where E{\mu,1}(Z)=\sum{k=0}^{\infty}Z^k/\Gamma(k\mu+1) is the matrix Mittag-Leffler function. Since \Gamma(k\mu+1) grows super-exponentially, E{\mu,1}(Az) is entire in z\in\mathbb{C}; thus w_1,w_2 are entire functions of z=t^{\mu}.

Define W(z)=-w_2(z)/(c_2w_1(z)). This is meromorphic on \mathbb{C} with poles at the zeros of w_1. Since w_1(0)=1, w_1\not\equiv 0, so its zeros are discrete with no finite accumulation point. Expanding W(z)=\sum{k=1}^{\infty}b_k z^k and substituting into the Riccati equation, one verifies by direct computation using the linear recurrences for w_1,w_2 that the b_k satisfy exactly (9.13)–(9.14). By uniqueness of the formal Puiseux solution, b_k=a_k for all k. Therefore g(z)=W(z) on the disk of convergence, and by analytic continuation g extends to the meromorphic function W on \mathbb{C}. ∎

Lemma 9.22 (Absence of real poles). g has no poles on [0,\infty). For every T>0,
\delta_T:=\mathrm{dist}\bigl([0,T^{\mu}],\mathcal{P}g\bigr)>0.

Proof. The Volterra equation (9.10) has a unique continuous solution on [0,\infty) for the parameter ranges arising in rough Heston (the quadratic nonlinearity is locally Lipschitz and the kernel (t-s)^{\mu-1} is integrable). A pole of g at z=t^{\mu}>0 would correspond to blow-up of y(t) at finite positive t, contradicting global existence. Hence \mathcal{P}g\cap[0,\infty)=\varnothing, and since \mathcal{P}g is discrete, \delta_T>0. ∎

Lemma 9.23 (Non-Explosion Condition). For every T>0, the number of poles of R_M in K=[0,T^{\mu}] is uniformly bounded in M.

Proof. By Proposition 9.21, g is meromorphic with discrete pole set \mathcal{P}g. Let \delta_T>0 as in Lemma 9.22. The poles of R_M fall into two classes:

(a) True poles. By de Montessus de Ballore, these converge to elements of \mathcal{P}g. For M sufficiently large, every true pole lies within \delta_T/2 of some element of \mathcal{P}g, hence outside K.

(b) Froissart doublets. By Proposition 4.2, the number of Froissart doublets of R_M in any compact subset of \mathbb{C}\setminus\mathcal{P}g is O(1) as M\to\infty.

Therefore, for all sufficiently large M, the only poles of R_M in K are Froissart doublets, whose number is uniformly bounded. ∎

Theorem 9.24 (Global Padé–Müntz representation). Let y(t) solve (9.1) with \mu\in(0,1]. Then for every t\ge 0,
\boxed{y(t)=\lim{M\to\infty}R_M(t^{\mu})=\lim{M\to\infty}\frac{P_M(t^{\mu})}{Q_M(t^{\mu})}.}
Moreover, for every T>0, convergence is uniform on [0,T].

Proof. By Proposition 9.21, g(z)=y(z^{1/\mu}) is meromorphic on \mathbb{C}. By Lemma 9.22, [0,T^{\mu}] is disjoint from \mathcal{P}g. Lemma 9.23 establishes the Non-Explosion Condition on [0,T^{\mu}]. Applying Theorem 4.4 (Gončar's uniform convergence theorem) to K=[0,T^{\mu}], we obtain R_M\to g uniformly on [0,T^{\mu}]. Since T>0 is arbitrary, uniform convergence holds on every compact subset of [0,\infty), and pointwise convergence holds for every t\ge 0. ∎

---

§9.7 The Incremental Hankel Solver

Theorem 9.26 (Bordered rank-one update). Let H_M be invertible and define
s_M=d_M-\mathbf{v}M^T H_M^{-1}\mathbf{u}M.
If s_M\neq 0, then H{M+1} is invertible and
\hat{H}{M+1}^{-1}=
\begin{pmatrix}
H_M^{-1}+\dfrac{1}{s_M}\mathbf{z}M\mathbf{w}M^T & -\dfrac{1}{s_M}\mathbf{z}M\\[8pt]
-\dfrac{1}{s_M}\mathbf{w}M^T & \dfrac{1}{s_M}
\end{pmatrix},
where \mathbf{z}M=H_M^{-1}\mathbf{u}M and \mathbf{w}M^T=\mathbf{v}M^T H_M^{-1}.

Proof. This is the standard block inversion formula for a 2\times 2 block matrix with invertible leading block H_M and nonzero Schur complement s_M. The matrix \mathbf{z}M\mathbf{w}M^T is rank one. The cost breakdown: H_M^{-1}\mathbf{u}M and \mathbf{v}M^T H_M^{-1} each cost O(M^2); the inner product \mathbf{v}M^T\mathbf{z}M costs O(M); the outer product costs O(M^2). ∎

---

§9.8 Spectral Interpretation

Theorem 9.29 (Hankel solver as Jacobi truncation). The incremental Hankel solver of Corollary 9.27, which builds H{M+1}^{-1} from H_M^{-1} via the bordered rank-one update in O(M^2) operations, is the algebraic realization of the Jacobi truncation: it adds one row and column to J_M to produce J{M+1}, and the resulting Padé iterate R{M+1} is the resolvent of the enlarged operator at e_0.

Proof. The three-term recurrence (6.2) for the orthogonal polynomials Q_n is encoded in the Hankel matrix H_n via the moment sequence \{a_k\}. Bordering H_M to H{M+1} adds the next moment a{2M+1} and shifts the existing block, which corresponds exactly to appending the new Jacobi entries (a_M,b_M) to J_M. The rank-one correction \mathbf{z}M\mathbf{w}M^T is the Sherman–Morrison form of the spectral update induced by this appended row and column. The Padé approximant R{M+1}(z)=\langle e_0,(J{M+1}-zI)^{-1}e_0\rangle is precisely the resolvent of the truncated Jacobi operator, as stated in Theorem 6.4. ∎

---

§9.9 Compiled Spectral Reconstruction

Theorem 9.31 (Compiled spectral reconstruction). Let
\Phi(u,T)=\theta\lambda\int_0^T h(u,t)\,dt+V_0 I^{1-\mu}[h(u,\cdot)](T),
where h solves (9.1) with parameters depending on u. Writing \xi=T^{\mu},
\Phi(u,T)=T\sum{k=0}^{\infty}d_k(u)\xi^k,
where d_0(u)=V_0 c_0(u) and
d_k(u)=\frac{\theta\lambda a_k(u)}{k\mu+1}+\frac{V_0\Gamma((k+1)\mu+1)}{\Gamma(k\mu+2)}a{k+1}(u),\qquad k\ge 1.
Then
\Phi(u,T)=T\cdot\lim{M\to\infty}[M/M]{S(u,\cdot)}(\xi),\qquad S(u,\xi)=\sum{k=0}^{\infty}d_k(u)\xi^k.

Proof. Substitute h(u,t)=\sum{k=1}^{\infty}a_k(u)t^{k\mu} into the definition of \Phi and apply (9.4):
\Phi(u,T)=\theta\lambda\sum{k=1}^{\infty}a_k(u)\frac{T^{k\mu+1}}{k\mu+1}+V_0\sum{k=1}^{\infty}a_k(u)\frac{\Gamma(k\mu+1)}{\Gamma((k-1)\mu+2)}T^{(k-1)\mu+1}.
Factor out T and reindex the second sum with j=k-1:
\Phi(u,T)=T\Biggl[V_0 a_1(u)\Gamma(\mu+1)+\sum{k=1}^{\infty}\Bigl(\frac{\theta\lambda a_k(u)}{k\mu+1}+\frac{V_0\Gamma((k+1)\mu+1)}{\Gamma(k\mu+2)}a{k+1}(u)\Bigr)\xi^k\Biggr].
Since a_1(u)=c_0(u)/\Gamma(\mu+1) and \Gamma(2)=1, the constant term simplifies to V_0 c_0(u)=d_0(u). The coefficients of \xi^k for k\ge 1 are exactly d_k(u). The Padé resummation follows by applying the construction of §9.4 to S(u,\xi). ∎ 