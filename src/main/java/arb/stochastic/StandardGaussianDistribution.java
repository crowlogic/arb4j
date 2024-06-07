package arb.stochastic;

import static arb.arblib.arb_hypgeom_erf;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 * 
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class StandardGaussianDistribution implements
                                          ProbabilityDistributionFunction
{
  @Override
  public String toString()
  {
    return String.format("StandardGaussianDistribution");
  }

  public RealFunction inv = new InverseStandardGaussianDistributionFunction();

  public StandardGaussianDistribution()
  {

  }

  @Override
  public int getInverseBranchCount()
  {
    return 1;
  }

  @Override
  public RealFunction inverse(int branch)
  {
    assert branch == 0 : "only 1 branch";
    return inv;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real result)
  {
    assert order < 2 : "todo: implement order >=2 using arb";
    arb_hypgeom_erf(result, z, prec);
    return result.add(1, prec).div(2, prec);
  }

}
