package arb.geometry.surfaces;

import arb.Real;
import arb.differential.geometry.TangentBundle;
import arb.exceptions.ArbException;
import arb.functions.ComplexToRealFunction;

public class Sphere implements
                    RiemannSurface
{
  Real radius;

  @Override
  public int getNumberOfSheets()
  {
    return 2;
  }

  @Override
  public ParametricSurface getSheet(int sheet)
  {
    assert sheet <= 2 : "a sphere only has two sheets, one for each hemisphere";
    switch (sheet)
    {
    case 0:
      return new Hemisphere(radius,
                            false);
    case 1:
      return new Hemisphere(radius,
                            true);
    default:
      throw new ArbException("a sphere only has two sheets, one for each hemisphere");
    }
  }

  @Override
  public int dim()
  {
    return 3;
  }


}
