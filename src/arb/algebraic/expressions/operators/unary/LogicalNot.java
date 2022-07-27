package arb.algebraic.expressions.operators.unary;

public class LogicalNot extends
                        UnaryOperator<Float, Float>
{

  public static LogicalNot instance = new LogicalNot();

  @Override
  public Float evaluate(Float arg)
  {
    return (float) (((int) arg.floatValue()) == 0 ? 1 : 0);
  }

  public LogicalNot()
  {
    super(2);
  }

}
