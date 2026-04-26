package arb.expressions;

import java.util.HashSet;

import arb.Complex;
import arb.Integer;
import arb.expressions.nodes.Node;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * Regression test for the {@code StackOverflowError} raised by
 * {@code Node.equals} ↔ {@code Expression.equals} ↔ {@code rootNode.equals}
 * recursion cycle.
 * <p>
 * The previous implementation of {@link arb.expressions.nodes.Node#equals}
 * compared the {@code expression} back-pointer, and
 * {@link Expression#equals} recursed into its {@code rootNode}. Combined,
 * any comparison between two nodes whose {@code expression} fields differ
 * produced an unbounded recursion: {@code Expression.equals} →
 * {@code rootNode.equals} → {@code Node.equals} → {@code Expression.equals}
 * → …. This was reliably triggered by expressions containing nested
 * {@code pFq} sub-expressions whose operands were themselves structurally
 * similar.
 * <p>
 * This test parses and compiles a representative such expression, inserts
 * every node in the AST into a {@link HashSet} (exercising
 * {@code equals}/{@code hashCode}), and compares the root nodes of two
 * independently-parsed copies. It must complete without overflowing the
 * stack.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class NodeEqualsNoStackOverflowTest extends
                                          TestCase
{

  private static final String BUG_EXPR =
                              "y➔-I*(pFq([1,m,-m],[1/2],-((1/2)*I)/y)*exp(I*(π*m+y))"
                                            + "-pFq([1,m,-m],[1/2],((1/2)*I)/y)*exp(I*(2*π*m-y)))"
                                            + "*(4*m^2-1)*(-1)^(-m)/((4*m^2-2)*y*π)";

  @SuppressWarnings({ "rawtypes", "unchecked" })
  public void testNodeEqualsDoesNotOverflow()
  {
    var                                         context = new Context(Integer.named("m").set(3));
    Expression<Complex, Complex, ComplexFunction> expr    = Function.parseAndCompile(Complex.class,
                                                                                  Complex.class,
                                                                                  ComplexFunction.class,
                                                                                  BUG_EXPR,
                                                                                  context);
    HashSet<Node<?, ?, ?>>                      set     = new HashSet<>();
    expr.rootNode.nodeStream().forEach(n -> set.add((Node) n));
    assertTrue("expected at least a handful of distinct nodes", set.size() > 0);
  }

  public void testRootNodeEqualsBetweenSeparateCompilationsDoesNotOverflow()
  {
    Expression<Complex, Complex, ComplexFunction> a = Function.parseAndCompile(Complex.class,
                                                                               Complex.class,
                                                                               ComplexFunction.class,
                                                                               BUG_EXPR,
                                                                               new Context(Integer.named("m").set(3)));
    Expression<Complex, Complex, ComplexFunction> b = Function.parseAndCompile(Complex.class,
                                                                               Complex.class,
                                                                               ComplexFunction.class,
                                                                               BUG_EXPR,
                                                                               new Context(Integer.named("m").set(3)));
    // Whatever the answer is (identity-based equality now), the call must
    // terminate without a StackOverflowError.
    boolean eq = a.rootNode.equals(b.rootNode);
    // Independently parsed expressions are distinct objects.
    assertFalse("distinct Expression instances must not be .equals under identity semantics", eq);
  }

  public void testExpressionEqualsDoesNotOverflow()
  {
    Expression<Complex, Complex, ComplexFunction> a = Function.parseAndCompile(Complex.class,
                                                                               Complex.class,
                                                                               ComplexFunction.class,
                                                                               BUG_EXPR,
                                                                               new Context(Integer.named("m").set(3)));
    Expression<Complex, Complex, ComplexFunction> b = Function.parseAndCompile(Complex.class,
                                                                               Complex.class,
                                                                               ComplexFunction.class,
                                                                               BUG_EXPR,
                                                                               new Context(Integer.named("m").set(3)));
    assertFalse(a.equals(b));
    assertTrue(a.equals(a));
    // hashCode must not recurse into rootNode either.
    a.hashCode();
    b.hashCode();
  }
}
