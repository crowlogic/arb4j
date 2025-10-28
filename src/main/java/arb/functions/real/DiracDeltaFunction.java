package arb.functions.real;

import arb.Real;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 */
public class DiracDeltaFunction implements
                                RealFunction
{
  
  public static final HeavisideStepFunction stepFunction = new HeavisideStepFunction();


  @Override
  public RealFunction integral()
  {
    return stepFunction;
  }

  @Override
  public String typeset()
  {
    return "\\delta (x)";
  }

  @Override
  public String toString()
  {
    return "δ";
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    return t.isZeroUpTo(bits) ? res.posInf() : res.zero();
  }

}
