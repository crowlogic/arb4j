package arb.functions.polynomials.quasi;

import arb.*;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.real.RealFunction;
import arb.functions.real.RealQuasiPolynomialNullaryFunction;
import arb.functions.sequences.ComplexPolynomialSequence;
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
  public void testHypergeometricRealQuasipolynomialFuntionExpression()
  {
    int                 bits      = 128;
    var                 poly      = RealQuasiPolynomialNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    RealQuasiPolynomial expressed = poly.evaluate(bits, new RealQuasiPolynomial());
    assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressed.toString());
  }



  public void testLommelQuasiPolynomialSequence()
  {
    Real    v          = new Real().set(RealConstants.half).setName("v");
    Context context    = new Context(v);
    var     expression = RealQuasiPolynomial.parseSequence("R",
                                                           "n->v₍ₙ₎*(z/2)^(-n)*pFq([1/2-n/2,-n/2],[v,-n,1-v-n],-z^2)",
                                                           context);
    System.out.println(expression.syntaxTextTree());
    Sequence<RealQuasiPolynomial> f  = expression.instantiate();
    RealQuasiPolynomial           f0 = f.evaluate(3, 128);
    System.out.println("f0=" + f0);
    double fzero = f0.eval(2.3);
    System.out.println("f(2.3)=" + f0);
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
