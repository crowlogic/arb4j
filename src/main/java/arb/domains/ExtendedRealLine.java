package arb.domains;

import arb.Real;
import arb.RealConstants;

public class ExtendedRealLine implements
                              Domain<Real>
{

  public static final Domain<Real> instance = new ExtendedRealLine();

  @Override
  public boolean contains(Real point)
  {
    return !point.equals(RealConstants.indeterminant);
  }

}
