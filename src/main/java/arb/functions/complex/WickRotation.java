package arb.functions.complex;

import arb.Complex;
import arb.ComplexConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Multiplication by the imaginary unit with optional negation. Wick rotation is
 * called a rotation because when we represent complex numbers as a plane, the
 * multiplication of a complex number by i is equivalent to rotating the vector
 * representing that number by an angle of π/2 about the origin.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
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
   * @param negate if true then result is -i*t otherwise it is just i*t
   */
  public WickRotation(boolean negate)
  {
    this.negate = negate;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= w.size();
    z.mul(ComplexConstants.imaginaryUnit, prec, w);
    if (negate)
    {
      w.neg(w);
    }
    if (order >= 2)
    {
      Complex derivative = w.get(1);
      derivative.getImag().identity();
      if (negate)
      {
        derivative.neg();
      }
    }
    for (int i = 2; i < order; i++)
    {
      w.get(i).zero();
    }
    return w;
  }

}
