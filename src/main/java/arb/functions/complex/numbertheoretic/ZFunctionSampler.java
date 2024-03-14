package arb.functions.complex.numbertheoretic;

import arb.Float;
import arb.FloatInterval;
import arb.Real;
import arb.RealDataSet;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.real.FunctionSampler;
import arb.functions.real.RealFunction;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class ZFunctionSampler
{

  public static void main(String[] args)
  {

    // Instantiate ZFunction
    RealFunction    zFunction = RealFunction.express("Z(t)");

    // Instantiate FunctionSampler with the required domain
    FunctionSampler sampler   = new FunctionSampler(new FloatInterval(new Float(0),
                                                                      new Float(10000)));

    // Set the sample rate per unit
    sampler.samplesPerUnit = 100; // For spacing of 0.01

    // Add the ZFunction to the sampler's function list
    sampler.functions.add(zFunction);

    // Refresh function datasets
    sampler.refreshFunctionDatasets();

    // Resample functions
    sampler.resampleFunctions(true);

    RealDataSet sample = sampler.dataSets.get(0);
    Real        row    = sample.data.getRow(1).sum(128, new Real());
    System.out.println("sampledZfuncSum=" + row);

    sampler.resampleFunctions(false);

    sample = sampler.dataSets.get(0);
    row    = sample.data.getRow(1).sum(128, new Real());
    System.out.println("sampledZfuncSum=" + row);
    // Your sampled data sets are now in sampler.dataSets
  }
}
