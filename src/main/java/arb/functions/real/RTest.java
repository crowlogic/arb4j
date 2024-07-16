package arb.functions.real;

import arb.RealConstants;
import arb.RealRationalFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RTest
{

  public static void main(String[] args)
  {
    R r = new R();
    r.v = RealConstants.half;
   // Larg arg = new Larg();
    //var initialValue = arg.evaluate(128);
    RealRationalFunction x = r.evaluate(3, 128, new RealRationalFunction() );
    System.out.println("x=" + x);
  //  System.out.format("initialValue=%s\n", initialValue);
  }

}
