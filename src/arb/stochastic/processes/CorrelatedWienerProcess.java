package arb.stochastic.processes;

import static arb.RealConstants.one;

import arb.Real;

/**
 * A {@link WienerProcess} with a specified correlation to another
 * {@link WienerProcess}
 *
 */
public class CorrelatedWienerProcess extends
                                     WienerProcess
{

  @Override
  public void close()
  {
    super.close();
    ρ⃰.close();
    ρ.close();
  }

  private Real ρ  = new Real();
  private Real ρ⃰ = new Real();

  @Override
  public Real sample(Real t, int prec, CorrelatedRandomVectorGenerator generator, Real x)
  {
    Real sample = super.sample(t, prec, generator, x).mul(ρ, prec);

    return sample;
  }

  public CorrelatedWienerProcess(WienerProcess W, Real ρ)
  {
    super(W.σ);
    this.ρ = ρ;
    int prec = ρ.bits();
    if (prec == 0)
    {
      prec = 128;
    }
    one.sub(ρ.pow(2, prec, ρ⃰), prec).sqrt(prec);
  }

}
