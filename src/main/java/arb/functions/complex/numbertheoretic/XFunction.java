package arb.functions.complex.numbertheoretic;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.SFunction;
import arb.operators.CompositionOperator;

/**
 * The conjugate of this function is {@link YFunction}
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class XFunction extends
                       CompositionOperator<SFunction, ZFunction>
{

  @Override
  public String toString()
  {
    return "X=" + super.toString();
  }

  public XFunction()
  {
    super(new SFunction(),
          new ZFunction());
  }

  public XFunction(Real scale)
  {
    super(new SFunction(scale),
          new ZFunction());
  }

}
