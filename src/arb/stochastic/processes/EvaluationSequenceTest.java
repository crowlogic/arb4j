package arb.stochastic.processes;

import static arb.utensils.Utilities.println;

import arb.FloatInterval;
import arb.RandomState;
import arb.Real;
import arb.RealPartition;
import arb.stochastic.StandardGaussianDistribution;
import junit.framework.TestCase;

public class EvaluationSequenceTest extends
                                    TestCase
{
  final static int prec = 128;

  public void testIntervalPartitionEvalSequence()
  {
    try ( FloatInterval fi = new FloatInterval(0,
                                               5))
    {
      RealPartition                partition      = fi.realPartition(50000, prec);
      EvaluationSequence           es             = new EvaluationSequence(partition,
                                                                           1);

      StandardGaussianDistribution standardNormal = new StandardGaussianDistribution();
      RandomState                  generator      = new RandomState(31337);
      es.generateRandomSamples(standardNormal, null, generator, prec);

      Real   real     = es.values[0];
      Real   var      = real.variance(prec, new Real());
      double vardelta = Math.abs(var.doubleValue() - 1);
      println("vardelta=" + vardelta);
      assertTrue(vardelta < 0.0035);
    }
  }

}
