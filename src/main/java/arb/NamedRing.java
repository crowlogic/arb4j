package arb;

import java.util.stream.Stream;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface NamedRing<A extends NamedRing<A>> extends
                          Ring<A>,
                          Named,
                          AutoCloseable
{

  @Override
  public void
         close();

  public <E>
         E
         get(int i);

  public default Stream<A>
         stream()
  {
    assert false : "TODO";
    return null;
  }

  public default NamedRing<A>
         set(Real alpha)
  {
    assert false : "todo: implement set(" + alpha + ")";
    return this;
  }

}
