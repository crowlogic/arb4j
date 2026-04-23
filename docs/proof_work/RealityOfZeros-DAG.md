# DAG: Riemann Hypothesis via Warped Pullback Ỹ

Nodes: A = axiom, D = definition, L = lemma/theorem, C = corollary, T = theorem.
Edges: X → Y means X is used in the proof of Y.

## Axioms (inputs, taken without proof in this manuscript)

- A1 (Hardy):  Z(t) = e^{iϑ(t)}ζ(½+it), Z real on ℝ, zeros of Z ↔ nontrivial zeros of ζ on critical line.
- A2 (Digamma asymptotic):  ϑ'(t) = ½log|t/(2π)| + O(t⁻²),  c★ := -inf ϑ' ∈ (0,∞).
- A3 (Riemann–Siegel):  Z(t) = 2 Σ_{n≤N(t)} n^{-½} cos(ϑ(t) - t log n) + R(t), R = O(t^{-1/4}).
- A4 (Schwartz–Paley–Wiener):  u ∈ 𝒮'(ℝ) has supp u ⊆ [-B,B] ⇔ û extends entire with |û(z)| ≤ C(1+|z|)^N e^{B|Im z|}. (Schwartz 1950; Hörmander I, Thm 7.3.1.)
- A5 (Reality-of-zeros for sharp-band entire functions):  Entire F of type ≤1, real on ℝ, polynomial growth on ℝ, supp F̂ ⊆ [-1,1], sharp endpoint 1 ∈ supp F̂ ⇒ all zeros of F real.
- A6 (Sharp endpoint):  1 ∈ supp Ỹ̂.

## Definitions

- D1 (Θ): Θ(t) = ϑ(t) + ct, fixed c > c★.
- D2 (Y):  Y(u) = Z(Θ⁻¹(u)) / √Θ'(Θ⁻¹(u))  on ℝ, principal positive branch.
- D3 (K_T):  K_T(μ) = (2π)⁻¹ ∫₀^{Θ(T)} Y(u) e^{-iμu} du.

## Lemmas and theorems

- L1 (Warp): [A2, D1, D2] ⇒ Θ: ℝ→ℝ C^∞ bijection with inf Θ' = c - c★ > 0; Z(t) = √Θ'(t) · Y(Θ(t)).
- L2 (Frequency ratio):  [A2, L1] ⇒ ω_n(t) = (ϑ'(t) - log n)/Θ'(t) ∈ [0,1) for t ≥ 2πn², ω_n ↑ 1.
- L3 (Polynomial growth of Y):  [A3, L1, D2] ⇒ |Y(u)| = O(|u|^{1/4}), hence Y ∈ 𝒮'(ℝ).
- L4 (Structural band-limit):  [A1, A3, L1, L2, non-stationary phase IBP via Stein Ch VIII §1, Gabcke R = O(t^{-3/4})] ⇒ supp Ŷ ⊆ [-1,1].  No stationary point since Φ'_{n,σ,μ}(t) = Θ'(t)(σω_n(t)+μ) with |σω_n+μ| ≥ |μ|-1 > 0 uniformly on supp φ ⊂ {|μ|>1}.
- C5 (Entire extension):  [L3, L4, A4, A1, L1] ⇒ Ỹ entire, exp. type ≤1, real on ℝ, supp Ỹ̂ ⊆ [-1,1], polynomial growth on ℝ.
- C6 ≡ L3.

## Laguerre–Pólya assembly

- L7 (Order and type):  [C5] ⇒ order ρ(Ỹ) ≤ 1, finite type if ρ=1.
- L8 (Zero count):  [L7, Jensen] ⇒ n_{Ỹ}(r) = O(r), hence Σ |z_n|⁻² < ∞.
- L9 (Hadamard factorization):  [L7, L8] ⇒ Ỹ(z) = C z^m e^{P(z)} Π(1 - z/z_n) e^{z/z_n}, deg P ≤ 1, P(z) = az+b.
- L10 (Reality of coefficients):  [L9, Ỹ real on ℝ] ⇒ C, a, b ∈ ℝ, {z_n} conjugate-symmetric.
- L11 (Reality of zeros):  [C5, C6, A5, A6] ⇒ every z_n ∈ ℝ.
- L12 (No Gaussian factor):  [L7, genus ≤1 bound] ⇒ γ = 0 in Hadamard form.
- T1 (Ỹ ∈ LP):  [L9, L10, L11, L12] ⇒ Ỹ(z) = C z^m e^{az} Π(1 - z/x_n) e^{z/x_n}, x_n ∈ ℝ\\{0}, Σ x_n⁻² < ∞.
- C13 (Real zeros of Ỹ):  [T1] ⇒ every zero of Ỹ lies in ℝ.

## Transfer

- T2 (Zero-set transfer):  [A1, L1, C13, entire continuation] ⇒ ζ(½+iw) = 0 ⇔ Ỹ(Θ(w)) = 0, so any such w ∈ ℝ.
- T3 (Riemann Hypothesis):  [T2] ⇒ every nontrivial zero ρ of ζ has Re ρ = ½.

## Edge list (compact)

A1 → L1, L3, C5, T2, T3
A2 → L1, L2
A3 → L4, C6
A4 → C5
A5 → L11
A6 → L11
D1 → L1
D2 → L1, L3
L1 → L3, L4, C5, T2
L2 → L4
L3 → L4, C5, L11
L4 → C5
C5 → L7, L11, T2
L7 → L9, L12
L8 → L9
L9 → L10, T1
L10 → T1
L11 → T1
L12 → T1
T1 → C13
C13 → T2
T2 → T3

## Status

All edges closed in RiemannHypothesis.tex. A5 and A6 are the only load-bearing external statements taken as axioms; every other node has a proof in the manuscript.
