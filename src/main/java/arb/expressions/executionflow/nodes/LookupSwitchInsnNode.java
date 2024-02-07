// ASM: a very small and fast Java bytecode manipulation framework
package arb.expressions.executionflow.nodes;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;
import org.objectweb.asm.Opcodes;
import org.slf4j.helpers.Util;

/**
 * A node that represents a LOOKUPSWITCH instruction.
 *
 * @author Eric Bruneton
 */
public class LookupSwitchInsnNode extends
                                  AbstractInsnNode
{

  /** Beginning of the default handler block. */
  public LabelNode       dflt;

  /** The values of the keys. */
  public List<Integer>   keys;

  /** Beginnings of the handler blocks. */
  public List<LabelNode> labels;

  /**
   * Constructs a new {@link LookupSwitchInsnNode}.
   *
   * @param dflt   beginning of the default handler block.
   * @param keys   the values of the keys.
   * @param labels beginnings of the handler blocks. {@code labels[i]} is the
   *               beginning of the handler block for the {@code keys[i]} key.
   */
  public LookupSwitchInsnNode(final LabelNode dflt, final int[] keys, final LabelNode[] labels)
  {
    super(Opcodes.LOOKUPSWITCH);
    this.dflt   = dflt;
    this.keys   = Arrays.asList(keys);
    this.labels = Util.asArrayList(labels);
  }

  @Override
  public int getType()
  {
    return LOOKUPSWITCH_INSN;
  }

  @Override
  public void accept(final MethodVisitor methodVisitor)
  {
    int[] keysArray = new int[this.keys.size()];
    for (int i = 0, n = keysArray.length; i < n; ++i)
    {
      keysArray[i] = this.keys.get(i).intValue();
    }
    Label[] labelsArray = new Label[this.labels.size()];
    for (int i = 0, n = labelsArray.length; i < n; ++i)
    {
      labelsArray[i] = this.labels.get(i).getLabel();
    }
    methodVisitor.visitLookupSwitchInsn(dflt.getLabel(), keysArray, labelsArray);
    acceptAnnotations(methodVisitor);
  }

  @Override
  public AbstractInsnNode clone(final Map<LabelNode, LabelNode> clonedLabels)
  {
    LookupSwitchInsnNode clone = new LookupSwitchInsnNode(clone(dflt, clonedLabels),
                                                          null,
                                                          clone(labels, clonedLabels));
    clone.keys.addAll(keys);
    return clone.cloneAnnotations(this);
  }
}