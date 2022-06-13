package arb.functions.complex;

import static arb.Constants.*;
import static java.lang.System.out;

import arb.*;
import arb.curves.Lemniscate;
import arb.exceptions.LackOfConvergenceException;
import arb.exceptions.NotDifferentiableException;
import arb.functions.Function;
import junit.framework.TestCase;

public class ComplexFunctionTest extends
                                 TestCase
{
  public static void testAbs()
  {
    try ( Complex a = new Complex();)
    {
      a.set(ONE, ONE);
      Function<Complex, Real> absoluteValueOfAConstantFunction = new ComplexConstant(a).abs();

      Real                    sqrt2                            = a.abs(128, new Real());
      Real                    b                                = absoluteValueOfAConstantFunction.evaluate(Constants.ZERO,
                                                                                                           1,
                                                                                                           128,
                                                                                                           new Real());
//      System.out.println("|1+i|="
//                    + b);
      assertEquals(sqrt2, b);

    }
  }

  /**
   * test integration 2
   * 
   * @throws NotDifferentiableException
   * @throws LackOfConvergenceException
   */
  @SuppressWarnings("resource")
  public static void testIntegration() throws NotDifferentiableException, LackOfConvergenceException
  {
    int             prec     = 256;

    Lemniscate      f        = new Lemniscate(new Real().set("2", 128));
    ComplexFunction df       = f.differential();
    ComplexFunction absdf    = (t, order, p, w) ->
                             {
                               assert t.getImag().getMid().isZero();
                               df.evaluate(t, order, prec, w).abs(prec, w.getReal());
                               w.getImag().zero();
                               return w;
                             };

    Complex         integral = new Complex();
    Magnitude       absErr   = new Magnitude();

    Complex         a        = new Complex();
    Complex         b        = new Complex();
    b.getReal().pi(prec).div(2, prec, b.getReal());
    out.println("a=" + a);
    out.println("b=" + b);
    IntegrationOptions opts             = new IntegrationOptions();
    // opts.verbose = true;
    Complex            abslprimeonehalf = absdf.evaluate(new Complex().set(HALF, new Real().zero()),
                                                         1,
                                                         128,
                                                         new Complex());
    System.out.format("|l'(1/2)|=%s\n", abslprimeonehalf);
    opts.useHeap = false;
    absdf.integrate(a, b, 128, absErr, opts, prec, integral);
    System.out.format("int(|l'(x)|,x=%s..%s) is %s\n", a.toFixedString(), b.toFixedString(), integral);
    assertTrue(integral.getImag().isZero());
    assertEquals(2.62205755429211981046483958989111941368275495,
                 integral.getReal().getMid().doubleValue(),
                 integral.getReal().getRad().doubleValue());
  }
}
