package arb.stochastic.processes.operators;

import java.util.List;
import java.util.stream.IntStream;

import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import junit.framework.TestCase;

/**
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class J0IntegralCovarianceOperatorTest extends
                                              TestCase
{

  public static void testJ0Projections()
  {
    List<Real>                   projections;
    try ( Integer index = new Integer())
    {
      projections = IntStream.range(0, 10).mapToObj(J0IntegralCovarianceOperator.λₖ).toList();
    }
    double lambda0 = projections.get(0).doubleValue();
    assertEquals(0.886226925452758013649083741670 * 2, lambda0);
    assertEquals(0.495415912200751376668128595640 * 2, projections.get(1).doubleValue());
    assertEquals(0.1854367759050935889237968144054542995537548 * 2, projections.get(9).doubleValue());

  }
}
