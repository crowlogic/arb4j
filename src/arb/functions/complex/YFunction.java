package arb.functions.complex;

import arb.Real;
import arb.operators.ComplexCompositionOperator;

public class YFunction extends
                       ComplexCompositionOperator<TFunction, ZFunction>
{
  @Override
  public ComplexFunction adjoint()
  {
    return new XFunction(f.f.scale);
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
