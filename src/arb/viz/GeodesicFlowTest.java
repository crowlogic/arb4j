package arb.viz;

import arb.ComplexConstants;
import arb.Real;
import arb.functions.complex.SFunction;
import arb.geometry.differential.ParallelTransporter;
import arb.geometry.differential.ParallelTransporter.What;

public class GeodesicFlowTest
{
  public static void main(String args[]) throws InterruptedException
  {
    GeodesicFlowTest.testFlow();
  }

  public static void testFlow() throws InterruptedException
  {
    try ( Real dt = new Real();)
    {
      ParallelTransporter<SFunction> flower = new ParallelTransporter<SFunction>(new SFunction(),
                                                                                 ComplexConstants.ZERO,
                                                                                 dt.set("0.1", 128),
                                                                                 What.Real,
                                                                                 new Real("-0.75",
                                                                                          128),
                                                                                 new Real("0.05",
                                                                                          128));
      flower.flow();
    }
  }
}
