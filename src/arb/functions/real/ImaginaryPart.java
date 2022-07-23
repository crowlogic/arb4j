package arb.functions.real;

import arb.Complex;
import arb.Real;
import arb.functions.complex.HolomorphicFunction;

public class ImaginaryPart<F extends HolomorphicFunction> extends
                          RealComplexPart<F>
{

  public ImaginaryPart(F func)
  {
    super(func);

  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    try ( Complex complexRes = new Complex(); Complex complexIn = new Complex();)
    {
      complexIn.getReal().set(z);
      f.evaluate(complexIn, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).set(complexRes.get(i).getImag());
      }
    }
    return res;
  }

}
