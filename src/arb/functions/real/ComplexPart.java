package arb.functions.real;

import arb.functions.complex.*;

public abstract class ComplexPart<F extends ComplexFunction> implements
                                 RealFunction
{

  protected F func;

  public ComplexPart(F func)
  {
    this.func = func;
  }

}