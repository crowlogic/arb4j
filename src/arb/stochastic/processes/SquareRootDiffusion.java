package arb.stochastic.processes;

import arb.Real;

/**
 * Also known as a Cox-Ingersoll-Ross process.
 * 
 * @see <a href="doc-files/InterestRateTermStructureTheory.pdf">A Theory of the
 *      Term Structure of Interest Rates</a>
 */
public class SquareRootDiffusion implements
                                 DiffusionProcess<DiffusionProcessState>
{
  public SquareRootDiffusion(Real a, Real b, Real σ)
  {
    this.a = a;
    this.b = b;
    this.σ = σ;
  }

  public Real a, b, σ;

  @Override
  public DriftCoeffecientFunction<DiffusionProcessState> μ()
  {
    assert false : "TODO: return dx(t)=a*(b-x(t))";
    return null;

  }

  @Override
  public DiffusionCoeffecientFunction<DiffusionProcessState> σ()
  {
    assert false : "implement me";
    return null;

  }

}
