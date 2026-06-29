package arb.functions;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.MuntzPadeApproximant;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * Infinite series evaluation by diagonal Padé certification.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class DiagonalPadeSeries implements
                                      AutoCloseable
{
  private final Real    α             = new Real().setName("α");
  private final Complex v             = new Complex();
  private final Complex one           = new Complex();
  private final Complex complexResult = new Complex();
  private final Real    threshold     = new Real();
  private final Real    termMagnitude = new Real();
  private final Real    lastMagnitude = new Real();
  private final Real    ratioTest     = new Real();
  private final Integer index         = new Integer();

  private RealCoefficients              realCoefficients;
  private ComplexCoefficients           complexCoefficients;
  private ComplexPolynomialCoefficients polynomialCoefficients;

  private MuntzPadeApproximant realPade;
  private MuntzPadeApproximant complexPade;

  public DiagonalPadeSeries()
  {
    α.one();
    v.zero();
    one.one();
  }

  public Real evaluate(Function<Integer, Real> term, Integer lowerLimit, int bits, Real result)
  {
    threshold.one().mul2e(-bits, threshold);
    if (directReal(term, lowerLimit, bits, result))
    {
      return result;
    }
    if (realCoefficients == null)
    {
      realCoefficients = new RealCoefficients();
    }
    realCoefficients.bind(term, lowerLimit.getSignedValue());
    if (realPade == null)
    {
      realPade = new MuntzPadeApproximant(α, realCoefficients, v, bits);
    }
    realPade.evaluate(one, 1, bits, complexResult);
    return result.set(complexResult.getReal());
  }

  public Complex evaluate(Function<Integer, Complex> term, Integer lowerLimit, int bits, Complex result)
  {
    threshold.one().mul2e(-bits, threshold);
    if (directComplex(term, lowerLimit, bits, result))
    {
      return result;
    }
    if (complexCoefficients == null)
    {
      complexCoefficients = new ComplexCoefficients();
    }
    complexCoefficients.bind(term, lowerLimit.getSignedValue());
    if (complexPade == null)
    {
      complexPade = new MuntzPadeApproximant(α, complexCoefficients, v, bits);
    }
    return complexPade.evaluate(one, 1, bits, result);
  }

  public ComplexPolynomial evaluate(Function<Integer, ComplexPolynomial> term, Integer lowerLimit, int bits, ComplexPolynomial result)
  {
    threshold.one().mul2e(-bits, threshold);
    if (polynomialCoefficients == null)
    {
      polynomialCoefficients = new ComplexPolynomialCoefficients();
    }
    polynomialCoefficients.bind(term, lowerLimit.getSignedValue());
    result.zero();
    index.set(lowerLimit);
    int slowTerms = 0;
    for (;; index.increment())
    {
      ComplexPolynomial value = term.evaluate(index, 1, bits, polynomialCoefficients.polynomialTerm);
      result.add(value, bits, result);
      polynomialCoefficients.magnitude(value, bits, termMagnitude);
      polynomialCoefficients.detectDivergence(termMagnitude);
      if (termMagnitude.compareTo(threshold) <= 0)
      {
        return result;
      }
      if (!lastMagnitude.isZero())
      {
        lastMagnitude.mul(3, bits, ratioTest).div(4, bits, ratioTest);
        slowTerms = termMagnitude.compareTo(ratioTest) > 0 ? slowTerms + 1 : 0;
        if (slowTerms >= 3)
        {
          throw new ArithmeticException("Σ{k=lo..∞} ComplexPolynomial Padé certification is not implemented");
        }
      }
      lastMagnitude.set(termMagnitude);
    }
  }

  private boolean directReal(Function<Integer, Real> term, Integer lowerLimit, int bits, Real result)
  {
    result.zero();
    index.set(lowerLimit);
    lastMagnitude.zero();
    int slowTerms = 0;
    int growthTerms = 0;
    RealCoefficients coefficients = realCoefficients == null ? realCoefficients = new RealCoefficients() : realCoefficients;
    coefficients.resetDivergence();
    for (;; index.increment())
    {
      term.evaluate(index, 1, bits, coefficients.realTerm);
      result.add(coefficients.realTerm, bits, result);
      coefficients.realTerm.abs(bits, termMagnitude);
      if (termMagnitude.compareTo(threshold) <= 0)
      {
        return true;
      }
      if (!lastMagnitude.isZero())
      {
        lastMagnitude.mul(3, bits, ratioTest).div(4, bits, ratioTest);
        growthTerms = termMagnitude.compareTo(lastMagnitude) > 0 ? growthTerms + 1 : 0;
        if (growthTerms >= 3)
        {
          throw new ArithmeticException("Σ{k=lo..∞} coefficients do not decrease");
        }
        slowTerms = termMagnitude.compareTo(ratioTest) > 0 ? slowTerms + 1 : 0;
        if (slowTerms >= 3)
        {
          return false;
        }
      }
      lastMagnitude.set(termMagnitude);
    }
  }

  private boolean directComplex(Function<Integer, Complex> term, Integer lowerLimit, int bits, Complex result)
  {
    result.zero();
    index.set(lowerLimit);
    lastMagnitude.zero();
    int slowTerms = 0;
    int growthTerms = 0;
    ComplexCoefficients coefficients = complexCoefficients == null ? complexCoefficients = new ComplexCoefficients() : complexCoefficients;
    coefficients.resetDivergence();
    for (;; index.increment())
    {
      term.evaluate(index, 1, bits, coefficients.complexTerm);
      result.add(coefficients.complexTerm, bits, result);
      coefficients.complexTerm.abs(bits, termMagnitude);
      if (termMagnitude.compareTo(threshold) <= 0)
      {
        return true;
      }
      if (!lastMagnitude.isZero())
      {
        lastMagnitude.mul(3, bits, ratioTest).div(4, bits, ratioTest);
        growthTerms = termMagnitude.compareTo(lastMagnitude) > 0 ? growthTerms + 1 : 0;
        if (growthTerms >= 3)
        {
          throw new ArithmeticException("Σ{k=lo..∞} coefficients do not decrease");
        }
        slowTerms = termMagnitude.compareTo(ratioTest) > 0 ? slowTerms + 1 : 0;
        if (slowTerms >= 3)
        {
          return false;
        }
      }
      lastMagnitude.set(termMagnitude);
    }
  }

  @Override
  public void close()
  {
    α.close();
    v.close();
    one.close();
    complexResult.close();
    threshold.close();
    termMagnitude.close();
    lastMagnitude.close();
    ratioTest.close();
    index.close();
    if (realCoefficients != null)
    {
      realCoefficients.close();
    }
    if (complexCoefficients != null)
    {
      complexCoefficients.close();
    }
    if (polynomialCoefficients != null)
    {
      polynomialCoefficients.close();
    }
    if (realPade != null)
    {
      realPade.close();
    }
    if (complexPade != null)
    {
      complexPade.close();
    }
  }

  public static class Coefficients implements
                                    ComplexPolynomialSequence,
                                    AutoCloseable
  {
    protected int          lowerLimit;
    protected final Real   largestMagnitude = new Real();
    protected final Integer shiftedIndex     = new Integer();
    protected final Complex complexTerm      = new Complex();
    protected final Real    realTerm         = new Real();
    protected final Complex coefficient      = new Complex();
    protected int          consecutiveNondecreasing;
    protected boolean       haveMagnitude;

    public void bindLowerLimit(int lowerLimit)
    {
      this.lowerLimit = lowerLimit;
      resetDivergence();
    }

    protected void resetDivergence()
    {
      largestMagnitude.zero();
      consecutiveNondecreasing = 0;
      haveMagnitude            = false;
    }

    protected void detectDivergence(Real magnitude)
    {
      if (!haveMagnitude)
      {
        largestMagnitude.set(magnitude);
        haveMagnitude = true;
      }
      else if (magnitude.compareTo(largestMagnitude) >= 0)
      {
        largestMagnitude.set(magnitude);
        consecutiveNondecreasing++;
        if (consecutiveNondecreasing >= 3)
        {
          throw new ArithmeticException("Σ{k=lo..∞} coefficients do not decrease");
        }
      }
      else
      {
        consecutiveNondecreasing = 0;
      }
    }

    @Override
    public String getName()
    {
      return "a";
    }

    @Override
    public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result)
    {
      throw new UnsupportedOperationException();
    }

    @Override
    public void close()
    {
      largestMagnitude.close();
      shiftedIndex.close();
      complexTerm.close();
      realTerm.close();
      coefficient.close();
    }
  }

  public static final class RealCoefficients extends
                                             Coefficients
  {
    private Function<Integer, Real> term;

    void bind(Function<Integer, Real> term, int lowerLimit)
    {
      this.term = term;
      bindLowerLimit(lowerLimit);
    }

    @Override
    public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result)
    {
      shiftedIndex.set(n).sub(1).add(lowerLimit);
      term.evaluate(shiftedIndex, 1, bits, realTerm);
      realTerm.abs(bits, largestMagnitude);
      coefficient.set(realTerm);
      return result.set(coefficient);
    }
  }

  public static final class ComplexCoefficients extends
                                                Coefficients
  {
    private Function<Integer, Complex> term;

    void bind(Function<Integer, Complex> term, int lowerLimit)
    {
      this.term = term;
      bindLowerLimit(lowerLimit);
    }

    @Override
    public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result)
    {
      shiftedIndex.set(n).sub(1).add(lowerLimit);
      term.evaluate(shiftedIndex, 1, bits, complexTerm);
      complexTerm.abs(bits, largestMagnitude);
      return result.set(complexTerm);
    }
  }

  public static final class ComplexPolynomialCoefficients extends
                                                         Coefficients
  {
    private Function<Integer, ComplexPolynomial> term;
    private final ComplexPolynomial              polynomialTerm = new ComplexPolynomial();
    private final Real                           coefficientMagnitude = new Real();

    void bind(Function<Integer, ComplexPolynomial> term, int lowerLimit)
    {
      this.term = term;
      bindLowerLimit(lowerLimit);
    }

    @Override
    public ComplexPolynomial evaluate(Integer n, int order, int bits, ComplexPolynomial result)
    {
      shiftedIndex.set(n).sub(1).add(lowerLimit);
      return term.evaluate(shiftedIndex, 1, bits, result);
    }

    void magnitude(ComplexPolynomial polynomial, int bits, Real result)
    {
      result.zero();
      for (int i = 0; i < polynomial.getLength(); i++)
      {
        polynomial.get(i).abs(bits, coefficientMagnitude);
        if (coefficientMagnitude.compareTo(result) > 0)
        {
          result.set(coefficientMagnitude);
        }
      }
    }

    @Override
    public void close()
    {
      super.close();
      polynomialTerm.close();
      coefficientMagnitude.close();
    }
  }
}
