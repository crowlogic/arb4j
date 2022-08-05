package arb.stochastic.processes.integrators;

import arb.*;
import arb.dynamical.systems.*;
import arb.stochastic.processes.*;

public interface MultivariateStochasticIntegrator<S extends State, D extends MultivariateStochasticProcess<S>>
{

  EvaluationSequence step(S state, int prec, EvaluationSequence evalSeq);

}
