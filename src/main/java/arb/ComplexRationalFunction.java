package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Context;
import arb.expressions.Expression;
import arb.functions.Function;
import arb.functions.rational.ComplexRationalNullaryFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexRationalFunction implements
                                     AutoCloseable,
                                     NamedField<ComplexRationalFunction>,
                                     Function<ComplexFraction, ComplexFraction>,
                                     Verifiable
{
  public final RationalFunction realPart;
  public final RationalFunction imaginaryPart;
  public String                 name;

  public ComplexRationalFunction identity()
  {
    realPart.identity();
    imaginaryPart.zero();
    return this;
  }

  public ComplexRationalFunction()
  {
    realPart      = new RationalFunction();
    imaginaryPart = new RationalFunction();
  }

  public ComplexRationalFunction set(int i)
  {
    realPart.set(i);
    imaginaryPart.zero();
    return this;
  }

  @SuppressWarnings("unchecked")
  @Override
  public ComplexRationalFunction get(int i)
  {
    if (i != 0)
    {
      throw new IndexOutOfBoundsException("ComplexRationalFunction is a scalar, index must be 0");
    }
    return this;
  }

  @Override
  public ComplexRationalFunction set(Fraction val)
  {
    realPart.set(val);
    imaginaryPart.zero();
    return this;
  }

  @Override
  public ComplexRationalFunction
         div(ComplexRationalFunction x, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    RationalFunction a = realPart;
    RationalFunction b = imaginaryPart;
    RationalFunction c = x.realPart;
    RationalFunction d = x.imaginaryPart;
    // (a + bi) / (c + di) = (ac + bd)/(c^2 + d^2) + (bc - ad)/(c^2 + d^2)i
    try ( var denominator = new RationalFunction(); var realResult = new RationalFunction();
          var imaginaryResult = new RationalFunction();)
    {

      c.mul(c, prec, denominator);
      d.mul(d, prec, realResult);
      denominator.add(realResult, prec, denominator);

      a.mul(c, prec, realResult);
      b.mul(d, prec, imaginaryResult);
      realResult.add(imaginaryResult, prec, realResult);
      realResult.div(denominator, prec, result.realPart);

      b.mul(c, prec, realResult);
      a.mul(d, prec, imaginaryResult);
      realResult.sub(imaginaryResult, prec, realResult);
      realResult.div(denominator, prec, result.imaginaryPart);

      return result;
    }
  }

  @SuppressWarnings("unchecked")
  @Override
  public <N extends Named> N setName(String name)
  {
    this.name = name;
    return (N) this;
  }

  @Override
  public String getName()
  {
    return name;
  }

  @Override
  public ComplexRationalFunction additiveIdentity()
  {
    realPart.zero();
    imaginaryPart.zero();
    return this;
  }

  @Override
  public ComplexRationalFunction multiplicativeIdentity()
  {
    realPart.one();
    imaginaryPart.zero();
    return this;
  }

  @Override
  public ComplexRationalFunction
         add(ComplexRationalFunction element, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    realPart.add(element.realPart, prec, result.realPart);
    imaginaryPart.add(element.imaginaryPart, prec, result.imaginaryPart);
    return result;
  }

  @Override
  public int bits()
  {
    return Math.max(realPart.bits(), imaginaryPart.bits());
  }

  @Override
  public int dim()
  {
    return 1;
  }

  @Override
  public ComplexRationalFunction div(int j, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    realPart.div(j, prec, result.realPart);
    imaginaryPart.div(j, prec, result.imaginaryPart);
    return result;
  }

  @Override
  public ComplexRationalFunction mul(int x, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    realPart.mul(x, prec, result.realPart);
    imaginaryPart.mul(x, prec, result.imaginaryPart);
    return result;
  }

  @Override
  public ComplexRationalFunction
         mul(ComplexRationalFunction x, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    try ( var realResult = new RationalFunction(); var imaginaryResult = new RationalFunction();)
    {

      realPart.mul(x.realPart, prec, realResult);
      imaginaryPart.mul(x.imaginaryPart, prec, imaginaryResult);
      realResult.sub(imaginaryResult, prec, result.realPart);

      realPart.mul(x.imaginaryPart, prec, realResult);
      imaginaryPart.mul(x.realPart, prec, imaginaryResult);
      realResult.add(imaginaryResult, prec, result.imaginaryPart);

      return result;
    }
  }

  @Override
  public ComplexRationalFunction newFieldElement()
  {
    return new ComplexRationalFunction();
  }

  @Override
  public ComplexRationalFunction set(ComplexRationalFunction value)
  {
    assert value.realPart != null : "value.realPart is null";
    assert value.imaginaryPart != null : "value.imaginaryPart is null";

    realPart.set(value.realPart);
    imaginaryPart.set(value.imaginaryPart);
    return this;
  }

  @Override
  public ComplexRationalFunction
         sub(ComplexRationalFunction element, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    realPart.sub(element.realPart, prec, result.realPart);
    imaginaryPart.sub(element.imaginaryPart, prec, result.imaginaryPart);
    return result;
  }

  @Override
  public ComplexRationalFunction zero()
  {
    return additiveIdentity();
  }

  @Override
  public boolean verify()
  {
    return realPart.verify() && imaginaryPart.verify();
  }

  /**
   * <pre>
   * 1. We have f(x) = (x + 1) + i(x - 1) 2. We evaluate this at x = 2 + i
   * 
   * Let's call the real part function a(x) = x + 1 and the imaginary part
   * function b(x) = x - 1
   * 
   * So, realResult = a(2 + i) = (2 + i) + 1 = 3 + i imaginaryResult = b(2 + i) = (2 + i) - 1 = 1
   * + i
   * 
   * Now, the key insight is that we want: f(2 + i) = a(2 + i) + i * b(2 + i) = (3
   * + i) + i(1 + i) = 3 + i + i + i^2 = 3 + i + i - 1 (because i^2 = -1) = 2 + 2i
   * 
   * The subtraction realResult - imaginaryResult achieves this because:
   * 
   * (3 + i) - (1 + i) = (3 + i) + (-1 - i) = 3 + i - 1 - i = 2
   * 
   * (3 + i) - (1 + i) = (3 - 1) + (i - i) = 2 + 0i = 2
   * 
   * For the imaginary part: i * (1 + i) = i + i^2 = i - 1
   * 
   * So (3 + i) + i(1 + i) = (3 + i) + (i - 1) = 3 + i + i - 1 = 2 + 2i
   * 
   * Which is exactly what the subtraction achieves!
   * 
   * It is related to conjugation. If we look at it another
   * way:
   * 
   * (a + bi) + i(c + di) = (a + bi) - (-i)(c + di) 
   *                      = (a + bi) - (d - ci) 
   *                      = (a - d)  + (b + c)i
   * 
   * This is equivalent to adding the conjugate of i(c + di), which is indeed what
   * the subtraction does.
   * </pre>
   * 
   */
  @Override
  public ComplexFraction evaluate(ComplexFraction t, int order, int bits, ComplexFraction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";
    ComplexFraction realResult = result;
    try ( ComplexFraction imaginaryResult = new ComplexFraction();)
    {
      realPart.evaluate(t, order, bits, realResult);
      imaginaryPart.evaluate(t, order, bits, imaginaryResult);
      return realResult.sub(imaginaryResult, bits, result);
    }
  }

  @Override
  public void close()
  {
    if (realPart != null)
    {
      realPart.close();
    }
    if (imaginaryPart != null)
    {
      imaginaryPart.close();
    }
  }

  @Override
  public String toString()
  {
    return String.format("%s + %si", realPart, imaginaryPart);
  }

  public ComplexRationalFunction set(String string)
  {
    return ComplexRationalNullaryFunction.express(string).evaluate(bits(), this);
  }

  @SuppressWarnings("resource")
  public static ComplexRationalFunction express(String expression)
  {
    return new ComplexRationalFunction().set(expression);
  }

  public static ComplexRationalFunction express(String expression, Context context)
  {
    return ComplexRationalNullaryFunction.express(expression, context).evaluate(128);
  }

  public static Expression<ComplexFraction, ComplexFraction, ComplexRationalFunction>
         compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<ComplexFraction, ComplexFraction, ComplexRationalFunction>
         compile(String expression, Context context)
  {
    return Compiler.compile(expression,
                            context,
                            ComplexFraction.class,
                            ComplexFraction.class,
                            ComplexRationalFunction.class,
                            null);
  }

  public ComplexRationalFunction neg(ComplexRationalFunction result)
  {
    realPart.neg(result.realPart);
    imaginaryPart.neg(result.imaginaryPart);
    return result;
  }

  public ComplexRationalFunction add(Integer power, int bits, ComplexRationalFunction result)
  {
    realPart.add(power,bits,result.realPart);
    result.imaginaryPart.set(imaginaryPart);
    return result;
  }
  
  public ComplexRationalFunction div(Integer power, int bits, ComplexRationalFunction result)
  {
    realPart.div(power,bits,result.realPart);
    imaginaryPart.div(power,bits,result.imaginaryPart);
    return result;
  }

  public ComplexRationalFunction pow(Integer power, int bits, ComplexRationalFunction result)
  {
    assert false : "TODO";
    return result;
  }

  public ComplexRationalFunction set(Integer integer)
  {
    realPart.set(integer);
    imaginaryPart.zero();
    return this;
  }

  public ComplexRationalFunction neg()
  {
    return neg(this);
  }

  public ComplexRationalFunction add(Fraction operand, int prec, ComplexRationalFunction result)
  {
    assert false : "TODO";
    return null;
  }
}