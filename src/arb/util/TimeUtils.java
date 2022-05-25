package arb.util;

import java.util.concurrent.TimeUnit;


public class TimeUtils
{

  public static double convertToHours(TimeUnit fromUnit, double from)
  {
    double ratio = fromUnit.convert(1L, TimeUnit.HOURS);
    return from / ratio;
  }

  public static double convertTimeUnits(double from, TimeUnit fromUnit, TimeUnit toUnit)
  {
    double ratio = fromUnit.convert(1L, toUnit);
    if (!Double.isFinite(ratio) || ratio == 0.0)
    {
      ratio = toUnit.convert(1L, fromUnit);
      return from * ratio;
    }
    return from / ratio;
  }
}
