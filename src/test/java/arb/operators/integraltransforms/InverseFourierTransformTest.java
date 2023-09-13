package arb.operators.integraltransforms;

import arb.*;
import arb.functions.real.RealFunction;
import arb.stochastic.StandardGaussianCharacteristicFunction;
import junit.framework.TestCase;

public class InverseFourierTransformTest extends
                                         TestCase
{

  final static int         prec    = 128;

  public static final Real ε       = new Real("0.00001",
                                              128);

  static boolean           verbose = false;

  /**
   * When using Mathematica's convention for the normalization constant which is
   * adopted here, the Fourier transform of the standard Gaussian density function
   * does exhibit the involution property.
   * 
   * Let's consider the normalized Gaussian function with the normalization
   * constant C:
   * 
   * g(x) = C * e^(-x²/2), where C = √(|b| / (2π)^(1-a)) and [a, b] = [0, 1].
   * 
   * In this case, C = √(1 / (2π)).
   * 
   * Now, the Fourier transform of g(x) with this normalization constant will
   * result in the same function:
   * 
   * G(u) = C * e^(-u²/2), where C = √(1 / (2π)).
   * 
   * So, the Fourier transform of the normalized Gaussian function is indeed an
   * involution when using the Mathematica convention for the normalization
   * constant.
   * 
   */
  public void testFourierTransformOfStandardGaussianDensity()
  {
    StandardGaussianCharacteristicFunction φ           = new StandardGaussianCharacteristicFunction();

    RealFunction                           realPartOfφ = φ.realPart().asRealFunction(new Complex());
    try ( var ift = new InverseFourierTransform<RealFunction>(realPartOfφ);
          var interval = new FloatInterval(-10,
                                           10);
          var δ = new Real();
          var G = new Complex();
          var 𝔼 = new Real();
          var partition = interval.generateRealPartition(prec, true, 100))

    {

      for (var ω : partition)
      {
        realPartOfφ.evaluate(ω, 1, prec, 𝔼);
        ift.evaluate(ω, 1, prec, G);
        assertTrue(G.im().compareTo(ε) <= 0);
        if (verbose)
        {
          System.out.format("             ω=%s\n", ω);
          System.out.format("          f(ω)=%s\n", 𝔼);

          System.out.format("      F(f(ω))=%s\n", G);
          System.out.format("   F^1(F(f(ω)))=%s\n\n", G);
        }

        assertTrue(G.im().compareTo(ε) <= 0);
        assertTrue(𝔼.sub(G.re(), prec, δ).abs().compareTo(ε) <= 0);
      }

    }
  }
}
