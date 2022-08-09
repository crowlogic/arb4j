package arb.stochastic.processes;

import arb.dynamical.systems.*;

@FunctionalInterface
public interface DiffusionCoeffecientFunction<S extends State> extends
                                             CoeffecientFunction<S>
{
    
}
