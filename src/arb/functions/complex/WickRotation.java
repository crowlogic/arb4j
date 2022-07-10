package arb.functions.complex;

import arb.*;

/**
 * Multiplication by the imaginary unit with optional negation. Wick rotation is
 * called a rotation because when we represent complex numbers as a plane, the
 * multiplication of a complex number by i is equivalent to rotating the vector
 * representing that number by an angle of π/2 about the origin.
 * 
 * @author crow
 */
public class WickRotation implements
                          ComplexFunction
{

  @Override
  public String toString()
  {
    return "WickRotation";
  }

  private boolean negate;

  public WickRotation()
  {

  }

  /**
   * 
   * @param b if true then result is -i*t otherwise it is just i*t
   */
  public WickRotation(boolean b)
  {
    this.negate = b;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= w.size();
    z.mul(Constants.imaginaryUnit, prec, w);
    if (negate)
    {
      w.neg(w);
    }
    if (order >= 2)
    {
      Complex derivative = w.get(1);
      derivative.getImag().one();
      if (negate)
      {
        derivative.neg(derivative);
      }
    }
    for (int i = 2; i < order; i++)
    {
      w.get(i).set(Constants.ZERO);
    }
    return w;
  }

}
