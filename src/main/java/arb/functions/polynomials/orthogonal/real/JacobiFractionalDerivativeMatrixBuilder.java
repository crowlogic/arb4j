package arb.functions.polynomials.orthogonal.real;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealSequenceSequence;
import arb.functions.real.RealFunction;

/**
 * Builder for Jacobi polynomial fractional derivative operational matrices.
 * 
 * Constructs D^γ matrices for varying fractional orders γ and degrees N, with
 * configurable Hurst exponent (α=β).
 * 
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JacobiFractionalDerivativeMatrixBuilder implements
                                                     AutoCloseable
{
  private Real alpha;
  private Real beta;
  private int  bits;

  /**
   * Creates builder with sensible defaults: α=β=1/2, bits=128
   */
  public JacobiFractionalDerivativeMatrixBuilder()
  {
    this.alpha = new Real(128).set(RealConstants.half);
    this.beta  = new Real(128).set(RealConstants.half);
    this.bits  = 128;
  }

  /**
   * Sets α and β to same value (Hurst exponent)
   */
  public JacobiFractionalDerivativeMatrixBuilder setHurst(Real hurst)
  {
    this.alpha = new Real(bits).set(hurst);
    this.beta  = new Real(bits).set(hurst);
    return this;
  }

  /**
   * Sets α independently
   */
  public JacobiFractionalDerivativeMatrixBuilder setAlpha(Real alpha)
  {
    this.alpha = new Real(bits).set(alpha);
    return this;
  }

  /**
   * Sets β independently
   */
  public JacobiFractionalDerivativeMatrixBuilder setBeta(Real beta)
  {
    this.beta = new Real(bits).set(beta);
    return this;
  }

  /**
   * Sets working precision in bits
   */
  public JacobiFractionalDerivativeMatrixBuilder setBits(int bits)
  {
    this.bits  = bits;
    this.alpha = new Real(bits).set(alpha);
    this.beta  = new Real(bits).set(beta);
    return this;
  }

  /**
   * Builds D^γ matrix for given fractional order and degree.
   * 
   * @param fractionalOrder γ
   * @param maxDegree       N
   * @return RealMatrix D^γ of size (N+1)×(N+1)
   */
  public RealMatrix build(Real fractionalOrder, int maxDegree)
  {
    try ( Context ctx = new Context(alpha,
                                    beta))
    {
      RealSequenceSequence ω      =
                             RealSequenceSequence.express("(j,k)➔(-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*(j-k)!*k!)",
                                                          ctx);

      RealFunction         normSq =
                                  RealFunction.express("normSq",
                                                       "i➔2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))",
                                                       ctx);

      RealSequenceSequence χ      =
                             RealSequenceSequence.express("(i,p)➔∫(-1,1,t^p*(1-t)^β*(1+t)^α*jacobi(i,α,β,t))/normSq(i)",
                                                          ctx);

      try ( Context ctxGamma = new Context(alpha,
                                           beta,
                                           fractionalOrder))
      {
        RealSequenceSequence μ      =
                               RealSequenceSequence.express("(i,j)➔sum(ω(j,k)*Γ(k+1)/Γ(k+1-γ)*χ(i,k-γ){k=⌈γ⌉..j})",
                                                            ctxGamma);

        RealMatrix           result = RealMatrix.newMatrix(maxDegree + 1, maxDegree + 1);
        for (int i = 0; i <= maxDegree; i++)
        {
          for (int j = 0; j <= maxDegree; j++)
          {
            μ.evaluate(i, bits).evaluate(j, bits, result.get(i, j));
          }
        }
        return result;
      }
    }
  }

  public Real getAlpha()
  {
    return alpha;
  }

  public Real getBeta()
  {
    return beta;
  }

  public int getBits()
  {
    return bits;
  }

  @Override
  public void close()
  {
    if (alpha != null)
    {
      alpha.close();
    }
    if (beta != null)
    {
      beta.close();
    }
  }

  @Override
  public String toString()
  {
    return String.format("JacobiFractionalDerivativeMatrixBuilder[α=%.6f, β=%.6f, bits=%d]",
                         alpha.doubleValue(),
                         beta.doubleValue(),
                         bits);
  }
}
