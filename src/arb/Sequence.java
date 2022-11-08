package arb;

/**
 * A {@link Sequence} is {@link Family} indexed by {@link Integer}s
 * 
 * @param <X>
 */
public interface Sequence<X extends Set> extends
                         Family<Integer, X>
{

}
