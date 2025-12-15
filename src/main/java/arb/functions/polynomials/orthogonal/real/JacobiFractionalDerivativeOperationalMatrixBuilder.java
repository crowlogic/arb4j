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
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class JacobiFractionalDerivativeOperationalMatrixBuilder implements
                                                                AutoCloseable
{
  private JacobiPolynomialSequence basis;
  private final Real               alpha;
  private final Real               beta;
  private final Real               fractionalOrder;
  private int                      bits;

  public JacobiFractionalDerivativeOperationalMatrixBuilder()
  {
    this.bits            = 128;
    this.alpha           = new Real(bits).setName("α").set(RealConstants.half);
    this.beta            = new Real(bits).setName("β").set(RealConstants.half);
    this.fractionalOrder = new Real(bits).setName("γ").set(RealConstants.half);
    this.basis           = null;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setBasis(JacobiPolynomialSequence basis)
  {
    this.basis = basis;
    return this;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setAlpha(Real a)
  {
    this.alpha.set(a);
    return this;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setBeta(Real b)
  {
    this.beta.set(b);
    return this;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setFractionalOrder(Real order)
  {
    this.fractionalOrder.set(order);
    return this;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setBits(int bits)
  {
    this.bits = bits;
    return this;
  }

  public RealMatrix build(int maxDegree)
  {
    // Lazy initialization of default basis if not set
    if (basis == null)
    {
      basis = new JacobiPolynomialSequence(alpha,
                                           beta);
    }

    Context ctx = basis.getContext();
    ctx.registerVariable("γ", fractionalOrder);

    // normSq(i) = 2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))
    RealFunction         normSq     =
                                RealFunction.express("normSq",
                                                     "i➔2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))",
                                                     ctx);

    // ω(j,k) =
    // (-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*factorial(j-k)*factorial(k))
    RealSequenceSequence ω          =
                           RealSequenceSequence.express("j➔(-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*factorial(j-k)*factorial(k))",
                                                        ctx);

 // gammaRatio(k) = Γ(k+1)/Γ(k+1-γ)
    RealFunction gammaRatio = RealFunction.express("gammaRatio",
                                                   "k➔Γ(k+1)/Γ(k+1-γ)",
                                                   ctx);

    // χ(i,p) = int(t^p*(1-t)^β*(1+t)^α*P(i)(t), t=-1..1) / normSq(i)
    RealSequenceSequence χ = RealSequenceSequence.express("chi",
      "i➔p➔int(t^p*(1-t)^β*(1+t)^α*P(i)(t), t=-1..1)/normSq(i)",
      ctx);

    // μ(i,j) = sum(ω(j)(k)*gammaRatio(k)*χ(i)(k-γ), k=⌈γ⌉..j)
    RealSequenceSequence μ = RealSequenceSequence.express("mu",
      "i➔j➔sum(ω(j)(k)*gammaRatio(k)*χ(i)(k-γ){k=⌈γ⌉..j})",
      ctx);

    RealMatrix           result     = RealMatrix.newMatrix(maxDegree + 1, maxDegree + 1);

    for (int i = 0; i <= maxDegree; i++)
    {
      for (int j = 0; j <= maxDegree; j++)
      {
        μ.evaluate(i, bits).evaluate(j, bits, result.get(i, j));
      }
    }

    return result;
  }

  public JacobiPolynomialSequence getBasis()
  {
    return basis;
  }

  public Real getAlpha()
  {
    return alpha;
  }

  public Real getBeta()
  {
    return beta;
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
    if (alpha != null)
    {
      alpha.close();
    }
    if (beta != null)
    {
      beta.close();
    }
    if (fractionalOrder != null)
    {
      fractionalOrder.close();
    }
  }

  @Override
  public String toString()
  {
    if (basis == null)
    {
      return String.format("JacobiFractionalDerivativeOperationalMatrixBuilder[basis=null, α=%.6f, β=%.6f, γ=%.6f, bits=%d]",
                           alpha.doubleValue(),
                           beta.doubleValue(),
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
