package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RationalFunctionTest
                                  extends
                                  TestCase
{

  @SuppressWarnings("resource")
  public void testAdd()
  {
    try ( var three = new RationalFunction().set(3); var four = new RationalFunction().set(4);
          var seven = new RationalFunction().set(7);)
    {
      three.add(four, seven);
      assertEquals("7", seven.toString());
    }
  }

  public void testInitAndToString()
  {
    try ( var f = new RationalFunction())
    {
      var numerator   = f.getNumerator();

      var denominator = f.getDenominator();
      assertEquals("0", numerator.toString());
      assertEquals("1", denominator.toString());
    }

  }

  public void testRationalIdentity()
  {
    try ( RationalFunction x = new RationalFunction())
    {
      x.multiplicativeIdentity();
      System.out.println("x=" + x);
    }
  }

  public void testHypergeometricFunctionExpressionRational()
  {
    var              rationalFunctional      = RationalNullaryFunction.express("pFq([-2,3.5,1],[2,4],1/2-x/2)");
    RationalFunction expressed = rationalFunctional.evaluate(128, new RationalFunction());
    assertEquals("0.065625*x² + 0.30625*x + 0.628125", expressed.toString());
  }

  @SuppressWarnings("resource")
  public void testSub()
  {
    try ( var a = new RationalFunction().set(10); var b = new RationalFunction().set(3);
          var result = new RationalFunction();)
    {
      a.sub(b, 128, result);
      assertEquals("7", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testMul()
  {

    try ( var three = new RationalFunction().set(3); var four = new RationalFunction().set(4);
          var result = new RationalFunction().set(7);)
    {
      three.mul(four, result);
      assertEquals("12", result.toString());
    }
  }

  @SuppressWarnings("resource")
  public void testDiv()
  {

    try ( var three = new RationalFunction().set(3); var four = new RationalFunction().set(4);
          var result = new RationalFunction().set(7);)
    {
      three.div(four, result);
      assertEquals("3/4", result.toString());
    }
  }

}
