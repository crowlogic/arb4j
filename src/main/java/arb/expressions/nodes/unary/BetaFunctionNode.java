package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionCallNode<D, C, F>
{

  private Node<D, C, F> p;
  private Node<D, C, F> q;

  public BetaFunctionNode(Expression<D, C, F> expression)
  {
    super("B",
          null,
          expression);

    p = expression.resolve();

    expression.require(',');

    q = expression.resolve();

    expression.require(')');

  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {

    return null;
  }

}
