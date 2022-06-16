package arb.functions.complex.dynamics;

import static java.lang.System.out;

import arb.*;
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
  private F    f;
  private int  n;
  private Real λ;

  public IteratedFunction(F f, int n, boolean normalized)
  {
    this.f = f;
    this.n = n;
    this.λ = normalized ? f.differential().abs().evaluate(Constants.ZERO, 1, 256, new Real()) : null;
  }

  @Override
  public Complex evaluate(Complex z, int order, int prec, Complex w)
  {
    assert order <= 1 : "TODO: implement order>1";
    try ( Complex x = Complex.newVector(order); Complex y = Complex.newVector(order))
    {
      x.set(z);
      for (int i = 0; i < n; i++)
      {
        f.evaluate(x, order, prec, y);
        if (λ != null)
        {
          y.div(λ, prec, y);
        }
        x.set(y);
      }
      return w.set(x);
    }
  }
}
