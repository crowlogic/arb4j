package arb.expressions.nodes.nary;

import org.objectweb.asm.tree.analysis.AnalyzerException;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.real.NullaryFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class SumTest extends
                         TestCase
{

  @SuppressWarnings("resource")
  public static void testFunctionOfSumOfPochhammerSymbols()
  {
    Integer p;
    Real    α;
    Context context = new Context(p = new Integer(4).setName("p"),
                                  α = Real.newVector(p.getSignedValue()).setName("α"));

    α.set(1.0, 2.0, 3.0, 4.0);

    Function<Integer, Real> numer = Function.express(Integer.class,
                                                     Real.class,
                                                     "F",
                                                     "n➔Z(Σα[k]₍ₙ₋₁₎{k=1…p})",
                                                     context);

    Integer                 in    = new Integer(2);
    Real                    val   = numer.evaluate(in, 128, new Real());
    assertEquals(-1.549194546181022389085217301856860745424, val.doubleValue());
    numer.evaluate(in.set(3), 128, val);
    assertEquals(-1.308882393456599159016145447440780279253, val.doubleValue());
  }

  /**
   * In the theory of special functions (in particular the hypergeometric
   * function) and in the standard reference work Abramowitz and Stegun, the
   * Pochhammer symbol (x)n is used to represent the rising factorial.[6][7]
   */
  @SuppressWarnings("resource")
  public static void testSumOfPochhammerSymbols()
  {
    Integer p;
    Real    α;
    Context context = new Context(p = new Integer(4).setName("p"),
                                  α = Real.newVector(p.getSignedValue()).setName("α"));

    α.set(1.0, 2.0, 3.0, 4.0);

    Function<Integer, Real> numer = Function.express(Integer.class, Real.class, "F", "n➔Σα[k]₍ₙ₋₁₎{k=1…p}", context);

    Integer                 in    = new Integer(2);
    Real                    val   = numer.evaluate(in, 128, new Real());
    assertEquals(10.0, val.doubleValue());
    numer.evaluate(in.set(3), 128, val);
    assertEquals(40.0, val.doubleValue());
  }

  @SuppressWarnings("resource")
  public static void testRatioOfSums()
  {
    Integer p;
    Integer q;
    Real    α;
    Real    β;
    Context context = new Context(p = new Integer(3).setName("p"),
                                  q = new Integer(1).setName("q"),
                                  α = Real.newVector(p.getSignedValue()).setName("α"),
                                  β = Real.newVector(q.getSignedValue()).setName("β"));

    α.set(1.0, 2.0, 3.0);
    β.set(4.0);

    Function<Integer, Real> ratio = Function.express(Integer.class,
                                                     Real.class,
                                                     "F",
                                                     "n➔Σα[k]₍ₙ₋₁₎{k=1…p}/Σβ[k]₍ₙ₋₁₎{k=1…q}",
                                                     context);
    Integer                 in    = new Integer(2);
    Real                    val   = ratio.evaluate(in, 128, new Real());
    assertEquals(1.5, val.doubleValue());
  }
  
  @SuppressWarnings("resource")
  public static void testRatioOfRatioOverSumPlusOne()
  {
    Integer p;
    Integer q;
    Real    α;
    Real    β;
    Context context = new Context(p = new Integer(3).setName("p"),
                                  q = new Integer(1).setName("q"),
                                  α = Real.newVector(p.getSignedValue()).setName("α"),
                                  β = Real.newVector(q.getSignedValue()).setName("β"));

    α.set(1.0, 2.0, 3.0);
    β.set(4.0);

    Function<Integer, Real> ratio = Function.express(Integer.class,
                                                     Real.class,
                                                     "F",
                                                     "n➔Σα[k]₍ₙ₋₁₎{k=1…p}/Σβ[k]₍ₙ₋₁₎{k=1…q}/Σβ[k]₍ₙ₋₁₎{k=1…q}+1",
                                                     context);
    Integer                 in    = new Integer(2);
    Real                    val   = ratio.evaluate(in, 128, new Real());
    assertEquals(1.375, val.doubleValue());
  }

  public static void testOnePlusTwoPlusThreeEqualsSix() throws AnalyzerException
  {
    NullaryFunction<Real> prod = RealNullaryFunction.express("Σk{k=1…3}");
    assertEquals(6.0, prod.evaluate(null, 128, new Real()).doubleValue());
  }

  public static void testOnePlusTwoPlusThreePlusfourEqualsTen() throws AnalyzerException
  {
    NullaryFunction<Real> prod = RealNullaryFunction.express("Σk{k=1…4}");
    assertEquals(10.0, prod.evaluate(null, 128, new Real()).doubleValue());
  }

  public static void testTwoPlusFourPlusSixEqualsTwelve() throws AnalyzerException
  {
    NullaryFunction<Real> prod = RealNullaryFunction.express("Σ2*k{k=1…3}");
    assertEquals(12.0, prod.evaluate(null, 128, new Real()).doubleValue());
  }
}
