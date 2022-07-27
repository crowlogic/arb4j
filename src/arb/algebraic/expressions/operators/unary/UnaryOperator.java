package arb.algebraic.expressions.operators.unary;

import arb.algebraic.expressions.Expression;
import arb.algebraic.expressions.Operator;

public abstract class UnaryOperator<X , Y> extends
                                   Operator<X, Y>
{

  public UnaryOperator(int opcode)
  {
    super(opcode);
  }

}
