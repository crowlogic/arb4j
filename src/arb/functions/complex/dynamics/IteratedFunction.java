package arb.functions.complex.dynamics;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

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
