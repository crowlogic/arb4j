package arb.stochastic.processes;

import arb.Real;
import arb.dynamical.systems.*;
import arb.functions.Function;

/**
 * 
 * @author crow
 *
 */
public interface CoeffecientFunction<S extends State> extends
                                     Function<S, Real>
{

}
