package arb.functions.complex.dynamics;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.SFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SNewtonMap extends
                        NewtonMap<SFunction>
{

  @Override
  public String toString()
  {
    return String.format("NewtonMap(%s)", f);
  }

  public SNewtonMap()
  {
    super(new SFunction());
  }

  public SNewtonMap(Real scale)
  {
    super(new SFunction(scale));
  }

}
