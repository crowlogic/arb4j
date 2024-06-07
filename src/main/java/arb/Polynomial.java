package arb;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public interface Polynomial<S,V extends Polynomial<? extends S, ? extends V>> extends
                            Named,
                            Function<S,S>,
                            Ring<V>,
                            AutoCloseableAssignable<V>
{

  @Override
  public void
          close();

}
