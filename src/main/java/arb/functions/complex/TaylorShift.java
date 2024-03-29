package arb.functions.complex;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * This function lops off the first element of the function, this is used to
 * implement the default {@link ComplexFunction#differential()}. If there is a
 * way to compute this shift without the first element then that would be more
 * efficient and should be used instead of this class
 * 
 *
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TaylorShift<F extends ComplexFunction> implements
                        ComplexFunction
{

  @Override
  public String toString()
  {
    return "TaylorShift[f=" + f + "]";
  }

  public TaylorShift(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = Math.max(1, order);
    assert w.size() >= order;
    try ( Complex x = Complex.newVector(order + 1))
    {
      return w.set(f.evaluate(z, order + 1, prec, x).slice(1, order + 1));
    }

  }

}
