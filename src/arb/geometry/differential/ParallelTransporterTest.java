package arb.geometry.differential;

import arb.ComplexConstants;
import arb.Real;
import arb.functions.complex.SFunction;
import arb.geometry.differential.ParallelTransporter.What;
import junit.framework.TestCase;

public class ParallelTransporterTest extends
                                     TestCase
{
  public static void testFlow()
  {
    Real dt = new Real("0.01", 128);
    ParallelTransporter<SFunction> transporter = new ParallelTransporter<SFunction>(new SFunction(),
                                                                                    ComplexConstants.ZERO,
                                                                                    dt,
                                                                                    What.Real,
                                                                                    null,
                                                                                    null);
  }
}
