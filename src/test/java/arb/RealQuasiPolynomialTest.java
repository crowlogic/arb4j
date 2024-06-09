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
  public void testLommelQuasiPolynomialSeuence()
  {
    var expression = RealQuasiPolynomial.parseSequence("R", "v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z^2)");
    System.out.println(expression.syntaxTextTree());
  }

  @SuppressWarnings("resource")
  public void testAddition()
  {
    var                 q             = new RealQuasiPolynomial(RealFunction.express("sin(x)"));
    var                 r             = new RealQuasiPolynomial(RealFunction.express("x"));
    RealQuasiPolynomial s             = q.add(r, 128, new RealQuasiPolynomial());
    double              s2pointThreee = s.eval(2.3, RoundingMode.Near);
    assertEquals(3.045705212176720177385406211643499538943, s2pointThreee);
  }

  @SuppressWarnings("resource")
  public void testSubtraction()
  {
    var                 q             = new RealQuasiPolynomial(RealFunction.express("sin(x)"));
    var                 r             = new RealQuasiPolynomial(RealFunction.express("x"));
    RealQuasiPolynomial s             = q.sub(r, 128, new RealQuasiPolynomial());
    double              s2pointThreee = s.eval(2.3);
    assertEquals(-1.5542947878232796, s2pointThreee);
  }

  @SuppressWarnings("resource")
  public void testSincDiv()
  {
    var                 q             = new RealQuasiPolynomial(RealFunction.express("sin(x)"));
    var                 r             = new RealQuasiPolynomial(RealFunction.express("x"));
    RealQuasiPolynomial s             = q.div(r, 128, new RealQuasiPolynomial());
    double              s2pointThreee = s.eval(2.3);
    assertEquals(0.3242196574681393, s2pointThreee);
  }

  @SuppressWarnings("resource")
  public void testMultiply()
  {
    var q = new RealQuasiPolynomial();
    q.p.set(1).shiftLeft(1);
    q.f = RealFunction.express("1/x");
    var r = new RealQuasiPolynomial().identity();
    r.p.identity();
    r.f = RealFunction.express("cos(x)");
    RealQuasiPolynomial s = q.mul(r, 128, new RealQuasiPolynomial());
    System.out.println(s);
  }

  public void testQuasiPolynomialJ0EigenfunctionSequence()
  {

    var expr = RealQuasiPolynomial.parseSequence("Ψ", "n➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)");
    System.out.println(expr.syntaxTextTree());
    var                 f = expr.instantiate();
    RealQuasiPolynomial g = f.evaluate(0, 128);
  }
}
