package arb;

import java.util.Objects;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRationalFunction implements
                                  Ring<RealRationalFunction>,
                                  Named,
                                  Comparable<RealRationalFunction>,
                                  AutoCloseableAssignable<RealRationalFunction>

{
  public String         name;

  public RealPolynomial value;

  public RealPolynomial remainder;

  public RealPolynomial divisor;

  @Override
  public RealRationalFunction mul(RealRationalFunction operand, int prec, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @SuppressWarnings("unchecked")
  @Override
  public RealRationalFunction setName(String name)
  {
    this.name = name;
    return this;
  }

  @Override
  public RealRationalFunction add(RealRationalFunction addend, int bits, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public RealRationalFunction sub(RealRationalFunction subtrahend, int bits, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public RealRationalFunction div(RealRationalFunction x, int prec, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof RealRationalFunction))
    {
      return false;
    }
    RealRationalFunction that = (RealRationalFunction) obj;
    return Objects.equals(value, that.value) && Objects.equals(remainder, that.remainder)
                  && Objects.equals(divisor, that.divisor);
  }

  @Override
  public int compareTo(RealRationalFunction o)
  {
    assert false : "TODO: Auto-generated method stub";
    return 0;
  }

  @Override
  public String toString()
  {
    return String.format("RealRationalFunction[name=%s, value=%s, remainder=%s, divisor=%s]",
                         name,
                         value,
                         remainder,
                         divisor);
  }

  @Override
  public RealRationalFunction set(RealRationalFunction val)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public void close()
  {
    if (value != null)
    {
      value.close();
    }
    if (remainder != null)
    {
      remainder.close();
    }
    if (divisor != null)
    {
      divisor.close();
    }
  }

}
