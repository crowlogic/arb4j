package arb.functions.complex.numbertheoretic;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.TFunction;
import arb.operators.CompositionOperator;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class YFunction extends
                       CompositionOperator<TFunction, ZFunction>
{
  @Override
  public String toString()
  {
    return "Y=" + super.toString();
  }

  public YFunction()
  {
    super(new TFunction(),
          new ZFunction());
  }

  public YFunction(Real vscale)
  {
    super(new TFunction(vscale),
          new ZFunction());
  }
}
