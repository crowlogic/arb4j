package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.ExpressionClassLoader;
import arb.stochastic.processes.heston.RoughHestonCalibrator.Option;
import junit.framework.TestCase;

/**
 * Regression guard for the dominant rough-Heston calibration-slowness defect
 * (arb4j issue #1073): the pricing machinery — the Müntz coefficient recurrence
 * {@code a}/{@code da}, the cumulant generator, and the whole Edgeworth price
 * chain, ≈70 generated classes — is byte-for-byte identical for every option in
 * a calibration (the options differ only in the runtime values of T and K, never
 * in the expression text). It must therefore be compiled <em>exactly once</em>
 * for the whole calibration and repriced per option by mutating variables, not
 * recompiled once per option.
 *
 * <p>
 * The earlier guard attempted to assert this by building two independent
 * {@link arb.functions.complex.RiccatiMuntzPadeFunctional} instances and checking
 * the second defined zero classes. That is unsatisfiable soundly: each instance
 * owns its own {@link arb.expressions.Context}, and a Context is 1:1 with its
 * {@link ExpressionClassLoader} (the loader instantiates operands from, and frees
 * native references owned by, exactly one Context). The only way to make two
 * independent constructions share classes is a process-global static loader —
 * the precise hack issue #1073 removes, because one instance disposing its native
 * memory then leaves the shared classes dereferencing freed handles
 * ({@code Cannot read field "dim" because "real" is null}).
 *
 * <p>
 * The sound formulation, asserted here: the number of classes a
 * {@link RoughHestonCalibrator} compiles is <em>independent of how many options
 * it calibrates</em>. A calibrator over many maturities must compile the same
 * machinery a single-option calibrator does — one shared, repriced pricer — so
 * the per-option compile count is zero. If the per-option recompilation is ever
 * reintroduced, the many-option calibrator compiles a multiple of the machinery
 * and this guard fails.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
@SuppressWarnings("resource")
public class RoughHestonCalibratorCompileOnceTest extends
                                                 TestCase
{
  static final int    bits = 128;

  static final int[]  free = { RoughHestonCalibrator.NU, RoughHestonCalibrator.RHO };

  /** λ θ ν V0 ρ μ. */
  static Real params()
  {
    Real p = Real.newVector(6);
    String[] v = { "0.1", "0.3", "0.4", "0.09", "-0.6", "0.6" };
    for (int i = 0; i < 6; i++)
      p.get(i).set(new Real(v[i], bits));
    return p;
  }

  /** A calibrator over {@code maturities.length} options (one ATM call each). */
  static RoughHestonCalibrator calibrator(String... maturities)
  {
    List<Option> opts = new ArrayList<>();
    for (String T : maturities)
      opts.add(new Option(new Real(T, bits), new Real("1.0", bits), true, new Real(), new Real("1", bits)));
    return new RoughHestonCalibrator(opts, free, params(), bits);
  }

  long classesToBuild(String... maturities)
  {
    long before = ExpressionClassLoader.classesDefined;
    try ( RoughHestonCalibrator cal = calibrator(maturities) )
    {
      return ExpressionClassLoader.classesDefined - before;
    }
  }

  public void testCalibratorCompilesPricingMachineryOnceRegardlessOfOptionCount()
  {
    // Warm up any one-time / process-global class definitions so the measured
    // deltas below reflect only the per-calibrator pricer compilation.
    try ( RoughHestonCalibrator warmup = calibrator("0.5") )
    {
    }

    long oneOption  = classesToBuild("0.5");
    long fourOptions = classesToBuild("0.25", "0.5", "1.0", "2.0");

    assertTrue("a calibrator must compile a non-trivial pricing machinery (sanity check): " + oneOption,
               oneOption > 10);
    assertEquals("the rough-Heston pricing machinery was RECOMPILED per option instead of compiled once and "
                  + "repriced by mutating T/K (the calibration-slowness defect, arb4j #1073): a four-option "
                  + "calibrator defined " + fourOptions + " classes vs " + oneOption + " for one option — "
                  + "compile-once requires these to be equal (per-option compile count = 0)",
                 oneOption,
                 fourOptions);
  }
}
