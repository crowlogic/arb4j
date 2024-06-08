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

  @SuppressWarnings("resource")
  public void testMultiply()
  {
    var q = new RealQuasiPolynomial();
    q.p.set(1).shiftLeft(1);
    q.f = RealFunction.express("1/x");
    var r = new RealQuasiPolynomial().identity();
    r.p.identity();
    r.f = RealFunction.express("cos(x)");
    RealQuasiPolynomial s = q.mul(r, 128, new RealQuasiPolynomial() );
    System.out.format( "%s*%s=%s", q, r, s);
  }
  
  public void testQuasi()
  {

    var expr = RealQuasiPolynomial.parseSequence("Ψ", "n➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)");
    System.out.println(expr.syntaxTextTree());
    var                 f = expr.instantiate();
    RealQuasiPolynomial g = f.evaluate(0, 128);
  }
}
