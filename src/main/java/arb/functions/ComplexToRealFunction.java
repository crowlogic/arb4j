package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface ComplexToRealFunction extends
                                       Function<Complex, Real>

{
  /**
   * 
   * @param t TODO
   * @return a conversion of this function of a complex variable to a function of
   *         a real variable, the imaginary part of the input is set to 0
   * 
   */
  public default RealFunction asRealFunction(Complex t)
  {

    final Real   realPartOft = t.re();

    RealFunction func        = new RealFunction()
                             {

                               @Override
                               public String toString()
                               {
                                 return ComplexToRealFunction.this.toString();
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
