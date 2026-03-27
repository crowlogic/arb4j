<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# verify all of the mathematics here \\\\documentclass[11pt]{article}

\\\\usepackage{amsmath,amssymb,amsthm,mathtools}\\\\usepackage{mathrsfs}\\\\usepackage[T1]{fontenc}\\\\usepackage{lmodern}\\\\usepackage{microtype}\\\\usepackage{hyperref}\\\\usepackage{enumitem}undefinedundefinedundefinedundefinedundefinedundefinedundefined

\\\\hypersetup{
colorlinks=true,
linkcolor=blue,
citecolor=blue,
urlcolor=blue
}

\\\\numberwithin{equation}{section}

\\\\\\\\\\\\\\\

\\\\\\\\\

\\\\DeclareMathOperator{\\\\Ree}{Re}
\\\\DeclareMathOperator{\\\\Imm}{Im}
\\\\DeclareMathOperator{\\\\Arg}{Arg}

\\\\title{A Stationary Gaussian Process Associated with the Critical-Line Zeta Function}
\\\
\\\\date{}

\\\\\\\begin{document}

\\\\maketitle


#### Abstract

A stationary model is constructed directly from the critical-line zeta function by composing \\$$
t \\\\longmapsto \\\\zeta\\\\!\\\\left(\\\\frac12+it\\\\right) \\
$$ with the inverse of the Riemann--Siegel theta function on the half-line \\$(T_0,\\\\infty)\\$, where \\$T_0\\$ is any constant satisfying \\$\\\\vartheta'(t)>0\\$ for all \\$t\\\\ge T_0\\$. The existence of such \\$T_0\\$ is established from the Stirling expansion of \\$\\\\vartheta'\\$. The restriction \\$\\\\vartheta\\\\restriction_{[T_0,\\\\infty)}\\$ is a strictly increasing real-analytic bijection onto \\$(\\\\tau_0,\\\\infty)\\$ with \\$\\\\tau_0=\\\\vartheta(T_0)\\$, and its inverse \\$$
\\\\vartheta^{-1}:(\\\\tau_0,\\\\infty)\\\\to(T_0,\\\\infty) \\
$$ is globally and uniquely defined on that domain. All subsequent objects are defined on \\$(\\\\tau_0,\\\\infty)\\$. The resulting stationary function is \\$$
\\\\zeta_{\\\\mathrm{st}}(\\\\tau) = \\\\frac{\\\\zeta\\\\!\\\\left(\\\\frac12+i\\\\,\\\\vartheta^{-1}(\\\\tau)\\\\right)} {\\\\sqrt{2\\\\,\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))}}, \\\\qquad \\\\tau>\\\\tau_0. \\
$$ The factor \\$\\\\sqrt{2\\\\,\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))}\\$ is forced by two simultaneous requirements: the composition with \\$\\\\vartheta^{-1}\\$ converts the varying zero density on the \\$t\\$-axis into a constant zero-crossing rate \\$1/\\\\pi\\$ on the \\$\\\\tau\\$-axis, and the Jacobian factor produces the unitary time change that preserves the Hilbert-space structure under the substitution \\$\\\\tau=\\\\vartheta(t)\\$; the factor \\$2\\$ is then fixed by the asymptotic mean square of \\$\\\\zeta(\\\\tfrac12+it)\\$.

The paper establishes the following: \\$T_0\\$ exists and is finite; \\$\\\\vartheta^{-1}\\$ is real-analytic on \\$(\\\\tau_0,\\\\infty)\\$ and given there by the Lagrange series \\$$
\\\\vartheta^{-1}(\\\\tau)=t_0+\\\\sum_{k=1}^\\\\infty\\\\frac{c_k}{k!}(\\\\tau-\\\\tau_0)^k, \\\\quad c_k=\\\\left.\\\\frac{d^{k-1}}{dt^{k-1}}\\\\left[\\\\frac{1}{\\\\vartheta'(t)}\\\\right]^k\\\\right|_{t=t_0}, \\
$$ convergent on any interval \\$(\\\\tau_0,\\\\vartheta(t_0+\\\\varepsilon))\\$ with \\$\\\\varepsilon<\\\\inf_{t\\\\ge T_0}1/|\\\\vartheta''(t)/\\\\vartheta'(t)^2|\\$; the Ces\\\\`aro mean square of \\$\\\\zeta_{\\\\mathrm{st}}\\$ over \\$(\\\\tau_0,T)\\$ tends to \\$1\\$ as \\$T\\\\to\\\\infty\\$; the asymptotic zero-crossing rate is \\$1/\\\\pi\\$; and the empirical covariance is \\$$
R(\\\\Delta)=e^{-i\\\\Delta}\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}, \\\\quad R(0)=1, \\
$$ with spectral density \\$\\\\widehat{R}(\\\\omega)=\\\\pi\\\\,\\\\mathbf{1}_{[-2,0]}(\\\\omega)\\$. By Bochner's theorem the covariance kernel is positive definite, and by the Kolmogorov existence theorem there is a centered stationary Gaussian process with this covariance. The stationary zeta function is identified, at the level of its empirical second-order statistics, with a sample path of that process.\\\


\\\\tableofcontents

\\\\section{Introduction}

The purpose of this paper is to construct a stationary object from the critical-line
zeta function \\$\\\\zeta(\\\\tfrac12+it)\\$ by reparametrizing time via the Riemann--Siegel
theta function and inserting the Jacobian normalization that makes the time change
unitary on the Hilbert-space level.

The zero-counting law

\\$$
N(T)=\\\\frac{\\\\vartheta(T)}{\\\\pi}+1+S(T),\\\\quad S(T)=O(\\\\log T),
\\
$$

shows that \\$\\\\vartheta(T)/\\\\pi\\$ is the dominant term in the cumulative zero count.
Consequently \\$\\\\tau=\\\\vartheta(t)\\$ is the natural time variable that uniformizes
the zero density. To implement this reparametrization one needs the inverse function
\\$\\\\vartheta^{-1}\\$. The Riemann--Siegel theta function is not monotone on all of
\\$(0,\\\\infty)\\$: it decreases on a compact initial segment before increasing without
bound. The correct domain for an invertible branch is \\$[T_0,\\\\infty)\\$, where \\$T_0\\$
is any fixed constant beyond which \\$\\\\vartheta'>0\\$. The main analysis---Cesàro
means and covariance limits---is insensitive to this truncation because the shifted
lower limit contributes \\$O(1)\\$ to quantities that diverge as \\$T\\\\to\\\\infty\\$.

The main result is the exact covariance formula \\$R(\\\\Delta)=e^{-i\\\\Delta}\\\\sin\\\\Delta/\\\\Delta\\$,
obtained by a direct calculation using the Hardy \\$Z\\$-function and the Riemann--Siegel
expansion, together with the identification of the associated spectral density
\\$\\\\widehat{R}(\\\\omega)=\\\\pi\\\\,\\\\mathbf{1}_{[-2,0]}(\\\\omega)\\$ and the resulting stationary
Gaussian process.

\\\\section{The Riemann--Siegel theta function}

\\\**Definition 0.1. (Riemann--Siegel theta function)** For \\$t>0\\$, define

\\\$$
\begin{equation}
\\\\vartheta(t)
=
\\\\Imm\\\\log\\\\Gamma\\\\!\\\\left(\\\\frac14+\\\\frac{it}{2}\\\\right)
-\\\\frac{t}{2}\\\\log\\\\pi.
\\\\label{eq:theta-def}
\\\\end{equation}
$$\\\


\\\**Lemma 0.2. (Derivative formulas)** \\\For \\$t>0\\$,

\\\$$
\begin{equation}
\\\\vartheta'(t)
=
\\\\frac12
\\\\Ree\\\\,\\\\psi\\\\!\\\\left(\\\\frac14+\\\\frac{it}{2}\\\\right)
-\\\\frac12\\\\log\\\\pi,
\\\\label{eq:theta-prime}
\\\\end{equation}
$$

and for every integer \\$n\\\\ge2\\$,

\\\$$
\begin{equation}
\\\\vartheta^{(n)}(t)
=
\\\\frac{1}{2^n}
\\\\Ree\\\\!\\\\left(
i^{\\\\,n-1}\\\\psi^{(n-1)}\\\\!\\\\left(\\\\frac14+\\\\frac{it}{2}\\\\right)
\\\\right),
\\\\label{eq:theta-higher}
\\\\end{equation}
$$

where \\$\\\\psi^{(k)}=d^{k+1}\\\\log\\\\Gamma/dz^{k+1}\\$ are the polygamma functions.\\\


\\\*Proof.* Set \\$z(t)=\\\\frac14+\\\\frac{it}{2}\\$. Then

\\$$
\\\\frac{d}{dt}\\\\log\\\\Gamma(z(t))=\\\\psi(z(t))\\\\,\\\\frac{i}{2},
\\
$$

so

\\$$
\\\\vartheta'(t)=\\\\Imm\\\\!\\\\left(\\\\frac{i}{2}\\\\psi(z)\\\\right)-\\\\frac12\\\\log\\\\pi.
\\
$$

For any complex \\$w=a+ib\\$, \\$\\\\Imm(iw)=\\\\Ree(w)\\$, hence
\\$\\\\vartheta'(t)=\\\\frac12\\\\Ree\\\\,\\\\psi(z)-\\\\frac12\\\\log\\\\pi\\$,
which is \\\[eq:theta-prime](#eq:theta-prime). For \\$n\\\\ge2\\$,

\\$$
\\\\frac{d^n}{dt^n}\\\\log\\\\Gamma(z(t))
=\\\\psi^{(n-1)}(z(t))\\\\left(\\\\frac{i}{2}\\\\right)^n.
\\
$$

Taking imaginary parts and using \\$\\\\Imm(i^n w)=\\\\Ree(i^{n-1}w)\\$ yields
\\\[eq:theta-higher](#eq:theta-higher).\\\ $\square$


\\\**Lemma 0.3. (Stirling asymptotics)** \\\As \\$t\\\\to+\\\\infty\\$,

\\\$$
\begin{equation}
\\\\vartheta(t)
=
\\\\frac{t}{2}\\\\log\\\\frac{t}{2\\\\pi e}
-\\\\frac{\\\\pi}{8}
+O(t^{-1}),
\\\\label{eq:theta-stirling}
\\\\end{equation}
$$

\\\$$
\begin{equation}
\\\\vartheta'(t)
=
\\\\frac12\\\\log\\\\frac{t}{2\\\\pi}
+O(t^{-2}).
\\\\label{eq:theta-prime-stirling}
\\\\end{equation}
$$\\\


\\\*Proof.* Apply Stirling's formula

\\$$
\\\\log\\\\Gamma(z)=\\\\left(z-\\\\tfrac12\\\\right)\\\\log z-z+\\\\tfrac12\\\\log(2\\\\pi)+O(z^{-1})
\\
$$

to \\$z=\\\\frac14+\\\\frac{it}{2}\\$. One computes

\\$$
\\\\log z=\\\\log\\\\tfrac{t}{2}+i\\\\tfrac{\\\\pi}{2}+O(t^{-1}),
\\\\quad
z-\\\\tfrac12=-\\\\tfrac14+\\\\tfrac{it}{2}.
\\
$$

Taking the imaginary part of \\$(z-\\\\tfrac12)\\\\log z-z\\$ and subtracting
\\$\\\\frac{t}{2}\\\\log\\\\pi\\$ gives \\\[eq:theta-stirling](#eq:theta-stirling). Differentiating the asymptotic
in \\$t\\$ gives \\\[eq:theta-prime-stirling](#eq:theta-prime-stirling).\\\ $\square$


\\\**Proposition 0.4. (Existence of \\$T_0\\$)** \\\There exists a finite constant \\$T_0>0\\$ such that \\$\\\\vartheta'(t)>0\\$ for all
\\$t\\\\ge T_0\\$. One may take \\$T_0\\$ to be the largest zero of \\$\\\\vartheta'\\$, which
is finite.\\\


\\\*Proof.* From \\\[eq:theta-prime-stirling](#eq:theta-prime-stirling), \\$\\\\vartheta'(t)\\\\sim\\\\frac12\\\\log\\\\frac{t}{2\\\\pi}\\\\to+\\\\infty\\$
as \\$t\\\\to+\\\\infty\\$. In particular \\$\\\\vartheta'(t)>0\\$ for all sufficiently large \\$t\\$.
The function \\$\\\\vartheta'\\$ is continuous, so its zero set is closed. Let

\\$$
T_0=\\\\sup\\\\{t>0:\\\\vartheta'(t)\\\\le0\\\\}.
\\
$$

If \\$\\\\vartheta'(t)>0\\$ for all large \\$t\\$, then the set \\$\\\\{\\\\vartheta'\\\\le0\\\\}\\$ is
bounded above, so \\$T_0<\\\\infty\\$. By continuity, \\$\\\\vartheta'(T_0)=0\\$ and
\\$\\\\vartheta'(t)>0\\$ for all \\$t>T_0\\$.\\\ $\square$


\\\**Remark 0.5.** The constant \\$T_0\\$ is determined by \\$\\\\vartheta\\$ alone. Its exact numerical value
does not affect any of the asymptotic results below. The paper leaves \\$T_0\\$ as the
(finite, determined) largest zero of \\$\\\\vartheta'\\$.\\\


\\\**Corollary 0.6. (Global branch of \\$\\\\vartheta^{-1}\\$)** \\\Let \\$T_0\\$ be as in Proposition~\\\[0.4](#prop:T0), and set \\$\\\\tau_0=\\\\vartheta(T_0)\\$. The
restriction

\\$$
\\\\vartheta\\\\restriction_{[T_0,\\\\infty)}:[T_0,\\\\infty)\\\\to[\\\\tau_0,\\\\infty)
\\
$$

is a strictly increasing real-analytic bijection. Its inverse

\\\$$
\begin{equation}
\\\\vartheta^{-1}:[\\\\tau_0,\\\\infty)\\\\to[T_0,\\\\infty)
\\\\label{eq:branch}
\\\\end{equation}
$$

is globally and uniquely defined on \\$[\\\\tau_0,\\\\infty)\\$, is real-analytic, and is
strictly increasing. This is the unique branch of \\$\\\\vartheta^{-1}\\$ used throughout
the paper.\\\


\\\*Proof.* On \\$[T_0,\\\\infty)\\$, \\$\\\\vartheta'(t)>0\\$, so \\$\\\\vartheta\\$ is strictly increasing and
hence injective. It is continuous and \\$\\\\vartheta(t)\\\\to+\\\\infty\\$ as \\$t\\\\to+\\\\infty\\$
by \\\[eq:theta-stirling](#eq:theta-stirling), so the image is \\$[\\\\tau_0,\\\\infty)\\$. The real-analytic
inverse function theorem yields a real-analytic inverse, which is strictly increasing
because \\$\\\\vartheta^{-1}{}'(\\\\tau)=1/\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))>0\\$.\\\ $\square$


\\\**Lemma 0.7. (Lagrange inversion for \\$\\\\vartheta^{-1}\\$)** \\\Fix any \\$t_0\\\\ge T_0\\$ and set \\$\\\\tau_0'=\\\\vartheta(t_0)\\$. In a neighborhood of
\\$\\\\tau_0'\\$ within \\$[\\\\tau_0,\\\\infty)\\$, the branch \\\[eq:branch](#eq:branch) admits the
convergent series

\\\$$
\begin{equation}
\\\\vartheta^{-1}(\\\\tau)
=
t_0+\\\\sum_{k=1}^\\\\infty \\\\frac{c_k}{k!}(\\\\tau-\\\\tau_0')^k,
\\\\label{eq:lagrange-series}
\\\\end{equation}
$$

where

\\\$$
\begin{equation}
c_k
=
\\\\left.
\\\\frac{d^{k-1}}{dt^{k-1}}
\\\\left[\\\\frac{1}{\\\\vartheta'(t)}\\\\right]^k
\\\\right|_{t=t_0}.
\\\\label{eq:lagrange-coeff}
\\\\end{equation}
$$

Each \\$c_k\\$ is a polynomial in
\\$\\\\{\\\\vartheta^{(j)}(t_0):1\\\\le j\\\\le k\\\\}\\$, computable via the polygamma formulas
\\\[eq:theta-prime](#eq:theta-prime)--\\\[eq:theta-higher](#eq:theta-higher).\\\


\\\*Proof.* Setting \\$F(t)=\\\\vartheta(t)-\\\\tau_0'\\$, one has \\$F(t_0)=0\\$ and
\\$F'(t_0)=\\\\vartheta'(t_0)>0\\$. The classical Lagrange inversion theorem gives the
power series expansion of the local inverse of \\$F\\$ at \\$0\\$. Since
\\$\\\\vartheta^{-1}\\$ on \\$[\\\\tau_0,\\\\infty)\\$ is the unique analytic inverse of \\$\\\\vartheta\\$,
this series computes \\$\\\\vartheta^{-1}\\$ near \\$\\\\tau_0'\\$. The coefficients are given
by \\\[eq:lagrange-coeff](#eq:lagrange-coeff).\\\ $\square$


\\\\section{The stationary zeta function}

\\\**Definition 0.8. (Stationary zeta function)** \\\With \\$T_0\\$, \\$\\\\tau_0\\$, and \\$\\\\vartheta^{-1}\\$ as in Corollary~\\\[0.6](#cor:branch),
define for \\$\\\\tau>\\\\tau_0\\$:

\\\$$
\begin{equation}
\\\\zeta_{\\\\mathrm{st}}(\\\\tau)
=
\\\\frac{
\\\\zeta\\\\!\\\\left(\\\\frac12+i\\\\,\\\\vartheta^{-1}(\\\\tau)\\\\right)
}{
\\\\sqrt{2\\\\,\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))}
}.
\\\\label{eq:zeta-st}
\\\\end{equation}
$$\\\


\\\**Remark 0.9. (Unitary time change)** The denominator \\$\\\\sqrt{\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))}\\$ is the Jacobian factor of
the substitution \\$\\\\tau=\\\\vartheta(t)\\$. Specifically, for any measurable \\$f\\$,

\\$$
\\\\int_{\\\\tau_0}^\\\\infty
\\\\frac{|f(\\\\vartheta^{-1}(\\\\tau))|^2}{\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))}\\\\,d\\\\tau
=
\\\\int_{T_0}^\\\\infty |f(t)|^2\\\\,dt.
\\
$$

This makes the map \\$f\\\\mapsto f\\\\circ\\\\vartheta^{-1}/\\\\sqrt{\\\\vartheta'\\\\circ\\\\vartheta^{-1}}\\$
unitary between \\$L^2(T_0,\\\\infty)\\$ and \\$L^2(\\\\tau_0,\\\\infty)\\$. The factor \\$2\\$ in
\\\[eq:zeta-st](#eq:zeta-st) is fixed by the second-moment normalization in Theorem~\\\[0.11](#thm:second-moment).\\\


\\\**Proposition 0.10. (Zero-crossing rate)** \\\The asymptotic density of zeros of \\$\\\\zeta_{\\\\mathrm{st}}\\$ in the \\$\\\\tau\\$-variable
is \\$1/\\\\pi\\$: for any \\$T>\\\\tau_0\\$,

\\$$
\\\\frac{\\\\#\\\\{\\\\tau\\\\in(\\\\tau_0,T):\\\\zeta_{\\\\mathrm{st}}(\\\\tau)=0\\\\}}{T}
\\\\to
\\\\frac{1}{\\\\pi}
\\\\qquad(T\\\\to\\\\infty).
\\
$$\\\


\\\*Proof.* The zeros of \\$\\\\zeta_{\\\\mathrm{st}}(\\\\tau)\\$ are exactly the zeros of
\\$\\\\zeta(\\\\frac12+i\\\\vartheta^{-1}(\\\\tau))\\$, i.e., the points
\\$\\\\tau=\\\\vartheta(t_\\\\rho)\\$ for each zero \\$t_\\\\rho>T_0\\$ of \\$\\\\zeta(\\\\frac12+it)\\$.
The number of such zeros with \\$\\\\vartheta(t_\\\\rho)<T\\$, i.e., with \\$t_\\\\rho<\\\\vartheta^{-1}(T)\\$,
is \\$N(\\\\vartheta^{-1}(T))\\$. From the zero-counting law,

\\$$
N(\\\\vartheta^{-1}(T))
=
\\\\frac{\\\\vartheta(\\\\vartheta^{-1}(T))}{\\\\pi}+1+S(\\\\vartheta^{-1}(T))
=
\\\\frac{T}{\\\\pi}+1+O(\\\\log T).
\\
$$

Dividing by \\$T\\$ and letting \\$T\\\\to\\\\infty\\$ gives the rate \\$1/\\\\pi\\$.\\\ $\square$


\\\**Theorem 0.11. (Unit second Ces\\\\`aro moment)** \\\

\\\$$
\begin{equation}
\\\\lim_{T\\\\to\\\\infty}
\\\\frac{1}{T-\\\\tau_0}
\\\\int_{\\\\tau_0}^T
|\\\\zeta_{\\\\mathrm{st}}(\\\\tau)|^2\\\\,d\\\\tau
=
1.
\\\\label{eq:unit-second}
\\\\end{equation}
$$\\\


\\\*Proof.* Substitute \\$\\\\tau=\\\\vartheta(t)\\$, \\$d\\\\tau=\\\\vartheta'(t)\\\\,dt\\$. With \\$T=\\\\vartheta(S)\\$:
\\\$$
\begin{align}
\\\\frac{1}{T-\\\\tau_0}
\\\\int_{\\\\tau_0}^T |\\\\zeta_{\\\\mathrm{st}}(\\\\tau)|^2\\\\,d\\\\tau
&=
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\frac{|\\\\zeta(\\\\frac12+it)|^2}{2\\\\,\\\\vartheta'(t)}
\\\\,\\\\vartheta'(t)\\\\,dt
\\\\notag\\\\\\\\
&=
\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}
\\\\int_{T_0}^S
\\\\left|\\\\zeta\\\\!\\\\left(\\\\frac12+it\\\\right)\\\\right|^2dt.
\\\\label{eq:mean-square-sub}
\\\\end{align}
$$
The Hardy--Littlewood mean-square formula gives

\\\$$
\begin{equation}
\\\\int_0^S
\\\\left|\\\\zeta\\\\!\\\\left(\\\\frac12+it\\\\right)\\\\right|^2dt
\\\\sim S\\\\log S,
\\\\label{eq:HL}
\\\\end{equation}
$$

so the integral from \\$T_0\\$ to \\$S\\$ is also \\$\\\\sim S\\\\log S\\$ (the contribution of
the compact initial segment is \\$O(1)\\$). By \\\[eq:theta-stirling](#eq:theta-stirling),
\\$\\\\vartheta(S)\\\\sim \\\\frac{S}{2}\\\\log S\\$ and \\$\\\\tau_0\\$ is a fixed constant, so
\\$\\\\vartheta(S)-\\\\tau_0\\\\sim\\\\frac{S}{2}\\\\log S\\$. Therefore

\\$$
\\\\frac{S\\\\log S}{2\\\\cdot\\\\frac{S}{2}\\\\log S}=1.
\\
$$

This proves \\\[eq:unit-second](#eq:unit-second).\\\ $\square$


\\\**Theorem 0.12. (Uniqueness of the normalization)** Let \\$e:(\\\\tau_0,\\\\infty)\\\\to(0,\\\\infty)\\$ be a positive measurable function such that

\\$$
\\\\lim_{T\\\\to\\\\infty}
\\\\frac{1}{T-\\\\tau_0}
\\\\int_{\\\\tau_0}^T
\\\\frac{|\\\\zeta(\\\\frac12+i\\\\vartheta^{-1}(\\\\tau))|^2}{e(\\\\tau)^2}\\\\,d\\\\tau
=
1.
\\
$$

Then \\$e(\\\\tau)^2\\\\sim 2\\\\,\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))\\$ as \\$\\\\tau\\\\to\\\\infty\\$.\\\


\\\*Proof.* Under the substitution \\$\\\\tau=\\\\vartheta(t)\\$, the condition becomes

\\$$
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\frac{|\\\\zeta(\\\\frac12+it)|^2}{e(\\\\vartheta(t))^2}\\\\,\\\\vartheta'(t)\\\\,dt
\\\\to 1.
\\
$$

Write \\$g(t)=e(\\\\vartheta(t))^2/\\\\vartheta'(t)\\$. The condition is

\\$$
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\frac{|\\\\zeta(\\\\frac12+it)|^2}{g(t)}\\\\,dt
\\\\to 1.
\\
$$

By \\\[eq:HL](#eq:HL), \\$\\\\int_{T_0}^S|\\\\zeta(\\\\frac12+it)|^2\\\\,dt\\\\sim S\\\\log S\\$ and
\\$\\\\vartheta(S)-\\\\tau_0\\\\sim\\\\frac{S}{2}\\\\log S\\$, so the limit with \\$g\\\\equiv c\\$
(constant) equals \\$1/(2c)\\\\cdot 2=1/c\\$. Requiring this to be \\$1\\$ forces
\\$g(t)\\\\to 1\\$ in the Cesàro sense, and in particular any slowly varying \\$g\\$ must
satisfy \\$g(t)\\\\sim 1\\$, i.e., \\$e(\\\\vartheta(t))^2\\\\sim\\\\vartheta'(t)\\$. More generally,
if \\$g\\$ is eventually monotone or slowly varying, then the Cesàro condition and the
known asymptotic of the integrand force \\$g(t)\\\\to c\\$ with \\$c\\$ determined by the
limit. Inserting back and using \\\[eq:HL](#eq:HL) and \\\[eq:theta-stirling](#eq:theta-stirling) forces
\\$c=1\\$, giving \\$e(\\\\vartheta(t))^2\\\\sim\\\\vartheta'(t)\\$. Rewriting in the
\\$\\\\tau\\$-variable: \\$e(\\\\tau)^2\\\\sim\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))\\$. The factor
\\$2\\$ arises because the target limit is \\$1\\$ while
\\$S\\\\log S/(2(\\\\vartheta(S)-\\\\tau_0))\\\\to 1\\$, so \\$e(\\\\tau)^2\\\\sim 2\\\\,\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))\\$.\\\ $\square$


\\\\section{Hardy \\$Z\\$-function and the stationary form}

\\\**Definition 0.13. (Hardy \\$Z\\$-function)** For \\$t>0\\$, define

\\\$$
\begin{equation}
Z(t)=e^{i\\\\vartheta(t)}\\\\zeta\\\\!\\\\left(\\\\frac12+it\\\\right).
\\\\label{eq:Z-def}
\\\\end{equation}
$$\\\


\\\**Lemma 0.14.** \\$Z(t)\\$ is real-valued for all real \\$t>0\\$.\\\


\\\*Proof.* The functional equation of \\$\\\\zeta\\$ gives
\\$\\\\overline{\\\\zeta(\\\\frac12+it)}=e^{2i\\\\vartheta(t)}\\\\zeta(\\\\frac12+it)\\$.
Indeed, \\$\\\\overline{\\\\zeta(\\\\frac12+it)}=\\\\zeta(\\\\frac12-it)\\$ by the Schwarz
reflection principle, and the functional equation
\\$\\\\zeta(s)=\\\\chi(s)\\\\zeta(1-s)\\$ at \\$s=\\\\frac12+it\\$ gives
\\$\\\\zeta(\\\\frac12-it)=\\\\zeta(\\\\frac12+it)/\\\\chi(\\\\frac12+it)\\$ with
\\$\\\\chi(\\\\frac12+it)=e^{-2i\\\\vartheta(t)}\\$. Therefore

\\$$
\\\\overline{Z(t)}
=e^{-i\\\\vartheta(t)}\\\\overline{\\\\zeta(\\\\tfrac12+it)}
=e^{-i\\\\vartheta(t)}\\\\cdot e^{2i\\\\vartheta(t)}\\\\zeta(\\\\tfrac12+it)
=e^{i\\\\vartheta(t)}\\\\zeta(\\\\tfrac12+it)
=Z(t).
\\\\qedhere
\\
$$\\\ $\square$


From \\\[eq:Z-def](#eq:Z-def) one has \\$\\\\zeta(\\\\frac12+it)=e^{-i\\\\vartheta(t)}Z(t)\\$, so for
\\$\\\\tau>\\\\tau_0\\$, using \\$\\\\vartheta(\\\\vartheta^{-1}(\\\\tau))=\\\\tau\\$:

\\\$$
\begin{equation}
\\\\zeta_{\\\\mathrm{st}}(\\\\tau)
=
e^{-i\\\\tau}
\\\\frac{
Z(\\\\vartheta^{-1}(\\\\tau))
}{
\\\\sqrt{2\\\\,\\\\vartheta'(\\\\vartheta^{-1}(\\\\tau))}
}.
\\\\label{eq:zeta-st-via-Z}
\\\\end{equation}
$$

\\\\section{Autocovariance calculation}

\\\**Definition 0.15. (Empirical covariance)** For \\$\\\\Delta\\\\in\\\\mathbb{R}\\$, define

\\\$$
\begin{equation}
R(\\\\Delta)
=
\\\\lim_{T\\\\to\\\\infty}
\\\\frac{1}{T-\\\\tau_0}
\\\\int_{\\\\tau_0}^T
\\\\zeta_{\\\\mathrm{st}}(\\\\tau+\\\\Delta)\\\\,
\\\\overline{\\\\zeta_{\\\\mathrm{st}}(\\\\tau)}\\\\,d\\\\tau,
\\\\label{eq:R-def}
\\\\end{equation}
$$

provided the limit exists.\\\


\\\**Lemma 0.16. (Reduction to \\$ZZ\\$-average)** Let

\\\$$
\begin{equation}
s(t,\\\\Delta)=\\\\vartheta^{-1}(\\\\vartheta(t)+\\\\Delta),
\\\\quad t\\\\ge T_0,\\\\;\\\\vartheta(t)+\\\\Delta\\\\ge\\\\tau_0,
\\\\label{eq:s-def}
\\\\end{equation}
$$

where \\$\\\\vartheta^{-1}\\$ is the unique branch \\\[eq:branch](#eq:branch). Then

\\\$$
\begin{equation}
R(\\\\Delta)
=
e^{-i\\\\Delta}
\\\\lim_{S\\\\to\\\\infty}
\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}
\\\\int_{T_0}^S
Z(s(t,\\\\Delta))\\\\,Z(t)\\\\,dt.
\\\\label{eq:R-leading}
\\\\end{equation}
$$\\\


\\\*Proof.* Substitute \\$\\\\tau=\\\\vartheta(t)\\$ in \\\[eq:R-def](#eq:R-def). From \\\[eq:zeta-st-via-Z](#eq:zeta-st-via-Z),

\\$$
\\\\zeta_{\\\\mathrm{st}}(\\\\vartheta(t)+\\\\Delta)
=e^{-i(\\\\vartheta(t)+\\\\Delta)}
\\\\frac{Z(s(t,\\\\Delta))}{\\\\sqrt{2\\\\,\\\\vartheta'(s(t,\\\\Delta))}},
\\\\quad
\\\\overline{\\\\zeta_{\\\\mathrm{st}}(\\\\vartheta(t))}
=e^{i\\\\vartheta(t)}
\\\\frac{Z(t)}{\\\\sqrt{2\\\\,\\\\vartheta'(t)}}.
\\
$$

Their product is

\\$$
e^{-i\\\\Delta}
\\\\frac{Z(s(t,\\\\Delta))Z(t)}{2\\\\sqrt{\\\\vartheta'(s(t,\\\\Delta))\\\\vartheta'(t)}}.
\\
$$

From the Lagrange expansion of \\$s(t,\\\\Delta)\\$,

\\$$
s(t,\\\\Delta)=t+\\\\frac{\\\\Delta}{\\\\vartheta'(t)}+O\\\\!\\\\left(\\\\frac{\\\\Delta^2\\\\vartheta''(t)}{\\\\vartheta'(t)^3}\\\\right),
\\
$$

and from \\$\\\\vartheta'(t)\\\\sim\\\\frac12\\\\log\\\\frac{t}{2\\\\pi}\\$ and \\$\\\\vartheta''(t)=O(t^{-1})\\$,

\\$$
\\\\frac{\\\\vartheta'(s(t,\\\\Delta))}{\\\\vartheta'(t)}=1+O\\\\!\\\\left(\\\\frac{\\\\Delta}{t(\\\\log t)^2}\\\\right).
\\
$$

Hence

\\$$
\\\\frac{\\\\vartheta'(t)}{\\\\sqrt{\\\\vartheta'(s(t,\\\\Delta))\\\\vartheta'(t)}}
=1+O\\\\!\\\\left(\\\\frac{\\\\Delta}{t(\\\\log t)^2}\\\\right).
\\
$$

Using \\$Z(t)=O(t^{1/4})\\$ from the Riemann--Siegel formula, the error term contributes
after averaging at most \\$O((\\\\log S)^{-1})\\\\to0\\$. This yields \\\[eq:R-leading](#eq:R-leading).\\\ $\square$


\\\**Lemma 0.17. (Riemann--Siegel formula)** For \\$t\\\\ge T_0\\$,

\\\$$
\begin{equation}
Z(t)
=
2\\\\sum_{n\\\\le \\\\sqrt{t/(2\\\\pi)}}
\\\\frac{\\\\cos(\\\\vartheta(t)-t\\\\log n)}{\\\\sqrt{n}}
+O(t^{-1/4}).
\\\\label{eq:RS}
\\\\end{equation}
$$\\\


\\\*Proof.* The approximate functional equation gives

\\$$
\\\\zeta\\\\!\\\\left(\\\\tfrac12+it\\\\right)
=\\\\sum_{n\\\\le N}\\\\frac{1}{n^{1/2+it}}
+\\\\chi\\\\!\\\\left(\\\\tfrac12+it\\\\right)\\\\sum_{n\\\\le N}\\\\frac{1}{n^{1/2-it}}
+O(t^{-1/4}),
\\\\quad N=\\\\sqrt{t/(2\\\\pi)}.
\\
$$

Multiply by \\$e^{i\\\\vartheta(t)}\\$. The functional equation gives
\\$e^{i\\\\vartheta(t)}\\\\chi(\\\\frac12+it)=e^{-i\\\\vartheta(t)}\\$. Therefore the two Dirichlet
sums combine into the real cosine sum \\\[eq:RS](#eq:RS).\\\ $\square$


Write \\$M(t)=\\\\lfloor\\\\sqrt{t/(2\\\\pi)}\\\\rfloor\\$. Substituting \\\[eq:RS](#eq:RS) into
\\\[eq:R-leading](#eq:R-leading) with \\$s=s(t,\\\\Delta)\\$:

\\\$$
\begin{equation}
Z(s)Z(t)
=4\\\\sum_{m\\\\le M(s)}\\\\sum_{n\\\\le M(t)}
\\\\frac{\\\\cos(\\\\vartheta(s)-s\\\\log m)\\\\cos(\\\\vartheta(t)-t\\\\log n)}{\\\\sqrt{mn}}
+O(t^{-1/4}\\\\log t).
\\\\label{eq:ZZ}
\\\\end{equation}
$$

The remainder contributes \\$O(S^{-1/4})\\$ after dividing by \\$\\\\vartheta(S)\\$.

Using \\$\\\\vartheta(s)=\\\\vartheta(t)+\\\\Delta\\$ and the expansion of \\$s\\$,

\\$$
\\\\vartheta(s)-s\\\\log m
=(\\\\vartheta(t)-t\\\\log m)
+\\\\Delta\\\\!\\\\left(1-\\\\frac{\\\\log m}{\\\\vartheta'(t)}\\\\right)
+O\\\\!\\\\left(\\\\frac{\\\\Delta^2\\\\log m}{\\\\vartheta'(t)^2}\\\\right).
\\
$$

Write \\$A_n(t)=\\\\vartheta(t)-t\\\\log n\\$ and
\\$\\\\alpha_m(t)=\\\\Delta(1-\\\\log m/\\\\vartheta'(t))\\$.
The product-to-sum identity splits the double sum into a \\$(-)\\$-part with phase
\\$A_n(t)-A_m(t)+\\\\alpha_m(t)=t\\\\log(n/m)+\\\\alpha_m(t)\\$ and a \\$(+)\\$-part with phase
\\$2\\\\vartheta(t)-t\\\\log(mn)+\\\\alpha_m(t)\\$.

\\\**Lemma 0.18. (Oscillatory \\$(+)\\$-part vanishes)** \\$$
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\sum_{m,n\\\\le M(t)}
\\\\frac{\\\\cos(2\\\\vartheta(t)-t\\\\log(mn)+\\\\alpha_m(t))}{\\\\sqrt{mn}}
\\\\,dt
\\\\to 0.
\\
$$\\\


\\\*Proof.* For each fixed \\$(m,n)\\$, the derivative of the phase \\$2\\\\vartheta(t)-t\\\\log(mn)+\\\\alpha_m(t)\\$
with respect to \\$t\\$ is

\\$$
2\\\\vartheta'(t)-\\\\log(mn)+O\\\\!\\\\left(\\\\frac{1}{t(\\\\log t)^2}\\\\right).
\\
$$

For \\$m,n\\\\le M(t)\\\\sim\\\\sqrt{t/(2\\\\pi)}\\$, one has \\$\\\\log(mn)\\\\le 2\\\\log M(t)\\\\sim\\\\log(t/(2\\\\pi))\\$.
Write \\$\\\\varphi(t)=2\\\\vartheta(t)-t\\\\log(mn)+\\\\alpha_m(t)\\$. We consider two regimes.

\\\\emph{Case 1: \\$\\\\log(mn)\\\\le\\\\log(t/(2\\\\pi))-1\\$.} Then
\\$\\\\varphi'(t)\\\\ge\\\\frac12+O(t^{-1})\\$, and integration by parts bounds the integral
over \\$[T_0,S]\\$ by \\$O(1)\\$ for each such pair.

\\\\emph{Case 2: \\$\\\\log(mn)>\\\\log(t/(2\\\\pi))-1\\$.} Then the phase has a possible
stationary point near \\$t_*=2\\\\pi mn\\$. The second derivative satisfies
\\$\\\\varphi''(t)=2\\\\vartheta''(t)+O(t^{-1}(\\\\log t)^{-2})\\$, and
\\$\\\\vartheta''(t)=\\\\frac{1}{2t}+O(t^{-2})\\$, so \\$|\\\\varphi''(t)|\\\\ge c/t\\$ for
large \\$t\\$. By the van der Corput second-derivative estimate, the integral over
\\$[t_*-\\\\delta,t_*+\\\\delta]\\$ is \\$O(\\\\sqrt{t_*})=O(\\\\sqrt{mn})\\$. The integral away
from the stationary point is \\$O(1)\\$ by the first-derivative test. Thus the total
contribution per pair is \\$O(\\\\sqrt{mn})\\$, and after the factor \\$1/\\\\sqrt{mn}\\$,
each pair contributes \\$O(1)\\$.

In both cases, each pair \\$(m,n)\\$ contributes \\$O(1)\\$. The number of pairs with
\\$m,n\\\\le M(S)\\$ is \\$O(M(S)^2)=O(S)\\$. Dividing by
\\$\\\\vartheta(S)\\\\sim\\\\frac{S}{2}\\\\log S\\$ gives \\$O((\\\\log S)^{-1})\\\\to0\\$.\\\ $\square$


\\\**Lemma 0.19. (Off-diagonal \\$(-)\\$-part vanishes)** \\$$
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\sum_{\\\\substack{m,n\\\\le M(t)\\\\\\\\m\\\\neq n}}
\\\\frac{\\\\cos(t\\\\log(n/m)+\\\\alpha_m(t))}{\\\\sqrt{mn}}
\\\\,dt
\\\\to 0.
\\
$$\\\


\\\*Proof.* For \\$m\\\\neq n\\$ with \\$|n-m|=k\\\\ge1\\$, the phase \\$t\\\\log(n/m)+\\\\alpha_m(t)\\$ has derivative

\\$$
\\\\log(n/m)+O\\\\!\\\\left(\\\\frac{\\\\Delta}{t(\\\\log t)^2}\\\\right)
\\\\asymp \\\\frac{k}{m}
\\
$$

for \\$k\\\\le m\\$. Integration by parts bounds the integral for each pair by
\\$O(m/k)\\$. By symmetry we may assume \\$m\\\\le n\\$, so that \\$1/\\\\sqrt{mn}\\\\le 1/m\\$, giving

\\$$
\\\\frac{1}{\\\\sqrt{mn}}\\\\cdot O(m/k)\\\\le O(1/k).
\\
$$

Summing over all \\$m,n\\\\le M(S)\\$ with offset \\$k=|n-m|\\$:

\\$$
\\\\sum_{k=1}^{M(S)}\\\\frac{M(S)}{k}\\\\ll M(S)\\\\log M(S)\\\\asymp \\\\sqrt{S}\\\\cdot\\\\frac12\\\\log S.
\\
$$

Dividing by \\$\\\\vartheta(S)\\\\asymp S\\\\log S\\$ gives \\$O(S^{-1/2})\\\\to0\\$.\\\ $\square$


\\\**Lemma 0.20. (Diagonal contribution)** \\$$
\\\\lim_{S\\\\to\\\\infty}
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\sum_{n\\\\le M(t)}
\\\\frac{\\\\cos(\\\\alpha_n(t))}{n}
\\\\,dt
=
\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}.
\\
$$\\\


\\\*Proof.* On the diagonal \\$m=n\\$, the \\$(-)\\$-phase is \\$t\\\\log(n/n)+\\\\alpha_n(t)=\\\\alpha_n(t)\\$,
where

\\$$
\\\\alpha_n(t)=\\\\Delta\\\\!\\\\left(1-\\\\frac{\\\\log n}{\\\\vartheta'(t)}\\\\right).
\\
$$

Set \\$u_n(t)=\\\\log n/\\\\vartheta'(t)\\$. On the range \\$n\\\\le M(t)=\\\\sqrt{t/(2\\\\pi)}\\$, one
has \\$u_n(t)\\\\in[0,1+o(1)]\\$. By the Euler--Maclaurin formula,

\\$$
\\\\sum_{n\\\\le M(t)}\\\\frac{\\\\cos(\\\\Delta(1-u_n(t)))}{n}
=\\\\vartheta'(t)\\\\int_0^1\\\\cos(\\\\Delta(1-u))\\\\,du+o(\\\\vartheta'(t)).
\\
$$

Therefore

\\$$
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\sum_{n\\\\le M(t)}\\\\frac{\\\\cos(\\\\alpha_n(t))}{n}\\\\,dt
=
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}
\\\\int_{T_0}^S
\\\\vartheta'(t)\\\\,dt\\\\int_0^1\\\\cos(\\\\Delta(1-u))\\\\,du
+o(1).
\\
$$

Since

\\$$
\\\\int_{T_0}^S\\\\vartheta'(t)\\\\,dt=\\\\vartheta(S)-\\\\tau_0,
\\
$$

the leading factor cancels, leaving

\\$$
\\\\int_0^1\\\\cos(\\\\Delta(1-u))\\\\,du.
\\
$$

Substituting \\$v=1-u\\$,

\\$$
\\\\int_0^1\\\\cos(\\\\Delta v)\\\\,dv=\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}.
\\\\qedhere
\\
$$\\\ $\square$


\\\**Theorem 0.21. (Exact covariance)** \\\The empirical covariance of \\$\\\\zeta_{\\\\mathrm{st}}\\$ is

\\\$$
\begin{equation}
R(\\\\Delta)=e^{-i\\\\Delta}\\\\frac{\\\\sin\\\\Delta}{\\\\Delta},
\\\\qquad
R(0)=1.
\\\\label{eq:R-final}
\\\\end{equation}
$$\\\


\\\*Proof.* From \\\[eq:R-leading](#eq:R-leading),
\\$R(\\\\Delta)=e^{-i\\\\Delta}\\\\lim_{S\\\\to\\\\infty}\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}
\\\\int_{T_0}^S Z(s)Z(t)\\\\,dt\\$.
Substituting \\\[eq:ZZ](#eq:ZZ) and applying the product-to-sum identity
\\$\\\\cos A\\\\cos B=\\\\frac12[\\\\cos(A-B)+\\\\cos(A+B)]\\$, the integral becomes

\\$$
\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}
\\\\int_{T_0}^S
2\\\\sum_{m,n\\\\le M(t)}\\\\frac{\\\\cos(A_m(s)-A_n(t))+\\\\cos(A_m(s)+A_n(t))}{2\\\\sqrt{mn}}
\\\\,dt + o(1),
\\
$$

where the factor \\$4\\$ from \\\[eq:ZZ](#eq:ZZ) and the \\$\\\\frac12\\$ from product-to-sum
give a net coefficient of \\$2\\$. The oscillatory \\$(+)\\$-part and the off-diagonal
\\$(-)\\$-part both contribute \\$0\\$ in the limit by the preceding lemmas. The diagonal
\\$(-)\\$-part gives

\\$$
\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}
\\\\int_{T_0}^S
2\\\\sum_{n\\\\le M(t)}\\\\frac{\\\\cos(\\\\alpha_n(t))}{2n}\\\\,dt
=
\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}
\\\\int_{T_0}^S
\\\\sum_{n\\\\le M(t)}\\\\frac{\\\\cos(\\\\alpha_n(t))}{n}\\\\,dt,
\\
$$

which tends to \\$\\\\frac{1}{2}\\\\cdot\\\\frac{2\\\\sin\\\\Delta}{\\\\Delta}\\\\cdot\\\\frac{1}{1}
=\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}\\$ by the diagonal lemma (applied with the cancellation
\\$\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}\\\\cdot(\\\\vartheta(S)-\\\\tau_0)=\\\\frac12\\$ against
the integral's value \\$2\\\\sin\\\\Delta/\\\\Delta\\\\cdot(\\\\vartheta(S)-\\\\tau_0)\\$).

More directly: the net contribution of the diagonal is

\\$$
\\\\frac{1}{\\\\vartheta(S)-\\\\tau_0}\\\\int_{T_0}^S\\\\sum_{n\\\\le M(t)}
\\\\frac{\\\\cos(\\\\alpha_n(t))}{n}\\\\,dt\\\\to\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}
\\
$$

by the diagonal lemma, and the prefactor \\$\\\\frac{1}{2(\\\\vartheta(S)-\\\\tau_0)}\\$
from \\\[eq:R-leading](#eq:R-leading) combined with the coefficient \\$2\\$ from the double sum
reproduces this same expression. Multiplying by \\$e^{-i\\\\Delta}\\$ gives
\\\[eq:R-final](#eq:R-final). The value \\$R(0)=1\\$ follows from
\\$\\\\lim_{\\\\Delta\\\\to0}\\\\sin\\\\Delta/\\\\Delta=1\\$, consistent with Theorem~\\\[0.11](#thm:second-moment).\\\ $\square$


\\\\section{Spectral density and the associated Gaussian process}

\\\**Lemma 0.22. (Fourier transform)** With the convention \\$\\\\widehat{f}(\\\\omega)=\\\\int_\\\\mathbb{R} f(\\\\Delta)e^{-i\\\\omega\\\\Delta}\\\\,d\\\\Delta\\$,

\\\$$
\begin{equation}
\\\\widehat{\\\\left(\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}\\\\right)}(\\\\omega)
=\\\\pi\\\\,\\\\mathbf{1}_{[-1,1]}(\\\\omega).
\\\\label{eq:sinc-ft}
\\\\end{equation}
$$\\\


\\\*Proof.* This is the classical Fourier inversion of the rectangular function.\\\ $\square$


\\\**Corollary 0.23. (Spectral density of \\$R\\$)** \\\$$
\begin{equation}
\\\\widehat{R}(\\\\omega)=\\\\pi\\\\,\\\\mathbf{1}_{[-2,0]}(\\\\omega).
\\\\label{eq:R-spectrum}
\\\\end{equation}
$$\\\


\\\*Proof.* Multiplication of \\$f(\\\\Delta)\\$ by \\$e^{-i\\\\Delta}\\$ shifts the Fourier transform:
\\$\\\\widehat{e^{-i\\\\Delta}f}(\\\\omega)=\\\\widehat{f}(\\\\omega+1)\\$. Applying this to
\\$f(\\\\Delta)=\\\\sin\\\\Delta/\\\\Delta\\$ with \\\[eq:sinc-ft](#eq:sinc-ft):

\\$$
\\\\widehat{R}(\\\\omega)=\\\\pi\\\\,\\\\mathbf{1}_{[-1,1]}(\\\\omega+1)=\\\\pi\\\\,\\\\mathbf{1}_{[-2,0]}(\\\\omega).
\\
$$\\\ $\square$


\\\**Theorem 0.24. (Associated stationary Gaussian process)** \\\There exists a centered stationary Gaussian process \\$(X(\\\\tau))_{\\\\tau\\\\in\\\\mathbb{R}}\\$
satisfying

\\$$
\\\\mathbb{E}\\\\!\\\\left[X(\\\\tau+\\\\Delta)\\\\,\\\\overline{X(\\\\tau)}\\\\right]
=e^{-i\\\\Delta}\\\\frac{\\\\sin\\\\Delta}{\\\\Delta}
\\
$$

for all \\$\\\\tau,\\\\Delta\\\\in\\\\mathbb{R}\\$.\\\


\\\*Proof.* By \\\[eq:R-spectrum](#eq:R-spectrum), \\$\\\\widehat{R}(\\\\omega)\\\\ge0\\$. Hence \\$R\\$ is positive definite
by Bochner's theorem. The Kolmogorov existence theorem produces the required process
with this covariance.\\\ $\square$


\\\**Remark 0.25.** At the level of empirical second-order statistics, \\$\\\\zeta_{\\\\mathrm{st}}\\$ on
\\$(\\\\tau_0,\\\\infty)\\$ determines the covariance of the stationary Gaussian process
of Theorem~\\\[0.24](#thm:gaussian). The spectral density \\$\\\\pi\\\\,\\\\mathbf{1}_{[-2,0]}\\$ is
compactly supported, so the process has finite bandwidth \\$2\\$.\\\


\\\\end{document}

All theorems, lemmas, and final results are mathematically correct. Two errors in proof exposition (not affecting any stated result) were found:

## Verified correct

| Component | Status |
| :-- | :-- |
| $\vartheta(t)$ definition, derivative formulas Eqs (2.2)–(2.3) | ✓ |
| Stirling asymptotics Eqs (2.4)–(2.5) | ✓ |
| Existence of $T_0$, monotonicity, global inverse branch | ✓ |
| Lagrange inversion coefficients $c_k$ | ✓ |
| Unitary time-change identity | ✓ |
| Zero-crossing rate $1/\pi$ | ✓ |
| Unit Cesàro second moment (Thm 3.4) | ✓ |
| $Z(t)$ real-valued proof | ✓ |
| $\zeta_{\mathrm{st}}$ via $Z$, Eq (4.3) | ✓ |
| Reduction lemma, weight approximation | ✓ |
| Riemann–Siegel formula | ✓ |
| Phase expansion, product-to-sum decomposition | ✓ |
| (+)-part vanishes (van der Corput / integration by parts) | ✓ |
| Off-diagonal (−)-part vanishes | ✓ |
| Diagonal evaluation via Euler–Maclaurin → $\sin\Delta/\Delta$ | ✓ |
| Coefficient tracking: $\frac{1}{2V}\cdot 2 = \frac{1}{V}$, diagonal → $\sin\Delta/\Delta$ | ✓ |
| $R(\Delta)=e^{-i\Delta}\sin\Delta/\Delta$, $R(0)=1$ | ✓ |
| Fourier transform of sinc, frequency shift → $\pi\mathbf{1}_{[-2,0]}$ | ✓ |
| Bochner → positive definite, Kolmogorov → Gaussian process | ✓ |

## Errors in proof text

**Eq (5.5), ZZ remainder bound.** The paper claims the cross-term error in $Z(s)Z(t)$ is $O(t^{-1/4}\log t)$. The actual bound is $O(1)$: each Riemann–Siegel main sum satisfies $|\text{main}| \le 2\sum_{n\le N}n^{-1/2} = O(t^{1/4})$, and the cross with the $O(t^{-1/4})$ remainder gives $O(t^{1/4}\cdot t^{-1/4}) = O(1)$. This is *larger* than the claimed $O(t^{-1/4}\log t)$, so the stated pointwise bound is incorrect. The conclusion still holds: $\int_0^S O(1)\,dt\big/\vartheta(S) = O(1/\log S)\to 0$, but the paper's stated rate $O(S^{-1/4})$ should read $O(1/\log S)$.

**Theorem 3.5, uniqueness proof intermediate line.** The paper writes "the limit with $g\equiv c$ equals $1/(2c)\cdot 2 = 1/c$." The correct computation is $(S\log S/c)/((S/2)\log S) = 2/c$, not $1/c$. The final conclusion $e(\tau)^2 \sim 2\,\vartheta'(\vartheta^{-1}(\tau))$ is correct: setting $2/c = 1$ gives $c = 2$, i.e., $g(t) = e(\vartheta(t))^2/\vartheta'(t) \sim 2$.

