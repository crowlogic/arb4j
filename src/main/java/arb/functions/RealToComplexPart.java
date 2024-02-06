package arb.functions;

import arb.Complex;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public abstract class RealToComplexPart implements
                                        RealFunction,
                                        AutoCloseable
{
  abstract Real getResult(Real res);

  protected Complex                     y = new Complex();
  protected final RealToComplexFunction f;

  public RealToComplexPart(RealToComplexFunction f)
  {
    super();
    this.f = f;
  }

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    assert order <= 1 : "todo: support order >1";
    f.evaluate(t, order, bits, y);
    return getResult(res);
  }

  @Override
  public void close()
  {
    y.close();
    y = null;
  }

}