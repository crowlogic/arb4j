package arb;

import java.lang.foreign.Arena;
import java.util.stream.Stream;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexFraction implements
                             Field<ComplexFraction>,
                             AutoCloseable
{
  @Override
  public String toString()
  {
    return String.format("(%s)+(%s)i", realPart, imaginaryPart);
  }

  Arena           arena;
  Fraction        parts;
  Fraction        realPart;
  Fraction        imaginaryPart;
  String          name;
  GaussianInteger numerator;
  GaussianInteger denominator;

  public ComplexFraction()
  {
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

  public ComplexFraction set(String string)
  {
    String[] parts = string.split("\\s*[+-]\\s*i");
    realPart.set(parts[0].trim());

    // Handle potential missing imaginary part
    if (parts.length > 1)
    {
      imaginaryPart.set(parts[1].trim());
      if (string.contains(" - "))
      {
        imaginaryPart.neg();
      }
    }
    else
    {
      // Default imaginary part to 0 if not provided
      imaginaryPart.set(0);
    }

    updateNumeratorAndDenominator();
    return this;
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
    updateNumeratorAndDenominator();
    return this;
  }

  public GaussianInteger getNumerator()
  {
    return numerator;
  }

  public GaussianInteger getDenominator()
  {
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
}
