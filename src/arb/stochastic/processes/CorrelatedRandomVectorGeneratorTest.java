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
    RandomState randomState      = new RandomState(31337);
    RealMatrix  covarianceMatrix = RealMatrix.newMatrix(2, 2);
    Real        meanVector       = new Real(2);
    covarianceMatrix.get(0, 0).one();
    covarianceMatrix.get(1, 1).one();
    int prec = 128;
    covarianceMatrix.get(0, 1).set("-0.75", prec);
    covarianceMatrix.get(1, 0).set("-0.75", prec);

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
      println("drew sample " + x);

      /**
       * transpose it here then calculate correlation
       */
      // TODO: add correlation to Real and then check that its the same as the one
      // that was used to generate the correlated pair of sample sequences
    }
  }

}
