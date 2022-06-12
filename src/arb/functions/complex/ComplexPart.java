package arb.functions.complex;

public abstract class ComplexPart<F extends ComplexFunction> implements
                     ComplexFunction
{
  F f;
  
  public ComplexPart(F func)
  {
    this.f = func;
  }

}
