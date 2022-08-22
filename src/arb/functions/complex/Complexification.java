package arb.functions.complex;

import arb.Complex;
import arb.functions.RealToComplexFunction;

public class Complexification implements
                              HolomorphicFunction
{
  public Complexification(RealToComplexFunction func)
  {
    this.func = func;
  }

  public RealToComplexFunction func;

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    // TODO Auto-generated method stub
    return null;
  }

}
