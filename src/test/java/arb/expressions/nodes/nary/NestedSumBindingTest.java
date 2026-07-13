package arb.expressions.nodes.nary;

import org.objectweb.asm.tree.analysis.AnalyzerException;

import arb.Real;
import arb.functions.NullaryFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * Tests for the iterated-sum syntax
 * {@code Σ body {v1=lo1…hi1, v2=lo2…hi2, …, vN=loN…hiN}}, which the expression
 * compiler rewrites (via {@code NAryOperationNode.parseAdditionalBindings()})
 * into nested single-index sums outermost-first.
 *
 * @author Stephen Crowley ©2024-2026
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class NestedSumBindingTest extends
                                 TestCase
{

  /**
   * Σ_{a=1..2} Σ_{b=1..3} (a+b) = (2+3+4) + (3+4+5) = 9 + 12 = 21.
   */
  public static void testIndependentBoundsSum() throws AnalyzerException
  {
    NullaryFunction<Real> f   = RealNullaryFunction.express("Σ(a+b){a=1…2, b=1…3}");
    Real                  val = f.evaluate(null, 128, new Real());
    assertEquals(21.0, val.doubleValue());
  }

  /**
   * Σ_{a=1..3} Σ_{b=1..a} a·b
   *   a=1: 1·1                     = 1
   *   a=2: 2·1 + 2·2               = 6
   *   a=3: 3·1 + 3·2 + 3·3         = 18
   *   total                        = 25.
   */
  public static void testDependentInnerBoundSum() throws AnalyzerException
  {
    NullaryFunction<Real> f   = RealNullaryFunction.express("Σa*b{a=1…3, b=1…a}");
    Real                  val = f.evaluate(null, 128, new Real());
    assertEquals(25.0, val.doubleValue());
  }

  /**
   * Three-index independent sum:
   *   Σ_{a=1..2} Σ_{b=1..2} Σ_{c=1..2} 1 = 8.
   */
  public static void testThreeIndexConstantSum() throws AnalyzerException
  {
    NullaryFunction<Real> f   = RealNullaryFunction.express("Σ1{a=1…2, b=1…2, c=1…2}");
    Real                  val = f.evaluate(null, 128, new Real());
    assertEquals(8.0, val.doubleValue());
  }

  /**
   * Three-index sum with all bounds dependent:
   *   Σ_{a=1..2} Σ_{b=1..a} Σ_{c=1..b} 1
   *     a=1,b=1: c=1          → 1
   *     a=2,b=1: c=1          → 1
   *     a=2,b=2: c=1,2        → 2
   *   total                    = 4.
   */
  public static void testThreeIndexDependentBoundsSum() throws AnalyzerException
  {
    NullaryFunction<Real> f   = RealNullaryFunction.express("Σ1{a=1…2, b=1…a, c=1…b}");
    Real                  val = f.evaluate(null, 128, new Real());
    assertEquals(4.0, val.doubleValue());
  }

  /**
   * Iterated product, two independent indices:
   *   Π_{a=1..2} Π_{b=1..2} (a+b) = (1+1)(1+2)(2+1)(2+2) = 2·3·3·4 = 72.
   */
  public static void testTwoIndexProduct() throws AnalyzerException
  {
    NullaryFunction<Real> f   = RealNullaryFunction.express("Π(a+b){a=1…2, b=1…2}");
    Real                  val = f.evaluate(null, 128, new Real());
    assertEquals(72.0, val.doubleValue());
  }

  /**
   * Indexed-family binding, single level:
   *   Σ_{q=1..3} Σ_{k∶q=1..2} k
   * = Σ_{q=1..3} (1+2) = 9.
   */
  public static void testSingleIndexedFamilyBinding() throws AnalyzerException
  {
    NullaryFunction<Real> f   = RealNullaryFunction.express("Σk{q=1…3, k∶q=1…2}");
    Real                  val = f.evaluate(null, 128, new Real());
    assertEquals(9.0, val.doubleValue());
  }
}
