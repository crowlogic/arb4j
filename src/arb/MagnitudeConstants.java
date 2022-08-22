package arb;

public class MagnitudeConstants
{

  public static final Magnitude log10mag = new Magnitude();
  public static final Magnitude zeroMag  = new Magnitude();

  static
  {
    zeroMag.zero();
    log10mag.set(10).log(log10mag);
  }
}
