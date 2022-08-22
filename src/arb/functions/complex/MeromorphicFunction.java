package arb.functions.complex;

/**
 * A meromorphic function on an open subset D of the complex plane is a
 * {@link HolomorphicFunction} on all of D except for a set of isolated points,
 * which are poles of the function. The term comes from the Ancient Greek meros
 * (μέρος), meaning "part".<br>
 * <br>
 * 
 * Every meromorphic function on D can be expressed as the ratio between a pair
 * of {@link HolomorphicFunction}s (with the denominator not constant 0) defined
 * on D: any pole must coincide with a zero of the denominator.
 *
 */
public interface MeromorphicFunction extends
                                     HolomorphicFunction
{

}
