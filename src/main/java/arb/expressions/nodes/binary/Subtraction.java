package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.LiteralConstant;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class Subtraction<D, R, F extends Function<D, R>> extends
                        BinaryOperation<D, R, F>
{

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (left == null)
    {
      left = new LiteralConstant<>(expression,
                                   "0");
    }
    return super.generate(mv, resultType);
  }

  @Override
  public String typeset()
  {
    return format("%s - %s", left.typeset(), right.typeset());
  }

  public Subtraction(Expression<D, R, F> expression, Node<D, R, F> left, Node<D, R, F> right)
  {
    super(expression,
          left,
          "sub",
          right,
          "-");
  }
}