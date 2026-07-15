package arb;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import arb.functions.complex.ComplexPolynomialNullaryFunction;
import junit.framework.TestCase;

public class ComplexPolyDiagTest extends TestCase
{
  public static void testDiag()
  {
    try (var f = ComplexPolynomialNullaryFunction.express("(1+ⅈ)*x²");
         var a = f.evaluate())
    {
      try (var c2 = a.get(2))
      {
        System.out.println("coeff[2] = [" + c2 + "] getImag.isZero=" + c2.getImag().isZero()
            + " getReal=[" + c2.getReal() + "] getImag=[" + c2.getImag() + "]");
      }
      System.out.println("toString = [" + a.toString() + "]");
    }

    try (var f2 = ComplexPolynomialNullaryFunction.express("ⅈ*x²");
         var a2 = f2.evaluate())
    {
      try (var c2 = a2.get(2))
      {
        System.out.println("pureImag coeff[2] = [" + c2 + "] getImag.isZero=" + c2.getImag().isZero());
      }
      System.out.println("pureImag toString = [" + a2.toString() + "]");
    }
  }
}
