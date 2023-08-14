package arb.functions.real;

import java.util.ArrayList;
import java.util.stream.IntStream;

import arb.*;
import arb.Float;

/**
 * The {@link FunctionSampler} class performs the sampling of real functions.
 * <p>
 * The FunctionSampler class provides utilities to manage a collection of real
 * functions and to resample these functions over a certain domain.
 * <p>
 * This class is typically used in scenarios where you need to regularly
 * resample a set of functions over a fixed or changing interval, typically when
 * the parameters of the function are changed and new values are needed
 */
public class FunctionSampler implements
                             AutoCloseable
{
  public static final int              precision      = 128;

  public final ArrayList<RealFunction> functions      = new ArrayList<>();

  public FloatInterval                 domain;

  public int                           sampleCount    = 0;
  public int                           samplesPerUnit = 100;

  public ArrayList<RealDataSet>        dataSets       = new ArrayList<RealDataSet>();

  public FunctionSampler(FloatInterval domain)
  {
    this.domain = domain;
  }

  public FunctionSampler(FloatInterval domain,
                         Float dt)
  {
    this.domain = domain;
    try ( Float length = domain.length(128, new Float()))
    {
      Float samplesPerUnit = length.div(dt, 128);
      this.samplesPerUnit = (int) samplesPerUnit.doubleValue();
    }
  }

  /**
   * Default construct with a domain of -10..10
   */
  public FunctionSampler()
  {
    this(new FloatInterval(-10,
                           10));
  }

  /**
   * Resample all functions in the list.
   *
   * This method goes through the list of functions and resamples each one,
   * updating the corresponding data set with the new samples.
   *
   * @param parallel A boolean that indicates if the process should be
   *                 parallelized.
   */
  public final void resampleFunctions(boolean parallel)
  {
    assert functions.size() == dataSets.size();
    IntStream.range(0, functions.size()).parallel().forEach(i ->
    {
      RealFunction function = functions.get(i);
      RealDataSet  dataset  = dataSets.get(i);
      Real         mesh     = dataset.getRealXValues();
      Real         values   = dataset.getRealYValues();

      IntStream    sequence = IntStream.range(0, sampleCount);
      if (parallel)
      {
        sequence = sequence.parallel();
      }
      sequence.forEach(n -> function.evaluate(mesh.get(n), 1, precision, values.get(n)));
      dataset.setName(function.toString());
    });
  }

  /**
   * Refresh the data sets associated with the functions.
   *
   * This method recalculates the sample count (if necessary), clears the current
   * data sets and then regenerates them for each function.
   */
  public void refreshFunctionDatasets()
  {
    if (sampleCount <= 0)
    {
      sampleCount = Math.min(10000,
                             1 + (int) domain.length(128, new Float()).mul(samplesPerUnit, 128).doubleValue());
    }
    freeExistingDatasets();
    for (RealFunction function : functions)
    {
      RealDataSet dataset = new RealDataSet(function.toString(),
                                            sampleCount);
      domain.generateRealPartition(precision, false, dataset.getRealXValues());
      dataSets.add(dataset);
    }
  }

  private void freeExistingDatasets()
  {
    for (RealDataSet rds : dataSets)
    {
      rds.close();
    }
    dataSets.clear();
  }

  @Override
  public void close() 
  {
    freeExistingDatasets();
  }
}
