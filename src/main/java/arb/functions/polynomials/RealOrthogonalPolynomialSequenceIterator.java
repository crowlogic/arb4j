package arb.functions.polynomials;

import arb.Real;
import arb.RealPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealOrthogonalPolynomialSequenceIterator extends
                                                      SequenceIterator<RealPolynomial>
{

  public RealOrthogonalPolynomialSequenceIterator(OrthogonalSequence<Real, RealPolynomial> seq)
  {
    super(seq);
  }

}
