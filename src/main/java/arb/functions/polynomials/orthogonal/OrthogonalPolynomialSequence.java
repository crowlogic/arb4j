package arb.functions.polynomials.orthogonal;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.real.RealFunction;

/*
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