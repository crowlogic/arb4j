package arb.functions.real;

import static java.lang.Math.max;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.ComplexToRealFunction;

/**
 * @see Complex#arg(int, Real)
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexPhase implements
                          ComplexToRealFunction
{

  @Override
  public Real evaluate(Complex t, int order, int prec, Real res)
  {
    order = max(0, order);
    assert order <= 1 : "the argument of a function isn't complex-differentiable";
    return t.arg(prec, res);
  }

}
