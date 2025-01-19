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
  }
}
