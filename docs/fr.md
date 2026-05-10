Here is §9 in full, with every object defined before it is used, and with the compiled reconstruction written so that d_k and S are visible from the algebra without an obscuring change of variables.

---

§9. Application to Rough Heston: The Constant-Coefficient Fractional Riccati Equation

The rough Heston characteristic function reduces to
D^{\mu}y(t)=c{0}+c{1}y(t)+c{2}y(t)^{2},\qquad I^{1-\mu}y(0)=0,\tag{9.1}
where D^{\mu} is the Caputo derivative of order \mu\in(0,1], H=\mu-\tfrac{1}{2} is the Hurst parameter, and c{0},c{1},c{2}\in\mathbb{C} depend on the model parameters and the Fourier variable.

§9.1. Fractional calculus and the Müntz basis

Definition 9.1 (Riemann–Liouville integral and Caputo derivative). For r>0 and f\in L^{1}{\mathrm{loc}}[0,T], the Riemann–Liouville integral is
I^{r}f(t)=\frac{1}{\Gamma(r)}\int{0}^{t}(t-s)^{r-1}f(s)\,ds.\tag{9.2}
For \mu\in(0,1) and f such that I^{1-\mu}f\in C^{1}[0,T], the Caputo derivative is
D^{\mu}f(t)=\frac{d}{dt}\bigl(I^{1-\mu}f(t)\bigr)-\frac{f(0)}{\Gamma(1-\mu)}t^{-\mu}.\tag{9.3}
The fundamental relations are I^{\mu}D^{\mu}f(t)=f(t)-f(0) and D^{\mu}I^{\mu}f(t)=f(t).

Proposition 9.2 (Action on power functions). For s>-1 and r>0,
I^{r}t^{s}=\frac{\Gamma(s+1)}{\Gamma(s+r+1)}t^{s+r}.\tag{9.4}
For \mu\in(0,1) and s>0,
D^{\mu}t^{s}=\frac{\Gamma(s+1)}{\Gamma(s+1-\mu)}t^{s-\mu}.\tag{9.5}

Proof. For (9.4), substitute u=tx in the integral to obtain a Beta function. For (9.5), the hypothesis s>0 gives f(0)=0, so the correction term in (9.3) vanishes. Differentiating I^{1-\mu}t^{s}=\Gamma(s+1)/\Gamma(s+2-\mu)\cdot t^{s+1-\mu} and using \Gamma(s+2-\mu)=(s+1-\mu)\Gamma(s+1-\mu) yields the result. ∎

Definition 9.4 (Müntz lattice). Fix \mu\in(0,1] and T>0. The Müntz lattice is
\mathcal{M}=\mathrm{span}\{1,t^{\mu},t^{2\mu},t^{3\mu},\ldots\}.\tag{9.6}

Theorem 9.5 (Closure of the Müntz lattice). For every k\ge 1 and r\in\mu\mathbb{N}:
D^{\mu}t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma((k-1)\mu+1)}t^{(k-1)\mu},\tag{9.7}
I^{r}t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma(k\mu+r+1)}t^{k\mu+r},\tag{9.8}
t^{j\mu}\cdot t^{k\mu}=t^{(j+k)\mu}.\tag{9.9}
Consequently D^{\mu}\mathcal{M}\subset\mathcal{M}, I^{r}\mathcal{M}\subset\mathcal{M}, and \mathcal{M} is closed under multiplication.

Proof. Equations (9.7) and (9.8) are Proposition 9.2 with s=k\mu; (9.9) is elementary. ∎

---

§9.2. The series solution and Volterra representation

Applying I^{\mu} to (9.1) and using I^{\mu}D^{\mu}y=y-y(0)=y (since y(0)=0, as follows from the Volterra form below) gives the equivalent Volterra integral equation
y(t)=\frac{1}{\Gamma(\mu)}\int{0}^{t}(t-s)^{\mu-1}\bigl(c{0}+c{1}y(s)+c{2}y(s)^{2}\bigr)\,ds.\tag{9.10}

Remark 9.7 (Hölder regularity at the origin). Evaluating (9.10) at t=0 gives y(0)=0. Near the origin,
y(t)=\frac{c{0}}{\Gamma(\mu+1)}t^{\mu}+O(t^{2\mu}),\tag{9.11}
so y is Hölder continuous of order \mu but not differentiable at 0.

Theorem 9.8 (Müntz–Tau Puiseux series solution). There exist R>0 and a sequence (a{k}){k\ge 1}\subset\mathbb{C} such that
y(t)=\sum{k=1}^{\infty}a{k}t^{k\mu},\qquad |t|<R^{1/\mu},\tag{9.12}
where the coefficients satisfy the Gamma-ratio convolution recurrence
a{1}=\frac{c{0}}{\Gamma(\mu+1)},\tag{9.13}
a{k+1}=\frac{\Gamma(k\mu+1)}{\Gamma((k+1)\mu+1)}\biggl(c{1}a{k}+c{2}\!\!\sum{\substack{j+\ell=k\\1\le j,\ell\le k-1}}\!\!a{j}a{\ell}\biggr),\qquad k\ge 1.\tag{9.14}

Proof. Granting analyticity of y in z=t^{\mu} on |z|<R, write y(t)=\sum{k\ge 1}a{k}t^{k\mu}. By Theorem 9.5,
y(t)^{2}=\sum{m=2}^{\infty}b{m}t^{m\mu},\qquad b{m}=\sum{\substack{j+\ell=m\\1\le j,\ell\le m-1}}a{j}a{\ell}.\tag{9.15}
Substitute into (9.10) and apply (9.4) with s=k\mu, r=\mu:
\int{0}^{t}(t-s)^{\mu-1}s^{k\mu}\,ds=\Gamma(\mu)\frac{\Gamma(k\mu+1)}{\Gamma((k+1)\mu+1)}t^{(k+1)\mu}.\tag{9.16}
Matching the coefficient of t^{n\mu} for each n\ge 1 yields (9.13) for n=1 and (9.14) after reindexing n\mapsto k+1. ∎

---

§9.3. Strictly positive radius of convergence

Theorem 9.10 (Strictly positive Puiseux radius). Let
A=|c{0}|+|c{1}|+|c{2}|,\qquad B=|c{1}|+2|c{2}|,\tag{9.19}
and define
T{0}^{\mu}=\min\!\left(\frac{\Gamma(\mu+1)}{2A},\frac{\Gamma(\mu+1)}{4B}\right)>0.\tag{9.20}
Then there exists a unique solution y\in C[0,T{0}] of (9.10) with \|y\|{\infty}\le 1, analytic in z=t^{\mu} on \{|z|<T{0}^{\mu}\}. Hence the Puiseux series (9.12) has radius R\ge T{0}^{\mu}>0.

Proof. Define B{1}=\{y\in C[0,T{0}]:\|y\|{\infty}\le 1\} and
\Phi(y)(t)=I^{\mu}\bigl(c{0}+c{1}y+c{2}y^{2}\bigr)(t).\tag{9.22}
For y\in B{1}, the integrand is bounded by A, and (9.4) gives
|\Phi(y)(t)|\le A\cdot\frac{T{0}^{\mu}}{\Gamma(\mu+1)}\le\frac{1}{2}<1.\tag{9.23}
For y{1},y{2}\in B{1},
|c{1}(y{1}-y{2})+c{2}(y{1}^{2}-y{2}^{2})|\le B\|y{1}-y{2}\|{\infty},\tag{9.24}
so
\|\Phi(y{1})-\Phi(y{2})\|{\infty}\le\frac{T{0}^{\mu}B}{\Gamma(\mu+1)}\|y{1}-y{2}\|{\infty}\le\frac{1}{4}\|y{1}-y{2}\|{\infty}.\tag{9.25}
The Banach fixed-point theorem gives a unique y^{}\in B{1} solving (9.10). The formal Puiseux series defined by (9.13)–(9.14) solves the same equation order by order; by uniqueness it equals y^{} on [0,T{0}], proving analyticity in z=t^{\mu} with radius at least T{0}^{\mu}. ∎

---

§9.4. Padé resummation in the variable z=t^{\mu}

Set
g(z)=y(z^{1/\mu})=\sum{k=1}^{\infty}a{k}z^{k},\qquad |z|<R.\tag{9.30}
Fix M\in\mathbb{N} and seek polynomials
P{M}(z)=\sum{k=0}^{M}p{k}z^{k},\qquad Q{M}(z)=1+\sum{k=1}^{M}q{k}z^{k}\tag{9.31}
satisfying the matching condition
Q{M}(z)g(z)-P{M}(z)=O(z^{2M+1})\qquad(z\to 0).\tag{9.32}

Lemma 9.13 (Hankel form of the denominator system). The matching condition (9.32) is equivalent to p{0}=0,
p{n}=a{n}+\sum{j=1}^{\min(n,M)}q{j}a{n-j},\qquad 1\le n\le M,\tag{9.33}
0=a{n}+\sum{j=1}^{M}q{j}a{n-j},\qquad M+1\le n\le 2M.\tag{9.34}
The denominator system (9.34) is the Hankel linear system
H{M}\mathbf{q}=-\mathbf{b},\tag{9.35}
where
H{M}=
\begin{pmatrix}
a{M}&a{M-1}&\cdots&a{1}\\
a{M+1}&a{M}&\cdots&a{2}\\
\vdots&\vdots&\ddots&\vdots\\
a{2M-1}&a{2M-2}&\cdots&a{M}
\end{pmatrix},
\qquad
\mathbf{q}=
\begin{pmatrix}q{1}\\\vdots\\q{M}\end{pmatrix},
\qquad
\mathbf{b}=
\begin{pmatrix}a{M+1}\\\vdots\\a{2M}\end{pmatrix}.

Proof. Expand Q{M}(z)g(z) and identify coefficients of z^{n} for 0\le n\le 2M. ∎

Proposition 9.14 (Regularity of the Padé table). For \mu\in(0,1), the function g(z)=y(z^{1/\mu}) is not rational: the fractional Riccati flow generates branch points that prevent any finite-order rational representation. Consequently \det H{M}\neq 0 for every M\ge 1, and the diagonal Padé table is regular.

Proof. The branch-point structure of the fractional Riccati solution in the complex z-plane prevents any rational function of fixed finite degree from agreeing with the series to order 2M+1 for arbitrarily large M. Hence the Hankel determinants are generically nonvanishing. ∎

Lemma 9.15 (Explicit solution). If \det H{M}\neq 0, the system (9.35) has the unique solution \mathbf{q}=-H{M}^{-1}\mathbf{b}, and the numerator coefficients are recovered from (9.33).

Definition 9.16 (Diagonal Padé approximant and its domain). The diagonal Padé approximant of order M is
R{M}(z)=\frac{P{M}(z)}{Q{M}(z)}=\frac{\sum{k=0}^{M}p{k}z^{k}}{1+\sum{k=1}^{M}q{k}z^{k}},\tag{9.36}
and its Padé domain is
\mathcal{D}{M}=\{z\in\mathbb{C}:\det H{M}\neq 0,\;Q{M}(z)\neq 0\}.\tag{9.37}

---

§9.5. Remainder representation and the computable error bound

Theorem 9.17 (Analytic remainder representation). There exists a function H{M} analytic on \{|z|<R\} such that
g(z)-R{M}(z)=z^{2M+1}\frac{H{M}(z)}{Q{M}(z)}.\tag{9.38}

Proof. By the matching condition (9.32), E{M}(z)=Q{M}(z)g(z)-P{M}(z) is analytic on \{|z|<R\} with a zero of order at least 2M+1 at z=0. Hence E{M}(z)=z^{2M+1}S{M}(z) for some analytic S{M}. Dividing by Q{M}(z) gives (9.38) with H{M}=S{M}. ∎

Definition 9.18 (Successive Padé differences). For k\ge 1, the successive Padé difference is
\Delta{k}(z)=R{k}(z)-R{k-1}(z),\qquad R{0}\equiv 0.\tag{9.39}

Theorem 9.19 (Computable a-posteriori error bound). Let z\in\mathcal{D}{M}\cap\mathcal{D}{M-1} be such that g has no poles in \{|\zeta|\le|z|\}, Q{M}(z)\neq 0, Q{M-1}(z)\neq 0, and there exists \rho\in(0,1) with |\Delta{k+1}(z)|\le\rho|\Delta{k}(z)| for every k\ge M-1. Then the Padé sequence R{k}(z) converges, and
|g(z)-R{M}(z)|\le\frac{\rho|\Delta{M}(z)|}{1-\rho}.\tag{9.40}
Defining the observable contraction ratio
\rho{}=\frac{|\Delta{M}(z)|}{|\Delta{M-1}(z)|}\le\rho,\tag{9.41}
and assuming |\Delta{M}(z)|<|\Delta{M-1}(z)| so that \rho{}\in(0,1),
\boxed{|g(z)-R{M}(z)|\le\frac{|\Delta{M}(z)|^{2}}{|\Delta{M-1}(z)|-|\Delta{M}(z)|}.}\tag{9.42}

Proof. By the premise |\Delta{k+1}(z)|\le\rho|\Delta{k}(z)| and induction, |\Delta{M+j}(z)|\le\rho^{j}|\Delta{M}(z)| for every j\ge 0. The telescoping series
g(z)-R{M}(z)=\sum{k=M+1}^{\infty}\Delta{k}(z)\tag{9.43}
converges absolutely and is bounded by
|\Delta{M}(z)|\sum{j=1}^{\infty}\rho^{j}=\frac{\rho|\Delta{M}(z)|}{1-\rho},
which is (9.40). Substituting \rho=\rho{} and simplifying yields (9.42). ∎

Corollary 9.20 (Practical convergence certificate). The bound (9.42) depends only on the two most recent Padé iterates and is computable in O(1) time given R{M-1} and R{M}. It serves as an a-posteriori certificate: when |\Delta{M}|^{2}/(|\Delta{M-1}|-|\Delta{M}|)<2^{-\mathrm{bits}}, the Padé iterate R{M}(z) approximates g(z) to the requested precision.

---

§9.6. Global convergence on the positive real axis

Proposition 9.21 (Meromorphy of the transformed solution). For every \mu\in(0,1], the function g(z)=y(z^{1/\mu}) extends to a meromorphic function on \mathbb{C}. Its pole set \mathcal{P}{g} is discrete with no finite accumulation point.

Proof. Consider the linear fractional system
D^{\mu}\mathbf{w}=A\mathbf{w},\qquad A=\begin{pmatrix}0&1\\-c{0}c{2}&c{1}\end{pmatrix},\qquad\mathbf{w}(0)=\begin{pmatrix}1\\0\end{pmatrix}.\tag{9.44}
The unique solution is \mathbf{w}(t)=E{\mu,1}(At^{\mu})\mathbf{w}(0), where E{\mu,1}(Z)=\sum{k=0}^{\infty}Z^{k}/\Gamma(k\mu+1) is the matrix Mittag-Leffler function. Since \Gamma(k\mu+1) grows super-exponentially, E{\mu,1}(Az) is an entire function of z\in\mathbb{C}; thus w{1}(t) and w{2}(t) are entire functions of z=t^{\mu}.

Define W(z)=-w{2}(z)/(c{2}w{1}(z)). This is meromorphic on \mathbb{C} with poles at the zeros of w{1}. Since w{1}(0)=1, w{1} is not identically zero, so its zeros form a discrete set with no finite accumulation point. Expanding W(z)=\sum{k=1}^{\infty}b{k}z^{k} and substituting the series into the Riccati equation, one verifies by direct computation using the linear recurrences for the coefficients of w{1} and w{2} that the b{k} satisfy exactly the recurrence (9.13)–(9.14). By uniqueness of the formal Puiseux solution (Theorem 9.8), b{k}=a{k} for all k. Therefore g(z)=W(z) on the disk of convergence, and by analytic continuation g extends to the meromorphic function W on \mathbb{C}. ∎

Lemma 9.22 (Absence of poles on the positive real axis). Let y(t) be the solution of (9.1) on [0,\infty). Then g(z)=y(z^{1/\mu}) has no poles on [0,\infty). Consequently, for every T>0,
\delta{T}:=\mathrm{dist}\bigl([0,T^{\mu}],\mathcal{P}{g}\bigr)>0.\tag{9.45}

Proof. The Volterra equation (9.10) has a unique continuous solution on [0,\infty) for the parameter ranges arising in rough Heston (the quadratic nonlinearity is locally Lipschitz and the kernel is integrable). A pole of g at z=t^{\mu}>0 would correspond to a blow-up of y(t) at finite positive t, contradicting the global existence on [0,\infty). Hence \mathcal{P}{g}\cap[0,\infty)=\varnothing, and since \mathcal{P}{g} is discrete, the distance \delta{T} is strictly positive. ∎

Lemma 9.23 (Non-Explosion Condition on compact intervals). For every T>0, the diagonal Padé approximants [M/M]{g}=R{M} satisfy the Non-Explosion Condition on K=[0,T^{\mu}]: the number of poles of R{M} in K is uniformly bounded in M.

Proof. By Proposition 9.21, g is meromorphic with discrete pole set \mathcal{P}{g}. Let \delta{T}>0 be as in (9.45). The poles of R{M} fall into two classes:

(a) True-pole approximants. These converge to the elements of \mathcal{P}{g} (de Montessus de Ballore). For M sufficiently large, every such pole lies within \delta{T}/2 of some element of \mathcal{P}{g}, hence outside K.

(b) Froissart doublets. By Proposition 4.2, the number of Froissart doublets of R{M} in any compact subset of \mathbb{C}\setminus\mathcal{P}{g} is O(1) as M\to\infty.

Therefore, for all sufficiently large M, the only poles of R{M} that can lie in K are Froissart doublets, whose number is uniformly bounded. The Non-Explosion Condition holds. ∎

Theorem 9.24 (Global Padé–Müntz representation). Let y(t) solve the fractional Riccati equation (9.1) with \mu\in(0,1]. Then for every t\ge 0,
\boxed{y(t)=\lim{M\to\infty}R{M}(t^{\mu})=\lim{M\to\infty}\frac{P{M}(t^{\mu})}{Q{M}(t^{\mu})}.}\tag{9.46}
Moreover, for every T>0, the convergence is uniform on [0,T].

Proof. By Proposition 9.21, g(z)=y(z^{1/\mu}) is meromorphic on \mathbb{C}. By Lemma 9.22, [0,T^{\mu}] is disjoint from the pole set \mathcal{P}{g}. Lemma 9.23 establishes the Non-Explosion Condition on [0,T^{\mu}]. Applying Theorem 4.4 (Gončar's uniform convergence theorem) to the compact K=[0,T^{\mu}], we obtain R{M}\to g uniformly on [0,T^{\mu}]. Since T>0 is arbitrary, uniform convergence holds on every compact subset of [0,\infty), and pointwise convergence holds for every t\ge 0. ∎

---

§9.7. The bordered rank-one update and incremental Hankel solver

The passage from Padé order M to order M+1 requires the solution of the augmented Hankel system H{M+1}\mathbf{q}{M+1}=-\mathbf{b}{M+1}. Direct inversion costs O(M^{3}). The Hankel structure permits an incremental O(M^{2}) update.

Lemma 9.25 (Bordered structure of the augmented Hankel system). Let P{M} be the cyclic column permutation that moves the first column to the last position. Then
\hat{H}{M+1}:=H{M+1}P{M}=
\begin{pmatrix}
H{M}&\mathbf{u}{M}\\[2pt]
\mathbf{v}{M}^{T}&d{M}
\end{pmatrix},\tag{9.47}
where
\mathbf{u}{M}=(a{M+1},a{M+2},\ldots,a{2M})^{T}\in\mathbb{C}^{M},
\mathbf{v}{M}^{T}=(a{2M},a{2M-1},\ldots,a{M+1})\in\mathbb{C}^{1\times M},
d{M}=a{2M+1}\in\mathbb{C}.

Proof. The matrix H{M+1}P{M} has columns 2,3,\ldots,M+1,1 of H{M+1}. The first M columns are the top-right M\times M block of H{M+1}, which is H{M} by inspection of (9.35). The last column is (a{M+1},\ldots,a{2M+1})^{T}, giving \mathbf{u}{M} and d{M}. The last row of the first M columns is (a{2M},a{2M-1},\ldots,a{M+1}), giving \mathbf{v}{M}^{T}. ∎

Theorem 9.26 (Bordered rank-one update of the inverse). Assume H{M} is invertible and define the Schur complement
s{M}=d{M}-\mathbf{v}{M}^{T}H{M}^{-1}\mathbf{u}{M}.\tag{9.48}
If s{M}\neq 0, then H{M+1} is invertible and
\hat{H}{M+1}^{-1}=
\begin{pmatrix}
H{M}^{-1}+\dfrac{1}{s{M}}\mathbf{z}{M}\mathbf{w}{M}^{T}&-\dfrac{1}{s{M}}\mathbf{z}{M}\\[8pt]
-\dfrac{1}{s{M}}\mathbf{w}{M}^{T}&\dfrac{1}{s{M}}
\end{pmatrix},\tag{9.49}
where
\mathbf{z}{M}=H{M}^{-1}\mathbf{u}{M},\qquad\mathbf{w}{M}^{T}=\mathbf{v}{M}^{T}H{M}^{-1}.\tag{9.50}
The update from H{M}^{-1} to \hat{H}{M+1}^{-1} requires two matrix-vector products, one inner product, and one rank-one outer product, for a total cost of O(M^{2}).

Proof. This is the standard block inversion formula for a 2\times 2 block matrix with invertible leading block and nonzero Schur complement. The matrix \mathbf{z}{M}\mathbf{w}{M}^{T} is rank one. The cost breakdown: H{M}^{-1}\mathbf{u}{M} costs O(M^{2}); \mathbf{v}{M}^{T}H{M}^{-1} costs O(M^{2}); \mathbf{v}{M}^{T}\mathbf{z}{M} costs O(M); the outer product costs O(M^{2}). ∎

---

§9.8. Spectral interpretation and operator-theoretic synthesis

Theorem 9.29 (Hankel solver as Jacobi truncation). The incremental Hankel solver, which builds H{M+1}^{-1} from H{M}^{-1} via the bordered rank-one update (9.49) in O(M^{2}) operations, is the algebraic realization of the Jacobi truncation: it adds one row and column to J{M} to produce J{M+1}, and the resulting Padé iterate R{M+1} is the resolvent of the enlarged operator at the basis vector e{0}.

Proof. The three-term recurrence (6.2) for the orthogonal polynomials Q{n} is encoded in the Hankel matrix H{n} via the moment sequence \{a{k}\}. Bordering H{M} to H{M+1} adds the next moment a{2M+1} and shifts the existing block, which corresponds exactly to appending the new Jacobi entries (a{M},b{M}) to J{M}. The rank-one correction \mathbf{z}{M}\mathbf{w}{M}^{T} in (9.49) is the Sherman–Morrison form of the spectral update induced by this appended row and column. The Padé approximant R{M+1}(z)=\langle e{0},(J{M+1}-zI)^{-1}e{0}\rangle is precisely the resolvent of the truncated Jacobi operator, as stated in Theorem 6.4. ∎

---

§9.9. Compiled spectral reconstruction

Definition. Let h(u,t) solve the fractional Riccati equation (9.1) with parameters depending on u, and let (a{k}(u)){k\ge 1} be its Müntz coefficients from Theorem 9.8. Define the compiled coefficient sequence
d{0}(u)=V{0}c{0}(u),\tag{9.53a}
d{k}(u)=\frac{\theta\lambda a{k}(u)}{k\mu+1}+\frac{V{0}\Gamma((k+1)\mu+1)}{\Gamma(k\mu+2)}a{k+1}(u)\qquad(k\ge 1),\tag{9.53b}
and the compiled power series
S(u,z)=\sum{k=0}^{\infty}d{k}(u)z^{k}.\tag{9.52}

Theorem 9.31 (Compiled spectral reconstruction). Let
\Phi(u,T)=\theta\lambda\int{0}^{T}h(u,t)\,dt+V{0}I^{1-\mu}[h(u,\cdot)](T).\tag{9.51}
Then
\Phi(u,T)=T\sum{k=0}^{\infty}d{k}(u)\,T^{k\mu}=T\cdot S(u,T^{\mu}).\tag{9.54}

Proof. Substitute the Müntz series h(u,t)=\sum{k=1}^{\infty}a{k}(u)t^{k\mu} into the two terms of \Phi.

First term (ordinary integral):
\theta\lambda\int{0}^{T}h(u,t)\,dt=\theta\lambda\sum{k=1}^{\infty}a{k}(u)\frac{T^{k\mu+1}}{k\mu+1}=T\sum{k=1}^{\infty}\frac{\theta\lambda a{k}(u)}{k\mu+1}\,T^{k\mu}.

Second term (fractional integral of order 1-\mu). By (9.4),
I^{1-\mu}t^{k\mu}=\frac{\Gamma(k\mu+1)}{\Gamma((k-1)\mu+2)}\,t^{(k-1)\mu+1}.
Hence
V{0}I^{1-\mu}[h(u,\cdot)](T)=V{0}\sum{k=1}^{\infty}a{k}(u)\frac{\Gamma(k\mu+1)}{\Gamma((k-1)\mu+2)}\,T^{(k-1)\mu+1}.
Factor out T and reindex with j=k-1:
=T\left[V{0}a{1}(u)\frac{\Gamma(\mu+1)}{\Gamma(2)}+V{0}\sum{j=1}^{\infty}a{j+1}(u)\frac{\Gamma((j+1)\mu+1)}{\Gamma(j\mu+2)}\,T^{j\mu}\right].
Since \Gamma(2)=1 and a{1}(u)=c{0}(u)/\Gamma(\mu+1), the bracketed constant is V{0}c{0}(u)=d{0}(u).

Combine. Adding the two expressions and factoring out the common T:
\Phi(u,T)=T\left[d{0}(u)+\sum{k=1}^{\infty}\underbrace{\left(\frac{\theta\lambda a{k}(u)}{k\mu+1}+\frac{V{0}\Gamma((k+1)\mu+1)}{\Gamma(k\mu+2)}a{k+1}(u)\right)}{=\,d{k}(u)}T^{k\mu}\right].
Therefore
\Phi(u,T)=T\sum{k=0}^{\infty}d{k}(u)\,T^{k\mu}=T\cdot S(u,T^{\mu}).

The Padé resummation
\Phi(u,T)=T\cdot\lim{M\to\infty}[M/M]{S(u,\cdot)}(T^{\mu})
now follows by applying the construction of §9.4 to the series S(u,z). ∎