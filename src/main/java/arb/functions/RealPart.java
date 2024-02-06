package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealPart extends
                      RealToComplexPart
{

  public RealPart(RealToComplexFunction realToComplexFunction)
  {
    super(realToComplexFunction);
  }

  @Override
  public String toString()
  {
    return "Re[" + f + "]";
  }

  @Override
  Real getResult(Real res)
  {
    return res.set(y.getReal());
  }

}