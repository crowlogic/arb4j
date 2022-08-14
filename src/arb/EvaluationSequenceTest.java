package arb;

import static arb.utensils.Utilities.println;

import arb.stochastic.StandardGaussianDistribution;
import junit.framework.TestCase;

public class EvaluationSequenceTest extends
                                    TestCase
{

  public void testIntervalPartitionEvalSequence()
  {
    try ( FloatInterval fi = new FloatInterval(0,
                                               5))
    {
      RealPartition      partition = fi.realPartition(50000, 128);
      EvaluationSequence es        = new EvaluationSequence(partition,
                                                            1);

      es.generateRandomSamples(new StandardGaussianDistribution(), new RandomState(31337), 128);
      Real   var      = es.values[0].variance(128, new Real());
      double vardelta = Math.abs(var.doubleValue() - 1);
      println("vardelta=" + vardelta);
      assertTrue(vardelta < 0.0035);
    }
  }

}
