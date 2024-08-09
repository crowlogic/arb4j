package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Subtraction<D, R, F extends Function<? extends D, ? extends R>> extends
                        BinaryOperation<D, R, F>
{

  @Override
  public Class<?> type()
  {
    fillInNullLeftHandSide();
    return super.type();
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    fillInNullLeftHandSide();
    return super.generate(mv, resultType);
  }

  private void fillInNullLeftHandSide()
  {
    if (left == null)
    {
      left = new LiteralConstant<>(expression,
                                   "0");
    }
  }

  @Override
  public String typeset()
  {
    String lhs = left == null ? "" : left.typeset();
    return format("\\left(%s-%s\\right)", "0".equals(lhs) ? "" : lhs, right.typeset());
  }

  public Subtraction(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "sub",
          right,
          "-");
  }

  @Override
  public boolean isCommutative()
  {
    return false;
  }

  @Override
  public Node<D, R, F> integral(Variable<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new Subtraction<E, S, G>(newExpression,
                                    left.spliceInto(newExpression),
                                    right.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }
}