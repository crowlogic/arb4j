package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.domains.Domain;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealType1ChebyshevPolynomials extends
                                       RegularRealRecurrentlyGeneratedOrthogonalPolynomialSequence
{

  public RealType1ChebyshevPolynomials(int bits)
  {
    super(bits,
          "2",
          "0",
          "1");
    p1.set(1)
      .shiftLeft(1);
  }

  @Override
  public Domain<Real>
         domainOfOrthogonality()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
