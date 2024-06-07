package arb.functions.polynomials;

import java.util.Iterator;

import arb.AutoCloseableAssignable;
import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PolynomialSequenceIterator<R, E extends AutoCloseableAssignable<? extends E>> implements
                                             Iterator<E>,
                                             AutoCloseable
{

  public final PolynomialSequence<R, E> sequence;

  public PolynomialSequenceIterator(PolynomialSequence<R, E> recurrentlyGeneratedOrthogonalPolynomialSequence)
  {
    sequence = recurrentlyGeneratedOrthogonalPolynomialSequence;
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