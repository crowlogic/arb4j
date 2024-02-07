// ASM: a very small and fast Java bytecode manipulation framework
package arb.expressions.executionflow.nodes;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;

/**
 * A node that represents a TABLESWITCH instruction.
 *
 * @author Eric Bruneton
 */
public class TableSwitchInsnNode extends
                                 AbstractInsnNode
{

  /** The minimum key value. */
  public int             min;

  /** The maximum key value. */
  public int             max;

  /** Beginning of the default handler block. */
  public LabelNode       dflt;

  /**
   * Beginnings of the handler blocks. This list is a list of {@link LabelNode}
   * objects.
   */
  public List<LabelNode> labels;

  /**
   * Constructs a new {@link TableSwitchInsnNode}.
   *
   * @param min    the minimum key value.
   * @param max    the maximum key value.
   * @param dflt   beginning of the default handler block.
   * @param labels beginnings of the handler blocks. {@code labels[i]} is the
   *               beginning of the handler block for the {@code min + i} key.
   */
  public TableSwitchInsnNode(final int min, final int max, final LabelNode dflt, final LabelNode... labels)
  {
    super(Opcodes.TABLESWITCH);
    this.min    = min;
    this.max    = max;
    this.dflt   = dflt;
    this.labels = Arrays.asList(labels);
  }

  @Override
  public int getType()
  {
    return TABLESWITCH_INSN;
  }

  @Override
  public void accept(final MethodVisitor methodVisitor)
  {
    Label[] labelsArray = new Label[this.labels.size()];
    for (int i = 0, n = labelsArray.length; i < n; ++i)
    {
      labelsArray[i] = this.labels.get(i).getLabel();
    }
    methodVisitor.visitTableSwitchInsn(min, max, dflt.getLabel(), labelsArray);
    acceptAnnotations(methodVisitor);
  }

  @Override
  public AbstractInsnNode clone(final Map<LabelNode, LabelNode> clonedLabels)
  {
    return new TableSwitchInsnNode(min,
                                   max,
                                   clone(dflt, clonedLabels),
                                   clone(labels, clonedLabels)).cloneAnnotations(this);
  }
}
