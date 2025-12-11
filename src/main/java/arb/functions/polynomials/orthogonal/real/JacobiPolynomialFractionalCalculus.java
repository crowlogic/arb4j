package arb.functions.polynomials.orthogonal.real;

import arb.Real;
import arb.RealMatrix;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.integer.RealSequenceSequence;
import arb.functions.real.RealFunction;

/**
 * Fractional Calculus Operational Matrix for Jacobi Polynomials.
 * 
 * @author Stephen Crowley
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class JacobiPolynomialFractionalCalculus implements
                                                AutoCloseable
{
  private final JacobiPolynomialSequence basis;
  public final Real                      fractionalOrder;
  private final int                      maxDegree;
  private final int                      bits;
  private final Context                  extendedContext;

  // Power series coefficients ω_{j,k}: Integer×Integer→Real
  public final RealSequenceSequence      ω;

  // Fractional derivative coefficient for monomials
  public final RealFunction              fractionalDerivativeMonomialCoeff;

  // Polynomial norm squared ||P_i||²
  public final RealFunction              normSquared;

  // Projection coefficient χ_{i,p}: Integer×Integer→Real
  public final RealSequenceSequence      χ;

  // Operational matrix element μ_{ij}: Integer×Integer→Real
  public final RealSequenceSequence      μ;

  private RealMatrix                     operationalMatrix;

  public JacobiPolynomialFractionalCalculus(JacobiPolynomialSequence jacobiBasis,
                                            Real fractionalOrder,
                                            int maxDegree,
                                            int bits)
  {
    basis                             = jacobiBasis;
    this.fractionalOrder              = new Real(bits).set(fractionalOrder).setName("γ");
    this.maxDegree                    = maxDegree;
    this.bits                         = bits;
    extendedContext                   = new Context(basis.α,
                                                    basis.β,
                                                    fractionalOrder);

    ω                                 =
      RealSequenceSequence.express("(j,k)➔(-1)^(j-k)*Γ(j+β+1)*Γ(j+k+α+β+1)/(Γ(k+β+1)*Γ(j+α+β+1)*(j-k)!*k!)",
                                   extendedContext);

    fractionalDerivativeMonomialCoeff = RealFunction.express("D_γ_t^k",
                                                             "k➔Γ(k+1)/Γ(k+1-γ)",
                                                             extendedContext);

    normSquared                       =
                RealFunction.express("‖P_i‖²",
                                     "i➔2^(α+β+1)*Γ(i+α+1)*Γ(i+β+1)/((2*i+α+β+1)*Γ(i+1)*Γ(i+α+β+1))",
                                     extendedContext);

    χ                                 =
      RealSequenceSequence.express("(i,p)➔∫(-1,1,t^p*(1-t)^β*(1+t)^α*jacobi(i,α,β,t))/‖P_i‖²(i)",
                                   extendedContext);

    μ                                 =
      RealSequenceSequence.express("(i,j)➔sum(ω(j,k)*Γ(k+1)/Γ(k+1-γ)*χ(i,k-γ){k=⌈γ⌉..j})",
                                   extendedContext);
  }

  public void printRecurrenceRelation()
  {
    System.out.println("=".repeat(80));
    System.out.println("THREE-TERM RECURRENCE RELATION FOR JACOBI POLYNOMIALS");
    System.out.println("=".repeat(80));
    System.out.println("\nP_{n+1}(x) = [A(n)·x·P_n(x) + B(n)·P_n(x) - C(n)·P_{n-1}(x)] / E(n)");
    System.out.println("\nCoefficients:");
    System.out.println("  A(n) = " + basis.A);
    System.out.println("  B(n) = " + basis.B);
    System.out.println("  C(n) = " + basis.C);
    System.out.println("  E(n) = " + basis.E);
    System.out.println("\nParameters: α = " + basis.α + ", β = " + basis.β);
  }

  public void printRodriguesFormula()
  {
    System.out.println("\n" + "=".repeat(80));
    System.out.println("RODRIGUES FORMULA");
    System.out.println("=".repeat(80));
    System.out.println("P_n^{(α,β)}(x) = (-1)^n / (2^n·n!) · (1-x)^{-α}(1+x)^{-β} · d^n/dx^n[(1-x)^{α+n}(1+x)^{β+n}]");
  }

  public void printPowerSeriesCoefficients()
  {
    System.out.println("\n" + "=".repeat(80));
    System.out.println("POWER SERIES COEFFICIENTS");
    System.out.println("=".repeat(80));
    System.out.println("\nω_{j,k} = " + ω);
    System.out.println("\nExpansion: P_j^{(α,β)}(x) = Σ_{k=0}^j ω_{j,k} x^k");
  }

  public void printFractionalDerivativeMonomials()
  {
    System.out.println("\n" + "=".repeat(80));
    System.out.println("FRACTIONAL DERIVATIVES OF MONOMIALS");
    System.out.println("=".repeat(80));
    System.out.println("\nD^γ[t^k] = Γ(k+1)/Γ(k+1-γ) · t^{k-γ}");
    System.out.println("\nCoefficient: " + fractionalDerivativeMonomialCoeff);
    System.out.println("Fractional order: γ = " + fractionalOrder);
  }

  public void printOperationalMatrixElements()
  {
    System.out.println("\n" + "=".repeat(80));
    System.out.println("OPERATIONAL MATRIX PROJECTION COEFFICIENTS");
    System.out.println("=".repeat(80));
    System.out.println("\n‖P_i‖² = " + normSquared);
    System.out.println("\nχ_{i,p} = " + χ);
  }

  public void printOperationalMatrix()
  {
    System.out.println("\n" + "=".repeat(80));
    System.out.println("COMPLETE OPERATIONAL MATRIX");
    System.out.println("=".repeat(80));
    System.out.println("\nμ_{ij} = " + μ);
    System.out.println("\nSize: " + (maxDegree + 1) + " × " + (maxDegree + 1));
    System.out.println("Fractional order: γ = " + fractionalOrder);
  }

  public Real getOperationalMatrixElement(int i, int j, Real result)
  {
    return μ.evaluate(i, bits).evaluate(j, bits, result);
  }

  public RealMatrix buildOperationalMatrix()
  {
    if (operationalMatrix == null)
    {
      operationalMatrix = RealMatrix.newMatrix(maxDegree + 1, maxDegree + 1);
      for (int i = 0; i <= maxDegree; i++)
      {
        for (int j = 0; j <= maxDegree; j++)
        {
          getOperationalMatrixElement(i, j, operationalMatrix.get(i, j));
        }
      }
    }
    return operationalMatrix;
  }

  public Real applyFractionalDerivative(Real coefficients, Real result)
  {
    assert coefficients.dim() == maxDegree + 1 : "coefficients dimension mismatch";
    assert result.dim() == maxDegree + 1 : "result dimension mismatch";

    RealMatrix M = buildOperationalMatrix();

    try ( Real temp = new Real(bits))
    {
      for (int i = 0; i <= maxDegree; i++)
      {
        temp.zero();
        for (int j = 0; j <= maxDegree; j++)
        {
          temp.add(M.get(i, j).mul(coefficients.get(j), bits, temp), bits);
        }
        result.get(i).set(temp);
      }
    }

    return result;
  }

  public void printAllFormulas()
  {
    printRecurrenceRelation();
    printRodriguesFormula();
    printPowerSeriesCoefficients();
    printFractionalDerivativeMonomials();
    printOperationalMatrixElements();
    printOperationalMatrix();
  }

  @Override
  public void close()
  {
    fractionalOrder.close();
    if (operationalMatrix != null)
    {
      operationalMatrix.close();
    }
  }

  @Override
  public String toString()
  {
    return String.format("JacobiPolynomialFractionalCalculus[basis=%s, γ=%s, N=%d]",
                         basis,
                         fractionalOrder,
                         maxDegree);
  }
}
