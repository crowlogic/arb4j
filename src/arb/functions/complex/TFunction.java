package arb.functions.complex;

import arb.*;
import arb.operators.*;

public class TFunction extends
                       Composition<SFunction, WickRotation>
{
  @Override
  public String toString()
  {
    return String.format("T(scale=%s)", f.a.toString(5));
  }

  @Override
  public ComplexFunction adjoint()
  {
    return new SFunction(f.a);
  }

  public TFunction()
  {
    super(new SFunction(),
          new WickRotation(false));
    f.a.printPrecision = false;
  }

  public TFunction(Real scale)
  {
    this();
    this.f.a = scale;
  }
}
