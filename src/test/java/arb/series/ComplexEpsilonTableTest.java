package arb.series;

import arb.Complex;
import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Correctness tests for {@link ComplexEpsilonTable} — the generic
 * {@link EpsilonTable} specialized to {@link Complex}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class ComplexEpsilonTableTest extends
                                     TestCase
{
  static final int bits = 256;

  /** z = 2i: Σ zᵏ diverges, but its Padé resummation is 1/(1−2i) = 0.2 + 0.4i, exact at 3 terms. */
  public void testDivergentComplexGeometricExactlyResummed()
  {
    try ( ComplexEpsilonTable t = new ComplexEpsilonTable(8, bits);
          Complex Z = new Complex(); Complex pow = new Complex(); Complex s = new Complex(); Complex est = new Complex();
          Complex lim = new Complex(); Complex denom = new Complex(); Complex d = new Complex();
          Real mag = new Real(); Real tol = new Real())
    {
      Z.set(0.0, 2.0);
      pow.one();
      s.zero();
      denom.set(1.0, -2.0);
      ComplexConstants.one.div(denom, bits, lim); // lim = 1/(1-2i), exact (not double 0.2/0.4)
      tol.one().mul2e(-bits / 2, tol);
      for (int k = 0; k < 3; k++)
      {
        s.add(pow, bits, s);
        pow.mul(Z, bits, pow);
        t.next(s, bits, est);
      }
      d.set(est); d.sub(lim, bits, d); d.abs(bits, mag);
      assertTrue("complex resummation of geometric(2i)=" + est + " must equal 1/(1-2i)=0.2+0.4i, |Δ|=" + mag,
                 mag.compareTo(tol) < 0);
      assertEquals("3 terms ⇒ 3 cell updates", 3L, t.cellUpdates());
    }
  }

  /** The driver resums the divergent complex geometric series fed by a supplier. */
  public void testDriverResumsComplexGeometric()
  {
    try ( ComplexEpsilonTable t = new ComplexEpsilonTable(40, bits);
          Complex out = new Complex(); Complex lim = new Complex(); Complex denom = new Complex(); Complex d = new Complex();
          Real mag = new Real(); Real tol = new Real())
    {
      denom.set(1.0, -2.0);
      ComplexConstants.one.div(denom, bits, lim); // lim = 1/(1-2i), exact
      tol.one().mul2e(-bits / 2, tol);
      t.limit((idx, b, res) -> complexGeometricPartial(idx, b, res), 0, 30, bits, out);
      d.set(out); d.sub(lim, bits, d); d.abs(bits, mag);
      assertTrue("driver resums complex geometric(2i) to 0.2+0.4i, got " + out, mag.compareTo(tol) < 0);
    }
  }

  /** S(n) = Σ_{k=0}^n (2i)ᵏ. */
  private static Complex complexGeometricPartial(int n, int bits, Complex res)
  {
    try ( Complex Z = new Complex(); Complex pow = new Complex(); Complex acc = new Complex())
    {
      Z.set(0.0, 2.0);
      pow.one();
      acc.zero();
      for (int k = 0; k <= n; k++)
      {
        acc.add(pow, bits, acc);
        pow.mul(Z, bits, pow);
      }
      res.set(acc);
    }
    return res;
  }
}
