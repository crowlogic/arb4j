package arb.expressions.nodes;

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
                        CachedNode<D, R, F>
{

  public StaticNode(Node<D, R, F> delegate)
  {
    super(delegate,
          "static");
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
  public boolean isConstant()
  {
    return true;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return delegate.dependsOn(variable);
  }

  @Override
  public boolean isIndependentOf(VariableNode<D, R, F> variable)
  {
    return delegate.isIndependentOf(variable);
  }
}
