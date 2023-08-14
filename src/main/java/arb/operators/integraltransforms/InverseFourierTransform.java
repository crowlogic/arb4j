package arb.operators.integraltransforms;

import java.io.Closeable;

import arb.Real;
import arb.functions.real.RealFunction;

/**
 * @see FourierTransform
 * 
 * @param <F>
 */
public class InverseFourierTransform<F extends RealFunction> extends
                                    FourierTransform<F> implements
                                    AutoCloseable,
                                    Closeable
{

  @Override
  public String toString()
  {
    return "InverseFourierTransform[" + f + "]";
  }

  public InverseFourierTransform(F f,
                                 Real a,
                                 Real b)
  {
    super(
          f,
          true,
          a,
          b);
  }

  public InverseFourierTransform(F f)
  {
    super(
          f,
          true);
  }

}
