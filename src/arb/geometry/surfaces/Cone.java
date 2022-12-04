package arb.geometry.surfaces;

import arb.Complex;
import arb.Real;

public class Cone implements
                  ParametricSurface
{

  @Override
  public Real evaluate(Complex t, int order, int prec, Real res)
  {
    throw new UnsupportedOperationException("TODO");
  }

  @Override
  public int dim()
  {
    return 3;
  }

}
