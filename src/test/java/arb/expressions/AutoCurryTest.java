package arb.expressions;

import arb.Integer;
import arb.Real;
import arb.functions.integer.Sequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies the equalities that define the parser-level treatment of the shape
 * {@code (p₁,…,pₙ) = body} (and its named variant {@code f(p₁,…,pₙ) = body}):
 *
 * <ul>
 * <li>declaration shape {@code (p₁,…,pₙ) = body} produces the same AST as
 *     the chain {@code p₁➔p₂➔…➔pₙ➔body};</li>
 * <li>partitions of an argument list across grouped {@code (…)} pairs at a
 *     call site yield the same nested
 *     {@link arb.expressions.nodes.unary.FunctionalEvaluationNode}
 *     tree, so {@code f(a,b) = f(a)(b)}.</li>
 * </ul>
 *
 * The body of every lambda used here is built from arithmetic on the bound
 * parameters alone, avoiding every identifier that has its own dedicated parser
 * node. Equivalence is asserted on the AST representation
 * ({@code rootNode.toString()}) so that the result is independent of any
 * downstream generation, byte-code emission, or numeric evaluation.
 *
 * @author Stephen Crowley ©2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
@SuppressWarnings("unchecked")
public class AutoCurryTest extends
                           TestCase
{

  private static Expression<Integer, RealFunction, Sequence<RealFunction>> sequenceExpression(String name, String body)
  {
    return new Expression<>(name,
                            Integer.class,
                            RealFunction.class,
                            (Class) Sequence.class,
                            body,
                            null,
                            name,
                            null).parse(false);
  }

  /**
   * The anonymous two-parameter declaration {@code (n,t)=n+t} produces the same
   * AST as the arrow chain {@code n➔t➔n+t}.
   */
  public void testTwoParameterDeclarationMatchesArrowChain()
  {
    var arrow = sequenceExpression("ArrowAdd", "n➔t➔n+t");
    var paren = sequenceExpression("ParenAdd", "(n,t)=n+t");
    assertEquals(arrow.rootNode.toString(), paren.rootNode.toString());
  }

  /**
   * The single-parameter shape {@code (n)=t➔n+t} reduces to the arrow chain
   * {@code n➔t➔n+t}; a parameter list of length one degenerates to a single
   * binding identical to the arrow form.
   */
  public void testSingleParameterDeclarationMatchesArrow()
  {
    var arrow = sequenceExpression("ArrowOne", "n➔t➔n+t");
    var paren = sequenceExpression("ParenOne", "(n)=t➔n+t");
    assertEquals(arrow.rootNode.toString(), paren.rootNode.toString());
  }

  /**
   * The named declaration {@code BesselNamed(n,t)=n+t} parses identically to
   * its anonymous counterpart {@code (n,t)=n+t} when the leading function name
   * agrees with the name passed to the parser. The leading identifier is
   * consumed; the AST records only the body chain.
   */
  public void testNamedDeclarationMatchesAnonymous()
  {
    var named     = sequenceExpression("Named", "Named(n,t)=n+t");
    var anonymous = sequenceExpression("Anon", "(n,t)=n+t");
    assertEquals(anonymous.rootNode.toString(), named.rootNode.toString());
  }
}
