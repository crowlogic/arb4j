package arb.stochastic.processes;

import static arb.utensils.Utilities.println;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import junit.framework.TestCase;

public class CorrelatedRandomVectorGeneratorTest extends
                                                 TestCase
{

  private Real x;

  public void testNextVector()
  {
    RandomState randomState      = new RandomState(31337);
    RealMatrix  covarianceMatrix = RealMatrix.newMatrix(2, 2);
    Real        meanVector       = new Real(2);
    covarianceMatrix.get(0, 0).one();
    covarianceMatrix.get(1, 1).one();
    covarianceMatrix.get(0, 1).set("-0.75", 128);
    covarianceMatrix.get(1, 0).set("-0.75", 128);

    try ( CorrelatedRandomVectorGenerator rvgen = new CorrelatedRandomVectorGenerator(meanVector,
                                                                                      covarianceMatrix,
                                                                                      128,
                                                                                      randomState))
    {
      rvgen.nextElement(128, x = new Real(2));
      println("sqrt correlation=" + rvgen.getRootMatrix());
    }
    catch (Exception e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    println("drew sample " + x);
  }

}
