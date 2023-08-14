package arb.functions;

import arb.Complex;
import arb.Real;
import arb.functions.real.RealFunction;

public interface ComplexToRealFunction extends
                                       Function<Complex, Real>
{
  /**
   * 
   * @return a conversion of this function of a complex variable to a function of
   *         a real variable, the imaginary part of the input is set to 0
   * 
   */
  public default RealFunction asRealFunction()
  {
    final Complex t           = new Complex();

    final Real    realPartOft = t.re();

    RealFunction  func        = new RealFunction()
                              {

                                @Override
                                public String toString()
                                {
                                  return ComplexToRealFunction.this.toString();
                                }

                                @Override
                                public void close()
                                {
                                  t.close();
                                }

                                @Override
                                public Real evaluate(Real z, int order, int bits, Real value)
                                {
                                  realPartOft.set(z);
                                  return ComplexToRealFunction.this.evaluate(t, order, bits, value);
                                }
                              };
    return func;

  }
}
