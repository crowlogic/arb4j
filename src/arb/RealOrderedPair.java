package arb;

public class RealOrderedPair extends
                             OrderedPair<Real, Real> implements
                             AutoCloseable
{

  @Override
  public void close() 
  {
    a.close();
    b.close();
  }

}
