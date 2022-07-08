package arb.viz;

import arb.*;
import arb.functions.complex.*;
import arb.viz.GeodesicTracer.*;
import junit.framework.*;

public class GeodesicTracerTest extends
                                TestCase
{
  public static void testRealPartTrace()
  {
    GeodesicTracer<SFunction> tracer = new GeodesicTracer<SFunction>(new SFunction(),
                                                                     new Real().set("0.01", 128),
                                                                     What.Real);
    tracer.trace();
  }
}
