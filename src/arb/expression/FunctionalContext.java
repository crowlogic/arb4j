package arb.expression;

import java.util.List;
import java.util.Map;

/**
 * 
 * @param <T> namespace (or env)
 */
public class FunctionalContext<T> implements
                              Expression
{
  protected final Function<T>           f;
  protected final List<Expression>      args;
  protected final Map<String, Variable> variables;
  public T                              env;

  public FunctionalContext(Function<T> f, List<Expression> args, Map<String, Variable> variables)
  {
    this.f         = f;
    this.args      = args;
    this.variables = variables;
  }

  @Override
  public float evaluate()
  {
    return this.f.evaluate(this);
  }
}