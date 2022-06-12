package arb.functions.complex.dynamics;

import arb.functions.complex.SFunction;

public class SNewtonMap extends
                        NewtonMap<SFunction>
{

  public SNewtonMap()
  {
    super(new SFunction());
  }

}
