package arb.functions.sequences;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealSequence extends
                              Sequence<Real>
{
  public static RealSequence express(String expression)
  {
    return (RealSequence) Sequence.express(Real.class, expression, RealSequence.class);
  }

  public static RealSequence express(String name, String expression)
  {
    return (RealSequence) Sequence.express(name, Real.class, expression, RealSequence.class);
  }

}
