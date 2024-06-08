package arb.expressions.nodes.unary;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class BesselFunctionOfTheFirstKindTest
                                              extends
                                              TestCase
{
  public void testPointwiseEvaluationOfEigenfunctionOfJ0IntegralCovarianceOperator()
  {
    try ( Integer n = new Integer(0))
    {
      Context context = new Context(n.setName("n"));
      var     f       = RealFunction.express("Ψ:y➔½*√(2*(4*n+1)/y)*(-1)ⁿ*J(2*n+½,y)", context);
      double  g       = f.eval(2.3);
      assertEquals(0.18292135352494568, g);
    }
  }
}
