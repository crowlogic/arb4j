package arb.geometry.surfaces;

import arb.Complex;
import arb.Real;
import arb.functions.ComplexToRealFunction;
import arb.geometry.differential.TangentBundle;

public class Hemisphere implements
                        ParametricSurface
{

  private Real    radius;
  private boolean top;

  public Hemisphere(Real radius, boolean top)
  {
    this.radius = radius;
    this.top    = top;
  }

  @Override
  public Real evaluate(Complex t, int order, int prec, Real res)
  {
    try ( Real radiusSquared = new Real(); Complex coordinateSquared = new Complex())
    {
      radius.pow(2, prec, radiusSquared);
      t.pow(2, prec, coordinateSquared);
      radiusSquared.sub(coordinateSquared.getReal(), prec, radiusSquared);
      radiusSquared.sub(coordinateSquared.getImag(), prec, radiusSquared);
      radiusSquared.sqrt(prec, res);
      if (!top)
      {
        res.negate(res);
      }
      return res;
    }
  }

  @Override
  public int dim()
  {
    return 3;
  }


}
