package arb.equations;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class EquationTest
                          extends
                          TestCase
{

  public static void testBesselFunctionOrthogonality()
  {
    try ( Real v = new Real("1.0",
                            128);
          Integer l = new Integer(3); Integer m = new Integer(2);)
    {
      Context      context       = new Context(v.setName("v"),
                                               l.setName("l"),
                                               m.setName("m"));
      RealEquation orthogonality = new RealEquation("∫x->(J(v+2*l+1,x)*J(v+2*m+1,x)/x)dx∈(0,∞) = sin(π*l-π*m)/(2*π*(v+l+1+m)*(1-m))",
                                                    context);
    }
  }
}
