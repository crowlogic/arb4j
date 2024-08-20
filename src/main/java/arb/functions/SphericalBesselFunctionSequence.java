package arb.functions;

import arb.Integer;
import arb.RationalFunction;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Expression;
import arb.functions.rational.RationalFunctionSequence;

/**
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SphericalBesselFunctionSequence implements
                                             RationalFunctionSequence,
                                             AutoCloseable
{

  @Override
  public String toString()
  {
    return "SphericalBesselFunctionSequence";
  }

  public  Expression<Integer, RationalFunction, RationalFunctionSequence> expression;

  public  RationalFunctionSequence                                        element;

  static
  {
  
  }



  @Override
  public RationalFunction evaluate(Integer t, int order, int bits, RationalFunction res)
  {
    expression = RationalFunctionSequence.compile("n->(R(n,½;x)*sin(x) - R(n-1,3⁄2;x)*cos(x))/x");
    element    = expression.instantiate();
    
    return element.evaluate(t, order, bits, res);
  }
}