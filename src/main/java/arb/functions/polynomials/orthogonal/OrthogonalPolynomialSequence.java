package arb.functions.polynomials.orthogonal;

import arb.Integer;
import arb.OrthogonalBasis;
import arb.Real;
import arb.RealPolynomial;
import arb.domains.Domain;
import arb.functions.Function;
import arb.functions.real.RealFunction;

public interface OrthogonalPolynomialSequence extends
                                              OrthogonalBasis<Real,RealPolynomial>,
                                              Function<Integer, RealPolynomial>

{
  RealPolynomial evaluate(Integer t, int order, int bits, RealPolynomial res);

  Domain<Real> getDomain();

  RealFunction getOrthogonalMeasure();


}