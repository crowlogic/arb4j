package arb.geometry.surfaces;

import arb.functions.ComplexToRealFunction;
import arb.geometry.differential.TangentBundle;

public class Torus implements
                   Surface
{

  @Override
  public int dim()
  {
   return 3;
  }

  @Override
  public TangentBundle tangentBundle()
  {
    assert false : "todo";
    return null;
  }

}
