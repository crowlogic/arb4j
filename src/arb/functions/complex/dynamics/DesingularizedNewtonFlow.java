package arb.functions.complex.dynamics;

import arb.Complex;
import arb.functions.complex.EntireFunction;
import arb.functions.complex.MeromorphicFunction;

/**
 * The desingularized {@link NewtonFlow}
 * 
 * <pre>
 * 
 *    -f(t)*conjugate(f'(t))      
 * ---------------------------   
 *        1+|f(t)|⁴
 * 
 * </pre>
 */
public class DesingularizedNewtonFlow<F extends MeromorphicFunction> extends
                                     NewtonFlow implements
                                     EntireFunction
{

  @Override
  public String toString()
  {
    return String.format("NewtonFlow(%s)", f);

  }

  public DesingularizedNewtonFlow(F f)
  {
    super(f);
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
        f.evaluate(z, 2, prec, y).mul(y.get(1).conj(), prec, w);
      }
      if (order >= 2)
      {
        diff.evaluate(z, 1, prec, w.get(1));

      }
    }
    return w;
  }

}
