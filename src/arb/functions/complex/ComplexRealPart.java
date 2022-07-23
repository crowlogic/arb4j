package arb.functions.complex;

import arb.Complex;

public class ComplexRealPart<F extends HolomorphicFunction> extends
                            ComplexPart<F>
{

  public ComplexRealPart(F func)
  {
    super(func);

  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex res)
  {
    assert res.size() >= order;
    try ( Complex complexRes = Complex.newVector(res.size()); Complex complexIn = new Complex();)
    {
      complexIn.getReal().set(z.getReal());
      f.evaluate(complexIn, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).getReal().set(complexRes.get(i).getReal());
      }
    }
    return res;
  }

}
