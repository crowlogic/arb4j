
package arb;

import java.util.ArrayList;

import arb.FloatInterval.RootStatus;
import arb.functions.real.RealFunction;

/**
 * TODO: add a ruleOut function to check intervals with RootUnknown status ,
 * perhaps as part of refine
 * 
 * @author crow
 *
 */
public class FoundRoots extends
                        ArrayList<RealRootInterval>
{

  @Override
  public boolean add(RealRootInterval e)
  {
    if (e.status == RootStatus.RootLocated)
    {
      foundCount++;
    }
    else if (e.status == RootStatus.RootUnknown)
    {
      unknownCount++;
    }
    return super.add(e);
  }

  @Override
  public String toString()
  {
    StringBuffer sb = new StringBuffer();
    sb.append(String.format("FoundRoots[evals=%s, unknownCount=%s, foundCount=%s]={",
                            evals,
                            unknownCount,
                            foundCount));
    boolean first = true;
    for (RealRootInterval interval : this)
    {
      if (!first)
      {
        sb.append(", \n");
      }
      sb.append(interval.toString());
      first = false;
    }
    sb.append("}");
    return sb.toString();
  }

  public int evals;

  public int unknownCount;

  public int foundCount;

  /**
   * Increase the precision of the root intervals via bisection and Newton's
   * method
   * 
   * @param f
   * @param digits number of digits of precision needed
   */
  public void refine(RealFunction func, int prec, int digits, boolean verbose)
  {

    try ( Real w = Real.newVector(3); Real v = new Real(); RealRootInterval u = new RealRootInterval();
          RealRootInterval convergenceRegion = new RealRootInterval(); Float convergenceFactor = new Float())
    {
      for (RealRootInterval rootInterval : this)
      {
        if (rootInterval.status != RootStatus.NoRoot)
        {
          Real refinedRoot = rootInterval.refine(func,
                                                 prec,
                                                 digits,
                                                 w,
                                                 v,
                                                 u,
                                                 convergenceRegion,
                                                 convergenceFactor,
                                                 verbose);
          refinedRoot.getInterval(prec, rootInterval);
          rootInterval.status = FloatInterval.RootStatus.RootLocated;
        }
      }
    }
  }

}
