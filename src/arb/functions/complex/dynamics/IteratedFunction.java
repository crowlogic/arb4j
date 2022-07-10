package arb.functions.complex.dynamics;

import static java.lang.Math.*;

import arb.*;
import arb.functions.complex.*;

/**
 * The infinite limit of this functiom composed with itself is the
 * {@link KoenigsFunction} of F<br>
 * 
 * If the precision is increased and the inputs either are exact or are computed
 * with increased accuracy as well, the output should converge proportionally,
 * absent any bugs. The general intended strategy for using ball arithmetic is
 * to add a few guard bits, and then repeat the calculation as necessary with an
 * exponentially increasing number of guard bits (Ziv’s strategy) until the
 * result is exact enough for one’s purposes (typically the first attempt will
 * be successful).
 * 
 * @param <F> a holomorphic self-map
 */
public class IteratedFunction<F extends ComplexFunction> implements
                             ComplexFunction,
                             AutoCloseable
{
  @Override
  public String toString()
  {
    return String.format("IteratedFunction(%s,n=%d,normalized=%s)", f.toString(), n, normalized );
  }

  public F       f;
  private int     n;
  private Real    λ;
  private boolean normalized;

  public IteratedFunction(F f, int n, boolean normalized)
  {
    this.f          = f;
    this.n          = n;
    this.normalized = normalized;
    this.λ          = f.differential().abs().evaluate(Constants.ZERO, 1, 128, new Real());
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    order = max(order, 1);
    assert order <= 2 : "TODO: implement order>2";
    try ( Complex x = new Complex(); Complex y = Complex.newVector(order))
    {
      x.set(z);
      for (int i = 0; i < n; i++)
      {
        f.evaluate(x, 1, prec, y);
        if (normalized)
        {
          y.div(λ, prec, y);
        }
        x.set(y);
      }

      if (order >= 2)
      {
        Complex won = w.get(1);
        if (normalized)
        {
          won.one();
        }
        else
        {
          won.zero();
          λ.pow(n, prec, won.getReal());
        }
      }
      w.set(x);
      return w;
    }
  }

  @Override
  public void close() throws Exception
  {
    λ.clear(); 
  }
}
