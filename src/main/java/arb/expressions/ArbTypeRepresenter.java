package arb.expressions;

import java.util.List;

import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.nodes.Node;
import org.yaml.snakeyaml.nodes.Tag;
import org.yaml.snakeyaml.representer.Represent;
import org.yaml.snakeyaml.representer.Representer;

import arb.Integer;
import arb.Named;
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
    representers.put(TreeTableViewSkin.class, data -> represent(null));
    representers.put(ExpressionTree.class, data ->
    {
      return representData(((ExpressionTree) data).expressionInput.getText());
    });

    representers.put(ArbTypeRepresenter.ContextVariable.class, data ->
    {
      ContextVariable contextVariable = (ArbTypeRepresenter.ContextVariable) data;
      return representSequence(getTag(String.class, Tag.SEQ),
                               List.of(contextVariable.type, contextVariable.value),
                               defaultFlowStyle);
    });

  }

  public static class ContextVariable
  {
    public ContextVariable(Named integer)
    {
      value = integer.toStringWithoutName();
      type  = integer.getClass().getName();
    }

    public Object value;
    public String type;
  }

  public class RealRepresentation implements
                                  Represent
  {

    @Override
    public Node representData(Object data)
    {
      Real integer = (Real) data;

      return represent(new ContextVariable(integer));
    }

  }

  public class IntegerRepresentation implements
                                     Represent
  {

    @Override
    public Node representData(Object data)
    {
      Integer integer = (Integer) data;

      return represent(new ContextVariable(integer));
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