package arb.stochastic.processes.heston;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * Guards the deletion of the fundamentally broken, verb-named rough-Heston price
 * class and the agent classes built on it. Classes are nouns — a function or a
 * process whose quantities are computed — never verbs; the {@code *Pricer} /
 * {@code *Calibrator} agents modelled the price as a machine that "does the
 * pricing" and are gone for good. This test fails if any of them is
 * reintroduced onto the classpath, so the shit class cannot be resurrected.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RoughHestonVerbClassAbsenceTest extends
                                             TestCase
{
  private static final String[] DELETED = { "arb.stochastic.processes.heston.RoughHestonOptionPricer",
                                            "arb.stochastic.processes.heston.RoughHestonResiduePricer",
                                            "arb.stochastic.processes.heston.RoughHestonCalibrator",
                                            "arb.stochastic.processes.heston.CalibProfile" };

  public void testDeletedVerbNamedClassesAreAbsent()
  {
    // Positive control: a surviving noun class must load, proving Class.forName
    // resolves this package here and the negative assertions below are live.
    try
    {
      Class.forName("arb.stochastic.processes.heston.RoughHestonCharacteristicFunction");
    }
    catch (ClassNotFoundException unexpected)
    {
      fail("positive control failed: RoughHestonCharacteristicFunction should load — " + unexpected);
    }

    for (String name : DELETED)
    {
      try
      {
        Class.forName(name);
        fail(name + " must not exist: classes are nouns, not verbs, and this one was deleted for being fundamentally broken");
      }
      catch (ClassNotFoundException expected)
      {
        // exactly what we require: the class is gone
      }
    }
  }
}
