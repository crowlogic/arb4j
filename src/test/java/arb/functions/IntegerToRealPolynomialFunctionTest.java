package arb.functions;

import arb.Integer;
import arb.RealPolynomial;
import junit.framework.TestCase;

public class IntegerToRealPolynomialFunctionTest extends
                                                 TestCase
{

  public void testExpressStringIntegerToRealPolynomialContextBoolean()
  {
    IntegerToRealPolynomialFunction f = IntegerToRealPolynomialFunction.express("P", "2*n+x", null, false);
    Integer n = new Integer();
    n.set(5);
    RealPolynomial p = f.evaluate(n, 128, new RealPolynomial() );
    assert false : "todo: assert that p=5+x=[5 1]";
    
  }
}
