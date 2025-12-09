package arb.functions;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ImaginaryPart extends
                           RealToComplexPart implements
                           RealFunction,
                           AutoCloseable
{
  public ImaginaryPart(RealToComplexFunction realToComplexFunction)
  {
    super(realToComplexFunction);
  }

  @Override
  public String toString()
  {
    return "Im[" + f + "]";
  }

  @Override
  Real getResult(Real res)
  {
    return res.set(y.getImag());
  }
}