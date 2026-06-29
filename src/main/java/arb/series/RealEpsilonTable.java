package arb.series;

import arb.Real;
import arb.RealConstants;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.integer.RealSequence;

/**
 * {@link EpsilonTable} over {@link Real}. The generic table carries the whole
 * algorithm; this supplies only the four real-valued primitives and a
 * {@link RealSequence} convenience for {@link #limit}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RealEpsilonTable extends
                                    EpsilonTable<Real>
{
  public RealEpsilonTable(int capacity, int bits)
  {
    super(capacity, bits);
  }

  @Override
  protected Real newVector(int capacity)
  {
    return Real.newVector(capacity);
  }

  @Override
  protected Real one()
  {
    return RealConstants.one;
  }

  @Override
  protected boolean isFinite(Real x)
  {
    return x.isFinite();
  }

  @Override
  protected void setInfinite(Real x)
  {
    x.posInf();
  }

  @Override
  protected void magnitude(Real x, int bits, Real result)
  {
    x.abs(bits, result);
  }

  @Override
  protected void resizeVector(int newCapacity)
  {
    e.resize(newCapacity);
  }

  /** Resum the partial sums delivered by a compiled {@link RealSequence}. */
  public Real limit(RealSequence partials, int startIndex, int bits, Real result)
  {
    return limit((idx, b, res) -> partials.evaluate(idx, b, res), startIndex, bits, result);
  }
}
