package arb;

import static arb.utensils.Utensils.println;

import java.nio.*;
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
   * <pre>
   A := <<1, 2, 3, 4> | <5, 6, 7, 8> | <9, 10, 11, 12> | <13, 14, 15, 16>>
                           [1  5  9   13]
                           [            ]
                           [2  6  10  14]
                      A := [            ]
                           [3  7  11  15]
                           [            ]
                           [4  8  12  16]
  
  p, l, u := LUDecomposition(A);
                      [1  0  0  0]  [1  0  0  0]  
                      [          ]  [          ]  
                      [0  1  0  0]  [2  1  0  0]  
           p, l, u := [          ], [          ], 
                      [0  0  1  0]  [3  2  1  0]  
                      [          ]  [          ]  
                      [0  0  0  1]  [4  3  0  1]  
  
             [1      5           9           13     ]
             [                                      ]
             [0      -4          -8          -12    ]
             [                                      ]
             [0      0           0            0     ]
             [                                      ]
             [0      0           0            0     ]
  
  
  (p . l) . u;
                         [1  5  9   13]
                         [            ]
                         [2  6  10  14]
                         [            ]
                         [3  7  11  15]
                         [            ]
                         [4  8  12  16]
   * 
   * </pre>
   */
  public void testLowerUpperFactorization()
  {
    int i = 0, j = 0, k = 0, n = 4, N = n * n;
    try ( RealMatrix A = RealMatrix.newMatrix(n, n); RealMatrix LU = RealMatrix.newMatrix(n, n))
    {
      while (k < N)
      {
        A.get(i++, j).set(++k);
        if (i == n)
        {
          i = 0;
          j++;
        }
      }
      RealMatrix factorization = A.computeLowerUpperFactorization(ByteBuffer.allocateDirect(n * Long.BYTES)
                                                                            .order(ByteOrder.nativeOrder())
                                                                            .asLongBuffer(),
                                                                  128,
                                                                  LU);
      System.out.println("A=" + A);
      System.out.println("LU=" + LU);
      assert factorization == LU;

      assert false : "todo: test LU, A =" + A;
    }
  }

}
