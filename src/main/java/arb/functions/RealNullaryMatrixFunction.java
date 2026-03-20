package arb.functions;

import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface RealNullaryMatrixFunction extends
                                           NullaryFunction<RealMatrix>
{

  public static RealNullaryMatrixFunction express(String string)
  {
    return NullaryFunction.express(RealMatrix.class, RealNullaryMatrixFunction.class, string);
  }

}
