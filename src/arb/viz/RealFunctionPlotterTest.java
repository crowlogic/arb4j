package arb.viz;

import arb.*;
import arb.functions.complex.*;
import arb.functions.real.*;
import arb.functions.real.dynamics.*;

public class RealFunctionPlotterTest
{

  @SuppressWarnings("resource")
  public static void main(String args[])
  {
    // RealNewtonMap<RealPart<CircularS>> f = new RealNewtonMap(new RealPart(new
    // CircularS()));
    RealFunction        f       = new RealNewtonMap(new RealPart(new CircularS(new Real().set("1", 128),
                                                                               new Real().set("0.5", 128))));
    // f.f.f.g.h.set(new Real().set("0.5", 128));
    FloatInterval       domain  = new FloatInterval(-Math.PI,
                                                    Math.PI);
    FloatInterval       range   = new FloatInterval(-Math.PI * 2,
                                                    Math.PI * 2);
    RealFunctionPlotter plotter = new RealFunctionPlotter(f,
                                                          domain,
                                                          range,
                                                          200);

    plotter.plot();
  }
}
