package arb.operators;

import arb.Complex;
import arb.ThreadLocalComplex;
import arb.functions.complex.HolomorphicFunction;

/**
 * The composition of two complex-valued functions
 * <code>C_g(f(t))=f(g(t))</code> which handles the chain-rule. Also known as
 * the Koopman operator
 *
 */
public class CompositionOperator<F extends HolomorphicFunction, G extends HolomorphicFunction> implements
                                HolomorphicFunction,
                                AutoCloseable
{
  public static <F extends HolomorphicFunction, G extends HolomorphicFunction> CompositionOperator<F, G> compose(F f,
                                                                                                                 G g)
  {
    return new CompositionOperator(f,
                                   g);
  }

  @Override
  public String toString()
  {
    return String.format("%s(%s)", f, g);
  }

  @Override
  public HolomorphicFunction adjoint()
  {
    // FIXME: does this need to be split into a left-adjoint and a right-adjoint
    // that takes an argument?
    return new TransferOperator<HolomorphicFunction>(f);
  }

  public CompositionOperator(F f, G g)
  {
    this.f = f;
    this.g = g;

  }

  public F           f;
  public G           g;
  
  ThreadLocalComplex y = new ThreadLocalComplex(3);

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    if (order > 4)
    {
      throw new UnsupportedOperationException(String.format("TODO: implement derivative for order=%d > 3", order));
    }
    Complex y = this.y.get();

    // y=[g(t), g'(t), g''(t)]
    g.evaluate(t, order, prec, y);
    // res=[f(g(t)),f'(g(t)),f''(g(t)]
    f.evaluate(y, order, prec, res);

    if (order < 2)
      return res;

    if (order >= 3)
    {
      // res[2]= g'(t)^2*f''(g(t)) + f'(g(t))*g''(t)
      try ( Complex tmp = new Complex())
      {
        Complex df2 = res.get(1); // df2=f'(g(t)
        y.get(1).pow(2, prec, tmp); // tmp=g'(t)^2
        tmp.mul(res.get(2), prec, res.get(2)); // tmp=tmp*res[2]=g'(t)^2*f''(g(t))

        y.get(2).mul(res.get(1), prec, tmp);
        tmp.add(res.get(2), prec, res.get(2));
      }
    }

    if (order >= 2)
    {
      // apply the chain rule: res[1]*=y[1] so that res[1] = f'(g(t))*g'(t)
      Complex df = res.get(1);
      df.mul(y.get(1), prec, df);
    }

    return res;
  }

  @Override
  public void close()
  {
    y.get().delete();
    y.remove();
  }

}
