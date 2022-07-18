package arb.functions.complex;

import arb.*;
import arb.operators.*;

public class YFunction extends
                       Composition<TFunction, ZFunction>
{
  @Override
  public String toString()
  {
    return "Y=" + super.toString();
  }

  @Override
  public ComplexFunction adjoint()
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
