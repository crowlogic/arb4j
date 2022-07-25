package arb;

public class RealOrderedPair extends
                             OrderedPair<Real, Real> implements
                             AutoCloseable
{

  public RealOrderedPair()
  {
    super(new Real(),
          new Real());
  }

  public RealOrderedPair(Real a, Real b)
  {
    super(a,
          b);
  }

  @Override
  public void close()
  {
    if (a != null)
    {
      a.close();
    }
    if (b != null)
    {
      b.close();
    }
  }

}
