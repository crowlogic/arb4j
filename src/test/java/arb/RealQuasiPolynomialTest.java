package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealQuasiPolynomialTest
                                     extends
                                     TestCase
{

  public void testOneOverXPlus2()
  {
    var q = new RealQuasiPolynomial();
    q.p.set(1).shiftLeft(1).add(2);
    q.f = RealFunction.express("1/x");
    var v = q.eval(2.3); // (1/(2+x)) where x=2.3
    assertEquals(0.23255813953488375, v);
  }

  @SuppressWarnings("resource")
  public void testMultiply()
  {
    var q = new RealQuasiPolynomial();
    q.p.set(1).shiftLeft(1).add(2); // x+2
    q.f = RealFunction.express("1/x"); // 1/(x+2)
    var r = new RealQuasiPolynomial().identity();
    r.f = RealFunction.express("sin(x)"); // (1/(x+s))*sin(x)=sin(x)/(x+2)
    RealQuasiPolynomial s              = q.mul(r, 128, new RealQuasiPolynomial());
    double              sTwoPointThree = s.eval(2.3);
    assertEquals(0.17341981678528381, sTwoPointThree);

  }

  public void testQuasi()
  {

    var expr = RealQuasiPolynomial.parseSequence("Ψ", "n➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)");
    System.out.println(expr.syntaxTextTree());
    var                 f = expr.instantiate();
    RealQuasiPolynomial g = f.evaluate(0, 128);
    assertTrue(g.eval(0.0) == 0);
  }
}
