package arb.functions.real;

import arb.functions.complex.ComplexFunction;

public abstract class RealComplexPart<F extends ComplexFunction> implements
                                     RealFunction
{

  public F f;

  public RealComplexPart(F func)
  {
    this.f = func;
  }

}