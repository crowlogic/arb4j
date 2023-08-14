package arb.domains;

import arb.Real;

public class RealLine implements
                      Domain<Real>
{

  @Override
  public boolean contains(Real point)
  {
    return point.isFinite();
  }

}
