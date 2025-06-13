package arb.stochastic;

import arb.Complex;

/**
 * Updated Spectra class with orthogonal processes U(λ) and V(λ)
 */
public class Spectra
{
  public final double[] path, pathQuad, envelope, t, freq, psd;
  public final double[] uProcess, vProcess, posFreq;
  public Complex        whiteNoise;

  /**
   * Legacy constructor for backward compatibility
   */
  public Spectra(double[] path,
                 double[] pathQuad,
                 double[] envelope,
                 double[] t,
                 double[] freq,
                 double[] psd,
                 Complex whiteNoise)
  {
    this(path,
         pathQuad,
         envelope,
         t,
         freq,
         psd,
         whiteNoise,
         null,
         null,
         null);
  }

  /**
   * Complete constructor with orthogonal processes
   */
  public Spectra(double[] path,
                 double[] pathQuad,
                 double[] envelope,
                 double[] t,
                 double[] freq,
                 double[] psd,
                 Complex whiteNoise,
                 double[] uProcess,
                 double[] vProcess,
                 double[] posFreq)
  {
    this.path       = path;
    this.pathQuad   = pathQuad;
    this.envelope   = envelope;
    this.t          = t;
    this.freq       = freq;
    this.psd        = psd;
    this.whiteNoise = whiteNoise;
    this.uProcess   = uProcess;
    this.vProcess   = vProcess;
    this.posFreq    = posFreq;
  }
}