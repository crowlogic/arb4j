package arb.stochastic.processes;

public interface Lockable
{

  void lock();

  void unlock();

  boolean locked();

  default void checkLock()
  {
    assert !locked() : "this " + getClass().getSimpleName() + " is locked";
  }

}