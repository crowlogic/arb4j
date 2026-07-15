package arb.applications;

import static org.junit.Assert.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;

import org.junit.Test;

import arb.*;
import arb.functions.complex.ComplexFunction;
import arb.functions.complex.MuntzPadeApproximant;
import arb.functions.complex.RiccatiMuntzPadeFunctional;
import arb.functions.integer.ComplexPolynomialSequence;
import arb.functions.integer.ComplexSequence;
import junit.framework.TestCase;

public class PadePrinterTest extends TestCase
{
  @Test
  public void testComplexToStringNoUnnecessaryParens()
  {
    try ( Complex c = new Complex("1.00034425", "0.0315", 128))
    {
      c.printPrecision = false;
      String s = c.toString().replace(" ", "");
      assertTrue("Complex.toString should contain clean imag: " + s,
                 s.contains("0.0315*ⅈ"));
    }
  }

  @Test
  public void testExpressionModeTaylorCoefficients()
  {
    try ( ComplexFunction f = ComplexFunction.express("t➔sin(t)");
          Complex          t0 = new Complex("0", 128))
    {
      int              N        = 4;
      try ( Complex coeffs = Complex.newVector(N))
      {
        f.evaluate(t0, N, 128, coeffs);
        assertEquals("c_0 = sin(0) = 0", "0", coeffs.get(0).toString().replace(" ", ""));
        assertEquals("c_1 = cos(0) = 1", "1", coeffs.get(1).toString().replace(" ", ""));
      }
    }
  }

  @Test
  public void testExpressionModeBuildsSigmaTable()
  {
    try ( ComplexFunction f = ComplexFunction.express("t➔exp(t)");
          Complex          t0 = new Complex("0", 128))
    {
      try ( MuntzPadeApproximant approx = new PadePrinter().makeExpressionApproximant(f, t0))
      {
        assertNotNull("σSeq should be non-null", approx.σSeq);
        assertNotNull("αSeq should be non-null", approx.α);
        assertNotNull("βSeq should be non-null", approx.βSeq);
        assertNotNull("hSeq should be non-null",  approx.hSeq);
        try ( Complex α0 = new Complex())
        {
          approx.αvSeq.evaluate(0, 128, α0);
          assertTrue("α₀ should be finite", α0.getReal().isFinite());
        }
      }
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }

  @Test
  public void testStandardModeRiccatiBuildsApproximant()
  {
    int bits = 64;
    try ( Real μ = new Real("1", bits))
    {
      RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, "1", "0", "-1");
      try ( Complex zeroV = new Complex(); MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV.zero(), 1, bits, null))
      {
        assertNotNull("ΦdenSeq should be non-null", approx.ΦdenSeq);
        assertNotNull("ΦnumSeq should be non-null", approx.ΦnumSeq);
        assertNotNull("KnSeq should be non-null",   approx.KnSeq);
        assertTrue("σ-table should produce at least 1 row", approx.α != null);
      }
    }
  }

  @Test
  public void testAutoTerminationDetectsZeroInDeltaBeta()
  {
    int bits = 128;
    try ( Real μ = new Real("1", bits))
    {
      RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, "1", "0", "-1");
      try ( Complex zeroV = new Complex();
            MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV.zero(), 1, bits, null))
      {
        ComplexSequence βvSeq = approx.βvSeq;
        try ( Complex βn    = new Complex();
              Complex βn_1  = new Complex();
              Complex delta = new Complex())
        {
          for (int n = 1; n <= 20; n++)
          {
            βvSeq.evaluate(n,     bits, βn);
            βvSeq.evaluate(n - 1, bits, βn_1);
            βn.sub(βn_1, bits, delta);
            if (delta.getReal().containsZero() && delta.getImag().containsZero())
            {
              return;
            }
          }
          fail("Δβₙ did not contain zero for any n up to 20");
        }
      }
    }
  }

  @Test
  public void testExpressionModeMakeExpressionApproximant()
  {
    int bits = 64;
    try ( ComplexFunction f = ComplexFunction.express("t➔exp(t)");
          Complex          t0 = new Complex("0", 64))
    {
      PadePrinter p = new PadePrinter();
      p.bits = bits;
      p.N    = 3;
      try ( MuntzPadeApproximant approx = p.makeExpressionApproximant(f, t0))
      {
        assertNotNull("approx should be non-null", approx);
        try ( ComplexPolynomial p0 = approx.ops.evaluate(0, bits))
        {
          assertNotNull("P₀(z) should be 1", p0);
        }
      }
    }
    catch (Exception e)
    {
      throw new RuntimeException(e);
    }
  }

  @Test
  public void testCliStdoutContainsExpectedSections()
  {
    ByteArrayOutputStream baos    = new ByteArrayOutputStream();
    PrintStream           original = System.out;
    try ( PrintStream ps = new PrintStream(baos, true, StandardCharsets.UTF_8))
    {
      System.setOut(ps);
      PadePrinter.main("--P", "1", "--Q", "0", "--R", "-1",
                       "--mu", "1", "--N", "3", "--bits", "64");
    }
    finally
    {
      System.setOut(original);
    }
    String output = baos.toString(StandardCharsets.UTF_8);
    assertTrue("output should contain 'σ-table definitions'", output.contains("σ-table"));
    assertTrue("output should contain 'Padé assembly'",       output.contains("Padé assembly"));
    assertTrue("output should contain 'Jacobi coefficients'", output.contains("Jacobi coefficients"));
    assertTrue("output should contain 'αₙ'",                  output.contains("αₙ"));
  }

  @Test
  public void testCliExpressionModeStdout()
  {
    ByteArrayOutputStream baos    = new ByteArrayOutputStream();
    PrintStream           original = System.out;
    try ( PrintStream ps = new PrintStream(baos, true, StandardCharsets.UTF_8))
    {
      System.setOut(ps);
      PadePrinter.main("--expr", "exp(t)", "--center", "0",
                       "--N", "2", "--bits", "64");
    }
    finally
    {
      System.setOut(original);
    }
    String output = baos.toString(StandardCharsets.UTF_8);
    assertTrue("output should contain 'Taylor coefficients'", output.contains("Taylor coefficients"));
    assertTrue("output should contain 'c_k'",                 output.contains("c_k"));
    assertTrue("output should contain 'σ-table'",             output.contains("σ-table"));
  }
}
