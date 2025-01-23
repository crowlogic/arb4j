package arb.functions.polynomials.orthogonal.real;

import java.util.ArrayList;

import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialExpansion;
import arb.functions.polynomials.orthogonal.OrthogonalPolynomialSequence;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class RealOrthogonalPolynomialExpansion<
              O extends OrthogonalPolynomialSequence<Real, Real, RealPolynomial>> extends
                                                       OrthogonalPolynomialExpansion<Real, Real, RealPolynomial, O>
                                                       implements
                                                       RealFunction
{
  public RealOrthogonalPolynomialExpansion(O basis, Real projections)
  {
    super(basis,
          projections);
  }

 
}
