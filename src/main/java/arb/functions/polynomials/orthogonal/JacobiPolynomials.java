package arb.functions.polynomials.orthogonal;

import java.util.*;
import java.util.stream.IntStream;

import arb.*;
import arb.domains.Domain;
import arb.expressions.Compiler;
import arb.expressions.Variables;
import arb.functions.complex.HolomorphicFunction;
import arb.functions.real.RealFunction;

public class JacobiPolynomials implements
                               OrthogonalBasis<Real, JacobiPolynomial>
{
  public static int      bits = 128;
  public Variables<Real> vars;
  public Real            α;
  public Real            β;

  public JacobiPolynomials(Real a, Real b)
  {
    this.α = a;
    this.β = b;
  }

  public List<Real> computeCoefficients(int n)
  {
    if (n < 2)
    {
      throw new IllegalArgumentException("n should be >= 2");
    }

    List<Real> coefficients = new ArrayList<>();
    coefficients.add(RealConstants.one); // P_0^(alpha, beta)(z) coefficient
    coefficients.add(RealConstants.zero); // P_1^(alpha, beta)(z) coefficient

    Variables<Real> vars = new Variables<>();
    vars.put("a", α);
    vars.put("b", β);
    Real realn = new Real();
    vars.put("n", realn);

    String       expressionStr = "(2 * n + a + b) / (2 * n) * z * P(n-1, a, b, z) - (n + a + b - 1) / n * P(n-2, a, b, z)";
    RealFunction expression    = Compiler.express(expressionStr, vars);

    try ( Real z = new Real())
    {
      IntStream.range(2, n + 1).forEach(i ->
      {
        realn.set(i);
        Real coefficient = expression.evaluate(realn, bits, z);
        coefficients.add(coefficient);
      });
    }

    return coefficients;
  }

  @Override
  public Iterator<JacobiPolynomial> iterator()
  {
    assert false : "TODO";
    return null;
  }

  @Override
  public RealFunction getOrthogonalMeasure()
  {
    assert false : "return (1-x)^a(1+x)^b";
    return null;
  }

  @Override
  public Domain<Real> getDomain()
  {
    assert false : "TODO";
    return null;
  }

}
