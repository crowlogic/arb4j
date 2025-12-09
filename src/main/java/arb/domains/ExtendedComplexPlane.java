package arb.domains;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ExtendedComplexPlane extends
                                  ComplexPlane
{

  @Override
  public boolean contains(Complex point)
  {
    assert false : "todo: return !isNan";
    return !point.isFinite();
  }

}
