package arb.functions.complex.dynamics;

import arb.*;
import arb.exceptions.*;
import arb.functions.complex.*;

/**
 * <code>-(f(t)*conjugate(f'(t)))/(1+|f(z)|^4)</code>
 * 
 */
public class DesingularizedNewtonFlow<F extends ComplexFunction> implements
                                     ComplexFunction
{

  @Override
  public String toString()
  {
    return String.format("NewtonFlow(%s)", f);

  }

  public DesingularizedNewtonFlow(F f)
  {
    this.f = f;
  }

  public F              f;

  final ComplexFunction diff = (t, order, prec, w) ->
                             {
                               try ( Complex s = Complex.newVector(3);)
                               {
                                 f.evaluate(t, 3, prec, s);
                                 Complex a = s.mul(s.get(2), prec, w);
                                 Complex b = s.get(1).pow(2, prec, s.get(0)).conj();
                                 a.mul(b, prec, w);
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
        f.evaluate(z, 2, prec, y).mul(y.get(1).conj(), prec, w);
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
