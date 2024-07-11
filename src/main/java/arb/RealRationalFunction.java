package arb;

import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.functions.real.RealFunction;
import arb.functions.real.RealPolynomialNullaryFunction;

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
    value.remainder.div(value.divisor, prec, quotient);

    // Add the result of the division (quotient) to the value
    this.value.add(quotient, prec, this.value);

    // Update this.remainder to the remainder of the quotient
    value.remainder = quotient.remainder;
    if (value.remainder == null)
    {
      value.divisor.set(1);
    }
    return this;
  }

  private int           bits;

  public String         name;

  public RealPolynomial value = new RealPolynomial();

  @Override
  public RealRationalFunction add(RealRationalFunction addend, int bits, RealRationalFunction result)
  {
    if (value.remainder == null)
    {
      value.remainder = new RealPolynomial();
    }
    if (value.divisor == null)
    {
      value.divisor = new RealPolynomial().set(1);
    }
    if (addend.value.remainder == null)
    {
      addend.value.remainder = new RealPolynomial();
    }
    if (addend.value.divisor == null)
    {
      addend.value.divisor = new RealPolynomial().set(1);
    }
    System.setProperty("arb4j.compiler.trace", "true");
    Context context   = new Context(this.value.setName("V1"),
                                    addend.value.setName("V2"),
                                    this.value.remainder.setName("R1"),
                                    this.value.divisor.setName("D1"),
                                    addend.value.remainder.setName("R2"),
                                    addend.value.divisor.setName("D2"));

    var     sum       = RealPolynomialNullaryFunction.express("V1+V2", context).evaluate(bits, new RealPolynomial());
    var     remainder = RealPolynomialNullaryFunction.express("R1*D2+R2*D1", context)
                                                     .evaluate(bits, new RealPolynomial());
    var     divisor   = RealPolynomialNullaryFunction.express("D1*D2", context).evaluate(bits, new RealPolynomial());
    System.out.format("sum=%s\nremainder=%s\ndivisor=%s\n", sum, remainder, divisor);
    assert false : "TODO: finish implementing this with expression compiler: " + sum;

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
    assert false : "TODO: do this with the expression compiler";

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
    return Objects.equals(value, that.value) && Objects.equals(value.remainder, that.value.remainder)
                  && Objects.equals(value.divisor, that.value.divisor);
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
      this.value.mul(operand.value.remainder, prec, result.value.remainder)
                .add(this.value.remainder.mul(operand.value, prec, temp), prec, result.value.remainder);
    }
    // Resulting Divisor = D1(x)D2(x)
    this.value.divisor.mul(operand.value.divisor, prec, result.value.divisor);

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
    this.value = val.value;
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
      this.value.remainder.mul(subtrahend.value.divisor, bits, result.value.remainder)
                          .sub(subtrahend.value.remainder.mul(this.value.divisor, bits, temp),
                               bits,
                               result.value.remainder);
    }
    // Resulting Divisor = D1(x)D2(x)
    this.value.divisor.mul(subtrahend.value.divisor, bits, result.value.divisor);

    return result;
  }

  @Override
  public String toString()
  {
    return String.format("RealRationalFunction[name=%s, value=%s, remainder=%s, divisor=%s]",
                         name,
                         value,
                         value.remainder,
                         value.divisor);
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
      if (value.remainder != null)
      {
        value.remainder.evaluate(t, order, bits, a); // Evaluate the remainder at 't'
        value.divisor.evaluate(t, order, bits, b); // Evaluate the divisor at 't'

        // Since divisor will always be non-null when remainder is set,
        // and you're assured it won't be zero by design, directly divide.
        a.div(b, bits, a); // Divides 'a' by 'b', storing the result in 'a'
        res.add(a, bits); // Adds the division result to the main result
      }
    }
    return res;
  }

}
