package arb.expressions.nodes;

import java.util.List;
import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;

import arb.expressions.Expression;
import arb.expressions.GenerationContext;
import arb.functions.Function;

/**
 * Wraps a constant (input-independent) node so that its value is computed once
 * in {@code evaluateStaticSubexpressions()} and simply loaded from a field
 * during {@code evaluate()}. When
 * {@link Expression#generationContext generationContext} is
 * {@link GenerationContext#StaticEvaluation}, {@link #generate} delegates to
 * the wrapped node to emit the actual computation; otherwise it loads the
 * cached field.
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class StaticNode<D, R, F extends Function<? extends D, ? extends R>> extends
                        Node<D, R, F>
{
  public final Node<D, R, F> delegate;

  public StaticNode(Node<D, R, F> delegate)
  {
    super(delegate.expression);
    this.delegate  = delegate;
    this.fieldName = expression.newIntermediateVariable("static", delegate.type());
    this.position  = delegate.position;
    this.bits      = delegate.bits;
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    if (expression.generationContext == GenerationContext.StaticEvaluation)
    {
      return delegate.generate(mv, resultType);
    }
    Class<?> fieldType = delegate.type();
    expression.loadThisAndFieldOntoStack(mv, fieldName, fieldType);
    generatedType = fieldType;
    if (!resultType.equals(fieldType))
    {
      generateCastTo(mv, resultType);
    }
    return mv;
  }

  @Override
  public Class<?> type()
  {
    return delegate.type();
  }

  @Override
  public boolean isConstant()
  {
    return true;
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
  public <E, S, G extends Function<? extends E, ? extends S>> Node<D, R, F> substitute(String variable, Node<E, S, G> replacement)
  {
    return delegate.substitute(variable, replacement);
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>> Node<E, S, G> spliceInto(Expression<E, S, G> newExpression)
  {
    return delegate.spliceInto(newExpression);
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return false;
  }

  @Override
  public List<? extends Node<D, R, F>> getBranches()
  {
    return delegate.getBranches();
  }

  @Override
  public boolean isAtomic()
  {
    return delegate.isAtomic();
  }

  @Override
  public char symbol()
  {
    return delegate.symbol();
  }

  @Override
  public boolean isIndependentOf(VariableNode<D, R, F> variable)
  {
    return true;
  }

  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
  }
}
