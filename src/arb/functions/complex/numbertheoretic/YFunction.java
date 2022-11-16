package arb.functions.complex.numbertheoretic;

import arb.Real;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.complex.TFunction;
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
  public HolomorphicFunction adjoint()
  {
    return new XFunction(f.f.a);
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
