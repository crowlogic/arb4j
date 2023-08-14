package arb;

public class MagnitudeConstants
{

  public static final Magnitude one = new Magnitude().set(1);

  static
  {
    System.loadLibrary("arblib");
  }

  public static Magnitude log10mag;
  public static Magnitude zeroMag;

  static
  {
    zeroMag  = new Magnitude().zero();
    log10mag = new Magnitude().set(10).log();
  }
}
