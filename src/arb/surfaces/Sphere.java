package arb.surfaces;

import arb.Real;
import arb.exceptions.ArbException;

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

}
