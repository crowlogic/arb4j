package arb;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.functions.complex.ComplexPolynomialNullaryFunction;
import junit.framework.TestCase;

public class ComplexPolyDiagTest extends TestCase
{
  private static final Logger log = LoggerFactory.getLogger(ComplexPolyDiagTest.class);

  public static void testDiag()
  {
    try (var f = ComplexPolynomialNullaryFunction.express("(1+ⅈ)*x²");
         var a = f.evaluate())
    {
      try (var c2 = a.get(2))
      {
        log.info("coeff[2] = [{}] getImag.isZero={} getReal=[{}] getImag=[{}]",
                 c2, c2.getImag().isZero(), c2.getReal(), c2.getImag());
      }
      log.info("toString = [{}]", a.toString());
    }

    try (var f2 = ComplexPolynomialNullaryFunction.express("ⅈ*x²");
         var a2 = f2.evaluate())
    {
      try (var c2 = a2.get(2))
      {
        log.info("pureImag coeff[2] = [{}] getImag.isZero={}", c2, c2.getImag().isZero());
      }
      log.info("pureImag toString = [{}]", a2.toString());
    }
  }
}
