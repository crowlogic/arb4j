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
 * Constructs operational matrices D^γ for varying fractional orders γ and
 * degrees N, with configurable Hurst exponent (α=β).
 * 
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JacobiFractionalDerivativeOperationalMatrixBuilder implements
                                                                AutoCloseable
{
  private JacobiPolynomialSequence basis;
  private Real                     fractionalOrder;
  private int                      bits;

  /**
   * Creates builder with sensible defaults. Jacobi basis created lazily on first
   * build() if not set.
   */
  public JacobiFractionalDerivativeOperationalMatrixBuilder()
  {
    this.basis           = null;
    this.fractionalOrder = new Real(128).setName("γ").set(RealConstants.half);
    this.bits            = 128;
  }

  /**
   * Sets custom Jacobi polynomial basis
   */
  public JacobiFractionalDerivativeOperationalMatrixBuilder setBasis(JacobiPolynomialSequence basis)
  {
    this.basis = basis;
    return this;
  }

  /**
   * Sets fractional order γ
   */
  public JacobiFractionalDerivativeOperationalMatrixBuilder setFractionalOrder(Real order)
  {
    this.fractionalOrder = new Real(bits).setName("γ").set(order);
    return this;
  }

  /**
   * Sets working precision in bits
   */
  public JacobiFractionalDerivativeOperationalMatrixBuilder setBits(int bits)
  {
    this.bits            = bits;
    this.fractionalOrder = new Real(bits).setName("γ").set(fractionalOrder);
    return this;
  }

  public RealMatrix build(int maxDegree)
  {
    if (basis == null)
    {
      try ( Real alpha = new Real(bits).set(RealConstants.half);
            Real beta = new Real(bits).set(RealConstants.half))
      {
        basis = new JacobiPolynomialSequence(alpha, beta);
      }
    }

    try (Context ctx = new Context(basis.α, basis.β, fractionalOrder))
    {
      // Polynomial norm squared normSq(i)
      RealFunction normSq = RealFunction.express("normSq",
          "i->2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))",
          ctx);

      // Power series coefficients ω(j)(k)
      RealSequenceSequence ω = RealSequenceSequence.express(
          "j->k->(-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*factorial(j-k)*factorial(k))"
          + "",
          ctx);

      // Projection coefficients χ(i)(p)
      RealSequenceSequence χ = RealSequenceSequence.express(
          "i->∫(-1,1,t^p*(1-t)^β*(1+t)^α*jacobi(i,α,β,t))/normSq(i)",
          ctx);

      // Operational matrix elements μ(i)(j)
      RealSequenceSequence μ = RealSequenceSequence.express(
          "i->sum(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ){k=⌈γ⌉..j})",
          ctx);

      RealMatrix result = RealMatrix.newMatrix(maxDegree + 1, maxDegree + 1);
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

  public JacobiPolynomialSequence getBasis()
  {
    return basis;
  }

  public Real getFractionalOrder()
  {
    return fractionalOrder;
  }

  public int getBits()
  {
    return bits;
  }

  @Override
  public void close()
  {
    if (fractionalOrder != null)
    {
      fractionalOrder.close();
    }
    if (basis != null)
    {
      basis.close();
    }
  }

  @Override
  public String toString()
  {
    if (basis == null)
    {
      return String.format("JacobiFractionalDerivativeOperationalMatrixBuilder[basis=default(1/2,1/2), γ=%.6f, bits=%d]",
                           fractionalOrder.doubleValue(),
                           bits);
    }
    return String.format("JacobiFractionalDerivativeOperationalMatrixBuilder[α=%.6f, β=%.6f, γ=%.6f, bits=%d]",
                         basis.α.doubleValue(),
                         basis.β.doubleValue(),
                         fractionalOrder.doubleValue(),
                         bits);
  }
}
