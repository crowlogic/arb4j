package arb;

import arb.algebra.Ring;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ComplexIntegerPolynomial implements Ring<ComplexIntegerPolynomial>
{
  public IntegerPolynomial realPart;

  public IntegerPolynomial imaginaryPart;
  
  @Override
  public ComplexIntegerPolynomial mul(ComplexIntegerPolynomial operand, int prec, ComplexIntegerPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ComplexIntegerPolynomial add(ComplexIntegerPolynomial addend, int bits, ComplexIntegerPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ComplexIntegerPolynomial sub(ComplexIntegerPolynomial subtrahend, int bits, ComplexIntegerPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

  @Override
  public ComplexIntegerPolynomial div(ComplexIntegerPolynomial x, int prec, ComplexIntegerPolynomial result)
  {
    assert false : "TODO: Auto-generated method stub";
    return null;
  }

}
