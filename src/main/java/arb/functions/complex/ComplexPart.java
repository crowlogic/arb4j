package arb.functions.complex;

public abstract class ComplexPart<F extends HolomorphicFunction> implements
                                 HolomorphicFunction
{
  F f;

  public ComplexPart(F func)
  {
    this.f = func;
  }

}
