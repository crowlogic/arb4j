package arb.functions.real;

import arb.RealRationalFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class pFqTest
{

  public static void main(String[] args)
  {
    pFq pfq = new pFq();
    Larg arg = new Larg();
    var initialValue = arg.evaluate(128);
    RealRationalFunction x = pfq.evaluate(128);
    System.out.println("x=" + x);
    System.out.format("initialValue=%s\n", initialValue);
  }

}
