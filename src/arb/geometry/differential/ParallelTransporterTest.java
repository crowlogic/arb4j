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
    if (System.currentTimeMillis() == 0)
    {

      try ( SFunction surface = new SFunction(); Real dt = new Real("0.01",
                                                                    128);
            ParallelTransporter<SFunction> transporter = new ParallelTransporter<SFunction>(surface,
                                                                                            ComplexConstants.ZERO,
                                                                                            dt,
                                                                                            What.Real,
                                                                                            null,

                                                                                            null))
      {
      }
      catch (Exception e)
      {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    }
  }
}
