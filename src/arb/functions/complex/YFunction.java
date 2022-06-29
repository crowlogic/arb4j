package arb.functions.complex;

import arb.Real;
import arb.operators.CompositionOperator;

public class YFunction extends
                       CompositionOperator<TFunction, ZFunction>
{
  @Override
  public String toString()
  {
    return "Y=" + super.toString();
  }

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
