package arb.dynamical.systems;

/**
 * A flow is ergodic if the only invariant measurable sets are the empty set or
 * the entire set. In other words, an ergodic flow is one in which the constants
 * of motion are constant functions almost everywhere. This might sound strange
 * at first, but an invariant of a flow could be a function which varies from
 * point to point, rather than equal to the same constant value at almost every
 * point of the flow
 *
 */
public interface ErgodicFlow extends
                             Flow
{

}
