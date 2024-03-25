package arb.operators;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.BesselFunctionOfTheFirstKind;
import arb.functions.sequences.RealSequence;
import arb.space.topological.VectorSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class TheJ0IntegralCovarianceOperator implements
                                             IntegralCovarianceOperator<Real,
                                                           BesselFunctionOfTheFirstKind>
{

  @Override
  public VectorSpace<? extends Real>
         apply(VectorSpace<? extends Real> x, int bits, VectorSpace<? extends Real> result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  RealSequence ξ =
                 RealSequence.express("1/√(π)*sin((π*n)/2)*n*√(2*(k+1)+1)*Π(n+2*i-1)*(n-2*i+1){i=1..k}/Π(n+2*i-2)*(n-2*i+2){i=1..k+1}");

  @Override
  public BesselFunctionOfTheFirstKind kernel()
  {
    assert false : "TODO";
    return null;
  }

}
