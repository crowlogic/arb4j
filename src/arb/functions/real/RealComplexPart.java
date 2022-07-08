package arb.functions.real;

import arb.functions.complex.ComplexFunction;

public abstract class RealComplexPart<F extends ComplexFunction> implements
                                     RealFunction
{

  @Override
  public String toString()
  {
    return String.format("%s[f=%s]", getClass().getSimpleName(), f);
  }

  public F f;

  public RealComplexPart(F func)
  {
    this.f = func;
  }

}