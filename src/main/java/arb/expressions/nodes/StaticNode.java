package arb.expressions.nodes;

import static org.objectweb.asm.Opcodes.ALOAD;
import static org.objectweb.asm.Opcodes.ASTORE;

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
    if (isRootNode)
    {
      // Issue #1039: when the root node itself is a StaticNode (the entire
      // expression depends only on context/fixed variables), we must write
      // the cached value into the caller's result argument (slot 4) rather
      // than just leaving it on the stack.
      expression.loadThisAndFieldOntoStack(mv, fieldName, fieldType);
      if (!resultType.equals(fieldType))
      {
        generateCastTo(mv, resultType);
      }
      // Store to result parameter (slot 4)
      mv.visitVarInsn(ASTORE, 4);
      // Reload for ARETURN
      mv.visitVarInsn(ALOAD, 4);
      generatedType = fieldType;
      return mv;
    }
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

  /**
   * A {@link StaticNode} already owns its cached field and has a
   * {@link CachedNode#delegate}; re-wrapping it on a subsequent pass of
   * {@link Expression#replaceConstantNodes()} would double-cache the same
   * computation and, worse, orphan the inner {@link #fieldName}. The
   * fixed-point hoisting loop relies on this override to be idempotent —
   * repeated passes converge instead of compounding wrappers.
   */
  @Override
  public Node<D, R, F> replaceConstantNodes()
  {
    return this;
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
