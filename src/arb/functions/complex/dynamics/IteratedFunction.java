package arb.functions.complex.dynamics;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

/**
 * The infinite limit of this functiom composed with itself is the
 * {@link KoenigsFunction} of F
 * 
 * @param <F> a holomorphic self-map
 */
public class IteratedFunction<F extends ComplexFunction> implements
                             ComplexFunction
{
  private F   f;
  private int n;

  public IteratedFunction(F f, int n)
  {
    this.f = f;
    this.n = n;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    try ( Complex x = new Complex(); Complex y = new Complex())
    {
      x.set(z);
      for (int i = 0; i < n; i++)
      {
        f.evaluate(x, order, prec, y);
        System.out.println("f[" + x + "]=" + y);
        x.set(y);
      }
      return w.set(x);
    }
  }
}
