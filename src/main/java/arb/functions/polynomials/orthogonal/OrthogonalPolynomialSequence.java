package arb.functions.polynomials.orthogonal;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.functions.sequences.RealSequence;

/**
 * All orthogonal polynomials can be expressed by specifying 3
 * {@link RealSequence}s<br><br>
 * 
 * 𝑃ₙ₊₁(𝑥) = 𝐴ₙ ⋅ 𝑥 ⋅ 𝑃ₙ(𝑥) + 𝐵ₙ ⋅ 𝑃ₙ(𝑥) - 𝐶ₙ ⋅ 𝑃ₙ₋₁(𝑥)<br>
 * <br>
 * 
 * where 𝑃ₙ(𝑥) represents the nth polynomial in the orthogonal polynomial
 * sequence, 𝐴ₙ, 𝐵ₙ, and 𝐶ₙ are coefficients specific to the orthogonal
 * polynomial family.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface OrthogonalPolynomialSequence extends
                                              RealOrthogonalPolynomialBasis,
                                              Function<Integer, RealPolynomial>

{

  Domain<Real> getDomain();

  RealFunction getOrthogonalMeasure();

}