package arb;

import static java.lang.System.out;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * The set of rational functions over a field K is a field, the field of
 * fractions of the ring of the polynomial functions over K.
 * 
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RealRationalFunctionTest
                                      extends
                                      TestCase
{

  public void testReduce()
  {
    RealRationalFunction f = new RealRationalFunction();
    f.value.remainder = new RealPolynomial();
    f.value.remainder.set(1);
    f.value.remainder.shiftLeft(2);
    f.value.divisor = new RealPolynomial();
    f.value.divisor.set(1);
    f.value.divisor.shiftLeft(2);
    System.out.println("f=" + f);
    assertEquals(1.0, f.eval(2.3));

    f.reduce(128);
    System.out.println("f=" + f);
    assertEquals(1.0, f.eval(2.3));
  }

  public void testAdd()
  {
    RealRationalFunction x = new RealRationalFunction();
    x.value.set(1).shiftLeft(1);

    RealRationalFunction xSquared = new RealRationalFunction();
    xSquared.value.set(1).shiftLeft(2);

    out.println("x=" + x);
    out.println("x^2=" + xSquared);

    RealRationalFunction xOverXSquared = new RealRationalFunction();
    x.div(xSquared, 128, xOverXSquared);

    out.println("xOverXSquared=" + xOverXSquared);

    assert false : "TODO";
  }

  public void testSub()
  {
    RealRationalFunction f = new RealRationalFunction();
    assert false : "TODO";
  }

  public void testMul()
  {
    RealRationalFunction f = new RealRationalFunction();
    assert false : "TODO";
  }

  public void testDiv()
  {
    RealRationalFunction f = new RealRationalFunction();
    assert false : "TODO";
  }

}
