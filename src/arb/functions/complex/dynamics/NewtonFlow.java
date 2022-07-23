package arb.functions.complex.dynamics;

import arb.Complex;
import arb.exceptions.NotDifferentiableException;
import arb.functions.complex.HolomorphicFunction;

/**
 * <code>-f(t)/f'(t)</code>
 * 
 */
public class NewtonFlow<F extends HolomorphicFunction> implements
                       HolomorphicFunction
{

  @Override
  public String toString()
  {
    return String.format("NewtonFlow(%s)", f);

  }

  public NewtonFlow(F f)
  {
    this.f = f;
  }

  public F              f;

  final HolomorphicFunction diff = (t, order, prec, w) ->
                             {
                               try ( Complex s = Complex.newVector(3);)
                               {
                                 f.evaluate(t, 3, prec, s);
                                 Complex numerator   = s.mul(s.get(2), prec, w);
                                 Complex denominator = s.get(1).pow(2, prec, s.get(0));
                                 numerator.div(denominator, prec, w);
                                 if (!w.isFinite())
                                 {
                                   w.getImag().zero();
                                   w.getReal().one().div(f.multiplicityOfRoot(t), prec);
                                 }
                                 w.neg(w).add(1, prec, w);
                                 return w;
                               }
                             };

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= 2 : String.format("specified order %d is only implemented (in this version) up to order 2",
                                      order);
    assert w.size() >= order;
    try ( Complex y = Complex.newVector(2))
    {
      if (order >= 1)
      {
        f.evaluate(z, 2, prec, y).div(y.get(1), prec, w);
      }
      if (order >= 2)
      {
        diff.evaluate(z, 1, prec, w.get(1));

      }
    }
    return w;
  }

  /**
   * @return (f(t)*f''(t))/(f'(t)^2)
   */
  @Override
  public HolomorphicFunction differential() throws NotDifferentiableException
  {
    return diff;
  }
}
