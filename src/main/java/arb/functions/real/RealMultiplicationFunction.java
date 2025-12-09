package arb.functions.real;

import arb.Real;

public class RealMultiplicationFunction implements
                                               RealFunction
{
  private final RealFunction that;
  private RealFunction       thisFunc;

  public RealMultiplicationFunction(RealFunction thisFunc, RealFunction that)
  {
    this.thisFunc = thisFunc;
    this.that     = that;
  }

  @Override
  public String typeset()
  {
    return String.format("%s \\cdot %s", thisFunc.typeset(), that.typeset());
  }

  @Override
  public String toString()
  {
    return String.format("(%s)*(%s)", thisFunc.toString(), that.toString());
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    try ( var blip = new Real())
    {
      return thisFunc.evaluate(t, order, bits, res)
                     .mul(that.evaluate(t, order, bits, blip), bits, res);
    }

  }
}