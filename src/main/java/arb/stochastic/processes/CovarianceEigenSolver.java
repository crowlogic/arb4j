package arb.stochastic.processes;

import java.util.Arrays;
import java.util.List;

import arb.Real;
import arb.RealMatrix;
import arb.expressions.Compiler;
import arb.functions.real.RealFunction;

public class CovarianceEigenSolver
{

  private RealMatrix covarianceMatrix;
  private int        n;

  public CovarianceEigenSolver(RealFunction kernel, List<Double> discretizationPoints)
  {
    n                = discretizationPoints.size();
    covarianceMatrix = RealMatrix.newMatrix(n, n);
    for (int i = 0; i < n; i++)
    {
      for (int j = 0; j < n; j++)
      {
        double xi = discretizationPoints.get(i);
        double xj = discretizationPoints.get(j);
        covarianceMatrix.get(i, j).set(kernel.eval(xi - xj));
      }
    }
  }

  public static int bits = 128;

  public RealMatrix solve()
  {
    RealMatrix cholesky = covarianceMatrix.chol(bits, RealMatrix.newMatrix(n, n));
    return cholesky;
  }

  public static void main(String[] args)
  {
    RealFunction kernel               = Compiler.express("exp(-x^2)");
    List<Double>             discretizationPoints = Arrays.asList(0.0, 0.1, 0.2, 0.3, 0.4, 0.5);
    CovarianceEigenSolver    solver               = new CovarianceEigenSolver(kernel,
                                                                              discretizationPoints);
    RealMatrix               eigenDecomposition   = solver.solve();
    Real                     eigenvalues          = eigenDecomposition.diag();
    System.out.println( "Eigenvalues: " + eigenvalues );
    
  }
}