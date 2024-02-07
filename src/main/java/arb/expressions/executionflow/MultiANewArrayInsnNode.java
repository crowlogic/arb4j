// ASM: a very small and fast Java bytecode manipulation framework
package arb.expressions.executionflow;

import java.util.Map;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

import arb.expressions.executionflow.nodes.AbstractInsnNode;
import arb.expressions.executionflow.nodes.LabelNode;

/**
 * A node that represents a MULTIANEWARRAY instruction.
 *
 * @author Eric Bruneton
 */
public class MultiANewArrayInsnNode extends AbstractInsnNode {

  /** An array type descriptor (see {@link org.objectweb.asm.Type}). */
  public String desc;

  /** Number of dimensions of the array to allocate. */
  public int dims;

  /**
   * Constructs a new {@link MultiANewArrayInsnNode}.
   *
   * @param descriptor an array type descriptor (see {@link org.objectweb.asm.Type}).
   * @param numDimensions the number of dimensions of the array to allocate.
   */
  public MultiANewArrayInsnNode(final String descriptor, final int numDimensions) {
    super(Opcodes.MULTIANEWARRAY);
    this.desc = descriptor;
    this.dims = numDimensions;
  }

  @Override
  public int getType() {
    return MULTIANEWARRAY_INSN;
  }

  @Override
  public void accept(final MethodVisitor methodVisitor) {
    methodVisitor.visitMultiANewArrayInsn(desc, dims);
    acceptAnnotations(methodVisitor);
  }

  @Override
  public AbstractInsnNode clone(final Map<LabelNode, LabelNode> clonedLabels) {
    return new MultiANewArrayInsnNode(desc, dims).cloneAnnotations(this);
  }
}