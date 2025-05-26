package arb.expressions.nodes.unary;

import static arb.expressions.Compiler.cast;
import static arb.expressions.Compiler.duplicateTopOfTheStack;
import static arb.expressions.Compiler.invokeStaticMethod;
import static arb.expressions.Compiler.loadResultParameter;
import static java.lang.String.format;

import org.objectweb.asm.MethodVisitor;

import arb.Integer;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.VariableNode;
import arb.functions.Function;

/**
 * <pre>
 * Binomial Coefficient
 * 
 * Syntax: ℭ(n,k) where n is the number of combinations and k is the number of
 * choices
 * </pre>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BinomialCoefficientNode<D, R, F extends Function<? extends D, ? extends R>> extends
                                    FunctionNode<D, R, F>
{
  @Override
  public MethodVisitor generate(MethodVisitor mv, Class<?> resultType)
  {
    Compiler.loadPointer(cast(duplicateTopOfTheStack(loadResultParameter(mv)), Integer.class));

    Compiler.generateCallToLoadUnsignedLong(combinations.generate(mv, Integer.class));

    Compiler.generateCallToLoadUnsignedLong(choices.generate(mv, Integer.class));

    return invokeStaticMethod(mv, arblib.class, "fmpz_bin_uiui", Void.class, long.class, long.class, long.class);
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

  public BinomialCoefficientNode(Expression<D, R, F> expression)
  {
    super("choose",
          null,
          expression);
    combinations = expression.resolve();
    choices      = expression.require(',').resolve();
    expression.require(')');
  }

  protected BinomialCoefficientNode(Expression<D, R, F> newExpression,
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
  public Node<D, R, F> integrate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public <E, S, G extends Function<? extends E, ? extends S>>
         Node<E, S, G>
         spliceInto(Expression<E, S, G> newExpression)
  {
    return new BinomialCoefficientNode<E, S, G>(newExpression,
                                                combinations.spliceInto(newExpression),
                                                choices.spliceInto(newExpression));
  }

  @Override
  public Node<D, R, F> differentiate(VariableNode<D, R, F> variable)
  {
    assert false : "TODO";
    return null;
  }

}
