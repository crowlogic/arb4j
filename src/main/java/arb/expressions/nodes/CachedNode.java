package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.functions.Function;

public class CachedNode<D, C, F extends Function<? extends D, ? extends C>> extends
                       Node<D, C, F>
{

  private final Node<D, C, F> originalNode;

  public CachedNode(Expression<D, C, F> expression,
                    Node<D, C, F> originalNode,
                    String cacheFieldName)
  {
    super(expression);
    this.originalNode = originalNode;
    this.fieldName    = cacheFieldName;

    if (Expression.trace)
    {
      log.debug("CachedNode.<init>: originalNode={}, cacheFieldName={}",
                   originalNode,
                   cacheFieldName);
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (Expression.trace)
    {
      log.debug("CachedNode.generate: loading field {} of type {}", fieldName, type());
    }
    return loadFieldFromThis(mv, fieldName, type());
  }

  @Override
  public boolean dependsOn(VariableNode<D, C, F> variable)
  {
    return false;
  }

  @Override
  public Node<D, C, F> differentiate(VariableNode<D, C, F> variable)
  {
    return expression.newLiteralConstant(0);
  }

  @Override
  public Node<D, C, F> integrate(VariableNode<D, C, F> variable)
  {
    return originalNode.integrate(variable);
  }

  @Override
  public List<? extends Node<D, C, F>> getBranches()
  {
    return List.of();
  }

  @Override
  public boolean isLeaf()
  {
    return true;
  }

  @Override
  public boolean isScalar()
  {
    return originalNode.isScalar();
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return (Node<E, S, G>) originalNode.spliceInto(newExpression);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<D, C, F>
         substitute(String variable, Node<E, S, G> arg)
  {
    return this;
  }

  @Override
  public Node<D, C, F> cache()
  {
    if (Expression.trace)
    {
      log.debug("CachedNode.cache: returning this (already cached)");
    }
    return this;
  }

  @Override
  public char symbol()
  {
    return originalNode.symbol();
  }

  @Override
  public Class<?> type()
  {
    return originalNode.type();
  }

  @Override
  public String typeset()
  {
    return originalNode.typeset();
  }

  @Override
  public String toString()
  {
    return originalNode.toString();
  }

  @Override
  public void accept(Consumer<Node<D, C, F>> consumer)
  {
    consumer.accept(this);
  }

  public Node<D, C, F> getOriginalNode()
  {
    return originalNode;
  }
}
