package arb.expressions;

import java.util.List;

import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.nodes.Node;
import org.yaml.snakeyaml.nodes.Tag;
import org.yaml.snakeyaml.representer.Represent;
import org.yaml.snakeyaml.representer.Representer;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.viz.ExpressionTree;
import javafx.scene.control.skin.TreeTableViewSkin;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ArbTypeRepresenter extends
                                Representer
{

  public ArbTypeRepresenter(DumperOptions options)
  {
    super(options);

    representers.put(Context.class, new ContextRepresentation());
    representers.put(Integer.class, new IntegerRepresentation());
    representers.put(Real.class, new RealRepresentation());
    representers.put(ExpressionTree.class, data ->
    {
      return representData(((ExpressionTree<?, ?, ?>) data).expressionInput.getText());
    });

    representers.put(SerializedContextVariable.class, data ->
    {
      SerializedContextVariable contextVariable = (SerializedContextVariable) data;
      return representSequence(getTag(String.class, Tag.SEQ),
                               List.of(contextVariable.type, contextVariable.value),
                               defaultFlowStyle);
    });

  }

  public class RealRepresentation implements
                                  Represent
  {

    @Override
    public Node representData(Object data)
    {
      Real real = (Real) data;

      return represent(new SerializedContextVariable(real));
    }

  }

  public class IntegerRepresentation implements
                                     Represent
  {

    @Override
    public Node representData(Object data)
    {
      Integer integer = (Integer) data;

      return represent(new SerializedContextVariable(integer));
    }

  }

  public class ContextRepresentation implements
                                     Represent
  {
    @Override
    public Node representData(Object data)
    {
      Context context = (Context) data;
      return representMapping(getTag(data.getClass(), Tag.MAP), context.variables.map, defaultFlowStyle);
    }
  }
}