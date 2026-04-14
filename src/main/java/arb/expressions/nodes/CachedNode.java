package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import arb.expressions.Expression;
import arb.functions.Function;

/**
 * Abstract base for nodes that cache a delegate's computation in a generated
 * class field. Holds the delegate, allocates the field via
 * {@link Expression#newIntermediateVariable}, and delegates all non-generation
 * methods to the wrapped node. Subclasses override {@link #generate} and
 * semantic predicates like {@link #isConstant()} and {@link #dependsOn}.
 * 
 * @see StaticNode — caches constant (input-independent) subexpressions
 * @see SharedNode — caches non-constant subexpressions that appear multiple
 *      times (CSE)
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public abstract class CachedNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                 Node<D, R, F>
{
  public final Node<D, R, F> delegate;

  protected CachedNode(Node<D, R, F> delegate, String fieldPrefix)
  {
    super(delegate.expression);
    this.delegate  = delegate;
    this.fieldName = expression.newIntermediateVariable(fieldPrefix, delegate.type());
    this.position  = delegate.position;
    this.bits      = delegate.bits;
  }

  @Override
  public Class<?> type()
  {
    return delegate.type();
  }

  @Override
  public String toString()
  {
    return delegate.toString();
  }

  @Override
  public String typeset()
  {
    return delegate.typeset();
  }

  @Override
  public char symbol()
  {
    return delegate.symbol();
  }

  @Override
  public boolean isAtomic()
  {
    return delegate.isAtomic();
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    return delegate.getBranches();
  }

  @Override
  public Node<D, R, F> integral(VariableNode<D, R, F> variable)
  {
    return delegate.integral(variable);
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    return delegate.differentiate(variable);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F>
         substitute(String variable, Node<E, S, G> replacement)
  {
    return delegate.substitute(variable, replacement);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return delegate.spliceInto(newExpression);
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }
}
