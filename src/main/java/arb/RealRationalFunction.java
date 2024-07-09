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
                                  Field<RealRationalFunction>,
                                  Named,
                                  Comparable<RealRationalFunction>,
                                  AutoCloseableAssignable<RealRationalFunction>
{
  private int           bits;

  public RealPolynomial divisor;

  public String         name;

  public RealPolynomial remainder;

  public RealPolynomial value;

  /**
   * <pre>
  Addition:
  Resulting Value = V1(x) + V2(x)
  Resulting Remainder = R1(x)D2(x) + R2(x)D1(x)
  Resulting Divisor = D1(x)D2(x)
   * </pre>
   */
  @Override
  public RealRationalFunction add(RealRationalFunction addend, int bits, RealRationalFunction result)
  {
    this.value.add(addend.value, bits, result.value);
    result.remainder = this.remainder.mul(addend.divisor, bits).add(addend.remainder.mul(this.divisor, bits), bits);
    result.divisor   = this.divisor.mul(addend.divisor, bits);
    return result;
  }

  @Override
  public RealRationalFunction additiveIdentity()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public int bits()
  {
    assert false : "TODO: Auto-generated method stub";
    return bits;
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

  @Override
  public int compareTo(RealRationalFunction o)
  {
    assert false : "todo";
    return 0;
  }

  @Override
  public int dim()
  {
    assert false : "TODO: Auto-generated method stub";
    return 0;
  }

  @Override
  public RealRationalFunction div(int j, int prec, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  /**
   * <pre>
   * Division:
          Resulting Value = V1(x)D2(x) / V2(x)D1(x)
          Resulting Remainder = (R1(x)D2(x) - R2(x)V1(x)) / V2(x)D1(x)
          Resulting Divisor = D1(x)D2(x)
   * </pre>
   */
  @Override
  public RealRationalFunction div(RealRationalFunction x, int prec, RealRationalFunction result)
  {
    try ( RealPolynomial tmp = new RealPolynomial();)
    {
      this.value.mul(x.divisor, prec, result.value).div(x.value.mul(this.divisor, prec, tmp), prec);
      result.remainder = this.remainder.mul(x.divisor, prec)
                                       .sub(x.remainder.mul(this.value, prec), prec)
                                       .div(x.value.mul(this.divisor, prec), prec);
      result.divisor   = this.divisor.mul(x.divisor, prec);
    }
    return result;
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
  public RealRationalFunction get(int index)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public String getName()
  {
    return name;
  }

  /**
   * <pre>
   * Multiplication:
     Resulting Value     = V1(x)V2(x)
     Resulting Remainder = V1(x)R2(x) + R1(x)V2(x)
     Resulting Divisor   = D1(x)D2(x)
   * </pre>
   */
  @Override
  public RealRationalFunction mul(int x, int prec, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public RealRationalFunction mul(RealRationalFunction operand, int prec, RealRationalFunction result)
  {
    this.value.mul(operand.value, prec, result.value);
    this.value.mul(operand.remainder, prec, result.remainder).add(this.remainder.mul(operand.value, prec), prec);
    result.divisor = this.divisor.mul(operand.divisor, prec);
    return result;
  }

  @Override
  public RealRationalFunction multiplicativeIdentity()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public RealRationalFunction newFieldElement()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public RealRationalFunction set(RealRationalFunction val)
  {
    this.value     = val.value;
    this.remainder = val.remainder;
    this.divisor   = val.divisor;
    return this;
  }

  @SuppressWarnings("unchecked")
  @Override
  public RealRationalFunction setName(String name)
  {
    this.name = name;
    return this;
  }

  /**
   * <pre>
   * Subtraction:
     Resulting Value     = V1(x) - V2(x)
     Resulting Remainder = R1(x)D2(x) - R2(x)D1(x)
     Resulting Divisor   = D1(x)D2(x)
   * </pre>
   */
  @Override
  public RealRationalFunction sub(RealRationalFunction subtrahend, int bits, RealRationalFunction result)
  {
    try ( RealPolynomial tmp = new RealPolynomial())
    {
      this.value.sub(subtrahend.value, bits, result.value);
      this.remainder.mul(subtrahend.divisor, bits, result.remainder)
                    .sub(subtrahend.remainder.mul(this.divisor, bits, result.divisor = tmp), bits);
      this.divisor.mul(subtrahend.divisor, bits, result.divisor);
      return result;
    }
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
  public RealRationalFunction zero()
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }
}
