package arb.algebraic.expressions.operators.unary;

public class Minus extends
                   UnaryOperator<Float, Float>
{

  public static Minus instance = new Minus();

  public Minus()
  {
    super(1);
  }

  @Override
  public Float evaluate(Float arg)
  {
    return -arg.floatValue();
  }
}
