package arb.expressions;

import arb.functions.real.RealFunction;

public abstract class RealCompiledFunction implements
                                           RealFunction
{
  public RealCompiledFunction(Expression expression)
  {
    super();
    this.expression = expression;
  }

  public final Expression expression;
  
}
