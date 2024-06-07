package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexRealPartIterator extends
                                     ComplexPartIterator
{

  public ComplexRealPartIterator(Complex x)
  {
    this.x = x;
  }

  @Override
  public Real next()
  {
    return x.get(i++).getReal();
  }

}
