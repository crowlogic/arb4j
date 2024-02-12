package arb.functions.real;

import arb.Integer;
import arb.Real;
import arb.functions.Function;

public class factor implements
                        Function<Integer, Real>
{

  @Override
  public Real evaluate(Integer t, int order, int bits, Real res)
  {
    return res.set(t);    
  }

}
