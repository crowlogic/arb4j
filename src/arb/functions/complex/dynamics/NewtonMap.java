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

  public NewtonMap(F f)
  {
    this.f = f;
  }

  F f;

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= 2 : String.format("requested order %d is only implemented (in this version) up to order 2",
                                      order);
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

  @Override
  public ComplexFunction differential() throws NotDifferentiableException
  {
    return (t, order, prec, w) ->
    {
      try ( Complex s = Complex.newVector(3);)
      {
        f.evaluate(t, 3, prec, s);
        Complex numerator   = s.mul(s.get(2), prec, w);
        Complex denominator = s.get(1).pow(2, prec, s);
        return numerator.div(denominator, prec, w);
      }
    };
  }
}
