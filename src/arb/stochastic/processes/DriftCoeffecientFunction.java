package arb.stochastic.processes;

import arb.Real;
import arb.functions.Function;

public interface DriftCoeffecientFunction<S extends DiffusionProcessState> extends
                                         CoeffecientFunction<S>,
                                         Function<S, Real>
{

}
