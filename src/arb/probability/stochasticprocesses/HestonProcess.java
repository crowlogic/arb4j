package arb.probability.stochasticprocesses;

import static arb.Constants.*;
import static arb.util.Utils.*;

import java.io.*;

import arb.*;
import arb.probability.*;

/**
 * The Heston process describes the evolution of the volatility of an underlying
 * asset. It is a stochastic volatility model: such a model assumes that the
 * volatility of the asset is not constant, nor even deterministic, but follows
 * a random process.
 * 
 * @see https://en.wikipedia.org/wiki/Heston_model
 */
public class HestonProcess
{
  private Real                       κ;              // rate reversion to the (ergodic) mean
  private Real                       λ;              // ergodic mean
  private Real                       ξ;              // volatility of volatility
  private Real                       δ;              // step-size = T / N where T is the length of the interval to be
                                                     // simulated and N
                                                     // is the number of mesh points calculated
  private Real                       ρ;
  private Real                       V;
  private Real                       S;
  private GaussianProbabilityDensity gaussianDensity;
  private Real                       r;
  private Real                       ρsquared;

  public static void main(String args[]) throws IOException
  {
    HestonProcess process = new HestonProcess();
    process.simulate(1000);

  }

  static public final int prec = 128;

  public HestonProcess()
  {
    this.r          = new Real("0",
                               prec);
    this.κ          = new Real("2",
                               prec);
    this.λ          = new Real("0.01",
                               prec);
    this.ξ          = new Real("0.1",
                               prec);
    this.δ          = new Real("0.01",
                               prec);
    this.ρ          = new Real("0.5",
                               prec);
    ρsquared        = new Real().set(ρ).pow(2, prec);
    gaussianDensity = new GaussianProbabilityDensity(ONE,
                                                     ONE);
  }

  public void simulate(int n)
  {
    this.V = Real.newVector(n);
    this.S = Real.newVector(n);
    V.set(0.01);
    S.set(10);
    try ( Real W1 = new Real(); Real W2 = new Real(); Real tmp = new Real(); Real b = new Real();)
    {
      for (int i = 1; i < n; i++)
      {
        double dblρ = ρ.doubleValue();
        Real   ω    = gaussianDensity.sample();
        Real   v    = V.get(i - 1);
        Real   s    = S.get(i - 1);
        assert v.isFinite() : "variance process exploded at i=" + i;
        assert s.isFinite() : "level process exploded at i=" + i;
        println(String.format("i=%d, v=%s, s=%s", i - 1, v.toString(20), s.toString(20)));

        W1.set(ω);
        W2.set(ρ.mul(ω, prec, W2).add(tmp.set(Math.sqrt(1.0 - dblρ * dblρ) * ω.doubleValue()), prec, W2));

        λ.sub(v, prec, tmp).mul(δ, prec, b);

        Real d  = ξ.mul(v.sqrt(prec).mul(δ.sqrt(prec), prec, tmp).mul(W2, prec, tmp), prec, tmp);

        Real Vi = V.get(i);
        Vi.set(v.add(κ.mul((b.add(d, prec, tmp)), prec, tmp), prec, tmp));

        Real a = s.add(s.mul(r, prec, s).mul(δ, prec, s), prec, s);
        s.mul(δ.sqrt(prec).mul(v.sqrt(prec), prec, tmp).mul(W1, prec, tmp), prec, b);

        Real Si             = S.get(i);
        Real spotPriceLevel = a.add(b, prec, tmp);
        Si.set(spotPriceLevel);

      }
    }
  }

}
