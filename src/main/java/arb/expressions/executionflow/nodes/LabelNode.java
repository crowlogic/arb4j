package arb.expressions.executionflow.nodes;

import java.util.Map;

import org.objectweb.asm.Label;
import org.objectweb.asm.MethodVisitor;

/** An {@link AbstractInsnNode} that encapsulates a {@link Label}. */
public class LabelNode extends
                       AbstractInsnNode
{

  private Label value;

  public LabelNode()
  {
    super(-1);
  }

  public LabelNode(final Label label)
  {
    super(-1);
    this.value = label;
  }

  @Override
  public int getType()
  {
    return LABEL;
  }

  /**
   * Returns the label encapsulated by this node. A new label is created and
   * associated with this node if it was created without an encapsulated label.
   *
   * @return the label encapsulated by this node.
   */
  public Label getLabel()
  {
    if (value == null)
    {
      value = new Label();
    }
    return value;
  }

  @Override
  public void accept(final MethodVisitor methodVisitor)
  {
    methodVisitor.visitLabel(getLabel());
  }

  @Override
  public AbstractInsnNode clone(final Map<LabelNode, LabelNode> clonedLabels)
  {
    return clonedLabels.get(this);
  }

  public void resetLabel()
  {
    value = null;
  }
}
