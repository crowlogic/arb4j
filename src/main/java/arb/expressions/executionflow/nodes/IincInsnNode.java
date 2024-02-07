// ASM: a very small and fast Java bytecode manipulation framework
package arb.expressions.executionflow.nodes;

import java.util.Map;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

/**
 * A node that represents an IINC instruction.
 *
 * @author Eric Bruneton
 */
public class IincInsnNode extends
                          AbstractInsnNode
{

  /** Index of the local variable to be incremented. */
  public int var;

  /** Amount to increment the local variable by. */
  public int incr;

  /**
   * Constructs a new {@link IincInsnNode}.
   *
   * @param varIndex index of the local variable to be incremented.
   * @param incr     increment amount to increment the local variable by.
   */
  public IincInsnNode(final int varIndex, final int incr)
  {
    super(Opcodes.IINC);
    this.var  = varIndex;
    this.incr = incr;
  }

  @Override
  public int getType()
  {
    return IINC_INSN;
  }

  @Override
  public void accept(final MethodVisitor methodVisitor)
  {
    methodVisitor.visitIincInsn(var, incr);
    acceptAnnotations(methodVisitor);
  }

  @Override
  public AbstractInsnNode clone(final Map<LabelNode, LabelNode> clonedLabels)
  {
    return new IincInsnNode(var,
                            incr).cloneAnnotations(this);
  }
}
