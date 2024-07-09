package arb;

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
    f.remainder = new RealPolynomial();
    f.remainder.set(1);
    f.remainder.shiftLeft(2);
    f.divisor = new RealPolynomial();
    f.divisor.set(1);
    f.divisor.shiftLeft(2);
    System.out.println("f=" + f);
    assertEquals(1.0, f.eval(2.3) );

    f.reduce(128);
    System.out.println("f=" + f);    
    assertEquals(1.0, f.eval(2.3) );
  }
  
  public void testAdd()
  {
    RealRationalFunction f = new RealRationalFunction();
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
