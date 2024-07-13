package arb;

import java.util.Objects;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.expressions.Parser;
import arb.functions.Function;
import arb.functions.real.RealFunction;
import arb.functions.real.RealPolynomialNullaryFunction;
import arb.functions.real.RealRationalNullaryFunction;
import arb.functions.sequences.Sequence;

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

    try ( RealPolynomial quotient = new RealPolynomial())
    {

      value.remainder.div(value.divisor, prec, quotient);

      this.value.add(quotient, prec, this.value);

      value.remainder = quotient.remainder;
      if (value.remainder == null && value.divisor != null)
      {
        value.divisor.close();
        value.divisor = null;
      }

      return this;
    }
  }

  private int           bits;

  public String         name;

  public RealPolynomial value = new RealPolynomial();

  @SuppressWarnings("resource")
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
    Context        context         = new Context(this.value.setName("V1"),
                                                 addend.value.setName("V2"),
                                                 this.value.remainder.setName("R1"),
                                                 addend.value.remainder.setName("R2"),
                                                 this.value.divisor.setName("D1"),
                                                 addend.value.divisor.setName("D2"));

    RealPolynomial resultValue     = result.value != null ? result.value : (result.value = new RealPolynomial());
    RealPolynomial resultRemainder = resultValue != null
                  && resultValue.remainder != null ? resultValue.remainder : (resultValue.remainder = new RealPolynomial());
    RealPolynomial resultDivisor   = resultValue != null
                  && resultValue.divisor != null ? resultValue.divisor : (resultValue.divisor = new RealPolynomial());

    RealPolynomialNullaryFunction.express("V1+V2", context).evaluate(bits, resultValue);

    RealPolynomialNullaryFunction.express("R1*D2+R2*D1", context).evaluate(bits, resultRemainder);

    RealPolynomialNullaryFunction.express("D1*D2", context).evaluate(bits, resultDivisor);

    return result;
  }

  public RealRationalFunction identity()
  {
    return additiveIdentity();
  }
  
  @Override
  public RealRationalFunction additiveIdentity()
  {
    return set(0);
  }

  @Override
  public int bits()
  {
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
    assert false : "todo: implement compareTo";
    return 0;
  }

  @Override
  public int dim()
  {
    assert false : "TODO: take this method and the get(int) method out of the Field interface";
    return 0;
  }

  @Override
  public RealRationalFunction div(int j, int prec, RealRationalFunction result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @SuppressWarnings("resource")
  @Override
  public RealRationalFunction div(RealRationalFunction unit, int bits, RealRationalFunction result)
  {
    assert !unit.value.isZero() : "Division by zero";
    if (value.remainder == null)
    {
      value.remainder = new RealPolynomial();
    }
    if (value.divisor == null)
    {
      value.divisor = new RealPolynomial().set(1);
    }
    if (unit.value.remainder == null)
    {
      unit.value.remainder = new RealPolynomial();
    }
    if (unit.value.divisor == null)
    {
      unit.value.divisor = new RealPolynomial().set(1);
    }
    Context        context         = new Context(this.value.setName("V1"),
                                                 unit.value.setName("V2"),
                                                 this.value.remainder.setName("R1"),
                                                 unit.value.remainder.setName("R2"),
                                                 this.value.divisor.setName("D1"),
                                                 unit.value.divisor.setName("D2"));

    RealPolynomial resultValue     = result.value != null ? result.value : (result.value = new RealPolynomial());
    RealPolynomial resultRemainder = resultValue != null
                  && resultValue.remainder != null ? resultValue.remainder : (resultValue.remainder = new RealPolynomial());
    RealPolynomial resultDivisor   = resultValue != null
                  && resultValue.divisor != null ? resultValue.divisor : (resultValue.divisor = new RealPolynomial());

    RealPolynomialNullaryFunction.express("(V1*D2)/(V2*D1)", context).evaluate(bits, resultValue);

    RealPolynomialNullaryFunction.express("(R1*D2-R2*V1)/(V2*D1)", context).evaluate(bits, resultRemainder);

    RealPolynomialNullaryFunction.express("D1*D2", context).evaluate(bits, resultDivisor);

    // System.out.format("divisor=%s\n", divisor);
    result.bits = bits;
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
    assert false : "accessing RealRationalFunction as an array doesn't make sense";
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

  @SuppressWarnings("resource")
  @Override
  public RealRationalFunction mul(RealRationalFunction operand, int bits, RealRationalFunction result)
  {
    if (value.remainder != null)
    {
      assert value.divisor != null : "remainder without divisor";
    }
    // Resulting Value = V1(x)V2(x)
    // Resulting Remainder = V1(x)R2(x) + R1(x)V2(x)
    // Resulting Divisor = D1(x)D2(x)
    if (value.remainder == null)
    {
      value.remainder = new RealPolynomial();
    }
    if (value.divisor == null)
    {
      value.divisor = new RealPolynomial().set(1);
    }
    if (operand.value.remainder == null)
    {
      operand.value.remainder = new RealPolynomial();
    }
    if (operand.value.divisor == null)
    {
      operand.value.divisor = new RealPolynomial().set(1);
    }
    Context        context         = new Context(this.value.setName("V1"),
                                                 operand.value.setName("V2"),
                                                 this.value.remainder.setName("R1"),
                                                 operand.value.remainder.setName("R2"),
                                                 this.value.divisor.setName("D1"),
                                                 operand.value.divisor.setName("D2"));

    RealPolynomial resultValue     = result.value != null ? result.value : (result.value = new RealPolynomial());
    RealPolynomial resultRemainder = resultValue != null
                  && resultValue.remainder != null ? resultValue.remainder : (resultValue.remainder = new RealPolynomial());
    RealPolynomial resultDivisor   = resultValue != null
                  && resultValue.divisor != null ? resultValue.divisor : (resultValue.divisor = new RealPolynomial());

    RealPolynomialNullaryFunction.express("V1*V2", context).evaluate(bits, resultValue);

    RealPolynomialNullaryFunction.express("V1*R2+R1*V2", context).evaluate(bits, resultRemainder);

    RealPolynomialNullaryFunction.express("D1*D2", context).evaluate(bits, resultDivisor);

    result.bits = bits;
    return result;
  }

  @Override
  public RealRationalFunction multiplicativeIdentity()
  {
    return set(1);
  }

  @Override
  public RealRationalFunction newFieldElement()
  {
    return new RealRationalFunction();
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
    assert bits > 0 : String.format("bits=%d must be >0", bits);
    if (value.remainder == null)
    {
      value.remainder = new RealPolynomial();
    }
    if (value.divisor == null)
    {
      value.setDivisor(1);
    }
    if (subtrahend.value.remainder == null)
    {
      subtrahend.value.remainder = new RealPolynomial();
    }
    if (subtrahend.value.divisor == null)
    {
      subtrahend.value.setDivisor(1);
    }
    Context        context         = new Context(this.value.setName("V1"),
                                                 subtrahend.value.setName("V2"),
                                                 this.value.remainder.setName("R1"),
                                                 subtrahend.value.remainder.setName("R2"),
                                                 this.value.divisor.setName("D1"),
                                                 subtrahend.value.divisor.setName("D2"));

    RealPolynomial resultValue     = result.value != null ? result.value : (result.value = new RealPolynomial());
    RealPolynomial resultRemainder = resultValue != null
                  && resultValue.remainder != null ? resultValue.remainder : (resultValue.remainder = new RealPolynomial());
    RealPolynomial resultDivisor   = resultValue != null
                  && resultValue.divisor != null ? resultValue.divisor : (resultValue.divisor = new RealPolynomial());

    RealPolynomialNullaryFunction.express("V1-V2", context).evaluate(bits, resultValue);

    RealPolynomialNullaryFunction.express("R1*D2-R2*D1", context).evaluate(bits, resultRemainder);

    RealPolynomialNullaryFunction.express("D1*D2", context).evaluate(bits, resultDivisor);

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
    res.bits = bits;
    return res;
  }

  public static Expression<Object, RealRationalFunction, RealRationalNullaryFunction> parse(String expression)
  {
    return Function.parse(Parser.expressionToUniqueClassname(expression),
                          expression,
                          null,
                          Object.class,
                          RealRationalFunction.class,
                          RealRationalNullaryFunction.class,
                          null,
                          null);
  }

  public static Expression<Integer, RealRationalFunction, Sequence<RealRationalFunction>>
         parseSequence(String className, String expression)
  {
    return parseSequence(className, expression, null);
  }

  public static Expression<Integer, RealRationalFunction, Sequence<RealRationalFunction>>
         parseSequence(String className, String expression, Context context)
  {
    return Function.parse(className,
                          expression,
                          context,
                          Integer.class,
                          RealRationalFunction.class,
                          Sequence.class,
                          null,
                          null);
  }

  public RealRationalFunction set(Real v)
  {
    value.set(v);
    value.setRemainder(0);
    return this;
  }

  public RealRationalFunction set(Integer integer)
  {
    value.set(integer);
    value.setRemainder(0);
    return this;
  }
}
