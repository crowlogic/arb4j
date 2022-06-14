package arb.functions.complex.dynamics;

import arb.operators.ComplexCompositionOperator;

public class SNewton2Map extends
                         ComplexCompositionOperator<SNewtonMap, SNewtonMap>
{

  public SNewton2Map()
  {
    super(new SNewtonMap(),
          new SNewtonMap());
  }

}
