package arb.functions.complex;

import arb.Real;
import arb.operators.ComplexCompositionOperator;

/**
 * The conjugate of this function is {@link YFunction}
 * 
 * @author crow
 */
public class XFunction extends
                       ComplexCompositionOperator<SFunction, ZFunction>
{

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

  @Override
  public ComplexFunction adjoint()
  {
    return new YFunction(f.scale);
  }
}
