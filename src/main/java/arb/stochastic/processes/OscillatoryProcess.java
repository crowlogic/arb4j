package arb.stochastic.processes;

import arb.Complex;
import arb.Field;
import arb.functions.Function;
import arb.functions.complex.ComplexFunction;
import arb.space.topological.VectorSpace;

public interface OscillatoryProcess<F extends Field<?>, V extends VectorSpace<? extends F>> extends
                                   GaussianProcess<F, Complex, Function<F, Complex>, V>
{
 public ComplexFunction gainFuction();
 
}
