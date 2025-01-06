package arb.expressions;

import java.util.List;

import org.yaml.snakeyaml.DumperOptions;
import org.yaml.snakeyaml.nodes.Node;
import org.yaml.snakeyaml.nodes.Tag;
import org.yaml.snakeyaml.representer.Represent;
import org.yaml.snakeyaml.representer.Representer;

import arb.Fraction;
import arb.Integer;
import arb.Named;
import arb.RationalFunction;
import arb.Real;
import arb.RealPolynomial;
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
public class TypeRepresenter extends
                                Representer
{

  public TypeRepresenter(DumperOptions options)
  {
    super(options);
    var namedStringRepresentation = new NamedStringRepresentation();
    representers.put(Context.class, new ContextRepresentation());
    representers.put(Integer.class, namedStringRepresentation);
    representers.put(Real.class, namedStringRepresentation);
    representers.put(Fraction.class, namedStringRepresentation);
    representers.put(RealPolynomial.class, namedStringRepresentation);
    representers.put(RationalFunction.class, namedStringRepresentation);

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

  public class NamedStringRepresentation implements
                                         Represent
  {

    @Override
    public Node representData(Object data)
    {
      return TypeRepresenter.this.representData(new SerializedContextVariable((Named) data));
    }

  }

  public class ContextRepresentation implements
                                     Represent
  {
    @Override
    public Node representData(Object data)
    {
      Context context = (Context) data;
      return TypeRepresenter.this.representMapping(getTag(data.getClass(), Tag.MAP),
                                                      context.variables.map,
                                                      defaultFlowStyle);
    }
  }
}