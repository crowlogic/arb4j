package arb.functions.real;

import arb.Complex;
import arb.functions.complex.ComplexFunction;

public final class RealComplexMultiplicationFunction implements
                                                            ComplexFunction
{
  private final ComplexFunction that;
  private RealFunction          thisFunc;

  public RealComplexMultiplicationFunction(RealFunction thisFunction, ComplexFunction that)
  {
    this.thisFunc = thisFunction;
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
  public Complex evaluate(Complex t, int order, int bits, Complex res)
  {
    try ( var blip = t.borrowVariable())
    {
      thisFunc.evaluate(t, order, bits, res);
      return res.mul(that.evaluate(t, order, bits, blip), bits, res);
    }

  }
}