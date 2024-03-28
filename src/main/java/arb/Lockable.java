package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Lockable<L>
{

  L lock();

  L unlock();

  boolean locked();

  default void checkLock()
  {
    assert !locked() : "this " + getClass().getSimpleName() + " is locked";
  }

}