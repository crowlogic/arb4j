package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class RationalFunction<R> implements
                                      Field<RationalFunction<R>>,
                                      Named,
                                      AutoCloseableAssignable<RealRationalFunction>,
                                      RealFunction
{

  @Override
  public void close()
  {
    assert false : "TODO";
  }

}