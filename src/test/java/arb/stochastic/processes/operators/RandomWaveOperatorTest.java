package arb.stochastic.processes.operators;

import arb.Integer;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealFunctionSequence;
import arb.functions.real.RealFunction;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RandomWaveOperatorTest extends
                                    TestCase
{
  public static void testRandomWaveOperatorTest()
  {
    /**
     * <pre>
     * h(s)=(√(π)⋅Γ(3/4)⋅J(1/4,s)⋅2^(1/4))/(s^(1/4))
     * S(w)=Fourier(J0(t),t,w)=1/sqrt(1-w^2)
     * √(S(w))=Fourier(h(s),s,w)
     * </pre>
     * 
     * @param args
     */

    RealFunctionSequence seq  =
                             RealFunctionSequence.express("Ψ:k->√((2*k+½)/π)*((k+1)⋰-½)²*√((8*k+2)/π)*(-1)ᵏ*j(2*k,x)");

    RealFunction         func = seq.evaluate(4, 128);
    var                  y    = func.eval(2.3);
    System.out.format("psi[3](2.3)=" + y);

  }
}
