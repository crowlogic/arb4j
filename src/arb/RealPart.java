package arb;

public class RealPart extends
                      ComplexPart implements
                      RealFunction
{

  public RealPart(ComplexFunction func)
  {
    super(func);

  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real res)
  {
    assert res.size() >= order;
    try ( Complex complexRes = Complex.newVector(res.size()); Complex complexIn = new Complex();)
    {
      complexIn.getReal().set(z);
      func.evaluate(complexIn, order, prec, complexRes);
      for (int i = 0; i < order; i++)
      {
        res.get(i).set(complexRes.get(i).getReal());
      }
    }
    return res;
  }

}
