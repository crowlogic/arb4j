package arb.expressions.nodes.unary;

import java.util.Objects;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.nodes.*;
import arb.functions.Function;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public abstract class UnaryOperationNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                        Node<D, R, F>
{
  @Override
  public Node<D, R, F> fold()
  {
    if ( Expression.trace )
    {
      log.debug("cache(): independentOfInput={}", shouldCache() );
    }
    if (shouldCache()  )
    {
      if (isResult)
      {
        if (Expression.trace)
        {
          log.debug("UnaryOperationNode.cache(): node={} has fieldName=result (root), skipping cache",
                    this);
        }
        return this;
      }

      if (Expression.trace)
      {
        log.debug("UnaryOperationNode.cache(): node={}, existing fieldName={}",
                  this,
                  this.fieldName);
      }

      deregisterPreviousFieldName();

      String fieldName = expression.getNextIntermediateVariableFieldName("cached", type());
      this.fieldName = fieldName;

      if (Expression.trace)
      {
        log.debug("  assigned new fieldName={}", fieldName);
      }

      expression.registerFoldedNode(this);
      return new FoldedNode<>(expression,
                              this,
                              fieldName);
    }

    if (arg != null)
    {
      if (Expression.trace)
      {
        log.debug("  caching arg child: {}", arg);
      }
      arg = arg.fold();
    }

    return this;
  }

  protected boolean shouldCache()
  {
    return inputIndependent() && !Function.class.isAssignableFrom(type());
  }

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

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return arg != null && arg.dependsOn(variable);
  }
}