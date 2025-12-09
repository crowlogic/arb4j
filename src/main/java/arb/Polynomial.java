package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Polynomial<S, V extends Polynomial<S,V>> extends
                           NamedRing<V>,
                           Function<S, S>,
                           AutoCloseableAssignable<V>
{

  public V
         identity();

  public S
         getCoeffs();

  @SuppressWarnings("unchecked")
  public default V
         neg()
  {
    return neg((V) this);
  }

  public V
         neg(V result);

  @Override
  public void
         close();

}
