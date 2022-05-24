package arb;

/**
 * A {@link ThreadLocal} {@link Complex} number of arbitrary precision
 */
public class ThreadLocalComplex extends
                                ThreadLocal<Complex>
{
  @Override
  public String toString()
  {
    return get().toString();
  }

  private int dim;

  public ThreadLocalComplex(int dim)
  {
    this.dim = dim;
  }

  @Override
  protected Complex initialValue()
  {
    return Complex.newVector(dim);
  }

  public Complex get(int i)
  {
    return get().get(i);
  }
}