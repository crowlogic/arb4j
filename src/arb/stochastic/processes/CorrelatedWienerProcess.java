package arb.stochastic.processes;

import arb.Real;

/**
 * A {@link WienerProcess} with a specified correlation to another
 * {@link WienerProcess}
 *
 */
public class CorrelatedWienerProcess extends
                                     WienerProcess
{

  public CorrelatedWienerProcess(WienerProcess W, Real ρ)
  {
    super(W.σ);
    assert false : "todo";
  }

}
