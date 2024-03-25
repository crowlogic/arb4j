package arb.stochastic.processes.operators;

import static java.lang.System.out;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import arb.Integer;
import arb.Real;
import junit.framework.TestCase;

public class J0IntegralCovarianceOperatorTest extends
                                              TestCase
{
  public static void testProjections()
  {
    int                          bits = 128;
    J0IntegralCovarianceOperator op   = new J0IntegralCovarianceOperator();
    List<Real>                   projections;
    try ( Integer index = new Integer())
    {
      projections = IntStream.range(0, 10)
                             .mapToObj(k -> op.ξ.evaluate(index.set(k), 0, bits, new Real()))
                             .collect(Collectors.toList());
    }
    assertEquals(1.534990061919732732719327437333897291, projections.get(0).doubleValue());
    assertEquals(0.4954159122007513766681285956400228789, projections.get(1).doubleValue());
    assertEquals(0.13970265286223372241546368542524387880, projections.get(9).doubleValue());

  }
}
