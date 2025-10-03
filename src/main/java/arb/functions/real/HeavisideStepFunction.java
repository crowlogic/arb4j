package arb.functions.real;

import arb.Real;
import arb.RealConstants;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class HeavisideStepFunction implements
                                   RealFunction
{
  public static final RealFunction deltaFunction = new DiracDeltaFunction();

  @Override
  public RealFunction derivative()
  {
    return deltaFunction;
  }

  @Override
  public String typeset()
  {
    return "\\Theta (x)";
  }

  @Override
  public String toString()
  {
    return "Θ";
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return res.set(t.compareTo(RealConstants.zero) < 0 ? RealConstants.zero : RealConstants.one);
  }

}
