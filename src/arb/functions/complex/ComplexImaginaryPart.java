package arb.functions.complex;

import arb.*;

public class ComplexImaginaryPart<F extends ComplexFunction> extends
                                 ComplexPart<F>
{

  public ComplexImaginaryPart(F func)
  {
    super(func);

  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex res)
  {
    assert res.size() >= order;
    try ( Complex complexRes = Complex.newVector(res.size()); Complex complexIn = new Complex();)
    {
      complexIn.getImag().set(z.getImag());
      f.evaluate(complexIn, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).getImag().set(complexRes.get(i).getImag());
      }
    }
    return res;
  }

}
