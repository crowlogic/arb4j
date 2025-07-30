package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.loadResultParameter;

import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @author Στεvε
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class UnaryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                        Node<D, R, F>
{

  @Override
  public int hashCode()
  {
    return Objects.hash(arg);
  }

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    UnaryOperationNode<?, ?, ?> other = (UnaryOperationNode<?, ?, ?>) obj;
    return Objects.equals(arg, other.arg);
  }

  public Node<D, R, F> arg;

  public UnaryOperationNode(Node<D, R, F> arg)
  {
    super(arg.expression);
    this.arg = arg;
  }

  public UnaryOperationNode(Expression<D, R, F> expression, Node<D, R, F> arg)
  {
    super(expression);
    this.arg = arg;
  }

  @Override
  public String toString()
  {
    return String.format("[name=%s,arg=%s]", getClass().getSimpleName(), arg);
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    return arg.generate(mv, resultType);
  }

  public void loadOutputVariableOntoStack(MethodVisitor methodVisitor, Class<?> resultType)
  {
    if (isResult)
    {
      cast(loadResultParameter(methodVisitor), resultType);
      fieldName = "result";
    }
    else
    {
      fieldName = expression.allocateIntermediateVariable(methodVisitor, resultType);
    }
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return arg.dependsOn(variable);
  }
}