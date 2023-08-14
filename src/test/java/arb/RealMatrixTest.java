package arb;

import static arb.utensils.Utensils.println;

import junit.framework.TestCase;

public class RealMatrixTest extends
                            TestCase
{

  public void testChol()
  {
    int        prec        = 128;
    RealMatrix correlation = RealMatrix.newMatrix(2, 2).identity();
    System.out.println("shit " + correlation.getRow(0));
    correlation.name = "correlation";
    correlation.get(1, 0).set(-0.75);
    correlation.get(0, 1).set(-0.75);
    RealMatrix sqrtCorrelation          = correlation.chol(prec, RealMatrix.newMatrix(2, 2));
    RealMatrix reconstructedCorrelation = RealMatrix.newMatrix(2, 2);

    sqrtCorrelation.mul(sqrtCorrelation.transpose(RealMatrix.newMatrix(2, 2)), prec, reconstructedCorrelation);
    println("correlation=\n" + correlation);
    println("√correlation=\n" + sqrtCorrelation);
    println("reconstructedCorrelation=\n" + reconstructedCorrelation);
    assertTrue(reconstructedCorrelation.contains(correlation));
    assertTrue(reconstructedCorrelation.overlaps(correlation));

    for (Real row : correlation)
    {
      println(row);
    }
  }

}
