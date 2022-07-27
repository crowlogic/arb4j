package arb.algebraic.expressions;

import arb.OrderedPair;

public abstract class BinaryOperator extends
                                     Operator<Float, OrderedPair<Float, Float>>
{

  @Override
  public abstract Float evaluate(OrderedPair<Float, Float> arg);

  public BinaryOperator(int opcode)
  {
    super(opcode);
  }

}
