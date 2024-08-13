package arb.expressions.nodes.binary;

import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.Variable;
import arb.expressions.nodes.unary.FunctionCallNode;
import arb.functions.Function;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BinomialCoeffecientNode<D, R, F extends Function<? extends D, ? extends R>>
                                    extends
                                    FunctionCallNode<D, R, F>
{
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    assert false : "TODO: complete the binomial coefficient implementation";
    return null;
  }

  @Override
  public String toString()
  {
    return String.format("ℭ(%s,%s)", combinations, choices);
  }

  public Node<D, R, F> combinations;

  public Node<D, R, F> choices;

  @Override
  public String typeset()
  {
    return format("\\binom{%s}{%s}", combinations.typeset(), choices.typeset());
  }

  public BinomialCoeffecientNode(Expression<D, R, F> expression)
  {
    super("choose",
          null,
          expression);
    combinations = expression.resolve();
    choices      = expression.require(',').resolve();
    expression.require(')');
  }

  protected BinomialCoeffecientNode(Expression<D, R, F> newExpression,
                                    Node<D, R, F> combinations,
                                    Node<D, R, F> choices)
  {
    super("choose",
          null,
          newExpression);
    this.combinations = combinations;
    this.choices      = choices;
  }

  @Override
  public Node<D, R, F> integral(Variable<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new BinomialCoeffecientNode<E, S, G>(newExpression,
                                                combinations.spliceInto(newExpression),
                                                choices.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> derivative(Variable<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

}
