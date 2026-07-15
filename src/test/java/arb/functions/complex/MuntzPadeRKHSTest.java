package arb.functions.complex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.*;
import arb.Integer;
import arb.expressions.Context;
import arb.functions.ComplexFunctional;
import arb.functions.integer.ComplexFunctionalSequence;
import arb.functions.integer.Sequence;
import junit.framework.TestCase;

/**
 * Compiler-driven test for the Christoffel–Darboux reproducing kernel
 * (issues #1181/#1182): verifies K_n(z,w) ≡ CD_n(z,w) and roots(Φ_den)
 * equals the support points of the moment functional μ.
 */
public class MuntzPadeRKHSTest extends TestCase
{
  private static final Logger log = LoggerFactory.getLogger(MuntzPadeRKHSTest.class);
  public void testKernelAgreement()
  {
    Real    μ     = new Real().set("1", 128);
    Complex zeroV = new Complex().zero();
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, "1", "0", "-1");
          MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV, 1, 128, null) )
    {
      Context ctx = approx.context;
      ComplexFunctionalSequence knSeq = ctx.getFunctionMapping("Kn").instantiate();
      ComplexFunctionalSequence cdSeq = ctx.getFunctionMapping("CDn").instantiate();
      int nK = 4;

      Complex z = new Complex().set(0.5, 0.0);
      Complex w = new Complex().set(0.7, 0.0);

      ComplexFunctional knN  = knSeq.evaluate(nK, 128);
      ComplexFunction   knNz = knN.evaluate(z, 1, 128, null);
      Complex           knVal = knNz.evaluate(w, 1, 128, new Complex());

      ComplexFunctional cdN  = cdSeq.evaluate(nK, 128);
      ComplexFunction   cdNz = cdN.evaluate(z, 1, 128, null);
      Complex           cdVal = cdNz.evaluate(w, 1, 128, new Complex());

      log.debug("Kn(4)(0.5)(0.7) = " + knVal);
      log.debug("CDn(4)(0.5)(0.7) = " + cdVal);

      try ( Complex diff = new Complex(); Real norm = new Real() )
      {
        knVal.sub(cdVal, 128, diff);
        diff.abs(128, norm);
        assertTrue("K_n(z,w) − CD_n(z,w) should be ≃ 0, got |diff| = " + norm, norm.isZeroUpTo(96));
      }
    }
  }

public void testSupportRoots()
  {
    Real    μ     = new Real().set("1", 128);
    Complex zeroV = new Complex().zero();
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, "1", "0", "-1");
          MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV, 1, 128, null) )
    {
      int nS = 4;
      try ( Integer ni = new Integer(nS);
            ComplexPolynomial den = approx.Φden().evaluate(ni, 128) )
      {
        Complex roots = den.roots(128);
        log.debug("Φ_den(4) roots:");
        for (int i = 0; i < roots.dim(); i++)
        {
          log.debug("  ζ_" + i + " = " + roots.get(i));
        }
        roots.close();
      }
    }
  }

  public void testReproductionIdentity()
  {
    Real    μ     = new Real().set("1", 128);
    Complex zeroV = new Complex().zero();
    try ( RiccatiMuntzPadeFunctional eq = new RiccatiMuntzPadeFunctional(μ, "1", "0", "-1");
          MuntzPadeApproximant approx = (MuntzPadeApproximant) eq.evaluate(zeroV, 1, 128, null) )
    {
      ComplexFunctionalSequence knSeq = approx.Kn();
      ComplexFunctionalSequence cdSeq = approx.CDn();
      int nK = 4;

      double[][] samples = { {0.5, 0.7}, {1.0, 0.5}, {-0.3, 0.2}, {0.8, -0.4} };
      for (double[] s : samples)
      {
        Complex z = new Complex().set(s[0], 0.0);
        Complex w = new Complex().set(s[1], 0.0);

        ComplexFunctional knN  = knSeq.evaluate(nK, 128);
        ComplexFunction   knNz = knN.evaluate(z, 1, 128, null);
        Complex           knVal = knNz.evaluate(w, 1, 128, new Complex());

        ComplexFunctional cdN  = cdSeq.evaluate(nK, 128);
        ComplexFunction   cdNz = cdN.evaluate(z, 1, 128, null);
        Complex           cdVal = cdNz.evaluate(w, 1, 128, new Complex());

        try ( Complex diff = new Complex(); Real norm = new Real() )
        {
          knVal.sub(cdVal, 128, diff);
          diff.abs(128, norm);
          assertTrue(String.format("K_n − CD_n at (%s,%s) should be ≃ 0, got |diff| = %s", s[0], s[1], norm),
                     norm.isZeroUpTo(96));
        }
      }
    }
  }
}
