package arb.functions.polynomials.orthogonal.real;

import static java.lang.System.out;

import java.util.List;

import arb.RealPolynomial;
import arb.utensils.ShellFunctions;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RandomWaveSpectralFactorsTest extends
                                           TestCase
{
  public void testRandomWaveSpectralFactors()
  {
    RandomWaveSpectralFactors P = new RandomWaveSpectralFactors(128);
    List<RealPolynomial> seq = ShellFunctions.seq(0, 4, P);
    seq.forEach(System.out::println);
    assertEquals( new RealPolynomial().set("1/8*(5*x^2-2)*3^(1/2)*π^(1/4)*2^(3/4)/Γ(3/4)").toString(), seq.get(2).toString() );
  }
}
