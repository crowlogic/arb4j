package arb.functions.polynomials;

import arb.Integer;
import arb.Real;
import arb.RealConstants;
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

  /**
   * <pre style="font-family: monospace">
   * /-------------------------------------\
   * | n   | New sumR1      | valueR1      |
   * |-----|----------------|--------------|
   * | 0   | 1.000000       | 1.000000     |
   * | 1   | -33.500000     | -34.500000   |
   * | 2   | 313.656250     | 347.156250   |
   * | 3   | -1283.262500   | -1596.918750 |
   * | 4   | 2504.429161    | 3787.691661  |
   * | 5   | -2025.650065   | -4530.079226 |
   * | 6   | 145.012899     | 2170.662964  |
   * \-------------------------------------/
   * </pre>
   */
  public static void testSum()
  {
    HypergeometricPolynomial F = new HypergeometricPolynomial(2, 1);
    F.α.set(-6, 2.5);
    F.β.set(1);
    double val = F.eval(2.3);
    System.out.format("value=%f", val);
  }

  public static void testSummand()
  {
    try ( var p = new Integer(3, "p"); var q = new Integer(1, "q"); var α = Real.newVector(p.getSignedValue(), "α");
          var β = Real.newVector(q.getSignedValue(), "β"); var z = new Real();)
    {
      z.set(RealConstants.π);
      var  context = new Context(p, q, α.set(1.5, 0.75, -3), β.set(1), z.setName("z"));

      var  summand = Function.express(Integer.class,
                                      Real.class,
                                      "n➔zⁿ*∏k➔α[k]₍ₙ₎{k=1…p}/(n!*∏k➔β[k]₍ₙ₎{k=1…q})",
                                      context);
      Real res     = summand.evaluate(new Integer(3), 1, 128, new Real());
      assertEquals(-244.81029976584379503781836652101052755, res.doubleValue());
    }
  }
}
