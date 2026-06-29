package arb.series;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Correctness and efficiency tests for {@link RealEpsilonTable} / the generic
 * {@link EpsilonTable}.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RealEpsilonTableTest extends
                                  TestCase
{
  static final int bits = 256;

  /** z = 2: 1+2+4+… diverges, but its Padé resummation is 1/(1−2) = −1, exact at 3 terms. */
  public void testDivergentGeometricExactlyResummed()
  {
    assertGeometric("2", "-1");
  }

  /** z = 1/2: 1+½+¼+… → 1/(1−½) = 2, exact at 3 terms. */
  public void testConvergentGeometricExactlyResummed()
  {
    assertGeometric("0.5", "2");
  }

  private void assertGeometric(String z, String limit)
  {
    try ( RealEpsilonTable t = new RealEpsilonTable(8, bits);
          Real Z = new Real(z, bits); Real pow = new Real("1", bits);
          Real s = new Real(); Real est = new Real(); Real lim = new Real(limit, bits);
          Real diff = new Real(); Real tol = new Real())
    {
      tol.one().mul2e(-bits / 2, tol);
      s.zero();
      for (int k = 0; k < 3; k++)
      {
        s.add(pow, bits, s);
        pow.mul(Z, bits, pow);
        t.next(s, bits, est);
      }
      est.sub(lim, bits, diff); diff.abs();
      assertTrue("resummation of geometric(z=" + z + ")=" + est + " must equal 1/(1-z)=" + limit + ", |Δ|=" + diff,
                 diff.compareTo(tol) < 0);
      assertEquals("3 terms ⇒ 0+1+2 = 3 cell updates", 3L, t.cellUpdates());
    }
  }

  /** Efficiency: m terms cost exactly m(m−1)/2 cell updates (running O(order)/term, not a cubic rebuild). */
  public void testRunningCostIsTriangularNotCubic()
  {
    final int m = 12;
    try ( RealEpsilonTable t = new RealEpsilonTable(m, bits);
          Real one = new Real("1", bits); Real s = new Real(); Real est = new Real())
    {
      s.zero();
      for (int k = 0; k < m; k++)
      {
        s.add(one, bits, s);
        t.next(s, bits, est);
      }
      assertEquals("running Wynn ε totals m(m-1)/2 cell updates", (long) m * (m - 1) / 2, t.cellUpdates());
      assertEquals("count() equals terms fed", m, t.count());
    }
  }

  /** The driver resums the divergent geometric series fed by a supplier. */
  public void testDriverResumsDivergentGeometric()
  {
    try ( RealEpsilonTable t = new RealEpsilonTable(40, bits);
          Real out = new Real(); Real lim = new Real("-1", bits); Real diff = new Real(); Real tol = new Real())
    {
      tol.one().mul2e(-bits / 2, tol);
      t.limit((idx, b, res) -> geometricPartial(2.0, idx, b, res), 0, bits, out);
      out.sub(lim, bits, diff); diff.abs();
      assertTrue("driver resums geometric(2) to -1, got " + out, diff.compareTo(tol) < 0);
    }
  }

  /** S(n) = Σ_{k=0}^n zᵏ. */
  private static Real geometricPartial(double z, int n, int bits, Real res)
  {
    try ( Real Z = new Real(Double.toString(z), bits); Real pow = new Real("1", bits); Real acc = new Real())
    {
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

  /** S(n) = Σ_{k=0}^n (−1)ᵏ k!. */
  private static Real eulerPartial(int n, int bits, Real res)
  {
    try ( Real f = new Real("1", bits); Real acc = new Real())
    {
      acc.zero();
      for (int k = 0; k <= n; k++)
      {
        if (k % 2 == 0)
          acc.add(f, bits, acc);
        else
          acc.sub(f, bits, acc);
        f.mul(k + 1, bits, f);
      }
      res.set(acc);
    }
    return res;
  }
}
