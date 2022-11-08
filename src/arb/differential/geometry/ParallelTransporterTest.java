package arb.differential.geometry;

import arb.ComplexConstants;
import arb.Real;
import arb.differential.geometry.ParallelTransporter.What;
import arb.functions.complex.SFunction;
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
