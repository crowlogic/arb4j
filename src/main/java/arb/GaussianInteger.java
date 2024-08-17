package arb;

import arb.algebra.Ring;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * A Gaussian integer is a {@link Complex} number whose real and imaginary parts
 * are both integers. The Gaussian integers, with ordinary addition and
 * multiplication of complex numbers, form an integral domain, usually written
 * as ℤ[i] or ℤ[i].
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class GaussianInteger implements Ring<GaussianInteger>, AutoCloseable
{
  @Override
  public String toString()
  {
    return String.format("%s+%si",
                         realPart,
                         imaginaryPart);
  }

  Integer parts         = Integer.newVector(2);

  Integer realPart      = parts.get(0);

  Integer imaginaryPart = parts.get(1);

  @Override
  public GaussianInteger mul(GaussianInteger operand, int prec, GaussianInteger result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public GaussianInteger add(GaussianInteger addend, int bits, GaussianInteger result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public GaussianInteger sub(GaussianInteger subtrahend, int bits, GaussianInteger result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public GaussianInteger div(GaussianInteger x, int prec, GaussianInteger result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  public GaussianInteger setRealPart(Integer val)
  {
    realPart.set(val);
    return this;
  }

  public GaussianInteger setImaginaryPart(Integer val)
  {
    imaginaryPart.set(val);
    return this;
  }

  @Override
  public void close()
  {
    parts.close();
    parts    = null;
    realPart = imaginaryPart = null;
  }

  @Override
  public boolean equals(Object obj)
  {
    if (!(obj instanceof GaussianInteger))
    {
      return false;
    }
    GaussianInteger f = (GaussianInteger) obj;
    return realPart.equals(f.realPart) && imaginaryPart.equals(f.imaginaryPart);
  }

  @Override
  public int
         dim()
  {
    return 1;
  }
}
