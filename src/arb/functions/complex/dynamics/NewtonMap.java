package arb.functions.complex.dynamics;

import arb.Complex;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.ComplexFunction;

/**
 * <code>t-f(t)/f'(t)</code>
 *
 * @author Isaac Newton
 * @author Stephen Crowley
 */
public class NewtonMap<F extends ComplexFunction> implements
                      ComplexFunction
{
  @Override
  public ComplexFunction differential() throws NotDifferentiableException
  {
    throw new UnsupportedOperationException("TODO: return (f(t)*f''(t))/(f'(t)^2)");
  }

  public NewtonMap(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert w.size() >= order;
    try ( Complex y = Complex.newVector(2))
    {
      if (order >= 1)
      {
        z.sub(f.evaluate(z, 2, prec, y).div(y.get(1), prec, w), prec, w);
      }
      if (order >= 2)
      {
        differential().evaluate(z, 1, prec, w.get(1));
      }
    }
    return w;
  }

}
