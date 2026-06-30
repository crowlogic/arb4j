package arb.series;

import arb.*;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.ComplexSequence;

/**
 * {@link EpsilonTable} over {@link Complex}. The generic table carries the
 * whole algorithm; this supplies only the four complex-valued primitives and a
 * {@link ComplexSequence} convenience for {@link #limit}. Used to resum a
 * complex series directly, e.g.\ a characteristic function or cumulant series
 * at a complex argument.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class ComplexEpsilonTable extends
                                       EpsilonTable<Complex>
{
  public ComplexEpsilonTable(int capacity, int bits)
  {
    super(capacity,
          bits);
  }

  @Override
  protected Complex newVector(int capacity)
  {
    return Complex.newVector(capacity);
  }

  @Override
  protected Complex one()
  {
    return ComplexConstants.one;
  }

  @Override
  protected boolean isFinite(Complex x)
  {
    return x.isFinite();
  }

  @Override
  protected void setInfinite(Complex x)
  {
    x.posInf();
  }

  @Override
  protected void magnitude(Complex x, int bits, Real result)
  {
    x.abs(bits, result);
  }

  @Override
  protected void resizeVector(int newCapacity)
  {
    e.resize(newCapacity);
  }

  /** Resum the partial sums delivered by a compiled {@link ComplexSequence}. */
  public Complex limit(ComplexSequence partials, int startIndex, int bits, Complex result)
  {
    return limit((idx, b, res) -> partials.evaluate(idx, b, res), startIndex, bits, result);
  }
}
