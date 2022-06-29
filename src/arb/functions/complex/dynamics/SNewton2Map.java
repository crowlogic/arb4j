package arb.functions.complex.dynamics;

import arb.operators.CompositionOperator;

public class SNewton2Map extends
                         CompositionOperator<SNewtonMap, SNewtonMap>
{

  public SNewton2Map()
  {
    super(new SNewtonMap(),
          new SNewtonMap());
  }

}
