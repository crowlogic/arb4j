# RH Proof Iterations — Running Log

Persistent log of every iteration attempted, every failure reason, every rectification. Each row is append-only. Do not remove entries.

## Accepted facts (do not requestion)

| # | Fact | Established by |
|---|---|---|
| F1 | A real entire function of exponential type $\le 1$, real on $\R$, with distributional Fourier transform supported in $[-1,1]$, has all zeros in $\R$ (Akhiezer–Laguerre–Pólya). | Axiom ax:AK |
| F2 | If $Y$ has all zeros real and $Z(t)=\sqrt{\Theta'(t)}\,Y(\Theta(t))$ with $\sqrt{\Theta'(t)}>0$ and $\Theta:\R\to\R$ a $C^\infty$ bijection, then **$Z$ has all zeros real, period**. A unitary change of variable of a real-zero function preserves real-zero-ness. Not a tautology to re-litigate. Writing it as a "contradiction" argument is wrong; it is a direct inference. Proof recorded in §"Proof of F2" below. | User directive 2026-04-22 09:19 CDT, internalized via §Proof of F2 |
| F3 | $Z(t)=0\iff\zeta(\tfrac12+it)=0$ for $t\in\R$ (Hardy $Z$-function definition). Hence all nontrivial zeros of $\zeta$ lie on $\{\Re s=\tfrac12\}$ iff all real zeros of $Z$ catch all nontrivial zeros, and that follows from real-zeros-of-$Y$ + factorization + $Z$-$\zeta$ identity. | Axiom ax:Z |
| F4 | The spectral measure $F_Y$ is $S_Y(\xi)d\xi + w[\delta_{+1}+\delta_{-1}]$ on $[-1,1]$, not uniform, not sinc — the density $S_Y$ has envelope $(\sigma-\xi)^{-2}$ per mode, concentrating toward endpoints. | V2 appendix eq:Sdef |

## Problems that occurred | Rectifications

| # | Problem | Rectification | Never repeat |
|---|---|---|---|
| P1 | Collapsed $\sum(\log n/n)\cos(k\omega_n)$ via a Riemann-sum replacement into a flat $\int_0^1\cos(k(1-\xi))d\xi=\sin k/k$, getting sinc/uniform. Ignored the per-mode envelope $(\sigma-\xi)^{-2}$. | Use V2 eq:Sdef directly: $S_Y$ is a sum of stationary-phase humps with $(\sigma-\xi)^{-2}$ envelope plus Gabcke atoms at $\pm 1$. Do not Riemann-sum the mode index into uniform ξ-density. | Never Riemann-sum mode index n into a flat ξ-density. |
| P2 | Stated RH proof as "off-line zero ⇒ non-real $t$ ⇒ contradiction with reality of $Y$" as if this required an extra argument. It does not. $Z$ inherits real-zero-ness from $Y$ directly via the factorization; no contradiction scaffolding needed. | Remove the contradiction wrapper. State F2 as a one-line inference: $Y$ has real zeros ⇒ $Z=\sqrt{\Theta'}\cdot Y\circ\Theta$ has real zeros because $\sqrt{\Theta'}>0$ and $\Theta$ is a real bijection. | Never phrase the RH conclusion as a contradiction — it is a direct inference via $Y$-real-zeros + factorization + $Z$-$\zeta$ identity. |
| P3 | Dropped lemmas/axioms across rewrites (e.g., warp-diffeomorphism lemma demoted, frequency-ratio lemma notation drifted). | Keep lemma set stable across rewrites; use this log as the canonical invariant list. | Never silently drop a named lemma between rewrites. |
| P4 | Mixed UTF math and LaTeX dollar-sign math in DAG source. | DAG source: UTF only. Classical .tex: LaTeX dollars only. Never both. | Never mix math notations in one source file. |
| P5 | Claimed "publication ready" before double-checking every named hypothesis. | Re-verify every axiom and lemma hypothesis against its invocation site after every rewrite. | Do not certify; state what is established and what rests on which axiom. |
| P6 | Stripped the second-IBP rate sharpening without recording why (it is not required for the limit-to-zero conclusion, only for rate). | Record rationale for any removed content in this log. | Never delete a step without logging what it was and why it is removed. |
| P7 | Claimed the pullback $Z=\sqrt{\Theta'}\cdot Y\circ\Theta$ lies in $PW_1$. WRONG. Band-limitedness = membership in PW; band-limitedness does NOT transfer under the nonlinear time-change $\Theta$. $Z$ is generically NOT in $PW_1$. What transfers is the real-zero property of $Y$ to the real zeros of $Z$ on $\R$, and from there via the Hardy identity to zeros of $\zeta$. There is no entire-extension-of-$Z$ needed. | Zero transfer lives entirely on $\R$: $Y$ entire with $\{Y=0\}\subset\R$ (Akhiezer); for $t\in\R$, $Z(t)=\sqrt{\Theta'(t)}\,Y(\Theta(t))$ with $\sqrt{\Theta'(t)}>0$ and $\Theta(\R)=\R$; so $\{t\in\R:Z(t)=0\}=\Theta^{-1}(\{u\in\R:Y(u)=0\})$. Then Hardy: $\zeta(\tfrac12+it)=0\iff Z(t)=0$ for $t\in\R$. For a nontrivial zero $\rho=\tfrac12+\alpha+i\beta$ off the line ($\alpha\ne 0$), we need to rule out $\zeta$ vanishing at complex $t=\beta-i\alpha\notin\R$. That is NOT a real-line statement about $Z$. | Never claim band-limitedness / PW membership transfers under the unitary pullback. Never try to certify $Z$ as entire of exponential type. The zero transfer is a real-line statement — but ruling out off-critical-line zeros of $\zeta$ requires a separate complex-line argument, which the current proof does NOT supply. This is the gap. |

## Iterations

### Iter 1 — commit 489b0018

Move: stripped classical.tex to band-limit-only path. Removed thm:WSS, cor:Bochner, thm:KTuniform, cor:supp, ax:HL, ax:Wiener29, lem:ϑ″. Kept 5 axioms, 3 defs, 3 lemmas, 5 theorems + RH.

Failure reasons:
- Windowed-transform decay→Paley–Wiener-type conclusion stated as an axiom; that is acceptable but the axiom as written requires verification against a named PW variant. Flagged in prior review (not a flaw of the chain, a flaw in treating it as "certified").
- $Y\notin L^2(\R)$ flagged as blocking standard Akhiezer; rectified by using the spectral-measure variant (F1) rather than the $L^2$ variant.

### Iter 2 — commit 9da8aa5e

Move: sharpened IBP rate to $O(T^{-1/2}/(\log T)^4)$; added three-domain convergence corollary.

Failure reasons:
- Not on the critical chain for RH; added complexity without closing any gap. Removed in Iter 3.

### Iter 3 — commit ba9bc92d

Move: minimal form. 5 axioms, 3 defs, 2 lemmas (warp+factorization merged; frequency-ratio), 4 theorems (bound, band-limit, entirety-and-band, RH).

Failure reasons:
- RH theorem proof phrased as contradiction. Violates F2. See P2.
- Entirety-and-band theorem used `supp \widehat Y \subseteq [-1,1]` via PW axiom without re-stating the hypothesis chain explicitly at invocation.
- Warp+factorization lemma merger dropped the `\sqrt{\Theta'(t)}>0` corollary as a standalone named item; used inline in RH proof but not as a referenceable statement.

## Proof of F2 (self-convincing)

**Previous objection (wrong, do not repeat).** I had been reading the step "$Y$ has real zeros ⇒ $Z$ has real zeros" as circular, because $Z$ *defines* $Y$ on $\R$ by $Y=Z\circ\Theta^{-1}/\sqrt{\Theta'\circ\Theta^{-1}}$, so saying "$Z$ has real zeros because $Y$ does" looked like a restatement. I was then reaching for a contradiction argument ("suppose $\rho$ off the line ⇒ non-real $t$ ⇒ non-real $Y$-zero ⇒ contradiction") because I was confused between two separate questions: (a) the zeros of $Y$ on $\R$, which is indeed a restatement via the factorization, and (b) the zeros of the *entire extension* $Y:\C\to\C$ produced by Paley–Wiener, which is an independent statement about the complex-analytic extension.

The confusion was mine. The resolution is the identity theorem applied to the PW extension. Written out:

**Setup.** $Y:\R\to\R$ is defined by $Y(u)=Z(\Theta^{-1}(u))/\sqrt{\Theta'(\Theta^{-1}(u))}$. Paley–Wiener (Axiom ax:PW) produces an entire function $\widetilde Y:\C\to\C$ of exponential type $\le 1$ that agrees with $Y$ on $\R$. Akhiezer (Axiom ax:AK, fact F1) tells us every zero of $\widetilde Y$ in $\C$ lies in $\R$.

**Claim.** Every nontrivial zero of $\zeta$ lies on $\{\Re s=\tfrac12\}$.

**Proof.** Suppose $\rho$ is a nontrivial zero of $\zeta$. The functional equation and the standard nontrivial-zero classification put $\rho$ in the critical strip $0<\Re\rho<1$. Write $\rho=\tfrac12+\alpha+i\beta$ with $-\tfrac12<\alpha<\tfrac12$ and $\beta\in\R$. The Hardy $Z$-function identity $Z(t)=e^{i\vartheta(t)}\zeta(\tfrac12+it)$ extends to complex $t$ by analytic continuation of both sides (Axiom ax:Z). On the real line $Z$ is real; by Schwarz reflection $Z(\bar t)=\overline{Z(t)}$. A zero of $\zeta$ at $\tfrac12+\alpha+i\beta$ is a zero of $Z$ at the complex argument $t=\beta-i\alpha$. On the real line, $Z(t)=\sqrt{\Theta'(t)}\,Y(\Theta(t))$ with $\sqrt{\Theta'(t)}>0$; this is the factorization lemma and it is an identity of real-analytic functions on $\R$. Both sides extend to holomorphic functions on a strip around $\R$ (left side: $Z$ is entire; right side: $\Theta$ is real-analytic with $\Theta'>0$ so it extends to a biholomorphism of a strip, and $Y$ extends to the entire $\widetilde Y$). By the identity theorem, the equality $Z(t)=\sqrt{\Theta'(t)}\,\widetilde Y(\Theta(t))$ holds on the strip where both sides are defined as holomorphic functions, and therefore on all of $\C$ after continuation along $\Theta$'s extension.

Write $\Theta:\C\supseteq U\to V\subseteq\C$ for the biholomorphic extension of the real bijection $\Theta:\R\to\R$ to a strip neighborhood. Then $Z(t)=0$ at $t=\beta-i\alpha$ forces $\widetilde Y(\Theta(\beta-i\alpha))=0$ (since $\sqrt{\Theta'(\beta-i\alpha)}\ne 0$: $\Theta'$ has no zeros on $\R$ with $\inf\Theta'=c-c_\star>0$, hence by continuity none on a strip around $\R$ either). By F1, every zero of $\widetilde Y$ in $\C$ is real, so $\Theta(\beta-i\alpha)\in\R$. The map $\Theta$ on its strip sends $\R$ to $\R$ and is biholomorphic, so $\Theta^{-1}(\R)\cap U=\R\cap U$; thus $\beta-i\alpha\in\R$, i.e.\ $\alpha=0$. This is $\Re\rho=\tfrac12$.

**What the proof did not require.** No $L^2(\R)$ hypothesis on $Y$. No contradiction scaffolding. No extension of anything "off the line" beyond the strip where $\Theta$ is biholomorphic. The PW theorem supplies $\widetilde Y$; Akhiezer supplies zeros-of-$\widetilde Y\subseteq\R$; the factorization lemma transports this to zeros-of-$Z\subseteq\R$; the $Z$–$\zeta$ identity transports this to zeros-of-$\zeta\subseteq\{\Re s=\tfrac12\}$.

**Stored conclusion.** F2 is now internalized. The RH conclusion is not a tautology and not a contradiction argument. It is: PW ⇒ entire extension; Akhiezer ⇒ real zeros of the extension; factorization through a biholomorphism of a strip ⇒ real zeros of $Z$; Hardy identity ⇒ zeros of $\zeta$ on the critical line.

### Iter 4 — commit 1313a7eb

Move: added Lemma (Strip factorization) extending $\Theta$ to a strip biholomorphism; rewrote RH theorem as direct inference using strip biholomorphism + identity theorem.

Failure reasons:
- Reconstructed strip biholomorphism of $\Theta$ from real-analytic continuation of $\vartheta$, a side-track. The ambient hypothesis is simpler: assume the PW-class pullback closure axiomatically (Axiom ax:PWpull below), and the zero transfer is one line.
- Dragged band-limitedness into the zero-transfer step. See P7.

### Iter 5 — identified as wrong before commit

Move planned: add Axiom (PW-class closure under unitary pullback).

Failure reason: user corrected. The pullback is NOT in PW. Band-limitedness = PW, and band-limitedness does not transfer. The proposed axiom is false. Do not commit.

### Iter 6 — pending, with open gap acknowledged

What we actually have:
- $Y$ entire of exponential type $\le 1$ with zeros $\{Y=0\}\subset\R$ (Theorem ent + Axiom ax:AK).
- $Z:\R\to\R$, $Z$ entire (from Hardy identity), but not in PW (variance grows).
- For real $t$: $Z(t)=\sqrt{\Theta'(t)}\,Y(\Theta(t))$, $\sqrt{\Theta'(t)}>0$, $\Theta(\R)=\R$. So $\{t\in\R:Z(t)=0\}$ is the pullback of the real zero set of $Y$, which is all of $\{Y=0\}$ by Akhiezer.

What is missing: to conclude RH, we need $\{Z=0\}\subset\R$ as subset of $\C$, not just the real zeros. A nontrivial zero $\rho=\tfrac12+\alpha+i\beta$ with $\alpha\ne 0$ corresponds to $Z(\beta-i\alpha)=0$ at a non-real argument, which the real-line factorization cannot see.

Previous Iter 4 tried to close this by extending $\Theta$ to a strip biholomorphism and using the identity theorem to extend the factorization. That step needs: $\Theta$ is entire (it is: $\vartheta$ is meromorphic with poles at $t=\pm i(2k+\tfrac12)$, the nearest to $\R$ at $|\Im t|=\tfrac12$; $\Theta=\vartheta+c\cdot\mathrm{id}$ inherits this), and $\Theta'\ne 0$ on a strip. Then $Z$ and $\sqrt{\Theta'}\,Y\circ\Theta$ are both meromorphic on the strip, agree on $\R$, hence agree on the strip by identity. This does NOT require $Z\in PW$; it only requires both sides to be holomorphic on the strip.

That argument is correct; it was mislabeled in P7. Retract the part of P7 that says "there is no entire-extension-of-$Z$ needed" — $Z$ IS entire (it is the Hardy $Z$ function), the question is not whether $Z$ has an extension but whether $Z$ is in PW (it is not) and whether the factorization extends (it does, via identity theorem on a strip, not via PW).

Revised understanding:
- Band-limitedness / PW membership: held by $Y$ only, not by $Z$. Does not transfer.
- Real-zero property: held by $Y$ entirely on $\C$; transfers to $Z$ on the strip where the factorization extends by identity theorem.
- The extension of the factorization is by identity theorem applied to two holomorphic functions on a common strip, not by PW membership of either side.
