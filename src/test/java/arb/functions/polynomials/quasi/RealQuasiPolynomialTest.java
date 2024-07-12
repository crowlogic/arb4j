package arb.functions.polynomials.quasi;

import arb.Real;
import arb.RealConstants;
import arb.RealQuasiPolynomial;
import arb.RoundingMode;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import arb.functions.real.RealQuasiPolynomialNullaryFunction;
import arb.functions.sequences.Sequence;
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
  public void testAddition()
  {
    var                 q             = new RealQuasiPolynomial(RealFunction.express("sin(x)"));
    var                 r             = new RealQuasiPolynomial(RealFunction.express("x"));
    RealQuasiPolynomial s             = q.add(r, 128, new RealQuasiPolynomial());
    double              s2pointThreee = s.eval(2.3, RoundingMode.Near);
    assertEquals(3.045705212176720177385406211643499538943, s2pointThreee);
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

  public void testQuasiPolynomialJ0EigenfunctionSequence()
  {

    var expr = RealQuasiPolynomial.parseSequence("Ψ", "n➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)");
    System.out.println(expr.syntaxTextTree());
    var                 f = expr.instantiate();
    RealQuasiPolynomial g = f.evaluate(0, 128);

    System.out.format("g.f=%s\n", g.f);
    System.out.format("g.p=%s\n", g.p);

  }
}
