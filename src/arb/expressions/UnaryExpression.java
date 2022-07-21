package arb.expressions;

public class UnaryExpression implements
                             Expression
{
  private final Operators  operators;
  private final Expression arg;

  public UnaryExpression(Operators operators, Expression arg)
  {
    this.operators = operators;
    this.arg       = arg;
  }

  public float evaluate()
  {
    switch (this.operators)
    {
    case UNARY_MINUS:
      return -this.arg.evaluate();
    case UNARY_BITWISE_NOT:
      return ~((int) this.arg.evaluate());
    case UNARY_LOGICAL_NOT:
      return ((int) this.arg.evaluate()) == 0 ? 1 : 0;
    default:
      return 0;
    }
  }
}