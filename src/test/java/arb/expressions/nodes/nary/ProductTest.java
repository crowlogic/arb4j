package arb.expressions.nodes.nary;

import org.objectweb.asm.tree.analysis.AnalyzerException;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.expressions.Context;
import arb.functions.Function;
import arb.functions.NullaryFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

/**
 * @author ©2024 Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class ProductTest extends
                         TestCase
{

  @SuppressWarnings("resource")
  public static void testFunctionOfProductOfPochhammerSymbols()
  {
    Integer p;
    Real    α;
    Context context = new Context(p = new Integer(4).setName("p"),
                                  α = Real.newVector(p.getSignedValue()).setName("α"));

    α.set(1.0, 2.0, 3.0, 4.0);

    Function<Integer, Real> numer = Function.express(Integer.class,
                                                     Real.class,
                                                     "F",
                                                     "n➔Z(∏α[k]₍ₙ₋₁₎{k=1…p})",
                                                     context);

    Integer                 in    = new Integer(2);
    Real                    val   = numer.evaluate(in, 128, new Real());
    assertEquals(-1.1150955782389447, val.doubleValue());
    numer.evaluate(in.set(3), 128, val);
    assertEquals(-0.5147694684849397, val.doubleValue());
  }

  /**
   * In the theory of special functions (in particular the hypergeometric
   * function) and in the standard reference work Abramowitz and Stegun, the
   * Pochhammer symbol (x)n is used to represent the rising factorial.[6][7]
   */
  @SuppressWarnings("resource")
  public static void testProductOfPochhammerSymbols()
  {
    Integer p;
    Real    α;
    Context context = new Context(p = new Integer(4).setName("p"),
                                  α = Real.newVector(p.getSignedValue()).setName("α"));

    α.set(1.0, 2.0, 3.0, 4.0);

    Function<Integer, Real> numer = Function.express(Integer.class, Real.class, "F", "n➔∏α[k]₍ₙ₋₁₎{k=1…p}", context);

    Integer                 in    = new Integer(2);
    Real                    val   = numer.evaluate(in, 128, new Real());
    assertEquals(24.0, val.doubleValue());
    numer.evaluate(in.set(3), 128, val);
    assertEquals(2880.0, val.doubleValue());
  }

  @SuppressWarnings("resource")
  public static void testRatioOfProducts()
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
                                                     "n➔∏α[k]₍ₙ₋₁₎{k=1…p}/∏β[k]₍ₙ₋₁₎{k=1…q}",
                                                     context);
    Integer                 in    = new Integer(2);
    Real                    val   = ratio.evaluate(in, 128, new Real());
    assertEquals(1.5, val.doubleValue());
  }
  
  @SuppressWarnings("resource")
  public static void testRatioOfRatioOverProductPlusOne()
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
                                                     "n➔∏α[k]₍ₙ₋₁₎{k=1…p}/∏β[k]₍ₙ₋₁₎{k=1…q}/∏β[k]₍ₙ₋₁₎{k=1…q}+1",
                                                     context);
    Integer                 in    = new Integer(2);
    Real                    val   = ratio.evaluate(in, 128, new Real());
    assertEquals(1.375, val.doubleValue());
  }

  public static void testOneTimesTwoTimesThreeEqualsSix() throws AnalyzerException
  {
    NullaryFunction<Real> prod = RealNullaryFunction.express("∏k{k=1…3}");
    assertEquals(6.0, prod.evaluate(null, 128, new Real()).doubleValue());
  }

  public static void testOneTimesTwoTimesThreeTimesfourEqualsTwentyFour() throws AnalyzerException
  {
    NullaryFunction<Real> prod = RealNullaryFunction.express("∏cool{cool=1…4}");
    assertEquals(24.0, prod.evaluate(null, 128, new Real()).doubleValue());
  }

  public static void testTwoTimesFourTimesSixEqualsFourtyEight() throws AnalyzerException
  {
    NullaryFunction<Real> prod = RealNullaryFunction.express("∏2*k{k=1…3}");
    assertEquals(48.0, prod.evaluate(null, 128, new Real()).doubleValue());
  }
}
