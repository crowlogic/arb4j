package arb.documentation.concepts.stochastic;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.concepts.Concept;

/**
 * <pre>
Adapted from Special Representations of Weakly Harmonizable Processes by Chang & Rao

1. Introduction
2. Factorizable Spectral Functions
3. Series Representations
4. A Moving Average Representation
5. Operator Representations
6. Spectral Support Sets
7. Acknowledgement
8. References

1. Introduction

The purpose of this article is to consider some special types of representations for second order processes 
related to different classes of harmonizable families. These include the series, moving average, and 
oscillatory representations. To make the statements precise, let us start with their standard formulations.

Thus if (Ω, Σ, P) is a probability space and L₀²(Ω, Σ, P), or L₀²(P), is the space of (equivalence classes of) 
scalar random variables on Ω with means zero and finite variances, then X : T → L₀²(P), a curve, is called 
a second order process denoted also as {Xₜ, t ∈ T}. In what follows T = ℝ (or ℤ), unless specified differently. 
Let r(⋅, ⋅) : (s, t) ↦ E(XₛXₜ), called the covariance function on ℝ × ℝ, be continuous, where
E(XₛXₜ) = (Xₛ, Xₜ) = ∫Ω XₛXₜ dP ∀ (s, t) ∈ T × T

Recall that the process {Xₜ, t ∈ ℝ} is then termed (i) (weakly) stationary if r(s, t) = ṙ(s - t) so that by
 the classical Bochner theorem 
  
                              r(s, t) = ∫ℝ eⁱ⁽ˢ⁻ᵗ⁾λ F(dλ)

for a unique positive bounded nondecreasing function F; (ii) strongly harmonizable if


                              r(s, t) = ∫ℝ ∫ℝ eⁱˢλ⁻ⁱᵗμ F(dλ, dμ)

for a positive definite F : ℝ × ℝ → ℂ of bounded variation in the sense of Vitali; and (iii) weakly harmonizable 
if (3) holds in which F is of the (weaker) bounded variation in Fréchet's sense. (See [2] or [11] on a discussion of 
these variations and a need for a new integral in the case of (iii) extending Lebesgue's classical concept.)

Some related classes are also of interest. Thus {Xₜ, t ∈ ℝ} is (a) periodically correlated if 
r(s + α, t + α) = r(s, t) for some fixed α > 0 and all s, t ∈ ℝ (α is termed a period); (b) oscillatory if 
the covariance is representable as (the Lebesgue integral) 

                                    r(s, t) = ∫ℝ eⁱ⁽ˢ⁻ᵗ⁾λ aᵍ(λ) āₜ(λ) F(dλ)

where again F is a positive nondecreasing function, defining a σ-finite measure, and {aₛ, s ∈ ℝ} is a square integrable 
(for F) collection of scalar functions on ℝ; and (c) Karhunen class if in (4) the factor eⁱ⁽ˢ⁻ᵗ⁾λ is absent. In all 
these cases the real or complex F is called the spectral (measure) function of the process. There are a few other 
second order classes of interest in applications, but we shall defer them at this point.

Under some reasonable conditions it is possible to present several series representations of these processes 
and also certain forms of moving averages for them. Since both of these are useful in many applications, we 
consider them for harmonizable families which extend the stationary classes.

2. Factorizable Spectral Functions

It is of interest to start with a subclass of harmonizable processes. They were isolated for a special study in [8]. 
Thus if {Xₜ, t ∈ ℝ} is a weakly (or strongly) harmonizable process with F(⋅, ⋅) as its spectral measure function, 
then it is termed a factorizable spectral measure (f.s.m.) class if F(s, t) = M(s)M(t). [Note that if F(s, t) = M(s)N(t) 
is assumed, it is not really different since the positive definiteness of F implies that N(s) = cM(s), for some
 c ≥ 0, s ∈ ℝ, so that M = N can be taken as a general form.] This class has some nice structural properties of which 
 the following will be used here. It is stated for the index T = ℝ, but a similar fact holds for T = ℤ.

Proposition 1. If {Xₜ, t ∈ ℝ} ⊆ L₀²(P) is a weakly harmonizable process, then the following are equivalent:

(i) the Xₜ-process is of f.s.m. class,

(ii) the covariance function r of the process is factorizable, in that
r(s, t) = f(s)f(t) for some continuous function f : ℝ → ℂ

In either of these equivalent cases, the process is necessarily strongly harmonizable and the f of (ii) is then the 
Fourier transform of some scalar measure μ on ℝ (so that f = μ̂).

Proof: Suppose (i) holds. Then F(A, B) = M(A)M(B). Since F is a bimeasure, this implies that M(⋅) is a scalar σ-additive 
set function on the Borel σ-algebra ℬ of ℝ. Thus it is a scalar measure (hence bounded). Then the covariance function r 
can be written as (cf. (3)):
r(s, t) = ∫ℝ ∫ℝ eⁱˢλ⁻ⁱᵗμ M(dλ)M(dμ)
= ∫ℝ eⁱˢλ M(dλ) · ( ∫ℝ eⁱᵗμ M(dμ) )
= f(s)f(t) (= M(s)M(t)⁻¹)

by using a form of the Fubini theorem. So (ii) holds.

Suppose, on the other hand, that (ii) holds. Then r(s, t) = f(s)f(t), for some f. Since the process is harmonizable, 
r can be expressed as (3). For the weakly harmonizable case, the integral there must be in the sense of M. Morse and W. 
Transue Even in this general case, one can use a suitable form of the inversion formula as follows. (See [13], Thm. 3.2
 without proof; and [11], Thm. 8.2 with a detailed and different argument.) Thus 

               F(A, B) = lim₍₀ ₜ₁, ₜ₂ → ∞₎ ∫₋ₜ₁₋ₜ₂ e⁻ⁱˡ₋ᵃ₁⁻ⁱˡ₋ᵃ₂ eⁱλ₋ᵃ₁ eⁱλ₋ᵃ₂ r(s, t) dsdt
               
where A = (λ₁, λ₂), B = (λ₁', λ₂') are intervals of ℝ such that F({λ₁}, {λ₁'}) = 0 = F({λ₂}, {λ₂'}). Substituting 

                          r(s, t) = f(s)f(t) 
                          
in (5), this reduces to F(A, B) = M(A)M(B) for a suitable M(⋅).

Since F is a bimeasure, this shows that M(⋅) is σ-additive on the class of all such intervals which are also continuity 
intervals of M(⋅). But then the standard theory says that M(⋅) has a unique σ-additive extension to be a scalar measure on ℬ, 
so that the process is of f.s.m. class and (i) obtains.

When these equivalent conditions hold, F(A, B) = M(A)M(B), and hence has a unique extension to be a bounded Borel (scalar) 
measure on the Borel sets of ℝ × ℝ. But this means (3) is a Lebesgue integral and the process is strongly harmonizable.
This implies that the f.s.m. class ⊆ strongly harmonizable class. The above result illuminates an interesting connection
between the harmonizable and the periodically correlated classes. While introducing and analyzing the latter class, 
Gladyšev [3] has shown that every periodically correlated sequence {Xₙ, -∞ < n < ∞} is necessarily strongly harmonizable.
However, a continuous parameter periodically correlated process need not even be weakly harmonizable. This also follows 
from Proposition 1. Indeed let f : ℝ → ℂ be a periodic continuous function having only a conditionally convergent Fourier
series. For instance such a function may be constructed as follows. Let φ : [0, 2π] → ℝ be the classical Cantor function
and define 𝑓̃ : [0, 2π] → ℝ by the equation 𝑓̃(x) = φ(x) - (x / 2π), and extend it to ℝ by periodicity. If this extended 
function is f, then it will be a candidate. Let r(s, t) = f(s)f(t). Then r(⋅, ⋅) is clearly a covariance function of a 
periodically correlated Gaussian process with mean zero. But it cannot be weakly harmonizable, since otherwise by the 
above proposition f = μ̂ for a scalar measure which must then have an absolutely convergent Fourier series. This fact
was first noted for an example in [4]. It is also not hard to construct examples of periodically correlated weakly harmonizable
processes that are not strongly harmonizable by considering a bimeasure F in (3) which determines a σ-finite but nonfinite 
measure on ℝ × ℝ. One such simple example is also given in [4]. The point of this paragraph is to draw the attention of the
reader to a significant distinction between certain discrete and continuous parameter harmonizable processes in their structures.

3. Series Representations

Turning to some other aspects, we recall that every (weakly or strongly) harmonizable process is of Karhunen class (cf. [2], Cor.
 7.6, and also p. 77, Eqs. (85) and (86) for a second proof). One of these proofs actually uses a series representation in its 
 demonstration. There are several such expansions and we shall present a “natural” series representation of (weakly) harmonizable
processes using its spectral domain properties, and another type later on.

Consider a weakly harmonizable process {Xₜ, t ∈ ℝ} with its spectral measure function F. Then the integral in (3) relative to 
F is defined and termed a “strict” MT-integral in [2], and denoted 

                                    r(s, t) = ∫ℝ² eⁱˢλ⁻ⁱᵗμ F(dλ, dμ)
                                    
and it reduces to the standard Lebesgue integral when F has finite Vitali variation. The spectral domain of the process is denoted as:

L²* (F) = {f measurable : ∫ℝ² f(λ)f(μ) F(dλ, dμ) = (f, f)F < ∞}.

Evidently eₛ ∈ L²* (F) and (eₛ, eₜ)F = r(s, t) where eₛ(λ) = eⁱˢλ.

It is easy to verify that (⋅, ⋅)F is a semi-inner product and that L²* (F) is a vector space. However, it is also true but nontrivial 
that {L²* (F), (⋅, ⋅)F} is a complete (semi-)inner product space; and the proof uses several results of the structure theory of 
harmonizable processes (cf. [2], p. 76). Even in the strongly harmonizable case the completeness proof is nontrivial. Thus 
if ℕ = {f : (f, f)F = 0} and L² (F) = L²* (F) / ℕ is the quotient space, let 𝑓̃ᵢ = fᵢ + ℕ, i = 1, 2. Set (𝑓̃₁, 𝑓̃₂)F = (f₁, f₂)F
Then {L² (F), (⋅, ⋅)F} is a Hilbert space and if ℋ(X) = sp{Xₜ, t ∈ ℝ} ⊆ L₀²(P) is the closed linear span, then the 
correspondence τ : 𝑓̃ ↦ ∫ℝ fdZ (∈ ℋ(X)), sets up an isometric isomorphism between L² (F) and ℋ(X). Here Z(⋅) is the stochastic
 measure representing the Xₜ process so that

                  Xₜ = ∫ℝ eⁱᵗλ Z(dλ) ∀ t ∈ ℝ

where the integral is taken in the Dunford-Schwartz sense (cf. [2]). Since the covariance function r of (6) is continuous, it is
known from prior results that ℋ(X) is separable and, due to the isometry noted above, so is L² (F). Let {fₙ, n ≥ 1} ∈ L² (F) be
any complete orthonormal sequence. If 𝑓̃ₙ = fₙ + ℕ and

                              ξₙ = ∫ℝ fₙ(λ) Z(dλ) ( = τ(𝑓̃ₙ) )

then {ξₙ, n ≥ 1} ∈ ℋ(X) is also a complete orthonormal sequence. With this setup we can establish the following result which extends
a similar one for the strongly harmonizable case in [1]. However, the latter authors assumed implicitly the completeness of L² (F),
and this property was not established until recently.

Proposition 2. Let {Xₜ, t ∈ ℝ} be a weakly harmonizable process with L² (F) as its spectral domain. If {𝑓̃ₙ, n ≥ 1} is a complete 
orthonormal set in L² (F) and {ξₙ, n ≥ 1} the corresponding set in ℋ(X) = sp{Xₜ, t ∈ ℝ} ⊆ L₀²(P), then
Xₜ = ∑ₙ₌₁ ∞ aₙ(t) ξₙ, t ∈ ℝ
where aₙ(t) = (eₜ, fₙ)F, n ≥ 1, 𝑓̃ₙ = fₙ + ℕ.

Proof: Since τ : L² (F) → ℋ(X) is an isometric isomorphism and τ(𝑓̃ₙ) = ξₙ, one has
(ξₙ, ξₘ) = (τ(𝑓̃ₙ), τ(𝑓̃ₘ)) = (fₙ, fₘ)F = δₘₙ.
Expanding Xₜ in a Fourier series in ℋ(X), we get (11) immediately with the coefficients aₙ(t) given by
aₙ(t) = (Xₜ, ξₙ) = (Xₜ, τ(𝑓̃ₙ)) = (τ*(Xₜ), fₙ)F
with τ* being the adjoint of
τ = (eₜ, fₙ)F
since τ*(Xₜ) = eₜ. This is precisely the assertion. ■

It is natural to ask for a Karhunen-Loève type expansion (cf. [5], p. 64) for harmonizable processes. However, the covariance function 

r : ℝ × ℝ → ℂ of such a process, being bounded and continuous, is not necessarily square integrable on ℝ × ℝ, and here one needs to alter 
slightly the above type series representation. But with such a modification one can present a result for a somewhat general class including 
all harmonizable families as follows.

Let {Xₜ, t ∈ T} ⊆ L₀²(P), T ⊆ ℝ, be a process with a bounded continuous covariance function r. Let
ṙ(s, t) = √(r(s, t) / (1 + s²) (1 + t²))
Then ṙ is also continuous and positive definite. The first being obvious, the second property is seen from the fact that for any 
continuous φ : ℝ → ℂ with compact support, one has
∫ℝ ∫ℝ ṙ(s, t) φ(s) φ(t) dsdt = ∫ℝ ∫ℝ r(s, t) φ(s) φ(t) dsdt ≥ 0
since r is positive definite and φ(s) / (1 + s²) is integrable. If Ẋₜ = Xₜ / √(1 + t²), then Ẋₜ ∈ L₀²(P), E(Xₛ Ẋₜ) = ṙ(s, t), and
 what is decisive, ṙ is square integrable on ℝ × ℝ, if r is bounded. In this case the operator A defined by
(Af)(s) = ∫ℝ ṙ(s, t) f(t) dt
is completely continuous on the standard Lebesgue space L²(ℝ), and has a complete set of (orthonormal) eigenfunctions corresponding
 to its eigenvalues λᵢ ≥ 0 (cf. [12], p. 243) so that Aφᵢ = λᵢφᵢ. We then have the following representation:

Proposition 3. Let {Xₜ, t ∈ T} ⊆ L₀²(P) be a process with a bounded continuous covariance function r. [In particular, this is automatic 
if the process is weakly or strongly harmonizable.] If ṙ : (s, t) ↦ r(s, t) / [(1 + s²) (1 + t²)] and λᵢ (≥ 0) are its eigenvalues and φᵢ
 are the corresponding normalized eigenfunctions, then {ξₙ, n ≥ 1} defined (as a Bochner or stochastic integral) by
ξₙ = λₙ⁻¹/² ∫ℝ Xₜ φₙ(t) (1 + t²)⁻¹/² dt
form a complete orthonormal set in ℋ(X) = sp{Xₜ, t ∈ T} ⊆ L₀²(P), and one has
Xₜ = ∑ₙ₌₁ ∞ √(λₙ) φₙ(t) (1 + t²)¹/² ξₙ
the series converging in ℋ(X)-mean.

Proof: If Ẋₜ = Xₜ / √(1 + t²), then E(Xₛ Ẋₜ) = ṙ(s, t) and using (12) and the classical Hilbert-Schmidt theory, we get
ṙ(s, t) = ∑₍ᵢ₌₁⁾ ∞ λᵢ φᵢ(s) φᵢ(t) ∀ λᵢ ≥ 0
the series converging in mean (and uniformly also). If we take F(⋅) to be the function which increases by jumps of size λᵢ at i ≥ 0 and vanishing on the negative line, and aₛ(v) = φᵢ(s) for v = i, and = 0 elsewhere in (4), without the exponential term, then (15) can be expressed as
ṙ(s, t) = ∫ℝ aₛ(v) āₜ(v) F(dv) ∀ s, t ∈ T × T
so that {Ẋₜ, t ∈ T} is a Karhunen process relative to {aₛ(⋅), s ∈ T}. Then it may be represented as
Ẋₜ = ∫ℝ aₜ(v) Z(dv) ∀ t ∈ T
where Z(⋅) is a stochastic measure with orthogonal values in L₀²(P), and E(Z(A)Z(B)) = F(A ∩ B) (cf. [5], p. 59; or [2], p. 55). If now we set Z({i}) = ξᵢ √(λᵢ) where ξₙ is given by (13), then (17) becomes
Ẋₜ = ∑ₙ₌₁ ∞ √(λₙ) φₙ(t) ξₙ
the series converging in ℋ(X). Since Xₜ = Ẋₜ (1 + t²)¹/², this gives (14). ■

Remark: If T is a compact set, then no factor such as [(1 + s²) (1 + t²)]⁻¹/² is needed in the above development, since the classical Mercer theorem applies and yields the expansion (15) for r. In the noncompact case, Mercer's theorem is no longer available and some such positive factor seems necessary to invoke the Hilbert-Schmidt result.

4. A Moving Average Representation

Another expression used in the stationary case is the moving average representation. Following the classical case (cf. [5], p. 79) one terms a Karhunen type process {Xₜ, t ∈ ℝ} ⊆ L₀²(P) to have a moving average representation if it is of the form
Xₜ = ∫ℝ g(t - u) Z(du) ∀ t ∈ ℝ
where Z(⋅) is a stochastic measure and ḡ(t - ⋅) ∈ L²(F) for each t. Here F is the spectral measure such that F(A, B) = E(Z(A)Z(B)). If Z(⋅) has orthogonal values in L₀²(P) then this reduces to the classical (stationary) case when F is moreover the Lebesgue measure. Here we consider again that Z(⋅) is an arbitrary stochastic measure in L₀²(P), and find conditions on g in order that the Xₜ-process is weakly harmonizable.

The following strong conclusion is somewhat unexpected.

Theorem 4. Let {Xₜ, t ∈ ℝ} be a process of the form (18) with g = ḟ, where f ∈ L¹(ℝ) and Z is a stochastic measure with values in L₀²(P). Then the process is strongly harmonizable and its spectral measure is absolutely continuous relative to the planar Lebesgue measure.

Proof: Since g = ḟ in (18), and hence g is bounded, it follows that the integral is well defined as a Dunford-Schwartz integral, and some of it properties will be used. Thus, since a form of the Fubini theorem is available here (cf. [11], p. 317 for detailed reasons), one has
Xₜ = ∫ℝ ḟ(t - u) Z(du)
= ∫ℝ Z(du) ( ∫ℝ eⁱ(ₜ⁻ᵤ)λ f(λ) dλ )
= ∫ℝ eⁱᵗλ f(λ) ( ∫ℝ e⁻ⁱᵤλ Z(du) ) dλ
= ∫ℝ eⁱᵗλ f(λ) Ỹ(λ) dλ,

where {Ỹ(λ), λ ∈ ℝ} is a weakly harmonizable process by ([2], Prop. 6.4), and the integral now becomes a Bochner integral. Let Z̃ : A ↦ ∫ₐ Ỹ(t) f(t) dt, A ∈ ℬ. Then Z̃ is a stochastic measure on the Borel sets ℬ of ℝ, and one has
E(Z̃(A)Z̃(B)) = ∫ₐ ∫₆ E(Ỹ(s)Ỹ(t)) f(s)f(t) dsdt
= ∫ₐ ∫₆ r_Y(s, t) f(s)f(t) dsdt
= ν(A, B) (say)

Here r_Y is the covariance function of the Ỹ-process and is bounded. So ν(⋅, ⋅) has finite Vitali variation, and (19) can be written, with the properties of the Bochner integral, as
Xₜ = ∫ℝ eⁱᵗλ Z̃(dλ) ∀ t ∈ ℝ.
Consequently {Xₜ, t ∈ ℝ} is strongly harmonizable.

Finally we may calculate the covariance function of Xₜ as
r(s, t) = E(XₛXₜ)
= ∫ℝ ∫ℝ eⁱˢλ⁻ⁱᵗλ' ν(dλ, dλ')
= ∫ℝ ∫ℝ eⁱˢλ⁻ⁱᵗλ' r_Y(λ, λ') f(λ)f(λ') dλ dλ'
Thus ν(⋅, ⋅) is absolutely continuous relative to the Lebesgue measure on ℝ × ℝ, being a Borel measure. ■

Remarks: 1. It is easily shown that ∥ ∫ℝ Xₜ h(t) dt ∥₂ ≤ K₀ · ∥ h ∥∞, for each h ∈ L¹(ℝ) and this implies the (V-boundedness and so equivalently) weak harmonizability of the Xₜ-process (cf. [11], Thm. 4.2). But the above stronger conclusion needs additional work, and the given demonstration seems to be the shortest.

2. If Z(⋅) has orthogonal increments with an absolutely continuous spectral measure (i.e., the stationary case), then one can prove a converse of the above result. In any event it is an extension of a classical theorem due to Karhunen (cf. [5], p. 83), and is a considerable strengthening of ([1], Thm. 4).

5. Operator Representations

We have defined the Karhunen class and the oscillatory one in Section 1. Both are of second order. The following elementary observation is useful for the ensuing work.

Proposition 5. The class of oscillatory processes {Xₜ, t ∈ T} ⊆ L₀²(P) and the class of Karhunen processes indexed by T where T = ℝ or ℤ, coincide.

Setting gₛ(λ) = eⁱˢλ aₛ(λ) in (4), s ∈ T, and λ ∈ T̂ where T̂ = ℝ or (0, 2π] accordingly as T = ℝ or ℤ respectively, in their definitions, the result follows immediately.

This simple identification enables an operator theoretical representation of mean continuous Karhunen processes indexed by ℝ or ℤ. We present this form and connect it with the (weakly) harmonizable class. This helps in gaining a better insight of these families. We shall deduce it from reformulations of essentially known results. Hereafter “operator” means “linear operator.”

Theorem 6. Let {Xₜ, t ∈ T} ⊆ L₀²(P) be a mean continuous process. Then it is representable as
Xₜ = Aₜ Uₜ Y₀, t ∈ T (T = ℝ or ℤ)
for some point Y₀ in ℋ(X) = sp{Xₜ, t ∈ T} ⊆ L₀²(P), where Aₜ is a densely defined closed operator in ℋ(X), for each t ∈ T, and {Uₛ, s ∈ T} is a weakly continuous unitary group of operators in ℋ(X) which commutes with each Aₜ, t ∈ T. If, moreover, the process is weakly harmonizable, then there is an enlarged Hilbert space 𝒦 ⊇ ℋ(X), operators Aₜ : 𝒦 → ℋ(X) and {Uₛ, s ∈ T} a weakly continuous unitary group on 𝒦, Y₀ ∈ 𝒦, such that {Aₜ, t ∈ T} restricted to ℋ(X) is a weakly continuous contractive positive definite family satisfying A₀ = identity on ℋ(X). [Here positive definiteness means that for any hᵢ ∈ ℋ(X), tᵢ ∈ T, i = 1, ..., n,
∑₍ᵢ₌₁⁾ⁿ ∑₍ⱼ₌₁⁾ⁿ (Aₜᵢ₋ₜⱼ hᵢ, hⱼ) ≥ 0 ∀ n ≥ 1.

On the other hand a process defined by (21) is always weakly harmonizable if only {Aₜ, t ∈ T} is a weakly continuous positive definite contractive family of operators there, with A₀ = identity, as above.

Proof: This result is obtained from several known, but deep, facts and we include its essential details for completeness.

Since the process is mean continuous, ℋ(X) is separable and so {Xₜ, t ∈ T} is of Karhunen class relative to a family {gₜ, t ∈ T̂ } and a Borel measure μ. By the preceding proposition, replacing gₜ' with eⁱᵗ(⋅) gₜ, we may express this as (T̂ denoting the dual group of T):
Xₜ = ∫T̂ eⁱᵗλ gₜ(λ) Z(dλ) ∀ t ∈ T
where Z(⋅) is an orthogonally valued σ-additive set function in ℋ(X) from the Borel σ-algebra of T̂. Here E(Z(A)Z(B)) = μ(A ∩ B) and ∫T̂ |gₜ(λ)|² μ(dλ) < ∞. But then the Yₜ-process defined by
Yₜ = ∫T̂ eⁱᵗλ Z(dλ) ∀ t ∈ T
is stationary; so, as is well known, there is a weakly continuous group of unitary operators {Uₜ, t ∈ T} on ℋ(X) such that Yₜ = Uₜ Y₀. Also by the spectral theorem for this family of operators (cf. [12], p. 281 and p. 383)
Uₜ = ∫T̂ eⁱᵗλ E(dλ) ∀ t ∈ T
where {E(⋅), ℬ} is the resolution of the identity of the {Uₜ, t ∈ T}, with ℬ as the Borel σ-algebra of T̂. Thus Z(A) = E(A) Y₀, A ∈ ℬ. Now define
Aₜ = ∫T̂ gₜ(λ) E(dλ)
Since μ(ℬ) = (E(B) Y₀, E(B) Y₀) and ∫T̂ |gₜ(λ)|² μ(dλ) < ∞, it follows from standard results of the functional calculus in Hilbert space that Aₜ is a closed densely defined operator in ℋ(X) and its domain contains {Yₛ, s ∈ T} for each t. Since Uₜ and E(B) commute for all t and B, we deduce that Aₜ and E(B), B ∈ ℬ commute. It then follows that Aₜ and {Uₛ, s ∈ T} commute for each t (cf. [12], p. 351) and one has
Aₜ Uₜ Y₀ = Aₜ (∫T̂ eⁱᵗᵥ E(dv) Y₀)
= ∫T̂ gₜ(λ) E(dλ) (∫T̂ eⁱᵗᵥ E(dv) Y₀)
= ∫T̂ eⁱᵗλ gₜ(λ) E(dλ) Y₀
= ∫T̂ eⁱᵗλ gₜ(λ) Z(dλ) = Xₜ

by (25) and a property of the spectral integral(22). Thus the representation (21) holds.

On the other hand, if Xₜ is given by (21), with Aₜ and {Uₛ, s ∈ T} commuting for each t ∈ T, so that Aₜ and {E(B), B ∈ ℬ} also commute, one concludes from a deep theorem of von Neumann and F. Riesz (cf. [12], p. 351 again, and the footnote there) that Aₜ is a function φₜ of Uₜ. It follows with the spectral theorem that
Aₜ = φₜ(Uₜ) = ∫T̂ φₜ(λ) E(dλ)
Consequently one has
Xₜ = Aₜ (Uₜ Y₀) = ∫T̂ φₜ(λ) E(dλ) ∫T̂ eⁱᵗᵥ E(dv) Y₀
= ∫T̂ eⁱᵗλ φₜ(λ) E(dλ) Y₀
= ∫T̂ eⁱᵗλ φₜ(λ) Z(dλ).
If we set gₜ'(λ) = eⁱᵗλ φₜ(λ), μ(B) = (E(B) Y₀, E(B) Y₀), then the above stated properties imply that gₜ' ∈ L²(T̂, ℬ, μ), so that the process {Xₜ, t ∈ T} is of Karhunen class.

For the last part since each weakly harmonizable process is of Karhunen class, it admits the representation (21), but now with special properties for {Aₜ, t ∈ T}. Let Qₜ = Aₜ Uₜ. Then by a known result (cf. [11], p. 330), {Qₜ, t ∈ T} must be positive definite, weakly continuous and contractive. Since {Uₜ, t ∈ T} is a unitary group which is weakly continuous, it follows that {Aₜ, t ∈ T} must also be contractive and weakly continuous. To see that it is also positive definite, let {h₁, ..., hₙ} ⊆ ℋ(X) be an arbitrary set and t₁, ..., tₙ be any points of the additive group T, n ≥ 1. Then letting vᵢ = Uₜᵢ* hᵢ ∈ ℋ(X), we have
0 ≤ ∑₍ᵢ₌₁⁾ⁿ ∑₍ⱼ₌₁⁾ⁿ (Qₜᵢ₋ₜⱼ vᵢ, vⱼ) since Qₜ is positive definite
= ∑₍ᵢ₌₁⁾ⁿ ∑₍ⱼ₌₁⁾ⁿ (Aₜᵢ₋ₜⱼ Uₜᵢ* hᵢ, Uₜⱼ* hⱼ)
= ∑₍ᵢ₌₁⁾ⁿ ∑₍ⱼ₌₁⁾ⁿ (Uₜᵢ* Aₜᵢ₋ₜⱼ hᵢ, Uₜⱼ* hⱼ) since Uₜ* and Aₛ also commute as do Uₜ and Uₛ
= ∑₍ᵢ₌₁⁾ⁿ ∑₍ⱼ₌₁⁾ⁿ (Aₜᵢ₋ₜⱼ hᵢ, hⱼ).
This establishes the asserted property of the {Aₜ, t ∈ T}. Note that from the fact [11] that Q₀ on ℋ(X) is also identity, we obtain that A₀ U₀ = A₀ is identity as well.

In the opposite direction the result depends on an important theorem of Grothendieck. If Aₜ : 𝒦 → ℋ(X) has the stated properties, then Qₜ = Aₜ Uₜ is positive definite and satisfies the hypothesis of the converse part of ([11], p. 330). Hence a process defined by (21) is weakly harmonizable. This finishes the essential details of all the assertions. ■

Remarks: 1. As mentioned before, the first part in an equivalent form is already given in [9], and the last part in [11]. Both results obviously depend on some deep facts in abstract analysis. The simple Proposition 5 is used in an essential way in obtaining the representation (21) which thus gives an operator representation of Karhunen processes indexed by T. The same result extends if T is replaced by a locally compact abelian group when ℋ(X) is assumed separable in addition.

2. If in (4) we set s = t, then
var Xₜ = r(t, t) = ∫ℝ |aₜ(λ)|² F(dλ) = ∫ℝ μₜ(dλ)
where μₜ(A) = ∫A |aₜ(λ)|² F(dλ) (taking T = ℝ for simplicity). This function, depending on t, is termed an “evolving spectrum” in time, by Priestley [10]. Since gₜ(λ) = eⁱᵗλ aₜ(λ) can be oscillatory for each t, the process Xₜ which necessarily has the representation (cf. [2], p. 55):
Xₜ = ∫ℝ eⁱᵗλ aₜ(λ) Z(dλ) ∀ t ∈ ℝ
is termed an oscillatory process. In [10], the aₜ-family is normalized so that a₀(λ) = 1, all λ, based on some natural reasons motivated by applications. (It was further assumed that aₜ(⋅) is the Fourier transform of some Hλ(⋅) of bounded variation such that |Hλ(0)| has a maximum.) The point of (29) is that Z(⋅) has orthogonal values and the form suggests a parallel development of the ideas (and interpretations) of the global stationary theory, locally at t if aₜ(⋅) is slowly varying. In any case, for the general representation theory one need not place these restrictions, but the specializations can be useful in estimation and inference theory itself, as indicated in [10].

3. As Proposition 5 also implies, the representation (21) of a Karhunen process is not unique. The preceding sections show that several other (series type) representations are possible.

6. Spectral Support Sets

Finally we consider briefly the support sets of spectral bimeasure functions of the (subclass) periodically correlated weakly harmonizable processes. Also as implied by Proposition 1, a clear distinction emerges between the continuous and discrete parameter cases. This may be anticipated from the work of [3] and [4].

The result to be given here is a generalization of one for the strongly harmonizable case found in [6]. First we need to state the concept of “support” precisely. A set Sβ ⊆ ℝ × ℝ is called the support of a bimeasure β, if it consists of points (x, y) ∈ ℝ × ℝ such that for each neighborhood U₁ × U₂ of (x, y), the variation function |β|(U₁, U₂) ≠ 0. Thus Sβ is the smallest closed set off of which β vanishes identically. We can now state the desired extension in the following:

Proposition 7. Let {Xₜ, t ∈ ℝ} ⊆ L₀²(P) be a weakly harmonizable and periodically correlated process with period α > 0 so that its covariance function r satisfies r(s + α, t + α) = r(s, t) for all (s, t) ∈ ℝ × ℝ. Then the support of the spectral bimeasure F of the process is contained in
S_F = {(λ₁, λ₂) ∈ ℝ × ℝ: λ₁ - λ₂ = 2πk / α, k ∈ ℤ}.
Conversely if the support of the bimeasure F of a weakly harmonizable process lies in S_F of (30), then it is periodically correlated.

Proof: Since a discrete parameter periodically correlated process is always strongly harmonizable (cf. [3]) and the strong case was treated in [6], we only need to consider the continuous parameter weakly harmonizable case. We establish the result using an approximation procedure.

From the structure theory it is long known that each weakly harmonizable process Xₜ is a limit in L₀²(P) of a sequence of strongly harmonizable processes Xₜⁿ, uniformly for t in compact subsets (cf. e.g., [11], Thm. 4.4, and reference to related works of others). This implies in particular that, if rₙ and r are the covariance functions of the approximant and the given processes, then
limₙ rₙ(s, t) = r(s, t)
uniformly for (s, t) ∈ K × K where K ⊆ ℝ is compact. Now since r is periodic, with period α, we assert that rₙ is also periodic with period α, for all large enough n. To see this, suppose it is not true. Then there is an ε > 0, and a point (s, t) ∈ ℝ × ℝ, such that
liminfₙ |rₙ(s + kα, t + kα) - rₙ(s, t)| > ε
for some k ∈ ℤ - {0}. But since r(s + kα, t + kα) = r(s, t) and (31) holds uniformly on the two point (hence compact) set K = {(s, t), (s + kα, t + kα)} we get from (31)
0 < ε
< |rₙ(s + kα, t + kα) - rₙ(s, t)|
≤ |rₙ(s + kα, t + kα) - r(s, t)| + |r(s + kα, t + kα) - r(s, t)| + |r(s, t) - rₙ(s, t)|
→ 0
for large enough n, giving a contradiction. Hence we can take Xₜⁿ to be also periodically correlated in addition.

Let Fₙ and F be the spectral measures of rₙ and r. We assert that Fₙ(A, B) → F(A, B) for any Borel sets A, B. Since there is no Helly-Bray type result, we cannot use the representation (3) directly to obtain this result. The following alternative argument can be given in its place. Indeed, the Xₜⁿ-processes can be obtained, to satisfy (31), as
Xₜⁿ = ∑₍ₖ₌₁⁾ⁿ φₖ (Xₜ, φₖ) ∀ n ≥ 1
where {φₖ, k ≥ 1} is a complete orthonormal system of the separable space ℋ(X) of the Xₜ-process. Then Xₜⁿ ∈ ℋ(X) and Xₜⁿ → Xₜ in L₀²(P)-mean, uniformly for t in compact sets of ℝ. Let ℓₖ : Y → (Y, φₖ), Y ∈ ℋ(X), be the linear functional on ℋ(X). If ζₙ and Z are the representing stochastic measures of Xₜⁿ- and Xₜ-processes, then (cf. [11], p. 319) (33) gives
ζₙ(⋅) = ∑₍ₖ₌₁⁾ⁿ φₖ ℓₖ (Z(⋅)), and Fₙ(A, B) = (ζₙ(A), ζₙ(B)).
In particular, since ℓₖ(Z(A)) = (Z(A), φₖ), it follows from the Parseval's equation that
Z(A) = limₙ ζ(A), in mean.
This immediately gives
F(A, B) = (Z(A), Z(B)) = limₙ (ζₙ(A), ζₙ(B)) = limₙ Fₙ(A, B).

Conversely, if the support of F is in S_F, since (35) always holds irrespective of periodicity, then for all large enough n, the support of Fₙ, S_Fₙ, satisfies S_Fₙ ⊆ S_F. But then by the converse part of the result of [6], Xₜⁿ is periodically correlated and strongly harmonizable. Since (31) holds, it follows that r is periodic so that Xₜ-process is also periodically correlated, as asserted. ■
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface HarmonizableRandomProcess extends Concept
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.correlationTheoryOfStationaryRandomProcesses.referToChapters("26.4"),
                     Bibliography.stationaryAndRelatedStochasticProcesses.referToChapters("8.3"),
                     Bibliography.stochasticProcessesInferenceTheory.referToChapters("4.3 p.181"));
  }

}
