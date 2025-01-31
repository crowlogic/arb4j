package arb.equations;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonFractionalRiccatiEquation extends
                                                  FractionalRiccatiEquation
{
  public static void main(String args[])
  {
    var roughHestonFractionalRiccatiEquation = new RoughHestonFractionalRiccatiEquation(RealConstants.half);
    System.out.println(roughHestonFractionalRiccatiEquation);
  }

  public RoughHestonFractionalRiccatiEquation(Real α)
  {
    super(α,
          "a->1/2*(-a^2-I*a)",
          "a->λ*(I*a*ρ*ν-1)",
          "a->1/2*(λ*ν)^2");
  }
}
