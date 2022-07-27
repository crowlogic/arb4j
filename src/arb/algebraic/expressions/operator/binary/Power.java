package arb.algebraic.expressions.operator.binary;

import arb.OrderedPair;
import arb.algebraic.expressions.BinaryOperator;

public class Power extends
                   BinaryOperator
{

  public Power(int opcode)
  {
    super(opcode);
    // TODO Auto-generated constructor stub
  }

  @Override
  public Float evaluate(OrderedPair<Float, Float> arg)
  {
    return arb.utensils.Utilities.TODO("implement me");

  }

}
