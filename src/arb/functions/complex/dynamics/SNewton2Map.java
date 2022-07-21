package arb.functions.complex.dynamics;

import arb.operators.Composition;

public class SNewton2Map extends
                         Composition<SNewtonMap, SNewtonMap>
{

  public SNewton2Map()
  {
    super(new SNewtonMap(),
          new SNewtonMap());
  }

}
