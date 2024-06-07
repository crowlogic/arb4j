package arb.functions.real;

import static java.lang.Math.max;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.ComplexToRealFunction;

/**
 * @see Complex#norm(int, Real)
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexMagnitude implements
                              ComplexToRealFunction
{

  @Override
  public Real evaluate(Complex t, int order, int prec, Real res)
  {
    order = max(0, order);
    assert order == 1 : "the magnitude of a function isn't complex-differentiable";
    return t.norm(prec, res);
  }

}
