package arb.functions.complex;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary} * @param <F>
 */
public abstract class ComplexPart<F extends ComplexFunction> implements
                                 ComplexFunction
{
  F f;

  public ComplexPart(F func)
  {
    this.f = func;
  }

}
