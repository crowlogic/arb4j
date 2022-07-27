package arb.algebraic.expressions.operators.unary;

public class BitwiseNot extends
                        UnaryOperator<Float, Float>
{

  public static BitwiseNot instance = new BitwiseNot();

  @Override
  public Float evaluate(Float arg)
  {
    return (float) ~(int) arg.floatValue();
  }

  public BitwiseNot()
  {
    super(3);
  }

}
