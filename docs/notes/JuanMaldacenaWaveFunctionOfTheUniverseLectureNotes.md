# The Wave Function of the Universe: From Hartle-Hawking to Nearly de Sitter Gravity

## Introduction

This document examines the wave function of the universe, building upon foundational work by Hartle and Hawking, and extends the analysis to nearly de Sitter gravity in two dimensions. The research is based on collaborative papers and explores both classical and quantum aspects of cosmological wave functions.

When performing a small coupling or semi-classical expansion in gravity, the resulting expressions should correspond to a WKB-like approximation to a wave function of the universe. This wave function can be conceptualized as the positive frequency component of a solution to a Klein-Gordon-type equation—specifically, the Wheeler-DeWitt equation:

$$
\hat{H} \Psi = 0
$$

where $\hat{H}$ represents the Hamiltonian constraint of quantum gravity. While the precise form of this equation in full quantum gravity remains unknown, semi-classical gravity should provide an approximation of this general type.

## The Hartle-Hawking Proposal

### Fundamental Framework

The Hartle-Hawking proposal addresses the multiplicity of possible solutions by selecting both a classical solution and a wave function for quantum fluctuations around that classical solution, denoted as $\psi_{\text{Schrödinger}}$. This component corresponds to quantum fluctuations obeying a first-order Schrödinger-like equation on the original background.

The Hartle-Hawking construction proceeds as follows:
1. Specify a boundary three-geometry.
2. Fill it using both Lorentzian and Euclidean geometry components.
3. Create a geometry with mixed Euclidean and Lorentzian signatures.

This approach draws inspiration from the $i\epsilon$ prescription in quantum field theory, where vacuum selection requires brief evolution into Euclidean time. By allowing Euclidean time evolution, the possibility emerges of closing the universe and obtaining a prediction for the universal wave function.

### Wave Function Evaluation

When evaluating the wave function through this method, the result shows that its square is proportional to the de Sitter entropy:

$$
|\Psi|^2 \propto e^{S_{\text{dS}}}
$$

where $S_{\text{dS}} = \frac{\pi L^2}{G}$ represents the de Sitter entropy.

The most conservative interpretation claims this captures the positive frequency component of the asymptotic wave function—the wave function in the far future for very large spaces. This interpretation aligns with established results in AdS/CFT correspondence.

### Fluctuation Predictions

The Hartle-Hawking wave function produces correct fluctuation predictions, demonstrated through calculations of probability amplitudes for spacetime boundary wiggles. These probabilities match exactly those obtained from the standard de Sitter vacuum (Bunch-Davies vacuum).

Critical to these calculations is the requirement that the interpolating geometries be complex. The evolution to Euclidean time imposes a positive frequency condition ensuring proper behavior of fluctuations. The complex nature proves essential because the evaluation involves $e^{iS}$. Real geometries would yield pure phases independent of fluctuations, whereas the actual result is Gaussian and suppressed for large amplitudes.

## Phenomenological Problems

### The Curvature Problem

The Hartle-Hawking wave function faces a well-documented phenomenological challenge, particularly apparent in the inflationary context where small fluctuation predictions are compared with observational data.

Consider the probability calculation for uniform curvature in the universe. Observational data indicates the universe has a radius of curvature exceeding approximately $80$ gigaparsecs today. Evolving this distance back to the inflation epoch, it crosses the horizon at time $\phi_*$, where the universe can be approximated as de Sitter.

The probability comparison between universes of different radii yields:

$$
\frac{P(R_1)}{P(R_2)} \propto \exp\left[-\frac{3\pi}{2G_{\text{eff}}\Delta\phi^2}(R_1^2 - R_2^2)\right]
$$

This expression exhibits enormous dependence on the universe's radius, favoring smaller universes. The exponent contains the amplitude of fluctuations measured in the cosmic microwave background, creating a concrete phenomenological problem.

## Connection to AdS/CFT

### Analogous Structures

The de Sitter problem relates closely to what can be termed the "minus Euclidean AdS problem." This connection becomes apparent through contour analysis.

The original Hartle-Hawking contour follows the red path: time increases rightward, then reverses to $t = 0$, followed by Euclidean time evolution to a configuration resembling $S^4$ where the three-geometry shrinks to nothing.

An alternative contour sets $\tau = i\pi/2 + \tilde{\tau}$. Inserting this into the metric yields:

$$
ds^2 = -L^2 \left[ -d\tilde{\tau}^2 + \cosh^2(\tilde{\tau}/L) d\Omega_3^2 \right]
$$

This represents Euclidean AdS₄ (hyperbolic space) with an additional minus sign. Despite being an analytic continuation, it provides equivalent answers to the original contour while manifesting the AdS-like problem structure more clearly.

### Renormalization Group Flow

The wave function of the universe can be expanded for large metric values as:

$$\Psi[g_{ij}] = e^{-\frac{1}{G}\int \sqrt{g}} \cdot e^{-\frac{1}{G}\int \sqrt{g}R} \cdots Psi_{\text{finite}}[g_{ij}]$$

Introducing a UV wave function 

$$\Psi_{\text{UV}}[g_{ij}; G_0]$$

depending on parameter $G_0$ as an asymptotic boundary condition, one can construct the decreasing solution encoding the renormalization group trajectory.

The CFT partition function emerges as the inner product:

$$Z_{\text{CFT}} = \langle \Psi_{\text{UV}} | \Psi_{\text{IR}} \rangle_{\text{KG}}$$

where the Klein-Gordon inner product is evaluated on a super-space slice. The independence of this result from slice choice manifests renormalization group invariance.

## Nearly de Sitter Gravity in Two Dimensions

### Model Construction

Nearly dS₂ gravity provides a simplified context for studying universal wave functions. This theory emerges as a limit of four-dimensional computations, analogous to how nearly AdS₂ gravity arises from near-extremal black holes.

The action contains:

$$
S = S_{\text{top}} + S_{\text{Schwarzian}}
$$

where:
- $S_{\text{top}}$ contributes only to entropy,
- $S_{\text{Schwarzian}}$ represents the Jacobi action of reparametrization.

After integrating over $\phi$ and fixing the metric to dS₂, the action reduces to:

$$
S = \gamma \ell + C \int d\tau \{f, \tau\}
$$

where $\{f, \tau\}$ denotes the Schwarzian derivative:

$$
\{f, \tau\} = \frac{f'''}{f'} - \frac{3}{2}\left(\frac{f''}{f'}\right)^2
$$

### Wave Function Calculations

In pure JT theory, the wave function contains:
1. A contribution from half the de Sitter entropy,
2. A piece proportional to boundary length,
3. A component from evaluating the Schwarzian action on the classical solution.

$$
\Psi \propto e^{S_{\text{dS}}/2} \cdot e^{-\gamma \ell/2} \cdot e^{-C \int \{f_{\text{cl}}, \tau\}}
$$

Quantum mechanically, integrating over fluctuations produces a factor $\ell^{-3/2}$, similar to previous Schwarzian quantization results but with an additional factor of $i$.

The wave function squared yields:

$$
|\Psi|^2 \propto \frac{1}{\ell^3} e^{S_{\text{dS}}}
$$

demonstrating how quantum corrections modify the classical result.

### Matter Field Corrections

Matter fields propagating in dS₂ allow computation of gravitational corrections through Schwarzian mode propagators. These encode effects such as universe expansion modification due to massive particle creation, captured by correlator modifications:

$$
\langle O_1(\tau_1) O_2(\tau_2) \rangle_{\text{corrected}} = \int [Df]\, e^{iS_{\text{Schwarzian}}[f]} \langle O_1(f(\tau_1)) O_2(f(\tau_2)) \rangle_{\text{matter}}
$$

## Topological Contributions and Matrix Models

### Sum Over Geometries

Following the approach of Saad, Shenker, and Stanford for AdS₂, one can consider contributions from various geometries in the dS₂ case. While naively requiring positive curvature geometries (only $S^2$), the inclusion of overall minus signs in metrics provides additional contributions.

All geometries with overall metric minus signs formally possess positive curvature while maintaining identical moduli spaces. The sum over topologies yields:

$$
Z = \int [d\text{moduli}]\, e^{iS[\text{geometry}]}
$$

with the same $S^3$ dependence as the AdS₂ case, requiring only the replacement $\beta \to -i\ell$.

### Matrix Model Interpretation

The completion of topological sums suggests description by a matrix integral, though the interpretation of this matrix in the dS₂ context remains unclear. This similarity to the AdS₂ case provides a solvable dS₂ theory where all calculations become tractable.

## Cosmological Wormholes and Density Matrices

### Beyond Pure States

Standard Hartle-Hawking calculations yield pure state wave functions. However, the same logic naturally extends to density matrix calculations by connecting bra and ket geometries through Euclidean evolution.

This "bra-ket identification" appears exotic but parallels conventional thermal state production in quantum field theory, providing inspiration from thermal field theory.

### Nearly AdS₂ Example

In nearly AdS₂ gravity, the double cone geometry provides a concrete example of such contributions. This can be interpreted as either two entangled universes or a single universe density matrix contribution:

$$
\rho(\ell_1, \ell_2) = Z_{\text{double cone}}(\ell_1, \ell_2)
$$

After appropriate analytic continuations accounting for bra-ket sign differences, this yields a Hermitian density matrix with the peculiar feature of diverging when the two lengths are equal.

### Motivation for Cosmological Wormholes

Even if the universe possesses a pure state wave function, observations necessarily involve tracing over unobserved regions, yielding density matrices for observable portions.

In potential dS/CFT correspondence, each wave function corresponds to a field theory. Tracing operations couple these field theories, and in AdS contexts, such couplings can generate wormholes connecting associated geometries.

Additionally, cosmological observations may lack precision to determine all theoretical couplings, naturally suggesting averaging procedures over both unobserved regions and coupling parameters.

## Conclusions and Open Questions

This analysis has reviewed several aspects of the Hartle-Hawking wave function while introducing improvements to the AdS/CFT renormalization group flow picture. The nearly dS₂ gravity framework enables perturbative quantum gravity calculations, with topological sums identical to those considered by Saad, Shenker, and Stanford.

The work suggests natural expectations for cosmological wormholes, though concrete examples beyond the de Sitter static patch remain elusive. The phenomenological problems of the Hartle-Hawking approach persist, requiring either resolution through deeper understanding or alternative approaches to the cosmic wave function.

**Key open questions include:**
- Resolution of the phenomenological curvature problem,
- Interpretation of matrix models in dS₂ contexts,
- Direct computation methods for observed universe density matrices,
- Physical meaning of cosmological wormhole contributions.

These investigations into simplified models may provide crucial insights for addressing fundamental questions in quantum cosmology and the measure problem in eternal inflation.
