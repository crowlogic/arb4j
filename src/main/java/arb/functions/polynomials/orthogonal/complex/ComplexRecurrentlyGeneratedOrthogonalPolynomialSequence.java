package arb.functions.polynomials.orthogonal.complex;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.polynomials.orthogonal.RecurrentlyGeneratedOrthogonalPolynomialSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class ComplexRecurrentlyGeneratedOrthogonalPolynomialSequence extends
                                                                              RecurrentlyGeneratedOrthogonalPolynomialSequence<Complex, Complex, ComplexPolynomial>
{

  @Override
  public Class<ComplexPolynomial> coDomainType()
  {
    return ComplexPolynomial.class;
  }

  public ComplexRecurrentlyGeneratedOrthogonalPolynomialSequence(int bits)
  {
    super(bits,
          ComplexPolynomial.class);
  }

  /**
   * Defaults to the {@link UnitCircle}
   */
  @Override
  public Domain<Complex> domainOfOrthogonality()
  {
    return ComplexConstants.unitCircle;
  }

}
