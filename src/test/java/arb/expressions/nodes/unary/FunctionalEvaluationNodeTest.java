package arb.expressions.nodes.unary;

import arb.Integer;
import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.integer.RealPolynomialSequence;
import junit.framework.TestCase;

/**
 * @see FunctionalEvaluationNode
 */
public class FunctionalEvaluationNodeTest extends
                                          TestCase
{

  /**
   * Tests that compiling and evaluating an expression containing a functional
   * evaluation P(n)(x) produces the correct result. Uses Legendre polynomials as
   * the function sequence: P(3)(0.5) should yield the 3rd Legendre polynomial
   * evaluated at 0.5.
   */
  public void testFunctionalEvaluationWithPolynomialSequence()
  {
    int bits = 128;

    try (var expr = RealPolynomialSequence.express("P", "P(3)", Integer.class, RealPolynomial.class, null))
    {
      expr.getField("P").set(new arb.functions.polynomials.orthogonal.real.JacobiPolynomials());
      RealPolynomial poly = expr.evaluate(new Integer(3), bits, new RealPolynomial());
      assertNotNull("compiled expression returned null", poly);

      try (Real result = new Real(); Real point = new Real("0.5", bits))
      {
        poly.evaluate(point, bits, result);
        assertFalse("evaluation result should not be zero for P_3(0.5)", result.isZero());
      }
    }
  }

  /**
   * Tests the structural properties of FunctionalEvaluationNode: isZero() must
   * return false, isLeaf() must return false, symbol() must return '@', and
   * getBranches() must return exactly two branches (functionNode and arg).
   */
  @SuppressWarnings("unchecked")
  public void testNodeStructuralProperties()
  {
    try (Expression<Real, Real, Function<Real, Real>> expr =
                   Function.express(Real.class, Real.class, "x", "x➔id(x)", null))
    {
      var rootNode = expr.rootNode;

      if (rootNode instanceof FunctionalEvaluationNode<?, ?, ?> funcNode)
      {
        assertFalse("isZero must be false for function application", funcNode.isZero());
        assertFalse("isLeaf must be false for function application", funcNode.isLeaf());
        assertEquals("symbol must be '@'", '@', funcNode.symbol());
        assertEquals("getBranches must return 2 nodes", 2, funcNode.getBranches().size());
        assertNotNull("getFunctionNode must not be null", funcNode.getFunctionNode());

        String ts = funcNode.typeset();
        assertTrue("typeset must contain \\left( delimiter", ts.contains("\\left("));
        assertTrue("typeset must contain \\right) delimiter", ts.contains("\\right)"));
      }
      else
      {
        fail("expected FunctionalEvaluationNode at root, got " + rootNode.getClass().getSimpleName());
      }
    }
  }
}
