package arb.expressions.nodes;

import arb.Real;
import arb.RealConstants;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne for © terms
 */
public class FractionalDerivativeNodeTest extends
                                          TestCase
{
  public static void testParseFractionalDerivative()
  {
    var expr = RealFunction.parse("t➔Đ^(1/2)sin(t)");
    System.out.println( "expr=\n" + expr.inspect(null));
    
    var f = expr.instantiate();
    System.out.println( expr + " = " + f );
  }
  
}
