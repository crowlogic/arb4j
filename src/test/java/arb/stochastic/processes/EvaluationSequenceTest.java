package arb.stochastic.processes;

import arb.*;
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
      RealPartition                partition      = fi.generateRealPartition(prec, true, 50000);
      EvaluationSequence           es             = new EvaluationSequence(partition,
                                                                           1);

      StandardGaussianDistribution standardNormal = new StandardGaussianDistribution();
      RandomState                  generator      = new RandomState(31337);
      es.generateRandomSamples(standardNormal, null, generator, prec);

      Real   real     = es.dimensions[0];
      Real   var      = real.variance(prec, new Real());
      double vardelta = Math.abs(var.doubleValue() - 1);
      assertTrue(vardelta < 0.0035);
    }
  }

}
