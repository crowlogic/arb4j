package arb.viz;

import arb.*;
import arb.functions.complex.*;
import arb.viz.GeodesicFlower.*;

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
      GeodesicFlower<SFunction> flower = new GeodesicFlower<SFunction>(new SFunction(),
                                                                       ComplexConstants.ZERO,
                                                                       dt.set("0.1", 128),
                                                                       What.Real);
      flower.flow();
    }
  }
}
