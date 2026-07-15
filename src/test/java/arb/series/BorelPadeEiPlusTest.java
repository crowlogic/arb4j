package arb.series;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import arb.Complex;
import arb.Real;

/**
 * Prototype test for the Borel-Padé-Ei+ pipeline (issue #1177).
 * Reference values: Python mpmath 1.4.0, dps=60, computed externally.
 *
 * <p>To recompute the reference constants:
 * <pre>
 * python3 -c "
 * from mpmath import mp, e1, exp
 * mp.dps = 60
 * print('E1_1    =', e1(1))
 * print('E1_2    =', e1(2))
 * print('e2      =', exp(2))
 * print('prod    =', exp(2) * e1(2))
 * print('E1_1p05_re =', e1(1+0.5j).real)
 * print('E1_1p05_im =', e1(1+0.5j).imag)
 * "
 * </pre>
 *
 * @see <a href="https://github.com/crowlogic/arb4j/issues/1177">Issue #1177</a>
 */
public class BorelPadeEiPlusTest
{
  static final int BITS = 128;

  // Reference values from Python mpmath e1() and exp() at 60 decimal digits
  static final String REF_E1_1    = "0.219383934395520273677163775460121649031047293406908207577979";
  static final String REF_E1_2    = "0.0489005107080611195672398352280495223144921849630231163273229";
  static final String REF_E2      = "7.38905609893065022723042746057500781318031557055184732408713";
  static final String REF_PROD    = "0.361328616888222584697161657678739938954590641547302396171377";
  static final String REF_E1_1P05_RE = "0.140547150857034628889579649885084572235244320463630015531791";
  static final String REF_E1_1P05_IM = "-0.150910439747827029664143510974561410868847383723693402936641";

  static Real ref(String s)
  {
    return new Real().set(s, BITS * 2);
  }

  static void assertBallContains(String msg, Real ball, String refStr)
  {
    try ( Real r = ref(refStr) )
    {
      assertTrue(msg + ": ball=" + ball + " ref=" + r, ball.contains(r));
    }
  }

  @Test
  public void testBorelTransform()
  {
    int N = 5;
    Real[] a = new Real[N + 1];
    for (int k = 0; k <= N; k++)
    {
      a[k] = new Real();
      Real sign = new Real().set(k % 2 == 0 ? 1 : -1);
      Real kfact = new Real().set(1);
      for (int j = 2; j <= k; j++)
        kfact.mul(j, BITS, kfact);
      sign.mul(kfact, BITS, a[k]);
    }

    Real[] b = BorelTransform.transform(a, N, BITS);
    for (int k = 0; k <= N; k++)
    {
      Real expected = new Real().set(k % 2 == 0 ? 1 : -1);
      assertTrue("b_" + k + ": ball=" + b[k] + " expected=" + expected,
                 b[k].contains(expected));
    }

    Real[] a2 = BorelTransform.inverse(b, N, BITS);
    for (int k = 0; k <= N; k++)
    {
      assertTrue("inverse a_" + k + ": ball=" + a2[k] + " original=" + a[k],
                 a2[k].contains(a[k]));
    }
  }

  @Test
  public void testBorelEval()
  {
    Real[] b = { new Real().set(1), new Real().set(-1),
                 new Real().set(1), new Real().set(-1) };
    Real p = new Real().set(0.5);
    Real result = BorelTransform.eval(b, p, BITS, new Real());
    assertBallContains("F(0.5)", result, "0.625");
  }

  @Test
  public void testExponentialIntegral()
  {
    try ( Real z = new Real().set(1);
          Real s = new Real().set(1) )
    {
      Real result = z.expint(s, BITS);
      assertBallContains("E_1(1)", result, REF_E1_1);
    }
  }

  @Test
  public void testEiPlusReconstruction()
  {
    try ( Real x   = new Real().set(2.0);
          Real one = new Real().set(1);
          Real e1x = new Real();
          Real e2x = new Real();
          Real prod = new Real() )
    {
      x.expint(one, BITS, e1x);
      assertBallContains("E_1(2)", e1x, REF_E1_2);

      x.exp(BITS, e2x);
      assertBallContains("e^2", e2x, REF_E2);

      e2x.mul(e1x, BITS, prod);
      assertBallContains("e^x * E_1(x)", prod, REF_PROD);
    }
  }

  @Test
  public void testComplexExpint()
  {
    try ( Complex z = new Complex().set(1.0, 0.5);
          Complex s = new Complex().set(1.0, 0.0);
          Complex result = new Complex() )
    {
      z.expint(s, BITS, result);
      assertTrue("Re(E_1(1+0.5i)) is finite", result.re().isFinite());
      assertTrue("Im(E_1(1+0.5i)) is finite", result.im().isFinite());
      assertBallContains("Re(E_1(1+0.5i))", result.re(), REF_E1_1P05_RE);
      assertBallContains("Im(E_1(1+0.5i))", result.im(), REF_E1_1P05_IM);
    }
  }
}
