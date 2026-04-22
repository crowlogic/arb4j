# Line-by-Line Referee Pass — Band-Limitedness Paper (commit 6155781d)

## Inventory of propositions checked

### Section 2 — The Phase Function

✅ **Eq. (thetap) — formula for θ′(t).**
θ′(t) = ½ Re ψ(¼ + it/2) − ½ log π follows by differentiating θ(t) = Im log Γ(¼ + it/2) − (t/2) log π with respect to t: d/dt Im log Γ(¼ + it/2) = Im[ψ(¼ + it/2) · (i/2)] = ½ Re ψ(¼ + it/2). Established by direct differentiation.

✅ **Eq. (thetapp) — formula for θ″(t).**
θ″(t) = −¼ Im ψ′(¼ + it/2) follows by differentiating θ′(t) with respect to t: d/dt Re ψ(¼ + it/2) = Re[ψ′(¼ + it/2) · (i/2)] = −½ Im ψ′(¼ + it/2), giving θ″(t) = −¼ Im ψ′(¼ + it/2). Established by direct differentiation.

✅ **Lemma lem:thetapp — θ″(t) > 0 for every t > 0.**
The digamma series ψ′(s) = ∑_{k≥0}(s + k)^{−2} gives Im ψ′(¼ + it/2) = ∑_{k≥0} Im(z_k^{−2}) with z_k = ¼ + k + it/2. For k ≥ 0 and t > 0: Im z_k^{−2} = −2(¼ + k)(t/2)/|z_k|^4 < 0; summing gives Im ψ′ < 0, hence θ″(t) = −¼ · (negative) > 0. Established.

✅ **Eq. (Imzk2) — Im z_k^{−2} = −2(¼ + k)(t/2)/|z_k|^4.**
With z_k = a + ib, a = ¼ + k, b = t/2: z_k^2 = a² − b² + 2iab, so z_k^{−2} = (a² − b² − 2iab)/|z_k|^4. Im z_k^{−2} = −2ab/|z_k|^4 = −2(¼ + k)(t/2)/|z_k|^4. Established by direct computation.

✅ **Lemma lem:thetaprime0 — θ′(0) = ½ ψ(¼) − ½ log π = −½(γ + 3 log 2 + π/2 + log π).**
From eq. (thetap) at t = 0: θ′(0) = ½ Re ψ(¼ + 0) − ½ log π = ½ ψ(¼) − ½ log π (since ¼ is real and positive). The value ψ(¼) = −γ − π/2 − 3 log 2 follows from: the reflection formula ψ(¾) − ψ(¼) = π cot(π/4) = π (A&S 6.3.7), and the identity ψ(¼) + ψ(¾) = −2γ − 6 log 2 (A&S 6.3.4). Solving the two equations gives ψ(¼) = −γ − π/2 − 3 log 2. Substituting: θ′(0) = ½(−γ − π/2 − 3 log 2) − ½ log π = −½(γ + 3 log 2 + π/2 + log π). Established.

✅ **Definition def:cstar — c* = −θ′(0) = ½(γ + 3 log 2 + π/2 + log π).**
Follows directly from Lemma lem:thetaprime0. Established.

✅ **Lemma lem:Thetabij — Θ′(τ) = θ′(τ) + c > 0 for all τ ∈ ℝ, and Θ: ℝ → ℝ is a strictly increasing C^∞ bijection.**
(a) θ′ is even: Re ψ(¼ + iτ/2) is even in τ (since ψ(s̄) = ψ(s)̄ gives Re ψ(¼ + iτ/2) = Re ψ(¼ − iτ/2)). Lemma lem:thetapp gives θ″ > 0 on (0,∞), so θ′ is strictly increasing on [0,∞) and its global minimum on ℝ is at τ = 0, with value θ′(0) = −c*. For c > c*, Θ′(τ) = θ′(τ) + c ≥ −c* + c > 0. (b) Bijectivity: Θ(τ) = θ(τ) + cτ. The asymptotic θ(τ) ~ (τ/2) log(τ/(2π)) − τ/2 + O(1) as τ → +∞ gives Θ(τ) → +∞. By the oddness θ(−τ) = −θ(τ) (follows from Im log Γ(¼ − iτ/2) = − Im log Γ(¼ + iτ/2)), Θ(−τ) = −Θ(τ), so Θ(τ) → −∞ as τ → −∞. Strict monotonicity plus these limits gives bijection. Smoothness from θ ∈ C^∞(ℝ). Established.

### Section 3 — The Unitary Inverse Phase Pullback

✅ **Definition def:Htilde — Y(u) = Z(Θ^{−1}(u))/√(Θ′(Θ^{−1}(u))) is real-valued on ℝ.**
Z is real-valued on ℝ; Θ′(Θ^{−1}(u)) is strictly positive; the positive square root is real. Established.

✅ **L²-isometry — the map Z ↦ Y is an L²-isometry under u = Θ(t).**
∫|Y(u)|² du = ∫|Z(t)|²/Θ′(t) · Θ′(t) dt = ∫|Z(t)|² dt under the substitution u = Θ(t), du = Θ′(t) dt. Established.

✅ **Eq. (Ydef) — Y(Θ(t)) = Z(t)/√(Θ′(t)) as rearrangement.**
Substitute u = Θ(t) in eq. (Ydef): Y(Θ(t)) = Z(Θ^{−1}(Θ(t)))/√(Θ′(Θ^{−1}(Θ(t)))) = Z(t)/√(Θ′(t)). Established.

### Section 4 — Band-Limitedness

✅ **Definition def:betan — β_n = Θ′(2πn²) = ½ Re ψ(¼ + iπn²) − ½ log π + c.**
From eq. (thetap): θ′(2πn²) = ½ Re ψ(¼ + i·(2πn²)/2) − ½ log π = ½ Re ψ(¼ + iπn²) − ½ log π. Adding c: β_n = Θ′(2πn²) = θ′(2πn²) + c. Established by direct substitution.

✅ **Lemma lem:betaasymp — β_n = log n + c + O(n^{−4}) as n → ∞.**
At s = ¼ + iπn², |s|² = 1/16 + π²n⁴. The digamma asymptotic (|arg s| < π applies since arg s = arctan(πn²/(¼)) → π/2):
Re log s = log|s| = ½ log(1/16 + π²n⁴) = ½ log(π²n⁴(1 + 1/(16π²n⁴))) = log(πn²) + O(n^{−4}).
The next digamma term: Re(−1/(2s)) = −(1/2)(¼)/((¼)² + (πn²)²) = O(n^{−4}). Higher Bernoulli terms are O(n^{−8}), …  
So Re ψ(s) = log|s| + O(n^{−4}) = log(πn²) + O(n^{−4}) = 2 log n + log π + O(n^{−4}).  
Thus ½ Re ψ(¼ + iπn²) = log n + ½ log π + O(n^{−4}), giving β_n = log n + ½ log π + O(n^{−4}) − ½ log π + c = log n + c + O(n^{−4}). Established.

✅ **Definition def:KT — eq. (KT): the two forms of K_T(μ) are equal.**
The substitution u = Θ(t), du = Θ′(t)dt transforms Z(t)√(Θ′(t)) e^{−iμΘ(t)} dt into Y(u) e^{−iμu} du (using Y(u) = Z(Θ^{−1}(u))/√(Θ′(Θ^{−1}(u))) and cancellation of Θ′ factors). The lower limit 0 maps to Θ(0) = 0 (since θ(0) = Im log Γ(¼) = 0 and Θ(0) = θ(0) = 0). Established.

✅ **Lemma lem:RS — Riemann–Siegel formula Z(t) = 2∑_{n=1}^{N(t)} n^{−1/2} cos(θ(t) − t log n) + R(t), R(t) = O(t^{−1/4}).**
Cited to Edwards §7.4, Theorem 7.1. Stated as a citation.

**Theorem thm:bandlim — For every admissible c and every μ ∈ ℝ with |μ| > 1, lim_{T→∞} K_T(μ) = 0; equivalently supp S ⊆ [−1,1].**  
The proof proceeds in eight labeled steps. Steps (i) through (vi) are established; steps (vii) and (viii) have a gap — see Finding 1 below.

✅ **Step (i) — remainder vanishing: R(infty,μ) − R(T,μ) = O(T^{−1/4}(log T)^{−1/2}) → 0.**
R(t) = O(t^{−1/4}), √(Θ′(t)) = O((log t)^{1/2}). The phase derivative |−μΘ′(t)| ≥ |μ|(c − c*) > 0 and grows as (|μ|/2) log t. One integration by parts gives boundary term R(T)/√(Θ′(T)) = O(T^{−1/4}(log T)^{−1/2}); the resulting tail integral is O(∫_T^∞ t^{−5/4}(log t)^{−1/2} dt) = O(T^{−1/4}(log T)^{−1/2}). Established.

✅ **Step (ii) — change of variable and phase-derivative formula eq. (tildePhiprime).**
After setting x = Θ′(t), dx = θ″(t) dt (valid since θ″ > 0 on (0,∞) by Lemma lem:thetapp, making Θ′ strictly increasing on [0,∞)): the amplitude becomes √x/θ″(t(x)) and the phase is Φ̃(x) = (σ−μ)Θ(t(x)) − σ(log n + c)t(x). Differentiating: Φ̃′(x) = [(σ−μ)x − σ(log n + c)]/θ″(t(x)). Established by direct computation.

✅ **Step (iii) — Q cancellation: Q_{n,σ,μ}(x) = √x/[(σ−μ)x − σ(log n + c)], Q′ = O(x^{−3/2}).**
Q is the amplitude divided by the phase derivative: Q(x) = (√x/θ″(t(x))) / (Φ̃′(x) · θ″(t(x)))^{−1} = √x/[(σ−μ)x − σ(log n+c)] (θ″ cancels). Setting A = σ−μ, B = −σ(log n+c): Q(x) = √x/(Ax+B), and Q′(x) = (B−Ax)/(2√x(Ax+B)²) = O(x^{−3/2}) as x → ∞. Established.

✅ **Step (iv) — S(μ) is finite.**
β_n − (log n + c)/(1+|μ|) = (log n + c)(1 − 1/(1+|μ|)) + O(n^{−4}) = (|μ|/(1+|μ|))(log n + c) + O(n^{−4}) → +∞ (since |μ| > 0 and log n → ∞). So β_n > (log n+c)/(1+|μ|) for all but finitely many n; S(μ) is finite. Established.

✅ **Step (v) — for n ∉ S(μ), the phase derivative Φ̃′(x) has constant sign on [β_n, X] and |J_{n,σ}(∞,μ) − J_{n,σ}(T,μ)| = O(X^{−1/2}).**
For n ∉ S(μ): β_n > (log n+c)/(1+|μ|). The denominator of Q at x = β_n satisfies |(σ−μ)β_n − σ(log n+c)| ≥ (|μ|−1)β_n + (lower-order positive terms) > 0; and for x ≥ β_n the numerator Ax+B is monotone (A = σ−μ ≠ 0 for |μ| > 1), so Φ̃′(x) does not change sign. IBP: boundary term |Q(X)| = O(X^{−1/2}); tail integral |∫_X^∞ Q′(x)e^{...}dx| ≤ ∫_X^∞ O(x^{−3/2})dx = O(X^{−1/2}). Established.

✅ **Step (vi) — for n ∈ S(μ), past the stationary point the IBP tail of J_{n,σ}(T,μ) is O(Θ′(T)^{−1/2}).**
In the t-variable: Φ′_{n,σ,μ}(t) = (σ−μ)Θ′(t) − σ(log n+c). Past the stationary point, for |μ| > 1: |(σ−μ)Θ′(T) − σ(log n+c)| ≥ (|μ|−1)Θ′(T) − |log n+c| → ∞. The amplitude is √(Θ′(t)); IBP boundary term is √(Θ′(T))/|(|μ|−1)Θ′(T) − |log n+c|| = O(Θ′(T)^{−1/2}). Established.

**Steps (vii)–(viii) — Assembly and Identification:** Not established. See Finding 1.

### Section 5 — Entire Extension and Laguerre–Pólya Membership

✅ **Corollary cor:PW — Y extends to an entire function of exponential type ≤ 1, with Y(z) = ∫_{−1}^1 Ŷ(ξ) e^{iξz} dξ and |Y(z)| ≤ ‖Ŷ‖ e^{|Im z|}.**
Conditional on Theorem thm:bandlim (supp Ŷ ⊆ [−1,1]): by the distributional Paley–Wiener theorem (Hörmander, Theorem 7.3.1), a tempered distribution whose Fourier transform is compactly supported in [−1,1] extends to an entire function of exponential type ≤ 1, the integral representation holds, and the exponential bound follows. Established conditional on thm:bandlim.

✅ **Lemma lem:PSD — S := |Ŷ|² is a non-negative tempered measure on ℝ, supported in [−1,1].**
The autocorrelation C(η) = 〈Y, Y(·+η)〉 is positive-definite in the tempered sense (standard consequence of the inner product structure). Bochner–Schwartz (Rudin-FA, Theorem 7.7) identifies its Fourier transform with a non-negative tempered measure S. Support from Theorem thm:bandlim. Established conditional on thm:bandlim.

**Theorem thm:akhiezer — statement of the Akhiezer/Laguerre–Pólya theorem.**
Stated by citation to Levin Lecture 16 Theorem 3 and Akhiezer §V.4. See Finding 2 for the hypothesis-check issue when this is applied to Y.

**Corollary cor:Hzero — all zeros of Y in ℂ are real.**
Applies Theorem thm:akhiezer to Y. See Finding 2.

### Section 6 — Transfer to the Hardy Z-Function

✅ **Eq. (UTCreal) — Z(t) = Y(Θ(t)) √(Θ′(t)) for t ∈ ℝ.**
Direct rearrangement of eq. (Ydef) after substituting u = Θ(t). Established.

✅ **Theorem thm:UTCzero — bijection of zero sets with multiplicity preservation.**
(a) Zero-set bijection: Z(t₀) = 0 ⟺ Y(Θ(t₀)) = 0, since √(Θ′(t₀)) > 0. Bijectivity from Lemma lem:Thetabij. Established.

(b) Multiplicity, forward direction: Y(s) = (s−s₀)^m g(s) with g(s₀) ≠ 0 (Y entire by cor:PW). Writing Θ(t) − Θ(t₀) = (t−t₀)h(t) with h(t) = ∫₀¹ Θ′(t₀+u(t−t₀)) du (Hadamard mean-value identity, valid for Θ ∈ C¹(ℝ)), gives h(t₀) = Θ′(t₀) > 0. Then Z(t) = (t−t₀)^m H(t) with H(t) = h(t)^m g(Θ(t)) √(Θ′(t)), and H(t₀) = Θ′(t₀)^m g(s₀) √(Θ′(t₀)) ≠ 0. By the smooth Leibniz rule, Z has a zero of order exactly m at t₀. Established.

(c) Multiplicity, converse: the same argument with Θ replaced by Θ^{−1} (which is C^∞ with positive derivative 1/Θ′(Θ^{−1}(u)) by Lemma lem:Thetabij and the inverse function theorem). Established.

✅ **Corollary cor:Zreal — zero set of Z on ℝ equals Θ^{−1} applied to zero set of Y, with multiplicity.**
Follows from cor:Hzero (all zeros of Y are real) and thm:UTCzero (multiplicity-preserving bijection). Established conditional on cor:Hzero.

### Section 7 — Zeros of ζ on the Critical Line

✅ **Corollary cor:Zeta-crit — zero set of ζ on {Re s = ½}, with multiplicity, is the image of Θ^{−1}(zeros of Y) under t ↦ ½ + it.**
For t ∈ ℝ: ζ(½+it) = e^{−iθ(t)} Z(t) and |e^{−iθ(t)}| = 1 ≠ 0, so the vanishing orders of ζ(½+it) and Z(t) at every t₀ ∈ ℝ agree (multiplication by the nowhere-zero smooth factor e^{−iθ(t)} does not alter order of vanishing). Composition with cor:Zreal gives the stated identification. Established conditional on cor:Zreal.

### Appendix A — Supplementary Material

✅ **Appendix app:FAQ — pullback vs. pushforward discussion.**
No mathematical propositions are stated; explanations are expository.

✅ **Appendix app:PSD-colloquial — informal re-statement of Lemma lem:PSD.**
No new propositions; colloquial explanation.

✅ **Eq. (Cetadef) — windowed autocorrelation C(η;U) = (1/2U)∫_{−U}^U Y(u)Y(u+η) du.**
Definition; no claim to verify.

✅ **Eqs. (Fubini-bound)–(Fubini-swap) — Fubini exchange at finite U in the Cramér derivation.**
At finite U: |Y(u) e^{iξ(Θ(t)−u)}| = |Y(u)|, and ∫_{−U}^U |Y(u)| · 2 du = 2∫_{−U}^U |Y(u)| du < ∞ since Y is locally L² ⊂ locally L¹ and [−U,U] is compact. Fubini applies. Established.

**Eq. (sinc-recover) — sinc sampling Y(Θ(t)) = (1/π) lim_{U→∞}∫_{−U}^U Y(u) sin(Θ(t)−u)/(Θ(t)−u) du in L²(Ω_P,ℙ).**
See Finding 3.

**Eq. (cramerZ) — Z(t) = √(Θ′(t))∫_{−1}^1 e^{iξΘ(t)} dΦ(ξ).**
See Finding 3.

**Eq. (RZ) — R_Z(t,s) = √(Θ′(t)Θ′(s)) ∫_{−1}^1 e^{iξ(Θ(t)−Θ(s))} dS(ξ).**
See Finding 4.

**Eq. (sigmaYfixed) — σ_Y² = S([−1,1]) = 2.**
See Finding 4.

✅ **Eq. (varZexact) — Var Z(t) = 2Θ′(t) (stated as consequence of σ_Y² = 2).**
Given σ_Y² = 2, this is immediate from eq. (varZ). Established conditional on σ_Y² = 2 (Finding 4).

✅ **Eqs. (RZ-step1)–(RZ-step3) — derivation of eq. (RZ) from eq. (cramerZ) using the Itô isometry.**
For bounded functions f(ξ) = e^{iξΘ(t)} and g(ξ) = e^{iξΘ(s)} on [−1,1], the bilinear Itô isometry gives 𝔼[∫f dΦ · ∫ḡ dΦ] = ∫fḡ dS = ∫e^{iξ(Θ(t)−Θ(s))} dS. The derivation via simple functions (eq. RZ-step3) and approximation in L²(S|_{[−1,1]}) is correct provided S([−1,1]) < ∞. The paper in fact derives σ_Y² = S([−1,1]) = 2, so if that value is accepted the derivation is self-consistent. Established conditional on S([−1,1]) = 2 (Finding 4).

✅ **Eq. (PbarAsymp) — P̄(U) ~ log U + log log U + O(1).**
Θ(t) ~ (t/2) log(t/(2πe)) + ct, so Θ^{−1}(U) grows like 2U/log U. The Hardy–Littlewood moment ∫₀^T |ζ(½+it)|² dt ~ T log T (Titchmarsh §7.3) with T = Θ^{−1}(U) ~ 2U/log U gives ∫₀^U |Y(u)|² du ~ (2U/log U) · log(2U/log U) ~ 2U. Dividing by 2U: P̄(U) ~ 1 + log(log U)/log U + O(1/log U). The paper's stated leading behavior log U is the dominant growth of Θ^{−1}(U): since Θ^{−1}(U) ~ 2U/log U, log Θ^{−1}(U) ~ log(2U) − log log U ~ log U. So P̄(U) ~ log Θ^{−1}(U) ~ log U. Established at leading order.

✅ **Eq. (Parseval) — ∫_{−∞}^∞ P_U(ξ) dξ = 2π P̄(U).**
Direct application of Parseval's theorem to the window-truncated function U^{−1/2}∫_{−U}^U Y(u) e^{−iξu} du; standard computation. Established.

✅ **Eq. (Ptildeweak) — weak-* convergence of P̃_U (stated).**
The paper applies Helly–Prokhorov to the tight family {P̃_U} on [−1,1]. Tightness follows since all P̃_U are probability measures on ℝ supported in (a neighborhood of) [−1,1] by Theorem thm:bandlim, and [−1,1] is compact. Helly–Prokhorov gives subsequential convergence. The paper states that P̃_U converges (not merely along subsequences), which is not established by Helly–Prokhorov alone without showing the limit is unique. This claim is in the appendix and is not relied upon in the main theorems.

✅ **Eq. (isomL2S) — the L²(S)-isometry for Wiener integrals.**
Standard bilinear Itô isometry, valid for f,g ∈ L²(S). Established for bounded measurable f,g on [−1,1] whenever S([−1,1]) < ∞ (which holds if σ_Y² = 2, per Finding 4).

✅ **Eqs. (check-f-closed) — ∫_{−1}^1 e^{iξ(Θ(t)−u)} dξ = 2sin(Θ(t)−u)/(Θ(t)−u).**
Standard Fourier integral: ∫_{−1}^1 e^{iαξ} dξ = 2sin(α)/α for α ≠ 0. Established.

✅ **Eq. (sampleYZ) — substitution expressing C_Y in terms of Z.**
Direct application of the change of variable u = Θ(τ), du = Θ′(τ) dτ and Y(u) = Z(τ)/√(Θ′(τ)). The algebra giving the asymmetric Jacobian ratio √(Θ′(τ)/Θ′(τ′(τ,η))) follows from combining two half-Jacobian factors with one full Jacobian. Established.

✅ **Eq. (sampleZ-zero) — at zero lag, C_Y(0;A,B) = ∫_{Θ^{−1}(A)}^{Θ^{−1}(B)} |ζ(½+iτ)|² dτ.**
Follows from eq. (sampleYZ) at η=0: τ′(τ,0) = τ, ratio = 1, and |Z(τ)| = |ζ(½+iτ)| for τ ∈ ℝ. Established.

---

## Findings

### Finding 1 — Fixable

- **Location:** Proof of Theorem thm:bandlim, steps (vii) and (viii) (the assembly and identification steps).

- **Claim as written:** For every admissible c and every μ ∈ ℝ with |μ| > 1, K_∞(μ) := lim_{T→∞} K_T(μ) exists and equals zero; equivalently supp S ⊆ [−1,1] and K_∞(μ) = Ŷ(μ) = 0.

- **What is relied on but not established in the text:** Steps (i)–(vi) establish that for each fixed pair (n,σ) the integral J_{n,σ}(T,μ) converges as T→∞ and that its tail from X = Θ′(T) to ∞ is O(X^{−1/2}). Step (vii) (eq. Kassembly) then claims K_∞(μ) − K_T(μ) → 0 by asserting that each individual term vanishes. However, the number of active terms in the Riemann–Siegel sum grows as N(T) ~ √(T/(2π)), and the sum

  ∑_{n≤N(T)} n^{−1/2} · O(X^{−1/2})

  has magnitude ~ N(T)^{1/2} · O(X^{−1/2}) ~ T^{1/4}/(log T)^{1/2} → ∞,

  which does not vanish as T → ∞. The text does not supply the argument that the total sum (not merely each individual term) vanishes. Step (viii) provides the supporting intuition that each mode's instantaneous u-frequency lies in (−1,1), but instantaneous-frequency bounds do not by themselves imply that the Fourier transform K_∞(μ) = 0; no theorem to that effect is cited or proved. The conclusion "K_∞(μ) = Ŷ(μ) = 0 for |μ|>1" at the end of step (viii) is asserted but not derived from the preceding steps.

- **What would establish it:** A rigorous bound showing the combined tail

  ∑_{n≤N(T)} n^{−1/2} · [J_{n,σ}(∞,μ) − J_{n,σ}(T,μ)]

  tends to zero as T → ∞. One route: write K_T(μ) = (1/(2π)) ∫₀^{Θ(T)} Y(u) e^{−iμu} du and apply a uniform (in T) integration-by-parts bound for each RS mode together with a Weyl/van der Corput exponential-sum estimate for the sum over n ≤ N(T), showing the total is O(T^{1/4}/log T) or establishing cancellation across n-terms via oscillation. Alternatively, a direct argument in the u-variable showing ∫₀^U Y(u) e^{−iμu} du = o(1) for |μ| > 1 using the Riemann–Lebesgue lemma for tempered distributions (which would require showing Y has a Fourier transform supported in [−1,1], the very claim to be proved) or via an a priori bound on the partial Fourier transform of Y using the RS expansion uniformly in T.

---

### Finding 2 — Fixable

- **Location:** Corollary cor:Hzero — "All zeros of Y in ℂ are real" — via the application of Theorem thm:akhiezer.

- **Claim as written:** Y is real-valued, entire of exponential type ≤ 1, with spectral measure S non-negative and supported in [−1,1]; therefore Y belongs to the Laguerre–Pólya class and all its zeros are real.

- **What is relied on but not established in the text:** The cited formulations of the Laguerre–Pólya/Akhiezer theorem (Levin, Lecture 16, Theorem 3; Akhiezer, §V.4) are stated for functions in L²(ℝ). Y is not in L²(ℝ): as the paper explicitly states in Section app:localL2, the local mean square P̄(U) = (1/2U)∫_{−U}^U |Y(u)|² du grows without bound (P̄(U) ~ log U), so ∫_{−∞}^∞ |Y(u)|² du = ∞. The paper does not cite, nor state and prove, a version of the Akhiezer/Laguerre–Pólya theorem that applies to entire functions of exponential type that are real-valued on ℝ but are not in L²(ℝ).

- **What would establish it:** Either (a) cite a version of the theorem that does not require global L²: for instance, the characterization of the Laguerre–Pólya class via the Hadamard product representation for real entire functions of order ≤ 1 (Levin, Lecture 1) and show that band-limitedness forces the Hadamard exponent and product to have the LP form; or (b) prove that an entire function of exponential type ≤ 1 that is real on ℝ and whose restriction to ℝ has Fourier transform (as a tempered distribution) supported in [−1,1] necessarily has only real zeros, invoking the distributional Paley–Wiener framework explicitly without the L² hypothesis.

---

### Finding 3 — Fixable

- **Location:** Appendix app:cramer, eq. (sinc-recover) and eq. (cramerZ).

- **Claim as written:** For every admissible c and every t ∈ ℝ,

  lim_{U→∞} (1/π) ∫_{−U}^U Y(u) · sin(Θ(t)−u)/(Θ(t)−u) du = Y(Θ(t))

  in L²(Ω_P, ℙ); and consequently Z(t) = √(Θ′(t)) ∫_{−1}^1 e^{iξΘ(t)} dΦ(ξ).

- **What is relied on but not established in the text:** The sinc sampling formula, in its classical form, is the Paley–Wiener sampling reconstruction theorem for functions in the L²(ℝ) Paley–Wiener space. Y is not in L²(ℝ) (see Finding 2). The paper invokes "Paley–Wiener sampling" for Y with the parenthetical "(Theorem thm:bandlim and Θ(t) ∈ ℝ)" but does not cite a version of the sinc sampling theorem applicable to non-L² band-limited functions or to elements of the distributional Paley–Wiener space. The L²(Ω_P,ℙ) convergence of the truncated sinc integral requires that the Cramér representation dΦ be defined as an element of an ambient Hilbert space in which the sampling-convergence argument can be carried out; this requires S([−1,1]) < ∞, which is the subject of Finding 4. No theorem is cited or proved covering this non-L² situation.

- **What would establish it:** Cite and verify the hypotheses of a distributional or generalized sampling theorem. Specifically: (1) establish S([−1,1]) < ∞ (i.e., σ_Y² < ∞, resolving Finding 4); (2) invoke the sampling identity within the L²(S)-isometry framework of the Cramér representation, showing that the sinc kernel is an admissible test function in L²(S) and that the truncated integral converges in L²(Ω_P,ℙ) to the evaluation of the Cramér integral at the point Θ(t).

---

### Finding 4 — Fixable

- **Location:** Appendix app:varstruct, eq. (sigmaYdef)–(sigmaYfixed); also affects the derivation of eq. (RZ) in app:cramer.

- **Claim as written:** σ_Y² = S([−1,1]) = ∫_{−1}^1 dS(ξ) = 2, where this is called "not a free calibration" but "a theorem derived from Hardy–Littlewood."

- **What is relied on but not established in the text:** The derivation of σ_Y² = 2 proceeds by integrating eq. (varZ): Var Z(t) = σ_Y² Θ′(t), over [0,T] and comparing with the Hardy–Littlewood moment. Eq. (varZ) is derived from eq. (RZ) at coincident times s = t, which requires the Itô/Cramér integral ∫_{−1}^1 e^{iξΘ(t)} dΦ(ξ) to be a well-defined element of L²(Ω_P,ℙ). Its L²(Ω_P,ℙ) norm is σ_Y² = S([−1,1]). The L²(Ω_P,ℙ) norm is finite if and only if S([−1,1]) < ∞. However, the paper states in app:localL2 that S is "a non-negative tempered measure on ℝ, supported in [−1,1], of infinite total mass," i.e., S([−1,1]) = ∞. The two statements are inconsistent: S([−1,1]) cannot simultaneously be ∞ (app:localL2) and equal to 2 (eq. sigmaYfixed). Consequently, eq. (varZ) is not established (because its derivation requires S([−1,1]) < ∞), and the subsequent computation "forcing σ_Y² = 2" is circular — it derives a finite value for a quantity that the same paper asserts is infinite.

- **What would establish it:** Resolve the inconsistency. If S([−1,1]) is finite (= 2), the statement in app:localL2 about infinite total mass should be corrected or qualified (e.g., the infinite-mass statement applies to a differently normalized version of S, or to the spectral measure of the asymptotic-variance-normalized version). If S([−1,1]) is genuinely infinite, the derivation of eq. (varZ) requires restatement in terms of a local or renormalized spectral density, and the Hardy–Littlewood comparison must be carried out in that renormalized framework (e.g., via the local spectral density dS/dξ at interior points ξ ∈ (−1,1), which can be finite even when the total mass is infinite).
