package arb.documentation.concepts.stochastic;

import java.util.stream.Stream;

import arb.documentation.Bibliography;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.Referral;
import arb.documentation.TheArb4jLibrary;
import arb.documentation.annotations.AppliesTo;
import arb.documentation.concepts.Concept;
import arb.functions.Function;

/**
 * <h3>The Karhunen-Loeve Expansion</h3>
 * 
 * Another spectral representation theorem, and one which is extensively used in
 * the sequel, is the Karhunen-Loeve expansion whereby a random process w(x, θ)
 * can be expanded in terms of a denumerable set of orthogonal random variables
 * in the form: w(x, θ) = ∑ from i₁ to ∞ of μᵢ(θ) gᵢ(x) where {μᵢ(θ)} is a set
 * of orthogonal random variables and {gᵢ(x)} are deterministic functions, which
 * can be related to the covariance kernel of w(x, θ). <br>
 * <br>
 * 
 * Note that since this equation constitutes a representation of the random
 * process in terms of a denumerable set of random variables, it may be regarded
 * as a quantization of the random process. It is important to note that this
 * equation can be viewed as a representation of the process w(x, θ) as a curve
 * in the Hilbert space spanned by the set {gᵢ(x)} expressed as a direct sum of
 * orthogonal projections in this Hilbert space whereby the magnitudes of the
 * projections on successive basis vectors are proportional to the corresponding
 * eigenvalues of the covariance function associated with the process w(x,
 * θ).<br>
 * <br>
 * 
 * Collectively, the representations discussed in the introduction of
 * {@link Bibliography#stochasticFiniteElements} can be thought of as linear
 * operators or filters acting on processes with independent increments.
 * 
 * <h4>Derivation</h4>
 * 
 * The Karhunen-Loeve expansion is an elegantly theoretical and computationally
 * appealing way to deal with measure spaces. It works by expanding functions in
 * a Fourier-like series as: w(x, θ) = ∑ from n₀ to ∞ of √λₙ ξₙ(θ) fₙ(x) where
 * {ξₙ(θ)} is said to be a set of 'random' variables to be determined, λₙ is
 * some constant, and {fₙ(x)} is an orthonormal set of deterministic basis
 * functions.
 * 
 * <h4>Spectral Covariance Representations</h4>
 * 
 * Let w(x, θ) be a random process, a function of the position vector x defined
 * over the domain D, with θ belonging to the space of random events Ω. Let
 * w̄(x) denote the expected value of w(x, θ) over all possible realizations of
 * the process, and C(x₁, x₂) denote its covariance function. <br>
 * <br>
 * By definition of the covariance function, it is bounded, symmetric, and
 * positive definite. Thus, it has the spectral decomposition: C(x₁, x₂) = ∑
 * from n₀ to ∞ of λₙ fₙ(x₁) fₙ(x₂) where λₙ and fₙ(x) are the eigenvalue and
 * the eigenfunction of the covariance kernel. And, specifically, that they are
 * the solution to the integral equation: <br>
 * <br>
 * 
 * ∫ C(x₁, x₂) fₙ(x₁) dx₁ = λₙ fₙ(x₂) over x∈D <br>
 * <br>
 * 
 * Due to the symmetry and the positive definiteness of the covariance kernel,
 * its eigenfunctions are orthogonal and form a complete set. They can be
 * normalized according to the following criterion: ∫ over D of fₙ(x) fₘ(x) dx =
 * δₙₘ where δₙₘ is the Kronecker delta. Clearly, w(x, θ) can be written as:
 * w(x, θ) = w̄(x) + α(x, θ) where α(x, θ) is a process with zero mean and
 * covariance function C(x₁, x₂). <br>
 * <br>
 * 
 * The process α(x, θ) can be expanded in terms of the eigenfunctions fₙ(x) as:
 * α(x, θ) = ∑ from n₀ to ∞ of ξₙ(θ) √λₙ fₙ(x)
 * 
 * Second-order properties of the random variables ξₙ can be determined by
 * multiplying both sides of the equation by α(x₂, θ) and taking the expectation
 * on both sides. Specifically, it is found that: <br>
 * <br>
 * C(x₁, x₂) = ⟨α(x₁, θ) α(x₂, θ)⟩ = ∑ ∑ ⟨ξₙ(θ) ξₘ(θ)⟩ √λₙ λₘ fₙ(x₁) fₘ(x₂) <br>
 * <br>
 * where the sums range over 0 to infinity.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@AppliesTo(StochasticProcess.class)
public interface KarhunenLoeveExpansion<D,C> extends
                                        Concept,Function<D,C>
{

  @Override
  default Stream<Referral> getReferences()
  {
    return Stream.of(Bibliography.stochasticProcessesInferenceTheory.referToChapters("IV.4.1.3 A technical remark p.140",
                                                                                     "VI.6.1 p.341"),
                     Bibliography.correlationTheoryOfStationaryRandomProcesses.referToChapters("26.1 p.448"),
                     Bibliography.stochasticFiniteElements.referToChapters("2.3 p.17"));
  }

}
