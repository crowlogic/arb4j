package arb;

import static arb.utensils.Utensils.println;
import static java.lang.System.*;

import java.nio.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import junit.framework.TestCase;

public class RealMatrixTest extends
                            TestCase
{

  public void testChol()
  {
    int        prec        = 128;
    RealMatrix correlation = RealMatrix.newMatrix(2, 2).identity();
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

  public void testDiagonal()
  {
    int        n    = 5;
    RealMatrix A    = RealMatrix.newMatrix(n, n);
    Real       diag = A.diag();
    assert diag.size() == n;
    IntStream.range(0, n).forEach(i -> diag.get(i).set(i + 1));
    IntStream.range(0, n)
             .forEach(i -> IntStream.range(0, n)
                                    .forEach(j -> assertTrue(A.get(i, j)
                                                              .equals(i == j ? diag.get(i) : RealConstants.zero))));
  }

  /**
   * This test case demonstrates the LU decomposition and factorization for a 4x4
   * matrix. It initializes matrix L and U as follows:
   * 
   * <pre>
   * L := Transpose(<<1, 0, 0, 0> | <2, 5, 0, 0> | <3, 6, 8, 0> | <4, 7, 9, 10>>);
   *                            [1  0  0  0 ]
   *                            [           ]
   *                            [2  5  0  0 ]
   *                       L := [           ]
   *                            [3  6  8  0 ]
   *                            [           ]
   *                            [4  7  9  10]
   * 
   * U := <<1, 0, 0, 0> | <2, 3, 0, 0> | <4, 5, 6, 0> | <7, 8, 9, 10>>;
   *                            [1  2  4  7 ]
   *                            [           ]
   *                            [0  3  5  8 ]
   *                       U := [           ]
   *                            [0  0  6  9 ]
   *                            [           ]
   *                            [0  0  0  10]
   * 
   * The product of L and U gives matrix A:
   * A := L . U;
   *                          [1  2    4    7 ]
   *                          [               ]
   *                          [2  19  33   54 ]
   *                     A := [               ]
   *                          [3  24  90   141]
   *                          [               ]
   *                          [4  29  105  265]
   * 
   * It then performs LU decomposition on matrix A, resulting in matrices P, L, and U:
   * - P is the permutation matrix.
   * - L is the lower-triangular matrix.
   * - U is the upper-triangular matrix.
   * 
   * The factorization is shown as follows:
   * 
   * p, l, u := LUDecomposition(A);
   *                             [1  0  0  0]                  
   *                             [          ]                  
   *               [1  0  0  0]  [2  1  0  0]  [1  2   4    7 ]
   *               [          ]  [          ]  [              ]
   *               [0  1  0  0]  [   6      ]  [0  15  25  40 ]
   *    p, l, u := [          ], [3  -  1  0], [              ]
   *               [0  0  1  0]  [   5      ]  [0  0   48  72 ]
   *               [          ]  [          ]  [              ]
   *               [0  0  0  1]  [   7  9   ]  [0  0   0   100]
   *                             [4  -  -  1]                  
   *                             [   5  8   ]                  
   * 
   * The equality of the matrix product (p . l) . u and A is verified as follows:
   * (p . l) . u = A;
   *             [1  2    4    7 ]   [1  2    4    7 ]
   *             [               ]   [               ]
   *             [2  19  33   54 ]   [2  19  33   54 ]
   *             [               ] = [               ]
   *             [3  24  90   141]   [3  24  90   141]
   *             [               ]   [               ]
   *             [4  29  105  265]   [4  29  105  265]
   * </pre>
   * 
   * @see RealMatrix
   */
  public void testLowerUpperFactorization()
  {
    int n = 4;

    try ( RealMatrix A = RealMatrix.newMatrix(n, n).setName("A"); RealMatrix LU = RealMatrix.newMatrix(n, n);
          RealMatrix lowerFactor = RealMatrix.newMatrix(n, n); RealMatrix upperFactor = RealMatrix.newMatrix(n, n);
          RealMatrix B = RealMatrix.newMatrix(n, n).setName("B"))
    {

      A.getRow(0).set(1, 2, 4, 7);
      A.getRow(1).set(2, 19, 33, 54);
      A.getRow(2).set(3, 24, 90, 141);
      A.getRow(3).set(4, 29, 105, 265);

      LongBuffer permutation = ByteBuffer.allocateDirect(n * Long.BYTES)
                                         .order(ByteOrder.nativeOrder())
                                         .asLongBuffer();

      printRowPointers(LU);

      RealMatrix factorization = A.computeLowerUpperFactorization(permutation, 128, LU);

      printRowPointers(LU);

      System.out.println("permutations=" + getPermutationString(permutation));
      assert factorization == LU;

      factorization.extractUpperAndLowerTriangularMatrices(lowerFactor, upperFactor);

      lowerFactor.mul(upperFactor, 128, B);

      System.out.format("%s\n\n%s\n\n%s\n\n%s\n\n%s\n\n", factorization, upperFactor, lowerFactor, A, B);

      // B.permuteRows(permutation);
      System.out.println("permutations=" + getPermutationString(permutation));

      B.permute(permutation);

      System.out.println("after depermutation\n" + B);

      System.out.println("permutations=" + getPermutationString(permutation));

      for ( int i = 0; i< n; i++ )
      {
        Real row = B.getRow(i);
        System.out.println( "row[" + i + "] = " + row );
      }
      
      assertTrue( B.getRow(0).get(3).equals(B.get(0,3)));

      RealMatrix diff = A.sub(B, 128, factorization);
      diff.printPrecision = true;
      out.println("diff=" + diff);

      try ( Real frobeniusNorm = new Real();)
      {
        diff.frobeniusNorm( 128, frobeniusNorm );
        out.println("frobenius norm=" + frobeniusNorm.doubleValue());

        assertTrue(frobeniusNorm.containsZero());

        assertTrue(frobeniusNorm.doubleValue() < 1e-35);
      }
    }
  }

  private void printRowPointers(RealMatrix lU)
  {
    for (int i = 0; i < lU.rowPointers.capacity(); i++)
    {
      long ptr = lU.rowPointers.get(i);
      System.out.format("row[%d]=0x%x\n", i, ptr);
    }
    out.println();
  }

  public String getPermutationString(LongBuffer permutation)
  {
    String permutationString = "[" + IntStream.range(0, permutation.capacity())
                                              .mapToObj(i -> String.valueOf(permutation.get(i)))
                                              .collect(Collectors.joining(","))
                  + "]";
    return permutationString;
  }

  public void testTranspose()
  {
    int n = 4;
    try ( RealMatrix A = RealMatrix.newMatrix(n, n); RealMatrix B = RealMatrix.newMatrix(n, n);
          RealMatrix C = RealMatrix.newMatrix(n, n);)
    {

      A.getRow(0).set(1, 2, 3, 4);
      A.getRow(1).set(5, 6, 7, 8);
      A.getRow(2).set(9, 10, 11, 12);
      A.getRow(3).set(13, 14, 15, 16);

      B.getRow(0).set(1, 5, 9, 13);
      B.getRow(1).set(2, 6, 10, 14);
      B.getRow(2).set(3, 7, 11, 15);
      B.getRow(3).set(4, 8, 12, 16);

      A.transpose(C);

      assertEquals(B, C);
    }
  }

  public void testMultiplyByScalar()
  {
    int n = 4;
    try ( RealMatrix A = RealMatrix.newMatrix(n, n); RealMatrix B = RealMatrix.newMatrix(n, n);
          RealMatrix C = RealMatrix.newMatrix(n, n);)
    {

      A.getRow(0).set(1, 2, 3, 4);
      A.getRow(1).set(5, 6, 7, 8);
      A.getRow(2).set(9, 10, 11, 12);
      A.getRow(3).set(13, 14, 15, 16);

      B.getRow(0).set(2, 4, 6, 8);
      B.getRow(1).set(10, 12, 14, 16);
      B.getRow(2).set(18, 20, 22, 24);
      B.getRow(3).set(26, 28, 30, 32);

      A.mul(RealConstants.two, 128, C);

      assertEquals(B, C);
    }
  }

}
