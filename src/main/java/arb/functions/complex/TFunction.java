package arb.functions.complex;

import arb.Real;
import arb.operators.CompositionOperator;

public class TFunction extends
                       CompositionOperator<SFunction, WickRotation>
{
  @Override
  public String toString()
  {
    return String.format("T(scale=%s)", f.scale.toString(5));
  }

  public TFunction()
  {
    super(new SFunction(),
          new WickRotation(false));
    f.scale.printPrecision = false;
  }

  public TFunction(Real scale)
  {
    this();
    this.f.scale = scale;
  }
}
