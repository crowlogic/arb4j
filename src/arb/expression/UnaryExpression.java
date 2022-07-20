package arb.expression;

public class UnaryExpression implements
                      Expression
{
  private final Operation         operation;
  private final Expression arg;

  public UnaryExpression(Operation operation, Expression arg)
  {
    this.operation  = operation;
    this.arg = arg;
  }

  public float evaluate()
  {
    switch (this.operation)
    {
    case UNARY_MINUS:
      return -this.arg.evaluate();
    case UNARY_BITWISE_NOT:
      return ~((int) this.arg.evaluate());
    case UNARY_LOGICAL_NOT:
      return ((int) this.arg.evaluate()) == 0 ? 1 : 0;
    }
    return 0;
  }
}