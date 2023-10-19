package arb.functions.polynomials.orthogonal;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.RealPolynomial;
import arb.expressions.Variables;

/**
 * The Jacobi Polynomials are orthogonal with respect to the measure<br>
 * 
 * (1-x)^α+(1+x)^β<br>
 * 
 * over the interval [-1,1].<br>
 * 
 * aₙ P(n+1, α, β)(x) = bₙ P(n, α, β)(x) + cₙ P(n-1, α, β)(x)<br>
 * 
 * aₙ = 2(n + 1)(n + α + β + 1)(2n + α + β)<br>
 * 
 * bₙ = (2n + α + β)((α² - β²) + (2n + α + β)(2n + α + β + 2))<br>
 * 
 * cₙ = 2(n + α)(n + β)(2n + α + β + 2)<br>
 */
public class JacobiPolynomial extends
                              RealPolynomial
{

  private final int               n;
  private final JacobiPolynomials polys;
  private final Variables<Real>   vars;
  private final List<Double>      coefficients;

  public JacobiPolynomial(JacobiPolynomials polys, int n)
  {
    this.n            = n;
    this.polys        = polys;
    this.vars         = polys.vars;
    this.coefficients = calculateCoefficients();
  }

  private List<Double> calculateCoefficients()
  {
    List<Double> coeffs = new ArrayList<>();
    // Base cases
    if (n == 0)
    {
      coeffs.add(1.0); // P_0^(α, β)(x) = 1
      return coeffs;
    }
    else if (n == 1)
    {
      coeffs.add(polys.α.doubleValue() - polys.β.doubleValue()); // P_1^(α, β)(x) = α - β + (α + β + 2) * x
      coeffs.add(polys.α.doubleValue() + polys.β.doubleValue() + 2);
      return coeffs;
    }

    // Calculate coefficients for n > 1 using recurrence relation
    List<Double> prevPrevCoeffs = new ArrayList<>();
    prevPrevCoeffs.add(1.0); // Coefficients for P_0^(α, β)(x)

    List<Double> prevCoeffs = new ArrayList<>();
    prevCoeffs.add(polys.α.doubleValue() - polys.β.doubleValue()); // Coefficients for P_1^(α, β)(x)
    prevCoeffs.add(polys.α.doubleValue() + polys.β.doubleValue() + 2);

    for (int i = 2; i <= n; i++)
    {
      coeffs.clear();
      double a = (2.0 * i + polys.α.doubleValue() + polys.β.doubleValue() - 1)
                    / (i * (2 * i + polys.α.doubleValue() + polys.β.doubleValue()));
      double b = (polys.α.doubleValue() * polys.α.doubleValue() - polys.β.doubleValue() * polys.β.doubleValue())
                    / ((2 * i + polys.α.doubleValue() + polys.β.doubleValue())
                                  * (2 * i + polys.α.doubleValue() + polys.β.doubleValue() - 2));
      double c = (i - 1 + polys.α.doubleValue()) * (i - 1 + polys.β.doubleValue())
                    / (i * (2 * i + polys.α.doubleValue() + polys.β.doubleValue() - 2));

      coeffs.add(a * (b + prevCoeffs.get(0))); // m=0 term
      for (int m = 1; m < i; m++)
      {
        coeffs.add(a * (prevCoeffs.get(m - 1) + b * prevCoeffs.get(m) + c * prevPrevCoeffs.get(m - 1)));
      }
      coeffs.add(a * (b * prevCoeffs.get(i - 1) + c * prevPrevCoeffs.get(i - 1))); // m=i term

      // Update previous coefficients for next iteration
      List<Double> temp = prevPrevCoeffs;
      prevPrevCoeffs = prevCoeffs;
      prevCoeffs     = temp;
      prevCoeffs.clear();
      prevCoeffs.addAll(coeffs);
    }

    return coeffs;
  }

  public double getCoefficient(int m)
  {
    if (m < 0 || m >= coefficients.size())
      return 0;
    return coefficients.get(m);
  }
}
