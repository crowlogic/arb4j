package arb;

public class ThreadLocalReal extends
                             ThreadLocal<Real>
{

  @Override
  public String toString()
  {
    return get().toString();
  }

  @Override
  protected Real initialValue()
  {
    return new Real();
  }

  public Real get(int i)
  {
    return get().get(i);
  }
}