package arb.expressions.nodes.unary;

import java.util.Objects;

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
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class BetaFunctionNode<D, C, F extends Function<? extends D, ? extends C>> extends
                             FunctionNode<D, C, F>
{

  @Override
  public String toString()
  {
    return String.format("Beta(%s,%s)", x, y);
  }

  @Override
  public Class<?> type()
  {
    return splicedNode.type();
  }

  @Override
  public int hashCode()
  {
    final int prime  = 31337;
    int       result = super.hashCode();
    result = prime * result + Objects.hash(x, y);
    return result;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (!super.equals(obj))
      return false;
    if (getClass() != obj.getClass())
      return false;
    BetaFunctionNode<?, ?, ?> other = (BetaFunctionNode<?, ?, ?>) obj;
    return Objects.equals(x, other.x) && Objects.equals(y, other.y);
  }

  private final Node<D, C, F>       x;
  private final Node<D, C, F>       y;
  private final Expression<D, C, F> definition;
  private Node<D, C, F>             splicedNode;

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
    splicedNode = definition.rootNode.spliceInto(expression);
    splicedNode.isResult = isResult;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;
    splicedNode.generate(mv, resultType);
    return mv;
  }

}