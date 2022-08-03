package arb.stochastic.processes;

import arb.OrderedPair;
import arb.dynamical.systems.State;

public class BivariateDiffusionProcess<S extends DiffusionProcessState, A extends DiffusionProcess<S>, B extends DiffusionProcess<S>>
                                      extends
                                      OrderedPair<A, B> implements
                                      StochasticProcess

{

}
