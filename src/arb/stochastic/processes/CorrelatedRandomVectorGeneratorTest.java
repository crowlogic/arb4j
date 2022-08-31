package arb.stochastic.processes;

import static arb.utensils.Utilities.println;

import arb.RandomState;
import arb.Real;
import arb.RealMatrix;
import junit.framework.TestCase;

public class CorrelatedRandomVectorGeneratorTest extends
                                                 TestCase
{

  public void testNextVector() throws Exception
  {
    RandomState randomState      = new RandomState(494949);
    RealMatrix  covarianceMatrix = RealMatrix.newMatrix(2, 2);
    Real        meanVector       = new Real(2);
    covarianceMatrix.get(0, 0).one();
    covarianceMatrix.get(1, 1).one();
    int prec = 128;
    covarianceMatrix.get(0, 1).set("-0.75", prec);
    covarianceMatrix.get(1, 0).set(covarianceMatrix.get(0, 1));

    try ( CorrelatedRandomVectorGenerator rvgen = new CorrelatedRandomVectorGenerator(meanVector,
                                                                                      covarianceMatrix,
                                                                                      prec,
                                                                                      randomState))
    {
      RealMatrix x = RealMatrix.newMatrix(10000, 2);

      for (Real element : x)
      {
        rvgen.nextElement(prec, element);
      }
      println("sqrt correlation=" + rvgen.getRootMatrix());

      Real dW1 = x.copyCol(0, new Real(x.getNumRows())).normalize(prec);
      Real dW2 = x.copyCol(1, new Real(x.getNumRows())).normalize(prec);

      Real cov = dW1.covariance(dW2, prec, new Real());
      cov.printPrecision = true;
      println("covariance " + cov);

      assertEquals( covarianceMatrix.get(0, 1).doubleValue(), cov.doubleValue(), 0.006 );      
    }
  }

}
