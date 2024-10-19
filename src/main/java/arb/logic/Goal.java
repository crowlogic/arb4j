package arb.logic;

import java.util.function.Predicate;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A {@link Goal}, in logic programming, is a {@link Predicate} applied to its
 * {arguments} which the system attempts to prove by matching it against the
 * {@link Clause}s of the program. A goal may fail or it may succeed in one or
 * more ways.
 * 
 * @param <D>
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Goal<D> extends
                     Predicate<D>
{

}
