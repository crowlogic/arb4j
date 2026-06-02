package arb.functions.complex;

import arb.Real;
import arb.expressions.ExpressionClassLoader;
import junit.framework.TestCase;

/**
 * Regression guard for the dominant rough-Heston calibration slowness: the Müntz
 * coefficient machinery (P, Q, R, the discriminant D, the self-referential
 * {@code a}, and {@code da}) is identical for every instance built from the same
 * coefficient expressions — only the runtime parameter values differ — yet it is
 * parsed, generated and JIT-compiled afresh for each instance. The calibrator
 * builds one such functional per option per calibrator, so the same expressions
 * are recompiled dozens of times per run; eliminating that recompilation took a
 * calibration from 8+ minutes to ~17 s.
 *
 * <p>
 * {@link ExpressionClassLoader#classesDefined} counts classes actually generated
 * and defined (a cache hit does not increment it). This guard builds two
 * functionals from identical coefficient expressions and asserts the second
 * defines <em>zero</em> new classes: the expressions must be compiled once and
 * the compiled classes reused (the {@code static} prototype / {@code
 * instantiate} pattern). While the redundant recompilation is happening the
 * second build defines the whole machinery again and this test does not pass;
 * once compile-once is in place it passes and fails again if recompilation is
 * reintroduced.
 */
public class RiccatiMuntzPadeFunctionalCompileOnceTest extends
                                                       TestCase
{
  static final int bits = 128;

  public void testIdenticalCoefficientsCompileOnce()
  {
    // tanh oracle coefficients: μ=1, P=1, Q=0, R=-1.
    try ( RiccatiMuntzPadeFunctional first = new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "1", "0", "-1") )
    {
      long definedBeforeSecond = ExpressionClassLoader.classesDefined;
      try ( RiccatiMuntzPadeFunctional second = new RiccatiMuntzPadeFunctional(new Real().set("1", bits), "1", "0", "-1") )
      {
        long definedBySecond = ExpressionClassLoader.classesDefined - definedBeforeSecond;
        assertEquals("the identical Müntz coefficient machinery was RECOMPILED for the second instance instead "
                      + "of reusing the classes compiled for the first — the rough-Heston calibration-slowness "
                      + "defect (compile once, instantiate many): the second build defined " + definedBySecond
                      + " new classes; compile-once requires 0",
                     0L,
                     definedBySecond);
      }
    }
  }
}
