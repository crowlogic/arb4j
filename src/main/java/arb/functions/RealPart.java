package arb.functions;

import arb.Real;

public class RealPart extends
                      RealToComplexPart
{

  public RealPart(RealToComplexFunction realToComplexFunction)
  {
    super(
          realToComplexFunction);
  }

  @Override
  public String toString()
  {
    return "Re[" + f + "]";
  }

  @Override
  Real getResult(Real res)
  {
    return res.set(y.getReal());
  }

}