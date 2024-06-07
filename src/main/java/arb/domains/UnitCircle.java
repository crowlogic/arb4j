package arb.domains;

import arb.Complex;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class UnitCircle implements
                        Domain<Complex>
{

  public static UnitCircle instance = new UnitCircle();

  @Override
  public boolean contains(Complex point)
  {
    try ( Real abs = new Real())
    {
      return point.abs(point.bits, abs).approximatelyEquals(RealConstants.one, point.bits);
    }
  }

}
