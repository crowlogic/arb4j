package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Function;

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
  RationalFunction realPart;
  RationalFunction imaginaryPart;
  private String   name;

  public ComplexRationalFunction()
  {
    realPart      = new RationalFunction();
    imaginaryPart = new RationalFunction();
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
    try ( var denominator = new RationalFunction(); var temp1 = new RationalFunction();
          var temp2 = new RationalFunction();)
    {

      c.mul(c, prec, denominator);
      d.mul(d, prec, temp1);
      denominator.add(temp1, prec, denominator);

      a.mul(c, prec, temp1);
      b.mul(d, prec, temp2);
      temp1.add(temp2, prec, temp1);
      temp1.div(denominator, prec, result.realPart);

      b.mul(c, prec, temp1);
      a.mul(d, prec, temp2);
      temp1.sub(temp2, prec, temp1);
      temp1.div(denominator, prec, result.imaginaryPart);

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

    try ( var temp1 = new RationalFunction(); var temp2 = new RationalFunction();)
    {

      realPart.mul(x.realPart, prec, temp1);
      imaginaryPart.mul(x.imaginaryPart, prec, temp2);
      temp1.sub(temp2, prec, result.realPart);

      realPart.mul(x.imaginaryPart, prec, temp1);
      imaginaryPart.mul(x.realPart, prec, temp2);
      temp1.add(temp2, prec, result.imaginaryPart);

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

  @Override
  public ComplexFraction evaluate(ComplexFraction t, int order, int bits, ComplexFraction result)
  {
    assert result.realPart != null : "result.realPart is null";
    assert result.imaginaryPart != null : "result.imaginaryPart is null";

    realPart.evaluate(t.realPart, order, bits, result.realPart);
    imaginaryPart.evaluate(t.imaginaryPart, order, bits, result.imaginaryPart);

    return result;
  }

  @Override
  public void close()
  {
    if (realPart != null)
    {
      realPart.close();
      realPart = null;
    }
    if (imaginaryPart != null)
    {
      imaginaryPart.close();
      imaginaryPart = null;
    }
  }

  @Override
  public String toString()
  {
    return realPart.toString() + " + " + imaginaryPart.toString() + "i";
  }
}