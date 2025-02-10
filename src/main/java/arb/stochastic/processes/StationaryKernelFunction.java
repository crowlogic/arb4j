package arb.stochastic.processes;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface StationaryKernelFunction extends
                                          RealFunction
{

  public default KernelFunction<Real> getKernelFunction()
  {
    return (p, bits, order, res) ->
    {

      Real h = p.getRight().sub(p.getLeft(), bits, res);
      return StationaryKernelFunction.this.evaluate(h, bits, res);

    };
  }
}
