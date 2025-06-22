package arb.stochastic;

import java.util.Iterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.Complex;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Standard {@link Complex}-valued (unit Gaussian) sampler using Arb/FLINT
 * arb_urandom and the Box-Muller method.
 *
 * @author ©2024 Stephen Crowley
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ComplexWhiteNoiseProcess implements
                                            AutoCloseable
{
  private final RealWhiteNoiseProcess realWhiteNoiseProcess = new RealWhiteNoiseProcess();

  public Stream<Complex> stream(int bits, int limit)
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(bits, limit),
                                                         limit,
                                                         Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }

  public Iterator<Complex> iterator(int bits, int limit)
  {
    return new Iterator<Complex>()
    {
      int n = 0;

      @Override
      public boolean hasNext()
      {
        return n < limit;
      }

      @Override
      public Complex next()
      {
        n++;
        return sample(bits, new Complex());
      }
    };
  }

  public ComplexWhiteNoiseProcess()
  {

  }

  public ComplexWhiteNoiseProcess initializeWithSeed(long seed)
  {
    realWhiteNoiseProcess.initializeWithSeed(seed);
    return this;
  }

  /**
   * Generate a standard normal sample using Arb's arb_urandom.
   * 
   * @param prec Precision in bits
   * @param out  Output Real, if dim>1 then each element is populated as well
   * @return out, containing the sample
   */
  public Complex sample(int prec, Complex out)
  {
    if (out.dim > 1)
    {
      for (var element : out)
      {
        realWhiteNoiseProcess.sample(prec, element.re());
        realWhiteNoiseProcess.sample(prec, element.im());
      }
    }
    else
    {
      realWhiteNoiseProcess.sample(prec, out.re());
      realWhiteNoiseProcess.sample(prec, out.im());
    }
    return out;
  }

  @Override
  public void close()
  {
    realWhiteNoiseProcess.close();
  }

}
