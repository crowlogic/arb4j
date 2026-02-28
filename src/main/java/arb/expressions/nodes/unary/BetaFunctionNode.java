package arb.expressions.nodes.unary;

import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.functions.Function;

/**
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
    return equivalentNode.type();
  }

  @Override
  public int hashCode()
  {
    return 31337 * super.hashCode() + Objects.hash(x, y) / 808;
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
  private Node<D, C, F>             equivalentNode;

  public BetaFunctionNode(Expression<D, C, F> expression)
  {
    super("Beta",
          null,
          expression);

    x = expression.resolve();
    expression.require(',');
    y = expression.resolve();
    expression.require(')');

    Context context = expression.context;
    if (context == null)
    {
      context = new Context();
    }

//    context.registerVariable("x", expression.newCoDomainInstance());
//    context.registerVariable("y", expression.newCoDomainInstance());

    equivalentNode = x.Γ().mul(y.Γ()).div(x.add(y).Γ());
    equivalentNode.isRootNode = isRootNode;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    generatedType = resultType;
    equivalentNode.generate(mv, resultType);
    return mv;
  }

}