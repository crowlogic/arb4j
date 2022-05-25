package arb.functions.complex;

import arb.Complex;

public class IteratedFunction implements ComplexFunction
{
  private ComplexFunction f;
  private int n;

  public IteratedFunction( ComplexFunction f, int n )
  {
    this.f = f;
    this.n = n;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    // TODO Auto-generated method stub
    return null;
  }
}
