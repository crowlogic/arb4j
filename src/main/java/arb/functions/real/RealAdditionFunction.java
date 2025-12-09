package arb.functions.real;

import arb.Real;

/**
 * @author Stephen Crowley ©2024-2025
 * @see arb.documentation.BusinessSourceLicenseVersionOnePointOne © terms
 * @see RealFunction
 */
public final class RealAdditionFunction
                                        implements
                                        RealFunction
{
  private final RealFunction that;
  private RealFunction       thisFunc;

  public RealAdditionFunction(RealFunction thisFunc, RealFunction that)
  {
    this.thisFunc = thisFunc;
    this.that     = that;
  }

  @Override
  public String typeset()
  {
    return String.format("(%s) + (%s)",
                         thisFunc.typeset(),
                         that.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("(%s)+(%s)",
                         thisFunc.toString(),
                         that.toString());
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    try ( var blip = new Real())
    {
      return thisFunc.evaluate(t,
                               order,
                               bits,
                               res)
                     .add(that.evaluate(t,
                                        order,
                                        bits,
                                        blip),
                          bits,
                          res);
    }

  }
}