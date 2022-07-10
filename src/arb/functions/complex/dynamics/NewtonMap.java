package arb.functions.complex.dynamics;

import arb.*;
import arb.exceptions.*;
import arb.functions.complex.*;

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
  public String toString()
  {
    return String.format("NewtonMap[%s]", f);
  }

  public NewtonMap(F f)
  {
    this.f = f;
  }

  public F                     f;

  final ComplexFunction diff = (t, order, prec, w) ->
                             {
                               assert order < 2;
                               assert w.size() >= order;
                               try ( Complex s = Complex.newVector(3);)
                               {
                                 f.evaluate(t, 3, prec, s);
                                 Complex numerator   = s.mul(s.get(2), prec, w);
                                 Complex denominator = s.get(1).pow(2, prec, s.get(0));
                                 numerator.div(denominator, prec, w);
                                 evaluatePole(t, prec, w, true);
                                 return w;
                               }
                             };

  protected void evaluatePole(Complex t, int prec, Complex w, boolean b)
  {
    assert t != w;
    if (!w.isFinite())
    {
      w.getImag().zero();
      if (b)
      {
        w.getReal().one().div(f.multiplicityOfRoot(t), prec);
      }
      else
      {
        w.getReal().zero();
      }
    }
  }

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
        evaluatePole(z, prec, w, false);
        z.sub(w, prec, w);
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
  public ComplexFunction differential() throws NotDifferentiableException
  {
    return diff;
  }
}
