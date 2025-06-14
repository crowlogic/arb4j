package arb.stochastic;

import arb.Complex;

public class Spectra
{
  public final double[] path, pathQuad, envelope, t, freq, psd;
  public Complex        whiteNoise;

  public Spectra(double[] path,
                 double[] pathQuad,
                 double[] envelope,
                 double[] t,
                 double[] freq,
                 double[] psd,
                 Complex whiteNoise)
  {
    this.path       = path;
    this.pathQuad   = pathQuad;
    this.envelope   = envelope;
    this.t          = t;
    this.freq       = freq;
    this.psd        = psd;
    this.whiteNoise = whiteNoise;
  }
}