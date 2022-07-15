package arb.functions.real;

import arb.functions.complex.*;

public abstract class RealComplexPart<F extends ComplexFunction> implements
                                     RealFunction
{

  @Override
  public String toString()
  {
    return String.format("%s[f=%s]", getClass().getSimpleName(), f);
  }

  @Override
  public RealFunction inverse()
  {
    // TODO Auto-generated method stub
    return null;
  }

  public F f;

  public RealComplexPart(F func)
  {
    this.f = func;
  }

}