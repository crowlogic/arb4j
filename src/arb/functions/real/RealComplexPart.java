package arb.functions.real;

import arb.functions.complex.*;

public abstract class RealComplexPart<F extends ComplexFunction> implements
                                     RealFunction
{

  public F func;

  public RealComplexPart(F func)
  {
    this.func = func;
  }

}