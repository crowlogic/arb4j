package arb.domains;

import arb.Complex;

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
