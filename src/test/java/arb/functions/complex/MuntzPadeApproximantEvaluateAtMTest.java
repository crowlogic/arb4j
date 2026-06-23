package arb.functions.complex;

import arb.Complex;
import arb.Real;
import junit.framework.TestCase;

/**
 * Verifies {@link MuntzPadeApproximant#evaluateAtM} returns κ_M at the
 * caller-specified M, not the adaptively-converged M.
 *
 * <p>Oracle: the classical Riccati y'=1-y², y(0)=0 has solution y(t)=tanh(t),
 * for which the [M-1/M] diagonal Padé is a known closed-form rational.
 * At M=3 it is t(15 + t²)/(15 + 6t²); at t=1 that is 16/21 ≈ 0.761904761904....
 */
public class MuntzPadeApproximantEvaluateAtMTest extends
                                                 TestCase
{
  public void testTanhPade2_3AtMFixed3()
  {
    int bits = 128;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits),
                                                                          "1", "0", "-1");
          Complex                    v  = new Complex();
          Complex                    t  = new Complex();
          Complex                    r  = new Complex() )
    {
      t.set(1);
      // Bind v=0 (the Riccati at v=0 is just the scalar y'=1-y² case).
      eq.evaluate(v, 1, bits, null);
      eq.evaluateAtM(v, 3, t, bits, r);
      // Expected: y(t)=tanh(t) ⟹ [2/3] Padé at t=1 is t(15+t²)/(15+6·t²) = 16/21.
      double got = r.getReal().doubleValue();
      assertEquals("Padé[2/3](tanh) at t=1 should be 16/21", 16.0 / 21.0, got, 1e-25);
    }
  }

  public void testTanhPade4_5AtMFixed5()
  {
    int bits = 256;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits),
                                                                          "1", "0", "-1");
          Complex                    v  = new Complex();
          Complex                    t  = new Complex();
          Complex                    r  = new Complex() )
    {
      t.set(1);
      eq.evaluate(v, 1, bits, null);
      eq.evaluateAtM(v, 5, t, bits, r);
      // [4/5] Padé of tanh: t(945 + 105t² + t^4) / (945 + 420t² + 15t^4)
      // at t=1 = 1051/1380 = 0.7615942028985507...
      double got = r.getReal().doubleValue();
      assertEquals("Padé[4/5](tanh) at t=1 should be 1051/1380",
                   1051.0 / 1380.0, got, 1e-25);
    }
  }

  public void testEvaluateAtMDifferentMSameVAndT()
  {
    int bits = 128;
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(new Real().set("1", bits),
                                                                          "1", "0", "-1");
          Complex                    v  = new Complex();
          Complex                    t  = new Complex();
          Complex                    r3 = new Complex();
          Complex                    r5 = new Complex() )
    {
      t.set(1);
      eq.evaluate(v, 1, bits, null);
      eq.evaluateAtM(v, 3, t, bits, r3);
      eq.evaluateAtM(v, 5, t, bits, r5);
      // Both should be close to tanh(1) = 0.7615941559..., r5 closer than r3.
      double tanhRef = Math.tanh(1.0);
      double e3 = Math.abs(r3.getReal().doubleValue() - tanhRef);
      double e5 = Math.abs(r5.getReal().doubleValue() - tanhRef);
      assertTrue("r5 should be at least as close to tanh(1) as r3 (e3=" + e3 + " e5=" + e5 + ")",
                 e5 <= e3);
    }
  }
}
