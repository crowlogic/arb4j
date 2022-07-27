package arb.algebraic.expressions;

import arb.algebraic.expressions.operators.unary.UnaryOperator;

public class UnaryExpression implements
                             Expression
{
  private final UnaryOperator<Float, Float> operator;
  private final Expression                  arg;

  public UnaryExpression(UnaryOperator<Float, Float> operator, Expression arg)
  {
    this.operator = operator;
    this.arg      = arg;
  }

  public Float evaluate(Float arg)
  {
    return operator.evaluate(arg);
  }

  @Override
  public Float evaluate()
  {
    return arb.utensils.Utilities.TODO("implement me");
    
  }
}