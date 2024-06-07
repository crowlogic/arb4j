package arb.utensils;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class PlotTest
{

  public static void main(String[] args)
  {
    ShellFunctions.plot(-10, 30, 20000, RealFunction.express("Z(t)"));
  }

}
