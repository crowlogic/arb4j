package arb.expression;

import java.util.List;
import java.util.Map;

/**
 * 
 * @param <T> namespace (or env)
 */
public class FunctionalExpressionContext<T> implements
                                        Expression
{
  protected final Function<T>                     f;
  protected final List<Expression>                args;
  protected final Map<String, VariableExpression> variableExpressions;
  public T                                        env;

  public FunctionalExpressionContext(Function<T> f,
                                     List<Expression> args,
                                     Map<String, VariableExpression> variableExpressions)
  {
    this.f                   = f;
    this.args                = args;
    this.variableExpressions = variableExpressions;
  }

  @Override
  public float evaluate()
  {
    return this.f.evaluate(this);
  }
}