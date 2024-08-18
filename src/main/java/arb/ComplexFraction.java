package arb;

import java.lang.foreign.Arena;
import java.util.Arrays;
import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Compiler;
import arb.expressions.Expression;
import arb.functions.Function;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFraction implements
                             Field<ComplexFraction>,
                             AutoCloseable
{

  public ComplexFraction set(Integer i)
  {
    realPart.set(i);
    imaginaryPart.zero();
    return this;
  }

  public ComplexFraction set(String string)
  {
    return express(string).evaluate(null, 0, this);
  }

  public static Function<Object, ComplexFraction> express(String string)
  {
    Expression<Object, ComplexFraction, Function<Object, ComplexFraction>> express  =
                                                                                   Compiler.express(string,
                                                                                                    null,
                                                                                                    Object.class,
                                                                                                    ComplexFraction.class,
                                                                                                    Function.class,
                                                                                                    null);

    Function<Object, ComplexFraction>                                      instance =
                                                                                    express.getInstance();
    return instance;
  }

  @Override
  public String toString()
  {
    return String.format("(%s)+(%s)i", realPart, imaginaryPart);
  }

  public Arena           arena;
  public Fraction        parts;
  public Fraction        realPart;
  public Fraction        imaginaryPart;
  public String          name;
  public GaussianInteger numerator;
  public GaussianInteger denominator;

  public ComplexFraction()
  {
    // TODO: this can be improved
    this(Arena.ofShared());
  }

  public ComplexFraction(Arena arena)
  {
    this.arena    = arena;
    parts         = Fraction.newVector(arena, 2);
    realPart      = parts.get(0);
    imaginaryPart = parts.get(1);
    numerator     = new GaussianInteger();
    denominator   = new GaussianInteger();
    updateNumeratorAndDenominator();
  }

  public ComplexFraction(String string)
  {
    this();
    set(string);
  }

  public void updateNumeratorAndDenominator()
  {
    numerator.setRealPart(realPart.getNumerator());
    numerator.setImaginaryPart(imaginaryPart.getNumerator());
    denominator.setRealPart(realPart.getDenominator());
    denominator.setImaginaryPart(imaginaryPart.getDenominator());
  }

  @Override
  public void close()
  {
    if (arena != null)
    {
      arena.close();
    }
    arena    = null;
    realPart = imaginaryPart = parts = null;
    numerator.close();
    denominator.close();
    numerator = denominator = null;
  }

  @Override
  public ComplexFraction additiveIdentity()
  {
    realPart.set(0);
    imaginaryPart.set(0);
    updateNumeratorAndDenominator();
    return this;
  }

  @Override
  public ComplexFraction multiplicativeIdentity()
  {
    realPart.set(1);
    imaginaryPart.set(0);
    updateNumeratorAndDenominator();
    return this;
  }

  @Override
  public ComplexFraction add(ComplexFraction element, int bits, ComplexFraction result)
  {
    realPart.add(element.realPart, bits, result.realPart);
    imaginaryPart.add(element.imaginaryPart, bits, result.imaginaryPart);
    result.updateNumeratorAndDenominator();
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
  public ComplexFraction div(int j, int bits, ComplexFraction result)
  {
    realPart.div(j, bits, result.realPart);
    imaginaryPart.div(j, bits, result.imaginaryPart);
    result.updateNumeratorAndDenominator();
    return result;
  }

  @Override
  public ComplexFraction div(ComplexFraction j, int bits, ComplexFraction result)
  {
    try ( Fraction denominator = new Fraction(); ComplexFraction temp = new ComplexFraction();)
    {

      j.realPart.mul(j.realPart, bits, denominator);
      j.imaginaryPart.mul(j.imaginaryPart, bits, temp.realPart);
      denominator.add(temp.realPart, bits, denominator);

      realPart.mul(j.realPart, bits, temp.realPart);
      imaginaryPart.mul(j.imaginaryPart, bits, temp.imaginaryPart);
      temp.realPart.add(temp.imaginaryPart, bits, temp.realPart);
      temp.realPart.div(denominator, bits, result.realPart);

      imaginaryPart.mul(j.realPart, bits, temp.realPart);
      realPart.mul(j.imaginaryPart, bits, temp.imaginaryPart);
      temp.realPart.sub(temp.imaginaryPart, bits, temp.realPart);
      temp.realPart.div(denominator, bits, result.imaginaryPart);

      result.updateNumeratorAndDenominator();
      return result;
    }
  }

  @Override
  public ComplexFraction get(int index)
  {
    if (index != 0)
    {
      throw new IndexOutOfBoundsException("ComplexFraction is a scalar, index must be 0");
    }
    return this;
  }

  @Override
  public String getName()
  {
    return name != null ? name : "ComplexFraction";
  }

  @Override
  public ComplexFraction mul(int x, int bits, ComplexFraction result)
  {
    realPart.mul(x, bits, result.realPart);
    imaginaryPart.mul(x, bits, result.imaginaryPart);
    result.updateNumeratorAndDenominator();
    return result;
  }

  public ComplexFraction add(Complex x, int bits, ComplexFraction result)
  {
    try ( var y = new ComplexFraction())
    {
      y.set(x);
      return add(y, bits, result);
    }
  }

  public ComplexFraction set(Complex x)
  {
    realPart.set(x.re());
    imaginaryPart.set(x.im());
    return this;
  }

  @Override
  public ComplexFraction mul(ComplexFraction x, int bits, ComplexFraction result)
  {
    try ( Fraction temp1 = new Fraction(); Fraction temp2 = new Fraction();)
    {

      realPart.mul(x.realPart, bits, temp1);
      imaginaryPart.mul(x.imaginaryPart, bits, temp2);
      temp1.sub(temp2, bits, result.realPart);

      realPart.mul(x.imaginaryPart, bits, temp1);
      imaginaryPart.mul(x.realPart, bits, temp2);
      temp1.add(temp2, bits, result.imaginaryPart);

      result.updateNumeratorAndDenominator();
      return result;
    }
  }

  @Override
  public ComplexFraction newFieldElement()
  {
    return new ComplexFraction();
  }

  @Override
  public ComplexFraction sub(ComplexFraction element, int bits, ComplexFraction result)
  {
    realPart.sub(element.realPart, bits, result.realPart);
    imaginaryPart.sub(element.imaginaryPart, bits, result.imaginaryPart);
    result.updateNumeratorAndDenominator();
    return result;
  }

  @Override
  public ComplexFraction zero()
  {
    return additiveIdentity();
  }

  @Override
  public ComplexFraction set(ComplexFraction value)
  {
    realPart.set(value.realPart);
    imaginaryPart.set(value.imaginaryPart);
    return this;
  }

  public ComplexFraction set(ComplexFraction... values)
  {
    assert false : "TODO: vectorize "
                   + this.getClass()
                   + " so it can hold  "
                   + Arrays.asList(values);
    // realPart.set(value.realPart);
    // imaginaryPart.set(value.imaginaryPart);
    return this;
  }

  public GaussianInteger getNumerator()
  {
    if (numerator == null)
    {
      numerator               = new GaussianInteger();
      numerator.realPart      = realPart.getNumerator();
      numerator.imaginaryPart = imaginaryPart.getNumerator();
    }

    return numerator;
  }

  public GaussianInteger getDenominator()
  {
    if (denominator == null)
    {
      denominator               = new GaussianInteger();
      denominator.realPart      = realPart.getDenominator();
      denominator.imaginaryPart = imaginaryPart.getDenominator();
    }

    return denominator;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof ComplexFraction))
    {
      return false;
    }
    ComplexFraction f = (ComplexFraction) obj;
    return realPart.equals(f.realPart) && imaginaryPart.equals(f.imaginaryPart);
  }

  @Override
  public Stream<ComplexFraction> stream()
  {
    assert false : "TODO";
    return null;
  }

  public ComplexFraction set(Real x)
  {
    realPart.set(x);
    imaginaryPart.zero();
    return this;
  }

}
