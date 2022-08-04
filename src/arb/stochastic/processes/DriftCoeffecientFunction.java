package arb.stochastic.processes;

import arb.Real;
import arb.dynamical.systems.State;
import arb.functions.Function;

public interface DriftCoeffecientFunction<S extends State> extends
                                         CoeffecientFunction<S>,
                                         Function<S, Real>
{

}
