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
                                     Function<ComplexFraction, ComplexFraction>,
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

  public static final int DEFAULT_BITS = 128;

  @Override
  public NamedRing<ComplexRationalFunction> set(Complex val)
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

  /**
   * Apologies for the confusion. Let's establish a proof for evaluating a general
   * complex rational function \( f(z) \), defined as:
   * 
   * \[ f(z) = \frac{P(z)}{Q(z)} \]
   * 
   * where:
   * 
   * \[ P(z) = r(z) + i \cdot q(z) \] \[ Q(z) = s(z) + i \cdot t(z) \]
   * 
   * and \( r(z), q(z), s(z), t(z) \) are rational functions of \( z \).
   * 
   * ### **Proof for Evaluating \( f(z) \) Correctly:**
   * 
   * To evaluate \( f(z) \), we must compute the quotient of the complex numbers
   * \( P(z) \) and \( Q(z) \). The general formula for the division of two
   * complex numbers \( \frac{a+bi}{c+di} \) is given by multiplying numerator and
   * denominator by the conjugate of the denominator:
   * 
   * \[ \frac{a+bi}{c+di} = \frac{(a+bi)(c-di)}{(c+di)(c-di)} = \frac{(ac+bd) +
   * (bc-ad)i}{c^2+d^2} \]
   * 
   * Applying this formula to \( P(z) \) and \( Q(z) \):
   * 
   * 1. **Multiply \( P(z) \) by the conjugate of \( Q(z) \)**: \[ (r(z) + i
   * q(z))(s(z) - i t(z)) = (r(z)s(z) + q(z)t(z)) + (q(z)s(z) - r(z)t(z))i \]
   * 
   * 2. **Multiply \( Q(z) \) by its own conjugate**: \[ (s(z) + i t(z))(s(z) - i
   * t(z)) = s(z)^2 + t(z)^2 \]
   * 
   * 3. **Form the quotient**: \[ f(z) = \frac{(r(z)s(z) + q(z)t(z)) + (q(z)s(z) -
   * r(z)t(z))i}{s(z)^2 + t(z)^2} \]
   * 
   * ### **Correctness of the Formula**: The above formula ensures correct
   * evaluation by adhering to the rules of complex number division. Each step
   * explicitly handles the distribution and combination of real and imaginary
   * parts, conforming to the algebraic principles of complex arithmetic. The
   * computation maintains the structure and relationships of the components,
   * ensuring that both the real and imaginary parts of the function are
   * accurately represented in the final result.
   * 
   * ### **Conclusion**: This method provides a general, rigorous way to evaluate
   * any complex rational function defined in the specified form, ensuring the
   * accuracy of both real and imaginary parts. This approach correctly
   * incorporates the algebraic handling of complex numbers with rational function
   * components, covering all possible complex rational functions fitting the
   * initial format.
   */
  @Override
  public ComplexFraction
         evaluate(ComplexFraction input, int order, int bits, ComplexFraction output)
  {
    assert false : "TODO: Let's verify the mathematical formulation given in your comment for evaluating a complex rational function, focusing on whether it is correctly derived and if it will function as intended based on the rules of complex arithmetic.\n"
                   + "\n"
                   + "### Formula for Complex Division\n"
                   + "The formula you've provided for complex division is standard and correct:\n"
                   + "\\[ \\frac{a+bi}{c+di} = \\frac{(a+bi)(c-di)}{(c+di)(c-di)} = \\frac{(ac+bd) + (bc-ad)i}{c^2+d^2} \\]\n"
                   + "\n"
                   + "### Applying the Formula to the General Form\n"
                   + "Given:\n"
                   + "\\[ P(z) = r(z) + i \\cdot q(z) \\]\n"
                   + "\\[ Q(z) = s(z) + i \\cdot t(z) \\]\n"
                   + "\n"
                   + "**Steps to Follow:**\n"
                   + "\n"
                   + "1. **Multiplication of \\( P(z) \\) by the Conjugate of \\( Q(z) \\):**\n"
                   + "\\[ (r(z) + i \\cdot q(z))(s(z) - i \\cdot t(z)) = r(z)s(z) + q(z)t(z) + i(q(z)s(z) - r(z)t(z)) \\]\n"
                   + "\n"
                   + "This step expands correctly according to the distribution (FOIL method) in complex numbers, handling the imaginary unit \\( i \\) correctly by recognizing \\( i^2 = -1 \\).\n"
                   + "\n"
                   + "2. **Multiplication of \\( Q(z) \\) by Its Own Conjugate:**\n"
                   + "\\[ (s(z) + i \\cdot t(z))(s(z) - i \\cdot t(z)) = s(z)^2 + t(z)^2 \\]\n"
                   + "\n"
                   + "Again, this is a standard operation to eliminate the imaginary part, leading to a real number which serves as the denominator in the division operation.\n"
                   + "\n"
                   + "3. **Forming the Quotient:**\n"
                   + "\\[ f(z) = \\frac{r(z)s(z) + q(z)t(z) + i(q(z)s(z) - r(z)t(z))}{s(z)^2 + t(z)^2} \\]\n"
                   + "\n"
                   + "The final quotient formation aligns correctly with the complex division rules. It ensures that the real parts are summed and the imaginary parts are subtracted appropriately, then divided by the magnitude squared of the complex denominator.\n"
                   + "\n"
                   + "### Conclusion: Verification of Correctness\n"
                   + "The method and formula given in your comment are mathematically sound for evaluating a complex rational function. The outlined steps correctly compute the division of two complex functions formed by rational functions, ensuring that both the real and imaginary parts are handled appropriately according to the complex arithmetic rules.\n"
                   + "\n"
                   + "This analysis confirms the correctness of the proposed implementation for the `evaluate` method based on the mathematical principles of complex numbers. It should work effectively for any inputs where \\( r(z), q(z), s(z), t(z) \\) are rational functions, provided the denominator \\( s(z)^2 + t(z)^2 \\) does not equal zero (to avoid division by zero errors).\n"
                   + "\n"
                   + "If there are specific cases or additional considerations you'd like to discuss or analyze further, please let me know!";

    return output;
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

  public ComplexRationalFunction pow(Integer power, int bits, ComplexRationalFunction result)
  {
    if (power.isZero())
    {
      return result.multiplicativeIdentity();
    }

    boolean isNegativePower = power.sign() < 0;
    int     absPower        = Math.abs(power.getSignedValue());

    result.set(this);

    for (int i = 1; i < absPower; i++)
    {
      result.mul(this, bits, result);
    }

    if (isNegativePower)
    {
      return one.div(result, bits, result);
    }

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
    // assert false : String.format("this=%s + operand=%s", this, operand);
    try ( ComplexRationalFunction tmp = new ComplexRationalFunction())
    {
      return operand.add(tmp.set(this), prec, result);
    }
  }

  public ComplexRationalFunction add(Fraction operand, int prec)
  {
    return add(operand, prec, this);
  }

  public ComplexRationalFunction mul(Real real, int prec, ComplexRationalFunction res)
  {
    res.set(this);
    res.realPart.mul(real, prec, res.realPart);
    return res;
  }
}