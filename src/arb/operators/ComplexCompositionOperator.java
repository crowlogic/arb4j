package arb.operators;

import arb.Complex;
import arb.ThreadLocalComplex;
import arb.functions.complex.ComplexFunction;

/**
 * The composition of two complex-valued functions <code>C_g(f(t))=f(g(t))</code> which
 * handles the chain-rule. Also known as the Koopman operator
 *
 */
public class ComplexCompositionOperator<F extends ComplexFunction, G extends ComplexFunction> implements
                                       ComplexFunction,
                                       AutoCloseable
{

  public ComplexCompositionOperator(F f, G g)
  {
    this.f = f;
    this.g = g;

  }

  public F           f;
  public G           g;
  ThreadLocalComplex y = new ThreadLocalComplex(2);

  @Override
  public Complex evaluate(Complex t, int order, int prec, Complex res)
  {
    if (order > 2)
    {
      throw new UnsupportedOperationException("derivatives beyond the first not implemented and in many cases not necessary but if someone thought of a way to implement thia via automatic-differentiation that would be superbly stupendous because it is tedious to implement them all by hand depending upon what ones needs are");
    }
    Complex y = this.y.get();

    // y=g(t) if order == 1 or y=[g(t), g'(t)] if order==2
    g.evaluate(t, order, prec, y);
    // res=y=f(g(t)) if order==1 or y=[f(g(t)),f'(g(t))] if order==2
    f.evaluate(y, order, prec, res);

    if (order == 2)
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
