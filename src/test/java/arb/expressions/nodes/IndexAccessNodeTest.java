package arb.expressions.nodes;

import arb.expressions.Context;
import arb.functions.complex.ComplexNullaryFunction;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.polynomials.RealPolynomialNullaryFunction;
import arb.functions.real.RealNullaryFunction;
import junit.framework.TestCase;

public class IndexAccessNodeTest extends
                                 TestCase
{

  public void testIndexAccessOfRealPolynomial()
  {
    var context = new Context();
    var P       = RealPolynomialNullaryFunction.express("P:3*x^2+x", context);
    var p       = P.evaluate().setName("p");
    context.registerVariable(p);
    var p0 = RealNullaryFunction.express("p[0]", context).evaluate().setName("p0");
    var p1 = RealNullaryFunction.express("p[1]", context).evaluate().setName("p1");
    var p2 = RealNullaryFunction.express("p[2]", context).evaluate().setName("p2");
    var P2 = RealNullaryFunction.express("P()[2]", context);
    var f2 = P2.evaluate();
    assertEquals( 3.0, f2.doubleValue() );
  }

  public void testIndexAccessOfComplexPolynomial()
  {
    var context = new Context();
    var P       = ComplexPolynomialNullaryFunction.express("P:3*x^2+x", context);
    var p       = P.evaluate().setName("p");
    context.registerVariable(p);
    var p0 = ComplexNullaryFunction.express("p[0]", context).evaluate().setName("p0");
    var p1 = ComplexNullaryFunction.express("p[1]", context).evaluate().setName("p1");
    var p2 = ComplexNullaryFunction.express("p[2]", context).evaluate().setName("p2");
    var P2 = ComplexNullaryFunction.express("P()[2]", context);
    var f2 = P2.evaluate();
    assertEquals( 3.0, f2.re().doubleValue() );    
    assertEquals( 0.0, f2.im().doubleValue() );    

  }
}
