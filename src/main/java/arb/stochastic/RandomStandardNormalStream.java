package arb.stochastic;

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

  public RandomStandardNormalStream initializeWithSeed(long seed)
  {
    arblib.gmp_randseed_ui(state.getGmpRandomState(), seed);
    return this;
  }

  /**
   * Generate a standard normal sample using Arb's arb_urandom.
   * 
   * @param prec Precision in bits
   * @param out  Output Real (may be this.cached)
   * @return out, containing the sample
   */
  public Real sample(int prec, Real out)
  {
    if (hasCached)
    {
      out.set(cached);
      hasCached = false;
      return out;
    }
    try ( Real u1 = new Real(); Real u2 = new Real(); Real r = new Real(); Real theta = new Real();
          Real z0 = new Real(); Real z1 = new Real(); Real pi = new Real();)
    {
      // u1 in (0,1), must be > 0
      do
      {
        arblib.arb_urandom(u1, getState(), prec);
      }
      while (u1.isZero());

      // u2 in [0,1)
      arblib.arb_urandom(u2, getState(), prec);

      // r = sqrt(-2 * log(u1))
      u1.log(prec, r).mul(-2, prec).sqrt(prec, r);

      // theta = 2 * pi * u2
      theta.set(pi.π(prec)).mul(2, prec, theta).mul(u2, prec, theta);

      // z0 = r * cos(theta)
      theta.cos(prec, z0).mul(r, prec, z0);

      // z1 = r * sin(theta)
      theta.sin(prec, z1).mul(r, prec, z1);

      // Output z0, cache z1
      out.set(z0);
      cached.set(z1);
      hasCached = true;
      return out;
    }
  }

  @Override
  public void close()
  {
    cached.close();
  }

  public RandomState getState()
  {
    return state;
  }

}
