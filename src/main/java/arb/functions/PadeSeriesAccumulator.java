package arb.functions;

import java.util.ArrayList;
import java.util.List;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Real;
import arb.functions.complex.MuntzPadeApproximant;
import arb.functions.integer.ComplexPolynomialSequence;

/**
 * Resums a coefficient sequence by building a diagonal Padé approximant from the
 * collected coefficients and evaluating the approximant at the unit point.
 *
 * <p>
 * This is a compiler-side implementation for the infinite upper-bound form of
 * {@code Σ f(k) {k=lo..∞}} where the summand values are interpreted as the
 * coefficients of a formal power series.
 */
public final class PadeSeriesAccumulator implements
                                         AutoCloseable
{
  private final Real                tolerance = new Real();
  private final Real                diff      = new Real();
  private final Real                bestDiff  = new Real();
  private final Real                current   = new Real();
  private final Real                previous  = new Real();
  private final Real                best      = new Real();
  private final Real                termValue = new Real();
  private final Complex             coeff     = new Complex();
  private final Complex             point     = new Complex();
  private final Complex             value     = new Complex();

  public PadeSeriesAccumulator()
  {
    point.one();
  }

  public Real accumulate(Function term,
                          arb.Integer index,
                          int bits,
                          Real sum)
  {
    sum.zero();
    tolerance.one().mul2e(-(bits / 2), tolerance);
    boolean haveBest = false;
    List<Complex> coefficients = new ArrayList<>();
    previous.posInf();
    best.posInf();
    bestDiff.posInf();

    try
    {
      for (;;)
      {
        term.evaluate(index, 1, bits, termValue);
        if (!termValue.isFinite())
        {
          return sum.set(termValue);
        }

        Complex c = new Complex().set(termValue);
        coefficients.add(c);
        if (coefficients.size() < 2)
        {
          index.increment();
          continue;
        }

        try ( RuntimeCoefficientSequence coeffs = new RuntimeCoefficientSequence(coefficients);
              Real alpha = new Real();
              Complex v = new Complex();
              MuntzPadeApproximant approximant = new MuntzPadeApproximant(alpha.one(), coeffs, v, bits))
        {
          approximant.evaluate(point, 1, bits, value);
          current.set(value.getReal());
          if (haveBest)
          {
            current.sub(previous, bits, diff).abs(bits, diff);
            if (diff.compareTo(tolerance) <= 0)
            {
              return sum.set(current);
            }
            if (diff.compareTo(bestDiff) < 0)
            {
              bestDiff.set(diff);
              best.set(current);
            }
            else
            {
              return sum.set(best);
            }
          }
          else
          {
            haveBest = true;
          }
          previous.set(current);
        }
        index.increment();
      }
    }
    finally
    {
      for (Complex coefficient : coefficients)
      {
        coefficient.close();
      }
    }
  }

  @Override
  public void close()
  {
    tolerance.close();
    diff.close();
    bestDiff.close();
    current.close();
    previous.close();
    best.close();
    termValue.close();
    coeff.close();
    point.close();
    value.close();
  }

  private static final class RuntimeCoefficientSequence implements
                                                       ComplexPolynomialSequence,
                                                       AutoCloseable
  {
    private final List<Complex> coefficients;

    private RuntimeCoefficientSequence(List<Complex> coefficients)
    {
      this.coefficients = coefficients;
    }

    @Override
    public ComplexPolynomial evaluate(arb.Integer n, int order, int bits, ComplexPolynomial res)
    {
      int index = n.getSignedValue();
      if (index < 0 || index >= coefficients.size())
      {
        res.zero();
        return res;
      }
      res.fitLength(1);
      res.setLength(1);
      res.get(0).set(coefficients.get(index));
      return res;
    }

    @Override
    public void close()
    {
    }
  }
}
