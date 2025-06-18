package arb.stochastic;

import java.util.Arrays;

import arb.*;

/**
 * Standard normal (unit Gaussian) sampler using Arb/FLINT arb_urandom and
 * Box-Muller. Caches the second deviate in a structure, no Java RNG is used.
 */
public final class RandomStandardNormalStream implements
                                              AutoCloseable
{
  private final Real        cached;
  private boolean           hasCached;
  private final RandomState state;

  public RandomStandardNormalStream()
  {
    this.state     = new RandomState();
    this.cached    = new Real();
    this.hasCached = false;
    arblib.gmp_randinit_default(state.getGmpRandomState());
    state.setInitialized(1);
  }

  Real u1    = new Real();
  Real u2    = new Real();
  Real r     = new Real();
  Real theta = new Real();
  Real pi    = new Real();

  public RandomStandardNormalStream initializeWithSeed(long seed)
  {
    arblib.gmp_randseed_ui(state.getGmpRandomState(), seed);
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
    if (hasCached)
    {
      hasCached = false;
      return out.set(cached);
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
      u1.log(prec, r).mul(-2, prec).sqrt(prec);
      theta.set(pi.π(prec)).mul(2, prec).mul(u2, prec);
      theta.sin(prec, cached).mul(r, prec);
      return theta.cos(prec, out).mul(r, prec);
    }
  }

  @Override
  public void close()
  {
    if (hasCached)
    {
      cached.close();
    }
    Arrays.asList(u1, u2, r, theta, pi).forEach(Real::close);
  }

}
