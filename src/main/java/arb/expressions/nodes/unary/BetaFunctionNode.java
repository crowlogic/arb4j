package arb.expressions.nodes.unary;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
 * 
 * @param <D>
 * @param <C>
 * @param <F>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @author ©2024 Stephen Crowley
 */
public class BetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionNode<D, C, F>
{

  private final Node<D, C, F>       x;
  private final Node<D, C, F>       y;
  private final Expression<D, C, F> definition;

  public BetaFunctionNode(Expression<D, C, F> expression)
  {
    super("Beta",
          null,
          expression);

    x = expression.resolve();
    expression.require(',');
    y = expression.resolve();
    expression.require(')');

    Context context = new Context();
    
    context.registerVariable("x", expression.newCoDomainInstance());
    context.registerVariable("y", expression.newCoDomainInstance());

    definition = Function.parse(expression.domainType,
                                expression.coDomainType,
                                expression.functionClass,
                                "Γ(x)*Γ(y)/Γ(x+y)",
                                context);

    definition.substitute("x", x);
    definition.substitute("y", y);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Node<D, C, F> splicedNode = definition.rootNode.spliceInto(expression);
    splicedNode.isResult = isResult;
    splicedNode.generate(mv, resultType);
    return mv;
  }


}