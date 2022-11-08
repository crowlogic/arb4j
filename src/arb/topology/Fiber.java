package arb.topology;

import arb.differential.geometry.VectorBundle;
import arb.functions.Preimage;
import arb.topological.spaces.FiberBundle;

/**
 * A fiber of a map f:X->Y is the {@link Preimage} of an element y in Y. That is,
 * f^(-1)(y)={x in X:f(x)=y}.<br>
 *
 * When π:E->M is a {@link FiberBundle}, then every {@link Fiber} is isomorphic, in
 * whatever category is being used. For instance, when E is a {@link VectorBundle}
 * of rank k, every fiber is isomorphic to R^k.<br>
 * 
 * @author crow
 *
 */
public interface Fiber
{

}
