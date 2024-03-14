package arb.functions.complex;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.geometry.curves.ComplexCircle;
import arb.operators.CompositionOperator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary} * @param <F>
 */
public class CircularComposition<F extends ComplexFunction> extends
                                CompositionOperator<F, ComplexCircle>
{

  public CircularComposition(F f, ComplexCircle g)
  {
    super(f,
          g);
  }

}
