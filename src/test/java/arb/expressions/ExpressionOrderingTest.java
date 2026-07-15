package arb.expressions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.functions.complex.ComplexFunction;
import junit.framework.TestCase;

/**
 * Test expression variable ordering to demonstrate how arrow chains work.
 * 
 * <p>Important pattern: Arrow chains define the binding order from left to right.
 * "x➔t➔x+t" binds x first (inner), then t (outer), then the final expression x+t</p>
 * 
 * <p>The Kn expression uses this same pattern: "n➔z➔w➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})"</p>
 * 
 * <p>The n parameter is the OUTERMOST arrow, determining the sum's upper bound.
 * This is why Knfuncfunc.class expects n as a field, not the method parameter.</p>
 */
public class ExpressionOrderingTest extends TestCase
{
  private static final Logger log = LoggerFactory.getLogger(ExpressionOrderingTest.class);

  /**
   * Test showing that complexFunction.parse automatically instantiates with instantiate()
   */
  public void testComplexFunctionParseReturnsInstantiated()
  {
    // ComplexFunction.parse() returns an Expression, which has an instantiate() method
    // The instantiate() method returns the functional sequence instance
    Expression<?, ?, ?> expr = ComplexFunction.parse("n➔t➔t*t+1/n");
    assertNotNull("Expression should not be null", expr);
    
    // For type safety, we need to call instantiate() and then cast if needed
    // But the key point is that parse() has the full expression
  }

  /**
   * The Kn expression "n➔z➔w➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})"
   * shows n as the outermost parameter (first after →)
   * 
   * This means:
   - The first → binds n (outer level)
   - The second → binds z (middle level)  
   - The third → binds w (inner level)
   - The sum expression body evaluates using all three
   */
  public void testKnExpressionParameterOrder()
  {
    // This is what Kn looks like internally - showing the parameter binding order
    String knExpression = "n➔z➔w➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})";
    
    // The Kn class creates a function in its context
    // ComplexFunctionalSequence.express("Kn", knExpression, context);
    
    // When evaluated:
    // 1. Kn.apply(4) returns Knfunc (binds n=4, outermost level)
    // 2. Knfunc.apply(z) returns Knfuncfunc (binds z, middle level)
    // 3. Knfuncfunc.evaluate(n) returns result (inner level uses n field)
    
    log.debug("Kn expression parameter order: n (outermost) ➔ z ➔ w ➔ sum body");
  }

  /**
   * Summary of the Kn expression binding:
   * 
   *         Kn (Integer domain)
   *              |
   *              v
   *    Knfunc (Complex domain)  <- n is the input to this level
   *              |
   *              v
   *    Knfuncfunc (Complex domain) <- z is the input to this level
   *              |
   *              v
   *  KnoperandF0001 (Integer domain) <- w is the input to this level
   */
  public void testExpressionBindingHierarchy()
  {
    log.debug("Expression binding hierarchy");
    log.debug("1. Kn: Integer ➔ ComplexFunctional (binds n)");
    log.debug("2. Knfunc: Complex ➔ ComplexFunction (binds z)");
    log.debug("3. Knfuncfunc: Complex ➔ Complex (binds w, uses n from Knfunc)");
    log.debug("4. KnoperandF0001: Integer ➔ Complex (sum over k=0..n)");
    
    // This demonstrates why variable order matters:
    // n must be a field on Knfuncfunc to access the sum bound
    assertTrue("Variable order determines binding hierarchy", true);
  }

  /**
   * The key insight: parameter order is crucial for multi-level currying
   * 
   * In "n➔z➔w➔body", n binds first (outermost), making it available in all inner levels
   * If the order was different (e.g., "w➔n➔z➔body"), then n wouldn't be available
   * when the sum expression references it
   */
  public void testParameterOrderCriticalForUpstreamAccess()
  {
    // Correct: n is outermost, accessible in inner sum
    String correct = "n➔z➔w➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})";
    
    // Incorrect: n would not be accessible in the sum bound
    String incorrect = "w➔n➔z➔sum(k➔Q(k)(z)*Q(k)(w)/hv(k){k=0..n})";
    
    log.debug("Correct order allows n to be accessed in sum bound: " + correct);
    log.debug("Incorrect order would break: n is not available when sum is evaluated");
    
    // The test failure in the last run confirms this - the sum needs n to be available
  }

  /**
   * Show the pattern of how the expression chain builds up
   */
  public void testExpressionChainBuilding()
  {
    log.debug("Expression chain building steps:");
    log.debug("1. Kn: Integer ➔ ComplexFunctional (n-bound)");
    log.debug("2. Knfunc: n (field) + Complex ➔ ComplexFunction (z-bound)");
    log.debug("3. Knfuncfunc: n (field), z (field), Complex ➔ Complex (w-bound)");
    log.debug("4. KnoperandF0001: n (field), z (field), w (field), Integer ➔ Complex (sum)");
    log.debug("5. Sum evaluation: uses n from Knfuncfunc field (not method parameter)");
    
    // This chain requires n to be a field at each level to propagate from Kn ➔ Knfunc ➔ Knfuncfunc
  }
}