package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.Named;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
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

  private Node<D, C, F> x;
  private Node<D, C, F> y;

  public BetaFunctionNode(Expression<D, C, F> expression)
  {
    super("B",
          null,
          expression);

    x = expression.resolve();

    expression.require(',');

    y = expression.resolve();

    expression.require(')');

    xval       = ((Named) expression.newCoDomainInstance()).setName("x");
    yval       = ((Named) expression.newCoDomainInstance()).setName("y");
    context    = new Context((Named) xval,
                             (Named) yval);
    definition = Function.compile(expression.domainType,
                                  expression.coDomainType,
                                  expression.functionClass,
                                  "(Γ(x)*Γ(y))/Γ(x+y)",
                                  context);
  }

  D                   xval;
  D                   yval;

  Context             context;

  Expression<D, C, F> definition;

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    definition.rootNode.generate(mv, resultType);
    return mv;
  }

}
