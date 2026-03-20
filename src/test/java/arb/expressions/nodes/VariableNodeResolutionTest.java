package arb.expressions.nodes;

import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealPolynomial;
import arb.exceptions.UndefinedReferenceException;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.rational.RationalNullaryFunction;
import arb.functions.real.RealFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Comprehensive tests for {@link VariableNode} resolution paths.
 *
 * <p>
 * Tests the three distinct ways a {@link VariableNode} can be resolved:
 * </p>
 * <ol>
 * <li><b>Context variable</b> — resolved via
 * {@link VariableNode#resolveContextualVariable()}</li>
 * <li><b>Independent variable</b> — resolved when
 * {@link VariableNode#isIndependent()} returns true</li>
 * <li><b>Upstream variable</b> — resolved via
 * {@link VariableNode#resolveUpstreamIndependentVariables()}</li>
 * </ol>
 *
 * <p>
 * Also tests the codegen paths in
 * {@link VariableNode#generateReference(org.objectweb.asm.MethodVisitor, Class)}:
 * </p>
 * <ul>
 * <li>isIndependent && nullary → generateFunctionalVariableIdentity
 * (identity())</li>
 * <li>isIndependent && !nullary → loadInputParameter</li>
 * <li>isFunctionalVariable() → generateFunctionalVariableIdentity
 * (identity())</li>
 * <li>else → generateReferenceToContextualVariable</li>
 * </ul>
 *
 * <p>
 * Some tests are expected to fail when production code has genuine bugs —
 * particularly around resolution paths broken after isDeclaredVariable removal.
 * Failing tests that correctly identify production bugs should be left as-is.
 * </p>
 */
public class VariableNodeResolutionTest extends
                                        TestCase
{

  // =========================================================================
  // A. Non-nullary functions (Real→Real via RealFunction)
  // =========================================================================

  /**
   * Test that parsing "x" as a {@link RealFunction} (Real→Real) correctly
   * resolves x as the independent variable with type Real (the domainType), and
   * that the expression is non-nullary.
   */
  public void testNonNullaryIndependentVariable()
  {
    Expression<Real, Real, RealFunction>   expr = RealFunction.parse("x");
    VariableNode<Real, Real, RealFunction> x    = expr.getIndependentVariable();

    assertNotNull("independent variable should not be null", x);
    assertEquals("x", x.getName());
    assertTrue("x should be independent", x.isIndependent);
    assertFalse("RealFunction expression should not be nullary", expr.isNullaryFunction());
    assertEquals("independent variable type in non-nullary should be domainType (Real)", Real.class, x.type());
  }

  /**
   * Test that "x^2+1" as a {@link RealFunction} correctly resolves x, and the
   * function evaluates to the expected value.
   */
  public void testNonNullaryExpressionWithVariable()
  {
    RealFunction f      = RealFunction.express("x^2+1");
    double       result = f.eval(3.0);
    assertEquals("3^2 + 1 = 10", 10.0, result);
  }

  /**
   * Test non-nullary function with a context variable: "x+a" where a is defined
   * in the context and x is the independent variable.
   */
  public void testNonNullaryWithContextVariable()
  {
    Context      context = new Context(Real.named("a").set("5", 128));
    RealFunction f       = RealFunction.express("x+a", context);
    double       result  = f.eval(3.0);
    assertEquals("3 + 5 = 8", 8.0, result);
  }

  /**
   * Verify that for a non-nullary RealFunction, x is independent, the expression
   * is not nullary, and isFunctionalVariable returns the appropriate value based
   * on whether the codomain is an interface.
   */
  public void testNonNullaryResolutionProperties()
  {
    Expression<Real, Real, RealFunction>   expr = RealFunction.parse("x^2");
    VariableNode<Real, Real, RealFunction> x    = expr.getIndependentVariable();

    assertNotNull("independent variable should exist", x);
    assertTrue("x should be independent", x.isIndependent);
    assertFalse("should not be nullary", expr.isNullaryFunction());
    assertEquals(Real.class, expr.domainType);
    assertEquals(Real.class, expr.coDomainType);
  }

  // =========================================================================
  // B. Nullary functions producing scalars (Object→Real)
  // =========================================================================

  /**
   * Test that a nullary constant expression "2^(1/4)" evaluates correctly. This
   * has no variable at all — it's a pure constant.
   */
  public void testNullaryConstantExpression()
  {
    RealNullaryFunction f      = RealNullaryFunction.express("2^(1/4)");
    Real                result = f.evaluate(128);
    assertNotNull("result should not be null", result);
    double val = result.doubleValue();
    assertEquals("2^(1/4) ≈ 1.189", 1.189207115002721, val, 1e-10);
  }

  /**
   * Test that a nullary expression with a context variable resolves the variable
   * from context.
   */
  public void testNullaryExpressionWithContextVariable()
  {
    Context             context = new Context(Real.named("a").set("7", 128));
    RealNullaryFunction f       = RealNullaryFunction.express("a+1", context);
    Real                result  = f.evaluate(128);
    assertNotNull("result should not be null", result);
    assertEquals("7 + 1 = 8", 8.0, result.doubleValue(), 1e-10);
  }

  // =========================================================================
  // C. Nullary functions producing concrete types
  // (Object→RationalFunction, Object→RealPolynomial)
  // =========================================================================

  /**
   * Test that {@code RationalFunction.express("x")} produces the identity
   * rational function. This is a nullary expression (Object→RationalFunction)
   * where x is the independent variable that gets identity() codegen.
   */
  public void testNullaryRationalFunctionIdentity()
  {
    RationalFunction expressed = RationalFunction.express("x");
    assertNotNull("expressed should not be null", expressed);
    assertEquals("x", expressed.toString());
  }

  /**
   * Verify the parse-level resolution for a nullary RationalFunction expression.
   * The independent variable x should be independent and nullary, with type
   * resolving to coDomainType (RationalFunction).
   */
  public void testNullaryRationalFunctionResolution()
  {
    Expression<Object, RationalFunction, RationalNullaryFunction> expr = RationalFunction.parse("x");

    assertTrue("should be nullary", expr.isNullaryFunction());
    assertEquals(Object.class, expr.domainType);
    assertEquals(RationalFunction.class, expr.coDomainType);

    VariableNode<?, ?, ?> x = expr.getIndependentVariable();
    assertNotNull("independent variable should exist", x);
    assertTrue("x should be independent", x.isIndependent);
    assertEquals("in nullary function, independent var type should be coDomainType", RationalFunction.class, x.type());
  }

  /**
   * Test that {@code RationalFunction.express("x/2")} produces "(x)/2".
   */
  public void testNullaryRationalFunctionArithmetic()
  {
    RationalFunction expressed = RationalFunction.express("x/2");
    assertNotNull("expressed should not be null", expressed);
    assertEquals("(x)/2", expressed.toString());
  }

  /**
   * Test that {@code RationalFunction.express("½-x/2")} produces "(-x+1)/2".
   */
  public void testNullaryRationalFunctionComplex()
  {
    RationalFunction expressed = RationalFunction.express("½-x/2");
    assertNotNull("expressed should not be null", expressed);
    assertEquals("(-x+1)/2", expressed.toString());
  }

  /**
   * Test that {@code RationalFunction.express("x^(-1)")} produces "1/(x)".
   */
  public void testNullaryRationalFunctionInverse()
  {
    RationalFunction expressed = RationalFunction.express("x^(-1)");
    assertNotNull("expressed should not be null", expressed);
    assertEquals("1/(x)", expressed.toString());
  }

  /**
   * Test RealPolynomial identity via {@link RealPolynomialNullaryFunction}. This
   * is a nullary expression (Object→RealPolynomial) where x is the polynomial's
   * formal variable.
   */
  public void testNullaryRealPolynomialIdentity()
  {
    RealPolynomialNullaryFunction f = RealPolynomialNullaryFunction.express("x");
    try ( RealPolynomial result = f.evaluate(128, new RealPolynomial()))
    {
      assertNotNull("result should not be null", result);
      assertEquals("x", result.toString());
    }
  }

  /**
   * Test RealPolynomial arithmetic expression via
   * {@link RealPolynomialNullaryFunction}.
   */
  public void testNullaryRealPolynomialArithmetic()
  {
    RealPolynomialNullaryFunction f = RealPolynomialNullaryFunction.express("x^2+1");
    try ( RealPolynomial result = f.evaluate(128, new RealPolynomial()))
    {
      assertNotNull("result should not be null", result);
      assertEquals("x² + 1", result.toString());
    }
  }

  // =========================================================================
  // D. Sequences / Non-nullary with functional codomain
  // (Integer→RationalFunction via RationalFunctionSequence)
  // =========================================================================

  /**
   * Test that {@code RationalFunctionSequence.express("n➔(½-z/2)ⁿ")} correctly
   * resolves n as the input (Integer domain) and z as the polynomial variable
   * that gets identity() codegen via isFunctionalVariable(). Evaluates at several
   * indices.
   */
  public void testSequenceInputAndFunctionalVariable()
  {
    RationalFunctionSequence seq = RationalFunctionSequence.express("n➔(½-z/2)ⁿ");
    try ( RationalFunction result = new RationalFunction())
    {
      seq.evaluate(0, 128, result);
      assertEquals("(½-z/2)^0 = 1", "1", result.toString());

      seq.evaluate(1, 128, result);
      assertEquals("(½-z/2)^1 = (-x+1)/2", "(-x+1)/2", result.toString());

      seq.evaluate(2, 128, result);
      assertEquals("(½-z/2)^2 = (x^2-2*x+1)/4", "(x^2-2*x+1)/4", result.toString());

      seq.evaluate(3, 128, result);
      assertEquals("(½-z/2)^3", "(-x^3+3*x^2-3*x+1)/8", result.toString());
    }
  }

  /**
   * Test that negative exponents work for the sequence too.
   */
  public void testSequenceNegativeExponent()
  {
    RationalFunctionSequence seq = RationalFunctionSequence.express("n➔(½-z/2)ⁿ");
    try ( RationalFunction result = new RationalFunction())
    {
      seq.evaluate(-2, 128, result);
      assertEquals("(½-z/2)^(-2)", "4/(x^2-2*x+1)", result.toString());
    }
  }

  /**
   * Test that for a RationalFunctionSequence, the parse-level expression
   * correctly identifies n as the input variable (Integer domain) and that
   * isFunctionalVariable() correctly reflects the functional codomain.
   */
  public void testSequenceResolutionProperties()
  {
    Expression<Integer, RationalFunction, RationalFunctionSequence> expr = RationalFunctionSequence.compile("n➔(½-z/2)ⁿ");

    assertFalse("sequence should not be nullary", expr.isNullaryFunction());
    assertEquals("domain should be Integer", Integer.class, expr.domainType);
    assertEquals("codomain should be RationalFunction", RationalFunction.class, expr.coDomainType);

    VariableNode<?, ?, ?> indep = expr.getIndependentVariable();
    assertNotNull("independent variable should exist", indep);
    assertEquals("independent variable should be n", "n", indep.getName());
  }

  /**
   * Test isFunctionalVariable() — the expression with RationalFunction codomain
   * is not an interface (RationalFunction is a class), so isFunctional() returns
   * false for Expression. However, isInterfaceFunctional() should return true
   * because RationalFunction implements Function.
   */
  public void testIsFunctionalVariableOnSequenceExpression()
  {
    Expression<Integer, RationalFunction, RationalFunctionSequence> expr = RationalFunctionSequence.compile("n➔(½-z/2)ⁿ");

    assertFalse("RationalFunction is a class, not an interface, so isFunctional() should be false", expr.isFunctional());
    assertTrue("RationalFunction implements Function, so isInterfaceFunctional() should be true", expr.isInterfaceFunctional());
  }

  // =========================================================================
  // E. Context variable resolution
  // =========================================================================

  /**
   * Test that a variable registered in the context is resolved as a contextual
   * variable, not as an independent variable.
   */
  public void testContextVariableResolution()
  {
    Context context = new Context();
    context.registerVariable("a", new RationalFunction("1"));
    Expression<Object, RationalFunction, RationalNullaryFunction> expr  = RationalFunction.parse("a", context);

    VariableNode<?, ?, ?>                                         indep = expr.getIndependentVariable();
    assertNull("a should be a context variable, not independent — so independent var should be null", indep);
  }

  /**
   * Test that context variables and independent variables coexist correctly. In
   * "x+a" with a in context, x should be independent and a should be a context
   * variable.
   */
  public void testContextVariableVsIndependentVariable()
  {
    Context context = new Context();
    context.registerVariable("a", new RationalFunction("1"));
    Expression<Object, RationalFunction, RationalNullaryFunction> expr  = RationalFunction.parse("x+a", context);

    VariableNode<?, ?, ?>                                         indep = expr.getIndependentVariable();
    assertNotNull("x should be the independent variable", indep);
    assertEquals("x", indep.getName());
  }

  /**
   * Test adding RationalFunction variables to context and using them in an
   * expression. This follows the pattern from
   * {@link arb.RationalFunctionTest#testRationalFunctionsAddedAsVariables()}.
   */
  public void testContextRationalFunctionVariables()
  {
    Context context = new Context();
    context.registerVariable("a", new RationalFunction("1"));
    context.registerVariable("b", new RationalFunction("-⅞*(½ - x/2)"));
    context.registerVariable("c", new RationalFunction("21/80*(½ - x/2)²"));
    Expression<Object, RationalFunction, RationalNullaryFunction> expr   = RationalFunction.parse("a+b+c", context);
    RationalFunction                                              result = expr.instantiate().evaluate();
    assertEquals("(21*x^2+98*x+201)/320", result.toString());
  }

  /**
   * Test that using function-parse style (name:expr) to register functions, then
   * referencing them without call syntax (a+b+c instead of a()+b()+c()), throws
   * an {@link UndefinedReferenceException} because the parser treats them as
   * variables, not function calls.
   */
  public void testFunctionsTreatedAsVariablesThrows()
  {
    Exception thrownException = null;
    try
    {
      Context context = new Context();
      RationalFunction.parse("a:1", context);
      RationalFunction.parse("b:-⅞*(½ - x/2)", context);
      RationalFunction.parse("c:21/80*(½ - x/2)²", context);
      Expression<Object, RationalFunction, RationalNullaryFunction> expr = RationalFunction.parse("a+b+c", context);
      expr.instantiate();
    }
    catch (Exception e)
    {
      thrownException = e;
    }
    assertNotNull("should throw because a+b+c references variables, not function calls", thrownException);
    assertEquals(UndefinedReferenceException.class, thrownException.getClass());
  }

  /**
   * Test that function-call syntax a()+b()+c() works correctly when functions are
   * registered via parse with names.
   */
  public void testFunctionCallSyntaxWorks()
  {
    Context context = new Context();
    RationalFunction.express("a:1", context);
    RationalFunction.express("b:-⅞*(½ - x/2)", context);
    RationalFunction.express("c:21/80*(½ - x/2)²", context);
    RationalFunction result = RationalFunction.express("a()+b()+c()", context);
    assertEquals("(21*x^2+98*x+201)/320", result.toString());
  }

  // =========================================================================
  // F. Resolution edge cases
  // =========================================================================

  /**
   * Test that a truly undefined variable (not in context, not independent, not
   * upstream) throws {@link UndefinedReferenceException}.
   */
  public void testUndefinedVariableThrows()
  {
    Exception thrownException = null;
    try
    {
      RealFunction.express("x+undefinedVar");
    }
    catch (UndefinedReferenceException e)
    {
      thrownException = e;
    }
    catch (Exception e)
    {
      thrownException = e;
    }
    assertNotNull("should throw for undefined variable", thrownException);
    assertTrue("should be UndefinedReferenceException but was " + thrownException.getClass().getName(), thrownException instanceof UndefinedReferenceException);
  }

  /**
   * Test the isIndependent() method: a variable equals the expression's
   * independent variable, OR the expression's independent variable is null.
   */
  public void testIsIndependentLogic()
  {
    Expression<Real, Real, RealFunction>   expr = RealFunction.parse("x");
    VariableNode<Real, Real, RealFunction> x    = expr.getIndependentVariable();
    assertNotNull(x);
    assertTrue("x.isIndependent() should be true", x.isIndependent());
    assertTrue("x.isIndependent field should be true", x.isIndependent);
  }

  /**
   * Test the type() method for an independent variable in a non-nullary function
   * — should return domainType.
   */
  public void testTypeForNonNullaryIndependent()
  {
    Expression<Real, Real, RealFunction>   expr = RealFunction.parse("x");
    VariableNode<Real, Real, RealFunction> x    = expr.getIndependentVariable();
    assertNotNull(x);
    assertEquals("type() should return domainType for non-nullary independent var", Real.class, x.type());
  }

  /**
   * Test the type() method for an independent variable in a nullary function —
   * should return coDomainType.
   */
  public void testTypeForNullaryIndependent()
  {
    Expression<Object, RationalFunction, RationalNullaryFunction> expr = RationalFunction.parse("x");
    VariableNode<?, ?, ?>                                         x    = expr.getIndependentVariable();
    assertNotNull(x);
    assertTrue("should be nullary", expr.isNullaryFunction());
    assertEquals("type() should return coDomainType for nullary independent var", RationalFunction.class, x.type());
  }

  /**
   * Test Expression.isFunctional() and Expression.isInterfaceFunctional() for
   * different expression types to understand the type classification.
   */
  public void testExpressionFunctionalClassification()
  {
    Expression<Real, Real, RealFunction> realExpr = RealFunction.parse("x");
    assertFalse("Real is not an interface", realExpr.isFunctional());
    assertFalse("Real does not extend Function", realExpr.isInterfaceFunctional());

    Expression<Object, RationalFunction, RationalNullaryFunction> ratExpr = RationalFunction.parse("x");
    assertFalse("RationalFunction is not an interface", ratExpr.isFunctional());
    assertTrue("RationalFunction extends Function", ratExpr.isInterfaceFunctional());
  }

  /**
   * Test that for a nullary RealNullaryFunction expression, isNullaryFunction()
   * is true and domainType is Object.class.
   */
  public void testNullaryRealFunctionProperties()
  {
    Expression<Object, Real, RealNullaryFunction> expr = RealNullaryFunction.parse("42");
    assertTrue("should be nullary", expr.isNullaryFunction());
    assertEquals(Object.class, expr.domainType);
    assertEquals(Real.class, expr.coDomainType);
  }

  /**
   * Test that a RealFunction (non-nullary) with functional codomain properties
   * has isFunctionalVariable() returning false (since Real is not a Function).
   */
  public void testIsFunctionalVariableForRealFunction()
  {
    Expression<Real, Real, RealFunction>   expr = RealFunction.parse("x");
    VariableNode<Real, Real, RealFunction> x    = expr.getIndependentVariable();
    assertNotNull(x);
    assertFalse("Real codomain is not functional, so isFunctionalVariable() should be false", x.isFunctionalVariable());
  }

  /**
   * Test that the expression toString() correctly represents the parsed
   * expression for a simple non-nullary function.
   */
  public void testExpressionToString()
  {
    Expression<Real, Real, RealFunction> expr = RealFunction.parse("x^2+1");
    String                               str  = expr.toString();
    assertNotNull(str);
    assertTrue("expression toString should contain x² but was: " + str, str.contains("x²") || str.contains("x^2"));
  }

  /**
   * Test that substitution works on a parsed expression's variable node. This
   * verifies that the VariableNode is properly linked to the expression.
   */
  public void testVariableNodeSubstitution()
  {
    Expression<Real, Real, RealFunction>   expr = RealFunction.parse("x^2");
    VariableNode<Real, Real, RealFunction> x    = expr.getIndependentVariable();
    assertNotNull(x);
    expr.substitute("x", x.sin());
    assertEquals("x➔sin(x)^2", expr.toString());
  }

  /**
   * Test evaluating RealFunction at multiple points to verify the generated
   * bytecode correctly loads the input parameter.
   */
  public void testNonNullaryEvaluationAtMultiplePoints()
  {
    RealFunction f = RealFunction.express("x^3-x");
    assertEquals("f(0) = 0", 0.0, f.eval(0.0), 1e-10);
    assertEquals("f(1) = 0", 0.0, f.eval(1.0), 1e-10);
    assertEquals("f(2) = 6", 6.0, f.eval(2.0), 1e-10);
    assertEquals("f(-1) = 0", 0.0, f.eval(-1.0), 1e-10);
  }

  /**
   * Test that a nullary function with no variables at all (pure constant) has
   * null independent variable.
   */
  public void testNullaryPureConstantHasNoIndependentVariable()
  {
    Expression<Object, Real, RealNullaryFunction> expr  = RealNullaryFunction.parse("42");
    VariableNode<?, ?, ?>                         indep = expr.getIndependentVariable();
    assertNull("pure constant expression should have no independent variable", indep);
  }

  /**
   * Test that multiple context variables can be used together in an expression.
   */
  public void testMultipleContextVariables()
  {
    Context             context = new Context(Real.named("a").set("3", 128),
                                              Real.named("b").set("4", 128));
    RealNullaryFunction f       = RealNullaryFunction.express("a+b", context);
    Real                result  = f.evaluate(128);
    assertEquals("3 + 4 = 7", 7.0, result.doubleValue(), 1e-10);
  }
}
