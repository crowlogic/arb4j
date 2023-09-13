package arb.operators.integraltransforms;

import org.junit.Test;

import arb.*;
import arb.functions.real.RealFunction;
import arb.stochastic.StandardGaussianDensityFunction;
import junit.framework.TestCase;

public class FourierTransformTest extends
                                  TestCase
{

  final static int         prec    = 128;

  static boolean           verbose = false;

  public static final Real ε       = new Real("10",
                                              prec).pow(-35, prec);

  @Test
  public void testFourierTransformOfStandardGaussianDensity()
  {
    // Create the standard Gaussian density function
    var f = new StandardGaussianDensityFunction();

    // Create the Fourier transform of the standard Gaussian density function
    try ( var ft = new FourierTransform<>(f); var interval = new FloatInterval(-10,
                                                                               10);
          var δ = new Real(); var G = new Complex(); var 𝔼 = new Real();
          var ift = new InverseFourierTransform<RealFunction>(ft.realPart());
          var mesh = interval.generateRealPartition(prec, false, 100))
    {

      // Evaluate the Fourier transform at each point and make sure their difference
      // isn't too big, then do the same for the inverse Fourier transform of the
      // Fourier transform
      for (var ω : mesh)
      {
        assertTrue(ft.evaluate(ω, 1, prec, G).im().compareTo(ε) <= 0);
        assertTrue(f.evaluate(ω, 1, prec, 𝔼).sub(G.re(), prec, δ).abs().compareTo(ε) <= 0);
        if (verbose)
        {

          System.out.format("             ω=%s\n", ω);
          System.out.format("          f(ω)=%s\n", 𝔼);

          System.out.format("      F(f(ω))=%s\n", G);

          System.out.format("   F^1(F(f(ω)))=%s\n\n", G);
        }
        assertTrue(ift.evaluate(ω, 1, prec, G).im().compareTo(ε) <= 0);
        assertTrue(𝔼.sub(G.re(), prec, δ).abs().compareTo(ε) <= 0);

      }

    }
  }
}
