package arb.stochastic.processes;

import java.util.Iterator;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import arb.RandomState;
import arb.Real;
import arb.arblib;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Standard {@link Real}-valued (unit Gaussian) sampler using Arb/FLINT
 * arb_urandom and the Box-Muller method.
 *
 * @author ©2024 Stephen Crowley
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealWhiteNoiseProcess implements
                                         AutoCloseable
{
  private final Real        cache     = Real.named("cache");

  private boolean           hasCached = false;

  private final RandomState state     = new RandomState();

  public Stream<Real> stream(int bits, int limit)
  {
    return StreamSupport.stream(Spliterators.spliterator(iterator(bits, limit),
                                                         limit,
                                                         Spliterator.SIZED | Spliterator.ORDERED),
                                false);
  }

  public Iterator<Real> iterator(int bits, int limit)
  {
    return new Iterator<Real>()
    {
      int n = 0;

      @Override
      public boolean hasNext()
      {
        return n < limit;
      }

      @Override
      public Real next()
      {
        n++;
        return sample(bits, new Real());
      }
    };
  }

  public RealWhiteNoiseProcess()
  {
    this.hasCached = false;
    state.initialize();

  }

  Real u1    = new Real();
  Real u2    = new Real();
  Real r     = new Real();
  Real theta = new Real();
  Real pi    = new Real();

  public RealWhiteNoiseProcess initializeWithSeed(long seed)
  {
    hasCached = false;
    state.initialize();
    state.seed(seed);
    return this;
  }

  /**
   * Generate a standard normal sample using Arb's arb_urandom.
   * 
   * @param prec Precision in bits
   * @param out  Output Real
   * @return out, containing the sample
   */
  public Real sample(int prec, Real out)
  {
    if (out.dim > 1)
    {
      out.forEach(x -> sampleOne(prec, x));
      return out;
    }
    else
    {
      return sampleOne(prec, out);
    }
  }

  protected Real sampleOne(int prec, Real out)
  {
    if (hasCached)
    {
      hasCached = false;
      return out.set(cache);
    }
    else
    {
      hasCached = true;

      do
      {
        arblib.arb_urandom(u1, state, prec);
      }
      while (u1.isZero());

      arblib.arb_urandom(u2, state, prec);
      theta.set(pi.π(prec))
           .mul(2, prec)
           .mul(u2, prec)
           .sin(prec, cache)
           .mul(u1.log(prec, r).mul(-2, prec).sqrt(prec), prec);
      return theta.cos(prec, out).mul(r, prec);
    }
  }

  @Override
  public void close()
  {
    Stream.of(cache, u1, u2, r, theta, pi).forEach(Real::close);
  }

}
