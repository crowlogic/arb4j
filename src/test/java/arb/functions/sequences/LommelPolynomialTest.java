package arb.functions.sequences;

import arb.Fraction;
import arb.Integer;
import arb.RationalFunction;
import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.rational.LommelPolynomial;
import arb.functions.rational.RationalFunctionSequence;
import arb.functions.rational.RationalNullaryFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class LommelPolynomialTest extends
                                  TestCase
{

  public void testLommelRationalFuctionSequenceViaSequenceNode()
  {
    RationalFunctionSequence sequence = RationalFunctionSequence.express("R(n,1⁄2;z)");
    RationalFunction         R3       = sequence.evaluate(3, 128);
    assertEquals("(-6*x^2+15)/(x^3)", R3.toString());
    Fraction R3AtTwoPointThree = R3.evaluate(new Fraction(23,
                                                          10));
    assertEquals(new Fraction(-16740,
                              12167),
                 R3AtTwoPointThree);
  }

  public void testLommelPolynomials()
  {
    var context = new Context();
    context.registerVariable("v", RealConstants.half);
    var R =
          RationalFunctionSequence.express("n➔v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                           context);
    var x = R.evaluate(3, 128);
    assertEquals("(-6*x^2+15)/(x^3)", x.toString());

    double y = x.asRealFunction().eval(2.3);
    assertEquals(-1.375852716363935234651105449165776280101915, y);
  }

  public void testRationalLommelPolynomialsAsNullary()
  {
    var    context = new Context(Real.named("v").set(RealConstants.half),
                                 Integer.named("n").set(3));

    var    R       =
             RationalNullaryFunction.express("v₍ₙ₎*(z/2)^(-n)*pFq([1⁄2-n/2,-n/2],[v,-n,1-v-n],-z²)",
                                             context);
    var    x       = R.evaluate();
    double y       = x.asRealFunction().eval(2.3);
    // System.out.println("y=" + y );
    assertEquals("(-6*x^2+15)/(x^3)", x.toString());
  }

  public void testLommelPolynomial()
  {
    try ( LommelPolynomial l = new LommelPolynomial())
    {
      l.v.set(RealConstants.half);
      l.n.set(3);
      RationalFunction func = l.evaluate(128);
      Fraction         l3x  = func.evaluate(new Fraction(230,
                                                         100),
                                            0,
                                            128,
                                            new Fraction());
      assertEquals(-1.3758527163639351505, l3x.doubleValue());
    }
  }
}
