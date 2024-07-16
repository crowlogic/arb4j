package arb.functions.real;

import arb.RealRationalFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class FTest
{

  

  public static void main(String[] args)
  {
   F f = new F();
   RealRationalFunction x = f.evaluate(128);
   System.out.println("x="+x);
   
  }

}
