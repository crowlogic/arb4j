package arb;

import java.util.Objects;

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
                                     Function<Fraction, ComplexFraction>,
                                     Verifiable
{

  @Override
  public boolean equals(Object obj)
  {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ComplexRationalFunction other = (ComplexRationalFunction) obj;
    return Objects.equals(imaginaryPart, other.imaginaryPart)
                  && Objects.equals(realPart, other.realPart);
  }

  @SuppressWarnings("resource")
  @Override
  public ComplexRationalFunction set(Real value)
  {
    zero().realPart.set(value);
    return this;
  }

  public static final int DEFAULT_BITS = 128;

  @Override
  public ComplexRationalFunction set(Complex val)
  {
    realPart.set(val.getReal());
    imaginaryPart.set(val.getImag());
    return this;
  }

  @SuppressWarnings("resource")
  public static ComplexRationalFunction one = new ComplexRationalFunction().set(1);

  final RationalFunction                realPart;
  final RationalFunction                imaginaryPart;
  public String                         name;

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

  public ComplexRationalFunction(String string)
  {
    this();
    set(string);
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

  public ComplexRationalFunction div(Complex x, int prec, ComplexRationalFunction result)
  {
    return div(result.set(x), prec, result);
  }

  /**
   * <pre>
   * Let 
   * 
   * f(x) = P(x)/Q(x) + i R(x)/S(x) 
   * g(x) = U(x)/V(x) + i W(x)/Y(x)
   * 
   * Then 
   * 
   * f(x)/g(x) = h(x) = a(x)/b(x) + i C(x)/D(x)
   * 
   * where 
   * 
   * a(x) = A(x)V(x)² + B(x)Y(x)² 
   * b(x) = d(x) 
   * C(x) = B(x)V(x)² - A(x)Y(x)²
   * d(x) = (Q(x)V(x)² + S(x)Y(x)²) * (U(x)² + W(x)²)
   * 
   * and
   * 
   * A(x) = P(x)U(x) + R(x)W(x) 
   * B(x) = R(x)U(x) - P(x)W(x)
   * </pre>
   */

  public ComplexRationalFunction
         div(ComplexRationalFunction x, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";
    assert !x.isZero();

    RationalFunction a = this.realPart;
    RationalFunction b = this.imaginaryPart;
    RationalFunction c = x.realPart;
    RationalFunction d = x.imaginaryPart;

    try ( RationalFunction temp1 = new RationalFunction();
          RationalFunction temp2 = new RationalFunction();)
    {
      // Calculate denominator: c^2 + d^2
      c.mul(c, prec, temp1);
      d.mul(d, prec, temp2);
      temp1.add(temp2, prec, temp1); // temp1 now holds denominator

      // Calculate real part: (ac + bd) / (c^2 + d^2)
      a.mul(c, prec, result.realPart);
      b.mul(d, prec, temp2);
      result.realPart.add(temp2, prec, result.realPart);
      result.realPart.div(temp1, prec, result.realPart);

      // Calculate imaginary part: (bc - ad) / (c^2 + d^2)
      b.mul(c, prec, result.imaginaryPart);
      a.mul(d, prec, temp2);
      result.imaginaryPart.sub(temp2, prec, result.imaginaryPart);
      result.imaginaryPart.div(temp1, prec, result.imaginaryPart);
      return result;
    }
  }

  public boolean isZero()
  {
    return realPart.isZero() && imaginaryPart.isZero();
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

  public ComplexRationalFunction mul(Integer x, int prec, ComplexRationalFunction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";
    realPart.mul(x, prec, result.realPart);
    imaginaryPart.mul(x, prec, result.imaginaryPart);
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

  public ComplexRationalFunction add(ComplexRationalFunction x, int prec)
  {
    return add(x, prec, this);
  }

  public ComplexRationalFunction mul(ComplexRationalFunction x, int prec)
  {
    return mul(x, prec, this);
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

  public static ComplexFraction imaginaryUnit = new ComplexFraction();

  static
  {
    imaginaryUnit.realPart.set(0, 1);
    imaginaryUnit.imaginaryPart.set(1, 1);
  }

  @Override
  public ComplexFraction evaluate(Fraction input, int order, int bits, ComplexFraction result)
  {
    realPart.evaluate(input, bits, result.realPart);
    imaginaryPart.evaluate(input, bits, result.imaginaryPart);
    return result;
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

  public static String group(String p, boolean t)
  {
    boolean q = p.contains(" ") || (t && (p.contains("+") || p.contains("-")));
    return q ? "(" + p + ")" : p;
  }

  @Override
  public String toString()
  {
    String rstr = realPart.toString();
    String istr = imaginaryPart.toString();
    return String.format("%s + %si", group(rstr, false), group(istr, true));
  }

  public ComplexRationalFunction set(String string)
  {
    return ComplexRationalNullaryFunction.express(string).evaluate(bits(), this);
  }

  public static ComplexRationalFunction express(String expression, int bits)
  {
    return ComplexRationalNullaryFunction.express(expression)
                                         .evaluate(bits, new ComplexRationalFunction());
  }

  public static ComplexRationalFunction express(String expression)
  {
    return express(expression, DEFAULT_BITS);
  }

  public static ComplexRationalFunction express(String expression, Context context)
  {
    return ComplexRationalNullaryFunction.express(expression, context).evaluate(128);
  }

  public static Expression<Fraction, ComplexFraction, ComplexRationalFunction>
         compile(String expression)
  {
    return compile(expression, null);
  }

  public static Expression<Fraction, ComplexFraction, ComplexRationalFunction>
         compile(String expression, Context context)
  {
    return Compiler.compile(expression,
                            context,
                            Fraction.class,
                            ComplexFraction.class,
                            ComplexRationalFunction.class,
                            null);
  }

  public ComplexRationalFunction neg(int unusedBits, ComplexRationalFunction result)
  {
    return neg(result);
  }

  public ComplexRationalFunction neg(ComplexRationalFunction result)
  {
    realPart.neg(result.realPart);
    imaginaryPart.neg(result.imaginaryPart);
    return result;
  }

  public ComplexRationalFunction add(Integer power, int bits, ComplexRationalFunction result)
  {
    realPart.add(power, bits, result.realPart);
    result.imaginaryPart.set(imaginaryPart);
    return result;
  }

  public ComplexRationalFunction div(Integer power, int bits, ComplexRationalFunction result)
  {
    realPart.div(power, bits, result.realPart);
    imaginaryPart.div(power, bits, result.imaginaryPart);
    return result;
  }

  public ComplexRationalFunction multiplicativeInverse(ComplexRationalFunction result)
  {
    try ( RationalFunction divisor = new RationalFunction())
    {
      realPart.pow(2, bits(), divisor)
              .add(imaginaryPart.pow(2, bits(), result.imaginaryPart), bits(), divisor);
      result.set(this);
      result.imaginaryPart.neg();
      result.realPart.div(divisor);
      result.imaginaryPart.div(divisor);
      return result;
    }
  }

  /**
   * FIXME: surely this can be done more efficiently
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  /**
   * FIXME: surely this can be done more efficiently
   * 
   * @param power
   * @param bits
   * @param result
   * @return
   */
  public ComplexRationalFunction pow(Integer power, int bits, ComplexRationalFunction result)
  {
    if (power.isZero())
    {
      return result.multiplicativeIdentity();
    }

    boolean isNegativePower = power.sign() < 0;
//    assert !isNegativePower : "TODO: fix negative powers so that "
//                              + this
//                              + " can be raised to the power of "
//                              + power;
    long    absPower        = power.getUnsignedValue();

    result.set(this);

    for (int i = 1; i < absPower; i++)
    {
      result.mul(this, bits, result);
    }

    if (isNegativePower)
    {
      // .one.div(result, bits, result);
      return result.multiplicativeInverse(result);
    }

    return result;
  }

  /**
   * Let a=this{@link #realPart} and b=this{@link #imaginaryPart} then
   * 
   * @param bits
   * @param result
   * @return result [re,im]=[a^2-b^2,2*a*b]
   * 
   */
  public ComplexRationalFunction square(int bits, ComplexRationalFunction result)
  {
    realPart.pow(2, bits, result.realPart);
    imaginaryPart.pow(2, bits, result.imaginaryPart);
    // result.real=this.real^2-this.imag^2
    result.realPart.sub(result.imaginaryPart, bits);
    // result.imag=2*this.real*this.imag
    realPart.mul(imaginaryPart, bits, result.imaginaryPart).mul(2, bits);
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
    return operand.add(result.set(this), prec, result);
  }

  public ComplexRationalFunction add(Fraction operand, int prec)
  {
    return add(operand, prec, this);
  }

  public ComplexRationalFunction mul(Complex real, int prec, ComplexRationalFunction res)
  {
    return real.mul(res.set(this), prec, res);
  }

  public ComplexRationalFunction mul(Real real, int prec, ComplexRationalFunction res)
  {
    res.set(this);
    res.realPart.mul(real, prec);
    return res;
  }

  public ComplexFraction evaluate(Fraction x, ComplexFraction result)
  {
    return evaluate(x, 0, result);
  }
}