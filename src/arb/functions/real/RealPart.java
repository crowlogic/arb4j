package arb.functions.real;

import arb.Complex;
import arb.Real;
import arb.functions.RealToComplexFunction;
import arb.functions.complex.HolomorphicFunction;

public class RealPart<F extends HolomorphicFunction> extends
                     RealComplexPart<F>
{

  public RealPart(F func)
  {
    super(func);

  }

  public RealPart(RealToComplexFunction realToComplexFunction)
  {
    super((F) new HolomorphicFunction()
    {
      @Override
      public Complex evaluate(Complex t, int order, int prec, Complex res)
      {
        return realToComplexFunction.evaluate(t.getReal(), order, prec, res);
      }
    });
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    assert res.size() >= order;
    try ( Complex complexRes = Complex.newVector(res.size()); Complex complexIn = new Complex();)
    {
      complexIn.getReal().set(z);
      f.evaluate(complexIn, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).set(complexRes.get(i).getReal());
      }
    }
    return res;
  }

}
