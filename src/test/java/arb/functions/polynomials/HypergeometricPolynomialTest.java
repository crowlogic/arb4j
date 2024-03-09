package arb.functions.polynomials;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.Function;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class HypergeometricPolynomialTest extends
                                          TestCase
{
  public static void testSummand()
  {
    try ( Integer p = new Integer(3); Integer q = new Integer(1); Real α = Real.newVector(p.getSignedValue());
          Real β = Real.newVector(q.getSignedValue()); Real z = new Real();)
    {
      Context                 context = new Context(p.setName("p"),
                                                    q.setName("q"),
                                                    α.setName("α").set(1.5, 0.75, -3),
                                                    β.setName("β").set(1),
                                                    z.setName("z"));

      Function<Integer, Real> summand = Function.express(Integer.class,
                                                         Real.class,
                                                         "n➔z^n*∏k➔α[k]₍ₙ₎{k=1…p}/n!*∏k➔β[k]₍ₙ₎{k=1…q}",
                                                         context);
      System.out.println(summand);
    }
  }
}
