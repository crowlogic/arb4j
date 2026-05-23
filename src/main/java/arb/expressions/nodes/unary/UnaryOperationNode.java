package arb.expressions.nodes.unary;

import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
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
    if (arg != null)
    {
      arg.parent = this;
    }
  }

  public UnaryOperationNode(Expression<D, R, F> expression, Node<D, R, F> arg)
  {
    super(expression);
    this.arg = arg;
    if (arg != null)
    {
      arg.parent = this;
    }
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

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    // Some FunctionNode instances (nullary context-lookup calls, e.g. m(),
    // σ(), context-lookup binom) carry no argument subtree. From the AST
    // perspective the variable does not appear lexically inside the call;
    // any dependence is carried by the looked-up mapping itself and is not
    // visible through this node.
    if (arg == null) return false;
    return arg.dependsOn(variable);
  }
}