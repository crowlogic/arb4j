package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealConstants;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealSequence;
import arb.functions.integer.RealSequenceSequence;

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
  private JacobiPolynomialSequence basis = new JacobiPolynomialSequence(RealConstants.negHalf,
                                                                        RealConstants.negHalf);

  private final Real               γ;
  private int                      bits;

  public RealSequenceSequence      μ;

  public RealSequenceSequence      χ;

  public RealSequenceSequence      ω;

  public RealSequence              normSq;

  public Context                   context;

  public JacobiFractionalDerivativeOperationalMatrixBuilder()
  {
    this.bits = 128;

    this.γ    = Real.named("γ").set(RealConstants.half);

    context   = basis.getContext();
    context.registerVariable("γ", γ);
    context.registerVariable(Real.named("t"));
    normSq = RealSequence.express("normSq",
                                  "i➔2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))",
                                  context);

    ω      =
      RealSequenceSequence.express("ω",
                                   "j➔k➔(-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*(j-k)!*k!)",
                                   context);

    χ      =
      RealSequenceSequence.express("χ", "i➔p➔int(t->t^p*w(t)*P(i)(t), t=-1..1)/normSq(i)", context);

    μ      = RealSequenceSequence.express("μ",
                                          "i➔j➔Σk➔(ω(j)(k)*Γ(k+1)/Γ(k+1-γ)*χ(i)(k-γ)){k=⌈γ⌉..j}",
                                          context);

  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setBasis(JacobiPolynomialSequence basis)
  {
    this.basis = basis;
    return this;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setFractionalOrder(Real order)
  {
    this.γ.set(order);
    return this;
  }

  public JacobiFractionalDerivativeOperationalMatrixBuilder setBits(int bits)
  {
    this.bits = bits;
    return this;
  }

  public RealMatrix build(int maxDegree)
  {

    RealMatrix result = RealMatrix.newMatrix(maxDegree + 1, maxDegree + 1);

    for (int i = 0; i <= maxDegree; i++)
    {
      RealSequence row = μ.evaluate(i, bits);
      for (int j = 0; j <= maxDegree; j++)
      {
        row.evaluate(j, bits, result.get(i, j));
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
    return basis.α;
  }

  public Real getBeta()
  {
    return basis.β;
  }

  public Real getFractionalOrder()
  {
    return γ;
  }

  public int getBits()
  {
    return bits;
  }

  @Override
  public void close()
  {

    if (γ != null)
    {
      γ.close();
    }
  }

  @Override
  public String toString()
  {
    return String.format("JacobiFractionalDerivativeOperationalMatrixBuilder[α=%.6f, β=%.6f, γ=%.6f, bits=%d]",
                         basis.α.doubleValue(),
                         basis.β.doubleValue(),
                         γ.doubleValue(),
                         bits);
  }
}
