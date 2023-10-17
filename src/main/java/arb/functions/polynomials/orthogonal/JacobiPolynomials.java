package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

import arb.Real;
import arb.RealConstants;
import arb.expressions.Variables;

public class JacobiPolynomials
{

  public static int      bits = 128;
  public Variables<Real> vars;
  public Real            α;
  public Real            β;

  public JacobiPolynomials(Real a, Real b)
  {
    this.α = a;
    this.β = a;
  }

  public static List<Real> computeCoefficients(int n, Real alpha, Real beta)
  {
    if (n < 2)
    {
      throw new IllegalArgumentException("n should be >= 2");
    }

    List<Real> coefficients = new ArrayList<>();
    coefficients.add(RealConstants.one); // P_0^(alpha, beta)(z) coefficient
    coefficients.add(RealConstants.zero); // P_1^(alpha, beta)(z) coefficient

    IntStream.range(2, n + 1).forEach(i ->
    {
      assert false : " 'TODO: use Expression#Compiler";
    });

    return coefficients;
  }

  public static void main(String[] args)
  {
    Real       alpha        = new Real(1);
    Real       beta         = new Real(1);

    List<Real> coefficients = computeCoefficients(5, alpha, beta);
    coefficients.forEach(System.out::println);
  }
}
