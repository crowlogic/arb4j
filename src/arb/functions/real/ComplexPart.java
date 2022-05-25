package arb.functions.real;

import arb.functions.complex.ComplexFunction;

public abstract class ComplexPart implements
                                  RealFunction
{

  protected ComplexFunction func;

  public ComplexPart(ComplexFunction func)
  {
    this.func = func;
  }

}