package arb.operators;

import arb.Complex;
import arb.functions.complex.ComplexFunction;
import arb.space.topological.VectorSpace;

/**
 * The composition of two complex-valued functions
 * <code>C_g(f(t))=f(g(t))</code> which handles the chain-rule. Also known as
 * the Koopman operator
 *
 */

public class CompositionOperator<F extends ComplexFunction, G extends ComplexFunction> implements
                                ComplexFunction,
                                LinearOperator<Complex>,
                                AutoCloseable
{
  public static <F extends ComplexFunction, G extends ComplexFunction> CompositionOperator<F, G> compose(F f,
                                                                                                                 G g)
  {
    return new CompositionOperator<F, G>(f,
                                         g);
  }

  @Override
  public String toString()
  {
    return String.format("%s(%s)", f, g);
  }

  public CompositionOperator(F f, G g)
  {
    this.f = f;
    this.g = g;
  }

  public F f;
  public G g;

  Complex  y = Complex.newVector(3);

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    if (order > 4)
    {
      throw new UnsupportedOperationException(String.format("TODO: implement derivative for order=%d > 3", order));
    }

    // y=[g(t), g'(t), g''(t)]
    g.evaluate(t, order, prec, y.slice(0, order));
    // res=[f(g(t)),f'(g(t)),f''(g(t)]
    f.evaluate(y, order, prec, res);

    if (order < 2)
      return res;

    if (order >= 3)
    {
      // res[2]= g'(t)^2*f''(g(t)) + f'(g(t))*g''(t)
      try ( Complex tmp = new Complex())
      {
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
    y.clear();
  }

  @Override
  public VectorSpace<? extends Complex>
         apply(VectorSpace<? extends Complex> x, int bits, VectorSpace<? extends Complex> result)
  {
    // TODO Auto-generated method stub
    return null;
  }

  
}
