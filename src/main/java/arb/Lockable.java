package arb;

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