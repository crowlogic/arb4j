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
public class RealValuedEquation
                          extends
                          Equation<Real, Real, RealFunction>
{

  public RealValuedEquation(String equationString)
  {
    super(Real.class,
          Real.class,
          RealFunction.class,
          equationString);
  }

  public RealValuedEquation(RealFunction leftSide, RealFunction rightSide)
  {
    super(Real.class,
          Real.class,
          RealFunction.class,
          leftSide,
          rightSide);
  }

  public RealValuedEquation(String equationString, Context context)
  {
    super(Real.class,
          Real.class,
          RealFunction.class,
          equationString,
          context);
  }

}
