package arb.stochastic.processes;

import arb.expressions.Expression;
import junit.framework.TestCase;

public class ZProcessTest extends
                          TestCase
{

  public void testOscillatoryProcessGainFunction()
  {
    try
    {
      Expression.trace = Expression.saveClasses = true;
      ZProcess Zprocess = new ZProcess();
    }
    finally
    {
      Expression.trace = Expression.saveClasses = false;
    }
  }

}
