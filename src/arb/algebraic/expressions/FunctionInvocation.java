package arb.algebraic.expressions;

import java.util.List;
import java.util.Map;

/**
 * 
 * @param <T> namespace (or env)
 */
public class FunctionInvocation<T> implements
                               Expression
{
  protected final Function<T>             f;
  protected final List<Expression<Float>> args;
  protected final Map<String, Variable>   variables;
  public T                                env;

  public FunctionInvocation(Function<T> f, List<Expression<Float>> args, Map<String, Variable> variables)
  {
    this.f         = f;
    this.args      = args;
    this.variables = variables;
  }

  @Override
  public Float evaluate()
  {
    return this.f.evaluate(this);
  }
}