package arb.expressions.nodes;

import static org.objectweb.asm.Opcodes.*;

import java.util.function.Consumer;

import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Type;

import arb.functions.Function;

/**
 * Wraps a non-constant subexpression that appears multiple times in the AST (a
 * common subexpression). The canonical instance ({@code isCanonical=true})
 * computes the delegate's value and stores it into a shared field; reference
 * instances ({@code isCanonical=false}) load the precomputed value from that
 * field.
 * 
 * <p>
 * All instances in the same {@link CongruenceClass} share the same
 * {@link #fieldName} so that the canonical instance's stored result is read by
 * the references.
 * 
 * @see CachedNode — abstract base providing delegate wrapping and field
 *      allocation
 * @see StaticNode — the constant-subexpression analogue from issue #874
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class SharedNode<D, R, F extends Function<? extends D, ? extends R>> extends
                        CachedNode<D, R, F>
{
  public final boolean isCanonical;

  /**
   * @param delegate    the original node being cached
   * @param fieldName   the shared field name for this CSE group (all members use
   *                    the same name); if {@code null}, a fresh one is allocated
   *                    by the {@link CachedNode} constructor
   * @param isCanonical {@code true} for the first occurrence (compute + store),
   *                    {@code false} for subsequent references (load only)
   */
  public SharedNode(Node<D, R, F> delegate, String fieldName, boolean isCanonical)
  {
    super(delegate,
          "cse");
    this.isCanonical = isCanonical;
    if (fieldName != null)
    {
      this.fieldName = fieldName;
    }
  }

  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Class<?> fieldType = delegate.type();

    if (isCanonical)
    {
      // Compute the delegate's value — leaves result on the stack
      boolean wasRootNode = delegate.isRootNode;
      delegate.isRootNode = false;
      delegate.generate(mv, fieldType);
      delegate.isRootNode = wasRootNode;

      // Store into the shared field: need [this, value] on stack
      // Stack is currently [value]. Load this underneath, swap, PUTFIELD.
      mv.visitVarInsn(ALOAD, 0);
      mv.visitInsn(SWAP);
      mv.visitFieldInsn(PUTFIELD,
                        expression.className.replace('.', '/'),
                        fieldName,
                        Type.getDescriptor(fieldType));

      // Reload the field so the value is back on the stack for the caller
      expression.loadThisAndFieldOntoStack(mv, fieldName, fieldType);
    }
    else
    {
      // Reference: just load the precomputed value from the shared field
      expression.loadThisAndFieldOntoStack(mv, fieldName, fieldType);
    }

    generatedType = fieldType;
    if (!resultType.equals(fieldType))
    {
      generateCastTo(mv, resultType);
    }
    return mv;
  }

  /**
   * Reference instances do not own a computation — only the canonical instance
   * does. Recursing into a reference's delegate would expose every node again
   * to traversals (notably static-node enumeration) and emit duplicate
   * computations.
   */
  @Override
  public void accept(Consumer<Node<D, R, F>> t)
  {
    t.accept(this);
    if (isCanonical)
    {
      delegate.accept(t);
    }
  }

  @Override
  public boolean isConstant()
  {
    return false;
  }

  @Override
  public boolean dependsOn(VariableNode<D, R, F> variable)
  {
    return delegate.dependsOn(variable);
  }
}
