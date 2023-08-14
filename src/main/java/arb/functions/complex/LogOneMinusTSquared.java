package arb.functions.complex;

import arb.Complex;
import arb.functions.complex.hyperbolic.HyperbolicTangent;
import arb.operators.CompositionOperator;

/**
 * TODO: refactor the SFunction as the {@link CompositionOperator} of the
 * {@link HyperbolicTangent} function with the {@link LogOneMinusTSquared}
 * function
 * 
 * @author crow
 *
 */
public class LogOneMinusTSquared implements
                                 HolomorphicFunction
{

  /**
   * @return ln(1-t^2)
   */
  @Override
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    assert false : "return ln(1-t^2)";
    return null;
  }

}
