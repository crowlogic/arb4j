package arb.algebraic.expressions;

import arb.OrderedPair;

public class BinaryExpression implements
                              Expression<Float>
{
  final BinaryOperator operator;
  Expression<Float>    a;
  Expression<Float>    b;

  public BinaryExpression(BinaryOperator operator, Expression<Float> a, Expression<Float> b)
  {
    this.operator = operator;
    this.a        = a;
    this.b        = b;
  }

  @Override
  public Float evaluate()
  {
    return operator.evaluate(new OrderedPair<Float, Float>(a.evaluate(),
                                                           b.evaluate()));
  }
}