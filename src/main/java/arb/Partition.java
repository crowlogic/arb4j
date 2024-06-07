package arb;

import java.util.Iterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 * 
 * @param <F>
 */
public interface Partition<F extends Field<F>> extends
                          Iterable<F>,
                          AutoCloseable
{
  /**
   * 
   * @return the number of elements of the partition
   */
  int count();

  /**
   * 
   * @param i
   * @return the i-th element of the {@link Partition}
   */
  F get(int i);

  @Override
  Iterator<F> iterator();

  @Override
  void close();

  public default void clean()
  {
    close();
  }

  public default Stream<F> stream()
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(),
                                                         count(),
                                                         Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }

}