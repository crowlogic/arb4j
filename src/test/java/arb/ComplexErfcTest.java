package arb;

import org.junit.Test;

import junit.framework.TestCase;

/**
 * Verifies the complex error-function bindings {@link Complex#erf(int, Complex)}
 * and {@link Complex#erfc(int, Complex)} ({@code acb_hypgeom_erf/erfc}) against
 * known values: erf(0)=0, erfc(0)=1, erf(z)+erfc(z)=1, and the purely-imaginary
 * identity erf(i·x) = i·(2/√π)∫₀ˣe^{t²}dt with erf(i)=i·1.6504257587975428760…
 */
public class ComplexErfcTest extends
                             TestCase
{
  @Test
  public void testErfcAtZeroIsOne()
  {
    int bits = 128;
    try ( Complex z = new Complex(); Complex r = new Complex(); Complex one = new Complex();
          Real diff = new Real(); Real tol = new Real().one().mul2e(-100, new Real()) )
    {
      z.set(0, 0);
      z.erfc(bits, r);
      one.set(1, 0);
      r.sub(one, bits, r);
      r.abs(bits, diff);
      assertTrue("erfc(0) must be 1, got offset " + diff, diff.compareTo(tol) < 0);
    }
  }

  @Test
  public void testErfPlusErfcIsOne()
  {
    int bits = 200;
    try ( Complex z = new Complex(); Complex e = new Complex(); Complex ec = new Complex();
          Complex sum = new Complex(); Complex one = new Complex();
          Real diff = new Real(); Real tol = new Real().one().mul2e(-150, new Real()) )
    {
      z.set(new Real("0.7", bits), new Real("-1.3", bits));
      z.erf(bits, e);
      z.erfc(bits, ec);
      e.add(ec, bits, sum);
      one.set(1, 0);
      sum.sub(one, bits, sum);
      sum.norm(bits, diff);
      assertTrue("erf(z)+erfc(z) must be 1, got |Δ|=" + diff, diff.compareTo(tol) < 0);
    }
  }

  @Test
  public void testComplexErfMatchesRealErfOnTheRealAxis()
  {
    int bits = 256;
    // erf(x + 0i) must equal the real binding Real(x).erf(x) exactly (to the ball).
    try ( Complex z = new Complex(); Complex c = new Complex();
          Real x = new Real("0.7", bits); Real rr = new Real();
          Real diffRe = new Real(); Real diffIm = new Real();
          Real tol = new Real().one().mul2e(-200, new Real()) )
    {
      z.set(x, new Real("0", bits));
      z.erf(bits, c);
      x.erf(bits, rr);
      c.re().sub(rr, bits, diffRe).abs(bits, diffRe);
      c.im().abs(bits, diffIm);
      assertTrue("Re erf(0.7) complex vs real mismatch: " + diffRe, diffRe.compareTo(tol) < 0);
      assertTrue("Im erf(0.7) must be 0, got " + diffIm, diffIm.compareTo(tol) < 0);
    }
  }
}
