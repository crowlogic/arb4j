package arb.functions.polynomials;

import java.util.Iterator;

import arb.AutoCloseableAssignable;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.Sequence;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class SequenceIterator<E extends AutoCloseableAssignable<? extends E>> implements
                             Iterator<E>,
                             AutoCloseable
{

  public final Sequence<? extends E> sequence;

  public SequenceIterator(Sequence<? extends E> seq)
  {
    sequence = seq;
  }

  Integer index = new Integer();

  @Override
  public void close()
  {
    index.close();
  }

  @Override
  public boolean hasNext()
  {
    return true;
  }

  @Override
  public E next()
  {
    var k = index.getSignedValueAndIncrement();

    return sequence.evaluate(k, sequence.bits());
  }
}