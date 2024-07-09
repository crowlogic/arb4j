package arb;

import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRationalFunction implements
                                  Field<RealRationalFunction>,
                                  Named,
                                  Comparable<RealRationalFunction>,
                                  AutoCloseableAssignable<RealRationalFunction>,
                                  RealFunction
{

  public RealRationalFunction reduce(int prec)
  {
    RealPolynomial quotient = new RealPolynomial();

    // Perform the division; this operation updates quotient with the result
    // and quotient.remainder will hold the remainder of the division
    this.remainder.div(this.divisor, prec, quotient);

    // Add the result of the division (quotient) to the value
    this.value.add(quotient, prec, this.value);

    // Update this.remainder to the remainder of the quotient
    this.remainder = quotient.remainder;
    if (this.remainder == null)
    {
      this.divisor.set(1);
    }
    return this;
  }

  private int           bits;

  public RealPolynomial divisor;

  public String         name;

  public RealPolynomial remainder;

  public RealPolynomial value = new RealPolynomial();

  @Override
  public RealRationalFunction add(RealRationalFunction addend, int bits, RealRationalFunction result)
  {
    if (result == null)
      result = this;

    // Resulting Value = V1(x) + V2(x)
    this.value.add(addend.value, bits, result.value);
    try ( RealPolynomial temp = new RealPolynomial())
    {
      // Resulting Remainder = R1(x)D2(x) + R2(x)D1(x)
      this.remainder.mul(addend.divisor, bits, result.remainder)
                    .add(addend.remainder.mul(this.divisor, bits, temp), bits, result.remainder);
    }
    // Resulting Divisor = D1(x)D2(x)
    this.divisor.mul(addend.divisor, bits, result.divisor);

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

  @Override
  public RealRationalFunction div(RealRationalFunction x, int prec, RealRationalFunction result)
  {

    try ( RealPolynomial V1D2 = new RealPolynomial(); RealPolynomial V2D1 = new RealPolynomial();
          RealPolynomial R1D2 = new RealPolynomial(); RealPolynomial R2V1 = new RealPolynomial();
          RealPolynomial temp = new RealPolynomial())
    {
      // Resulting Value = V1(x)D2(x) / V2(x)D1(x)
      this.value.mul(x.divisor, prec, V1D2);
      x.value.mul(this.divisor, prec, V2D1);
      V1D2.div(V2D1, prec, result.value);
      // Resulting Remainder = (R1(x)D2(x) - R2(x)V1(x)) / V2(x)D1(x)
      this.remainder.mul(x.divisor, prec, R1D2);
      x.remainder.mul(this.value, prec, R2V1);
      R1D2.sub(R2V1, prec, temp).div(V2D1, prec, result.remainder);
      // Resulting Divisor = D1(x)D2(x)
      this.divisor.mul(x.divisor, prec, result.divisor);
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
    if (result == null)
      result = this;

    // Resulting Value = V1(x)V2(x)
    this.value.mul(operand.value, prec, result.value);
    try ( RealPolynomial temp = new RealPolynomial())
    {
      // Resulting Remainder = V1(x)R2(x) + R1(x)V2(x)
      this.value.mul(operand.remainder, prec, result.remainder)
                .add(this.remainder.mul(operand.value, prec, temp), prec, result.remainder);
    }
    // Resulting Divisor = D1(x)D2(x)
    this.divisor.mul(operand.divisor, prec, result.divisor);

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

  @Override
  public RealRationalFunction sub(RealRationalFunction subtrahend, int bits, RealRationalFunction result)
  {
    if (result == null)
      result = this;

    // Resulting Value = V1(x) - V2(x)
    this.value.sub(subtrahend.value, bits, result.value);
    try ( RealPolynomial temp = new RealPolynomial())
    {
      // Resulting Remainder = R1(x)D2(x) - R2(x)D1(x)
      this.remainder.mul(subtrahend.divisor, bits, result.remainder)
                    .sub(subtrahend.remainder.mul(this.divisor, bits, temp), bits, result.remainder);
    }
    // Resulting Divisor = D1(x)D2(x)
    this.divisor.mul(subtrahend.divisor, bits, result.divisor);

    return result;
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

  @Override
  public Real evaluate(Real t, int order, int bits, Real res)
  {
    try ( Real a = new Real(); Real b = new Real())
    {
      // Evaluate the polynomial part of the rational function.
      value.evaluate(t, order, bits, res);

      // If there is a remainder, evaluate it and the divisor, then add the result to
      // 'res'.
      if (remainder != null)
      {
        remainder.evaluate(t, order, bits, a); // Evaluate the remainder at 't'
        divisor.evaluate(t, order, bits, b); // Evaluate the divisor at 't'

        // Since divisor will always be non-null when remainder is set,
        // and you're assured it won't be zero by design, directly divide.
        a.div(b, bits, a); // Divides 'a' by 'b', storing the result in 'a'
        res.add(a, bits); // Adds the division result to the main result
      }
    }
    return res;
  }

}
