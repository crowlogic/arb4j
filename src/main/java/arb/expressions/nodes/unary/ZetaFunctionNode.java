package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionNode<D, C, F>
{

  public ZetaFunctionNode(Expression<D, C, F> expression)
  {
    super("ζ",
          expression.resolve(),
          expression.require(')'));
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    assert false : "todo";
    return null;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "todo: generate " + this;

    // Generate bytecode that calls the appropriate zeta function
    // Can use the RiemannζFunction.evaluate() with proper order
    return mv;
  }
}