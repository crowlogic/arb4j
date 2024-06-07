package arb.equations;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealEquation
                          extends
                          Equation<Real, Real, RealFunction>
{

  public RealEquation(String equationString)
  {
    super(Real.class,
          Real.class,
          RealFunction.class,
          equationString);
  }

  public RealEquation(RealFunction leftSide, RealFunction rightSide)
  {
    super(Real.class,
          Real.class,
          RealFunction.class,
          leftSide,
          rightSide);
  }

  public RealEquation(String equationString, Context context)
  {
    super(Real.class,
          Real.class,
          RealFunction.class,
          equationString,
          context);
  }

}
