package arb.functions.polynomials.orthogonal;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.sequences.RealSequence;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RecurrentlyGeneratedOrthogonalPolynomialSequence extends
                                                                  OrthogonalPolynomialSequence
{

  RealSequence A();

  RealSequence B();

  RealSequence C();

}