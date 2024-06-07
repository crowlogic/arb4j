package arb.functions.real.quasipolynomial;

import arb.Real;
import arb.RealPolynomial;
import arb.RealQuasiPolynomial;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import arb.functions.sequences.QuasiPolynomialSequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealQuasiPolynomialSequence extends
                                             QuasiPolynomialSequence<Real, RealPolynomial, RealFunction, RealQuasiPolynomial>
{

  public static RealQuasiPolynomialSequence express(String string, Context context)
  {
    return QuasiPolynomialSequence.express(string,
                                           RealQuasiPolynomial.class,
                                           string,
                                           RealQuasiPolynomialSequence.class,
                                           context);
  }

}
