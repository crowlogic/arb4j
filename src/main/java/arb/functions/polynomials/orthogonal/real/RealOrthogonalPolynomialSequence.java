package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class RealOrthogonalPolynomialSequence extends
                                                       OrthogonalPolynomialSequence<Real, Real, RealPolynomial>
{

  public abstract Domain<Real> domainOfOrthogonality();

  public abstract RealFunction orthogonalityMeasure();

}