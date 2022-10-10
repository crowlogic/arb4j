package arb.topology;

/**
 * A fiber of a map f:X->Y is the preimage of an element y in Y. That is,
 * f^(-1)(y)={x in X:f(x)=y}.
 * 
 * For instance, let X and Y be the complex numbers C. When f(z)=z^2, every
 * fiber consists of two points {z,-z}, except for the fiber over 0, which has
 * one point. Note that a fiber may be the empty set.
 * 
 * In special cases, the fiber may be independent, in some sense, of the choice
 * of y in Y. For instance, if f is a covering map, then the fibers are all
 * discrete and have the same cardinal number. The example f(z)=z^2 is a
 * covering map away from zero, i.e., f(z)=z^2 from the punctured plane C-{0} to
 * itself has a fiber consisting of two points.
 * 
 * When pi:E->M is a fiber bundle, then every fiber is isomorphic, in whatever
 * category is being used. For instance, when E is a real vector bundle of
 * bundle rank k, every fiber is isomorphic to R^k.
 * 
 * @author crow
 *
 */
public interface Fiber
{

}
