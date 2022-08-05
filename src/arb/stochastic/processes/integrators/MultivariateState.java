package arb.stochastic.processes.integrators;

import arb.dynamical.systems.*;
import arb.stochastic.processes.*;

public interface MultivariateState extends State
{
    int dim();
    
    public DiffusionProcessState get( int i );
}
