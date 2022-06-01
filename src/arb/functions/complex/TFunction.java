package arb.functions.complex;

import arb.Real;
import arb.operators.ComplexCompositionOperator;

public class TFunction extends
                       ComplexCompositionOperator<SFunction, WickRotation>
{
  @Override
  public ComplexFunction adjoint()
  {
    return new SFunction(f.scale);
  }

  public TFunction()
  {
    super(new SFunction(),
          new WickRotation(false));
  }

  public TFunction(Real scale)
  {
    this();
    this.f.scale = scale;
  }
}
