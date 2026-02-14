package arb.functions.polynomials.orthogonal.real;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.integer.*;
import arb.utensils.Utensils;

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
  public static void main( String args[] )
  {
    JacobiFractionalDerivativeOperationalMatrixBuilder builder = new JacobiFractionalDerivativeOperationalMatrixBuilder();
   // builder.context.printValues();
  }
  public static final Logger logger =
                                    LoggerFactory.getLogger(JacobiFractionalDerivativeOperationalMatrixBuilder.class);

  static
  {
    Expression.trace = false;
  }

  private JacobiPolynomialSequence basis = new JacobiPolynomialSequence(RealConstants.negHalf,
                                                                        RealConstants.negHalf);

  private final Real               γ;
  private int                      bits;

  public ComplexSequenceSequence   μ;

  public ComplexFunctionSequence   χ;

  public ComplexSequenceSequence   ω;

  public ComplexSequence           normSq;

  public Context                   context;

  public JacobiFractionalDerivativeOperationalMatrixBuilder()
  {
    this.bits        = 128;

    this.γ           = Real.named("γ").set(RealConstants.half);

    Expression.trace = true;

    context          = basis.getContext();
    context.printValues();
    context.registerVariable("γ", γ);
    // context.registerVariable(Real.named("t"));
    normSq =
           ComplexSequence.express("normSq",
                                   "i➔2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))",
                                   context);

    ω      =
      ComplexSequenceSequence.express("ω",
                                      "j➔k➔(-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*(j-k)!*k!)",
                                      context);

    χ      = ComplexFunctionSequence.express("χ",
                                             "i➔p➔int(t➔t^p*w(t)*P(i)(t), t=-1..1)/normSq(i)",
                                             context);

    μ      = ComplexSequenceSequence.express("μ",
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

  public ComplexMatrix build(int maxDegree)
  {

    ComplexMatrix result = ComplexMatrix.newMatrix(maxDegree + 1, maxDegree + 1);

    if (Expression.trace && logger.isDebugEnabled())
    {
      logger.debug("build(maxDegree={}) μrow={}", maxDegree, Utensils.yamlString(μ));
    }
    for (int i = 0; i <= maxDegree; i++)
    {
      ComplexSequence μrow = μ.evaluate(i, bits);
      
      Complex         resultRow  = result.getRow(i);
      if (Expression.trace && logger.isDebugEnabled())
      {
        logger.debug("Evaluating μrow({})={}", i, Utensils.yamlString(μrow));
      }
      for (int j = 0; j <= maxDegree; j++)
      {
        μrow.evaluate(j, bits, resultRow.get(j));
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
