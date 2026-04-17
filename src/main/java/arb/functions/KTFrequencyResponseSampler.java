package arb.functions;

import arb.Complex;
import arb.FloatInterval;
import arb.Real;
import arb.RealDataSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * For a fixed upper limit T, sample
 *
 * K_T(ν) = ∫_{T_0}^{T} ζ(½ + ⅈt) · √(ϑ'(t)) · exp(-ⅈνϑ(t)) dt
 *
 * across a frequency band ν ∈ [ν_lo, ν_hi] at N equally spaced points, returning
 * the real and imaginary parts as two {@link RealDataSet}s ready to plot.
 *
 * Inspired by the design of the stationary Gaussian process sampler: frequencies
 * are the horizontal axis, the arbitrary-precision sampled values are stored as
 * {@link Real} vectors inside a {@link RealDataSet} keyed on a
 * {@link FloatInterval}.
 *
 * Each sample requires a full integration on [T_0, T] for that ν, so total cost
 * is N · (T − T_0)/dt integrand evaluations. The ν-free amplitude
 * ζ(½+ⅈt)·√(ϑ'(t)) and the phase argument ϑ(t) are not currently reused across
 * ν; see KTFrequencyFunctional for the complementary case where T varies at
 * fixed ν.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class KTFrequencyResponseSampler implements
                                         AutoCloseable
{
  public static final int BITS_DEFAULT = 128;

  public final Real          T0;
  public final Real          T;
  public final Real          dt;
  public final FloatInterval frequencyBand;
  public final int           N;
  public final int           bits;

  public RealDataSet         realPart;
  public RealDataSet         imagPart;
  public Real                frequencies;

  public KTFrequencyResponseSampler(Real T0, Real T, Real dt, FloatInterval frequencyBand, int N, int bits)
  {
    this.T0            = T0;
    this.T             = T;
    this.dt            = dt;
    this.frequencyBand = frequencyBand;
    this.N             = N;
    this.bits          = bits;

    frequencies        = Real.newVector(N);
    realPart           = new RealDataSet("Re K_T(ν)",
                                         N,
                                         frequencyBand);
    imagPart           = new RealDataSet("Im K_T(ν)",
                                         N,
                                         frequencyBand);
  }

  public KTFrequencyResponseSampler(Real T0, Real T, Real dt, FloatInterval frequencyBand, int N)
  {
    this(T0, T, dt, frequencyBand, N, BITS_DEFAULT);
  }

  /**
   * Sample K_T(ν) at N equally spaced ν in the frequency band. Populates the
   * internal {@link #realPart} and {@link #imagPart} {@link RealDataSet}s and
   * returns this.
   */
  public KTFrequencyResponseSampler sample()
  {
    try ( KTFrequencyFunctional K = new KTFrequencyFunctional(T0,
                                                              dt,
                                                              bits);
          Real                   nuLo   = new Real().set(frequencyBand.left());
          Real                   nuHi   = new Real().set(frequencyBand.right());
          Real                   width  = new Real();
          Real                   step   = new Real();
          Real                   offset = new Real();
          Real                   nu     = new Real();
          Complex                value  = new Complex())
    {
      nuHi.sub(nuLo, bits, width);
      width.div(N - 1, bits, step);

      for (int k = 0; k < N; k++)
      {
        step.mul(k, bits, offset);
        nuLo.add(offset, bits, nu);
        frequencies.get(k).set(nu);

        try ( RealToComplexFunction F = K.evaluate(nu, 1, bits, null))
        {
          ((NumericalComplexFunctionIntegral) F).evaluate(T, 1, bits, value);
        }

        realPart.getTimes().get(k).set(nu);
        realPart.getValues().get(k).set(value.getReal());
        imagPart.getTimes().get(k).set(nu);
        imagPart.getValues().get(k).set(value.getImag());
      }
    }
    return this;
  }

  @Override
  public void close()
  {
    frequencies.close();
    realPart.close();
    imagPart.close();
  }
}
