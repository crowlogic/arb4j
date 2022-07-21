package arb.functions.complex;

import arb.Complex;
import arb.ComplexConstants;

public class ComplexConstant implements
                             ComplexFunction
{
  public ComplexConstant(Complex c)
  {
    this.c = c;
  }

  Complex c;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    if (order >= 1)
    {
      w.set(c);
    }
    for (int i = 2; i <= order; i++)
    {
      w.get(i).set(ComplexConstants.ZERO);
    }
    return w;
  }

}
