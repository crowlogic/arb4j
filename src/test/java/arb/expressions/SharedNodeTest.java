package arb.expressions;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.expressions.nodes.Node;
import arb.expressions.nodes.SharedNode;
import arb.expressions.nodes.binary.BinaryOperationNode;
import arb.expressions.nodes.unary.FunctionNode;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * Verifies that {@link SharedNode} instances are correctly inserted into the AST
 * by {@link Expression#optimize()} (CSE pass). These tests inspect the tree
 * structure after optimization to confirm canonical and reference SharedNodes
 * appear at the right positions with matching field names.
 * 
 * @see <a href="https://github.com/crowlogic/arb4j/issues/518">#518</a>
 * 
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class SharedNodeTest extends
                             TestCase
{

  /**
   * Collects all {@link SharedNode} instances in the AST via depth-first
   * traversal.
   */
  @SuppressWarnings("unchecked")
  private static List<SharedNode<Real, Real, RealFunction>>
          collectSharedNodes(Expression<Real, Real, RealFunction> expr)
  {
    List<SharedNode<Real, Real, RealFunction>> shared = new ArrayList<>();
    expr.rootNode.accept(node ->
    {
      if (node instanceof SharedNode)
      {
        shared.add((SharedNode<Real, Real, RealFunction>) node);
      }
    });
    return shared;
  }

  /**
   * {@code tanh(log(1+x²))/(1+x²)} has {@code 1+x²} appearing twice. After
   * CSE, both occurrences must be wrapped in {@link SharedNode} — exactly one
   * canonical and one reference — sharing the same field name.
   */
  public void testSharedNodeInsertedForRepeatedSubexpression()
  {
    var expr = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    assertEquals("expected exactly 2 SharedNodes for the two occurrences of 1+x²", 2, shared.size());

    long canonicalCount = shared.stream().filter(s -> s.isCanonical).count();
    long referenceCount = shared.stream().filter(s -> !s.isCanonical).count();
    assertEquals("expected exactly 1 canonical SharedNode", 1, canonicalCount);
    assertEquals("expected exactly 1 reference SharedNode", 1, referenceCount);
  }

  /**
   * Both SharedNodes in the same congruence class must share the same field
   * name so the canonical instance's stored value is loaded by the reference.
   */
  public void testSharedNodesShareFieldName()
  {
    var expr = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    assertEquals(2, shared.size());

    String fieldName0 = shared.get(0).fieldName;
    String fieldName1 = shared.get(1).fieldName;
    assertNotNull("SharedNode field name must not be null", fieldName0);
    assertEquals("both SharedNodes must share the same field name", fieldName0, fieldName1);
  }

  /**
   * The canonical SharedNode's delegate must represent the common subexpression
   * {@code 1+x²}, not a wrapper or unrelated node.
   */
  public void testCanonicalDelegateIsTheCommonSubexpression()
  {
    var expr = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    SharedNode<Real, Real, RealFunction> canonical =
      shared.stream().filter(s -> s.isCanonical).findFirst().orElseThrow();

    String delegateString = canonical.delegate.toString();
    assertTrue("canonical delegate should represent 1+x² but was: " + delegateString,
               delegateString.contains("x²") || delegateString.contains("x^2"));
  }

  /**
   * After CSE, the division node's right child (the denominator {@code 1+x²})
   * must be a reference SharedNode, not the original AdditionNode.
   */
  @SuppressWarnings("unchecked")
  public void testDenominatorIsReferenceSharedNode()
  {
    var expr = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    expr.optimize();

    // Root is a DivisionNode
    assertTrue("root must be a BinaryOperationNode (division)",
               expr.rootNode instanceof BinaryOperationNode);
    BinaryOperationNode<Real, Real, RealFunction> div =
      (BinaryOperationNode<Real, Real, RealFunction>) expr.rootNode;

    assertTrue("denominator must be a SharedNode after CSE",
               div.right instanceof SharedNode);
    SharedNode<Real, Real, RealFunction> denominator =
      (SharedNode<Real, Real, RealFunction>) div.right;
    assertFalse("denominator SharedNode must be a reference (not canonical)",
                denominator.isCanonical);
  }

  /**
   * The numerator's nested argument chain
   * {@code tanh(log(SharedNode(1+x²)))} must have a canonical SharedNode at
   * the innermost position (the argument to log).
   */
  @SuppressWarnings("unchecked")
  public void testNumeratorContainsCanonicalSharedNode()
  {
    var expr = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    expr.optimize();

    BinaryOperationNode<Real, Real, RealFunction> div =
      (BinaryOperationNode<Real, Real, RealFunction>) expr.rootNode;

    // Numerator is tanh(log(SharedNode))
    assertTrue("numerator must be a FunctionNode (tanh)",
               div.left instanceof FunctionNode);
    FunctionNode<Real, Real, RealFunction> tanh =
      (FunctionNode<Real, Real, RealFunction>) div.left;

    assertTrue("tanh's argument must be a FunctionNode (log)",
               tanh.arg instanceof FunctionNode);
    FunctionNode<Real, Real, RealFunction> log =
      (FunctionNode<Real, Real, RealFunction>) tanh.arg;

    assertTrue("log's argument must be a SharedNode after CSE",
               log.arg instanceof SharedNode);
    SharedNode<Real, Real, RealFunction> inner =
      (SharedNode<Real, Real, RealFunction>) log.arg;
    assertTrue("inner SharedNode (arg of log) must be canonical", inner.isCanonical);
  }

  /**
   * An expression with no repeated subexpressions should have zero SharedNodes
   * after optimization.
   */
  public void testNoSharedNodesWhenNoCommonSubexpressions()
  {
    var expr = RealFunction.parse("sin(x) + cos(x)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    assertEquals("no common subexpressions means no SharedNodes", 0, shared.size());
  }

  /**
   * Three occurrences of the same subexpression should produce one canonical
   * and two reference SharedNodes, all sharing the same field name.
   */
  public void testTripleOccurrenceProducesOneCanonicalTwoReferences()
  {
    // sin(x²) + cos(x²) + tan(x²) — x² appears three times
    var expr = RealFunction.parse("sin(x²)+cos(x²)+tan(x²)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    assertEquals("expected 3 SharedNodes for triple occurrence of x²", 3, shared.size());

    long canonicalCount = shared.stream().filter(s -> s.isCanonical).count();
    long referenceCount = shared.stream().filter(s -> !s.isCanonical).count();
    assertEquals("expected exactly 1 canonical", 1, canonicalCount);
    assertEquals("expected exactly 2 references", 2, referenceCount);

    // All must share the same field name
    String fieldName = shared.get(0).fieldName;
    for (SharedNode<Real, Real, RealFunction> s : shared)
    {
      assertEquals("all SharedNodes in the same congruence class must share field name",
                   fieldName, s.fieldName);
    }
  }

  /**
   * Numerical correctness: the optimized expression must produce the same
   * result as the unoptimized one.
   */
  public void testOptimizedExpressionProducesCorrectResult()
  {
    var original  = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    var optimized = RealFunction.parse("tanh(log(1+x²))/(1+x²)");
    optimized.optimize();

    var fOrig = original.generate().instantiate();
    var fOpt  = optimized.generate().instantiate();

    // Test at several points
    for (double x : new double[] { 0.0, 0.5, 1.0, 2.3, 5.0, -1.7 })
    {
      double yOrig = fOrig.eval(x);
      double yOpt  = fOpt.eval(x);
      assertEquals("mismatch at x=" + x, yOrig, yOpt, 1e-14);
    }
  }

  /**
   * Numerical correctness for triple-occurrence CSE.
   */
  public void testTripleOccurrenceNumericalCorrectness()
  {
    var original  = RealFunction.parse("sin(x²)+cos(x²)+tan(x²)");
    var optimized = RealFunction.parse("sin(x²)+cos(x²)+tan(x²)");
    optimized.optimize();

    var fOrig = original.generate().instantiate();
    var fOpt  = optimized.generate().instantiate();

    for (double x : new double[] { 0.1, 0.5, 1.0, -0.3 })
    {
      double yOrig = fOrig.eval(x);
      double yOpt  = fOpt.eval(x);
      assertEquals("mismatch at x=" + x, yOrig, yOpt, 1e-14);
    }
  }

  /**
   * Two distinct subexpressions each appearing twice should produce two
   * separate congruence classes, each with its own field name.
   * {@code sin(x²)*cos(x³)+sin(x²)-cos(x³)} has {@code x²} appearing twice
   * and {@code x³} appearing twice — two distinct CSE groups.
   */
  public void testTwoDistinctCommonSubexpressions()
  {
    var expr = RealFunction.parse("sin(x²)*cos(x³)+sin(x²)-cos(x³)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    assertTrue("should have SharedNodes for repeated subexpressions", shared.size() >= 4);

    long distinctFieldNames = shared.stream().map(s -> s.fieldName).distinct().count();
    assertTrue("should have at least 2 distinct CSE field names, got " + distinctFieldNames,
               distinctFieldNames >= 2);
  }

  /**
   * Function calls like {@code sin(x²)} are not leaves and must be CSE'd when
   * they appear multiple times — regardless of whether {@code isAtomic()}
   * returns {@code true}.
   */
  public void testFunctionCallNodesAreCsed()
  {
    // sin(x²) appears twice and cos(x³) appears twice
    var expr = RealFunction.parse("sin(x²)*cos(x³)+sin(x²)-cos(x³)");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);

    // sin(x²), cos(x³), x², and x³ each appear twice → 4 congruence classes, 8 SharedNodes
    // But inner nodes (x², x³) inside a SharedNode's delegate are not revisited
    // by accept(), so the actual count depends on traversal. What matters is
    // that sin(x²) and cos(x³) themselves are wrapped.
    boolean hasSinGroup = shared.stream().anyMatch(s -> s.delegate.toString().equals("sin(x^2)"));
    boolean hasCosGroup = shared.stream().anyMatch(s -> s.delegate.toString().equals("cos(x^3)"));
    assertTrue("sin(x²) must be CSE'd", hasSinGroup);
    assertTrue("cos(x³) must be CSE'd", hasCosGroup);
  }

  /**
   * Leaf nodes (plain variables, literal constants) must never be wrapped in
   * SharedNode even if they appear multiple times, because they are trivially
   * cheap to evaluate.
   */
  public void testLeafNodesAreNotWrapped()
  {
    // x appears 3 times but it's a leaf — should not be wrapped
    var expr = RealFunction.parse("x+x+x");
    expr.optimize();

    List<SharedNode<Real, Real, RealFunction>> shared = collectSharedNodes(expr);
    assertEquals("leaf nodes (variables) should not be wrapped in SharedNode", 0, shared.size());
  }
}
