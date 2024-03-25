package arb.stochastic.processes.operators;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.BesselFunctionOfTheFirstKind;
import arb.functions.sequences.RealSequence;
import arb.operators.IntegralCovarianceOperator;
import arb.space.topological.VectorSpace;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class J0IntegralCovarianceOperator implements
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

  /**
   * projection of the k-th orthonormalized Fourier transformed Type 1 Chebyshev
   * polynomial function onto the Bessel function of the first kind of order 0
   */
  RealSequence ξ = RealSequence.express("(√(2⋅k+3)⋅Γ(k+½)²)/(2⋅√(π)⋅Γ(k+1)²)");

  @Override
  public BesselFunctionOfTheFirstKind kernel()
  {
    assert false : "TODO";
    return null;
  }

}
