package arb.expressions;

import java.util.List;

import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.nodes.Node;
import org.yaml.snakeyaml.nodes.Tag;
import org.yaml.snakeyaml.representer.Represent;
import org.yaml.snakeyaml.representer.Representer;

import arb.Fraction;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.viz.ExpressionTreeView;

/**
 * A custom {@link Representer} implementation for serializing various Arb4j
 * types into YAML. This class ensures that objects are serialized efficiently
 * using SnakeYAML's automatic anchoring and aliasing mechanism, while allowing
 * for custom representations of specific types such as {@link Real},
 * {@link Fraction}, and {@link Integer}.
 *
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
    representers.put(Fraction.class, new FractionRepresentation());
    representers.put(ExpressionTreeView.class, data ->
    {
      return representData(((ExpressionTreeView<?, ?, ?>) data).expressionInput.getText());
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

      return ArbTypeRepresenter.this.representData(new SerializedContextVariable(real));
    }

  }

  public class FractionRepresentation implements
                                      Represent
  {

    @Override
    public Node representData(Object data)
    {
      Fraction integer = (Fraction) data;

      return ArbTypeRepresenter.this.representData(new SerializedContextVariable(integer));
    }

  }

  public class IntegerRepresentation implements
                                     Represent
  {

    @Override
    public Node representData(Object data)
    {
      Integer integer = (Integer) data;

      return ArbTypeRepresenter.this.representData(new SerializedContextVariable(integer));
    }

  }

  public class ContextRepresentation implements
                                     Represent
  {
    @Override
    public Node representData(Object data)
    {
      Context context = (Context) data;
      return ArbTypeRepresenter.this.representMapping(getTag(data.getClass(), Tag.MAP),
                                                      context.variables.map,
                                                      defaultFlowStyle);
    }
  }
}