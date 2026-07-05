package arb.stochastic;

import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.Jacobian;
import arb.functions.real.RealFunction;

/**
 * Exact maximum-likelihood estimation for arb4j distributions using compiler-built
 * derivatives and a damped Newton/Levenberg–Marquardt step.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class MaximumLikelihoodEstimation
{
  private static final Logger log = LoggerFactory.getLogger(MaximumLikelihoodEstimation.class);

  public static final class EstimateResult
  {
    public final double[] parameters;
    public final int      iterations;
    public final boolean  converged;
    public final double   objective;
    public final double   gradientNorm;

    public EstimateResult(double[] parameters, int iterations, boolean converged, double objective, double gradientNorm)
    {
      this.parameters = parameters;
      this.iterations = iterations;
      this.converged = converged;
      this.objective = objective;
      this.gradientNorm = gradientNorm;
    }
  }

  public static EstimateResult estimate(Distribution distribution, double[] observations, double[] initialParameters, int maxIterations, double tolerance, int bits)
  {
    assert initialParameters.length == distribution.parameterNames().length : "parameter count mismatch";
    double[] parameters = Arrays.copyOf(initialParameters, initialParameters.length);
    clipParameters(parameters, distribution);

    String[] parameterNames = distribution.parameterNames();
    int count = parameterNames.length;
    RealFunction logDensity = distribution.logDensityFunction();
    RealFunction[] firstPartials = new RealFunction[count];
    RealFunction[][] secondPartials = new RealFunction[count][count];
    for (int i = 0; i < count; i++)
    {
      firstPartials[i] = logDensity.derivative(parameterNames[i]);
      for (int j = 0; j < count; j++)
      {
        secondPartials[i][j] = firstPartials[i].derivative(parameterNames[j]);
      }
    }

    applyParameters(distribution, parameters, logDensity, firstPartials, secondPartials);

    double damping = 1e-3;
    double objective = negativeLogLikelihood(distribution, observations, bits);
    double gradientNorm = Double.POSITIVE_INFINITY;

    for (int iteration = 0; iteration < maxIterations; iteration++)
    {
      double[] gradient = evaluateGradient(firstPartials, observations, bits);
      gradientNorm = norm(gradient);
      double perSampleGradient = gradientNorm / Math.max(1, observations.length);
      if (perSampleGradient < tolerance)
      {
        return new EstimateResult(parameters, iteration, true, objective, gradientNorm);
      }

      double[][] observedInformation = negate(evaluateHessian(secondPartials, observations, bits));
      double[][] system = addDiagonal(observedInformation, damping);
      double[] step = solve(system, gradient);

      double[] trial = Arrays.copyOf(parameters, parameters.length);
      for (int i = 0; i < trial.length; i++)
      {
        trial[i] += step[i];
      }
      clipParameters(trial, distribution);

      applyParameters(distribution, trial, logDensity, firstPartials, secondPartials);
      double trialObjective = negativeLogLikelihoodOfCurrentState(logDensity, observations, bits);
      log.debug("iter={} params={} obj={} grad={} step={} trial={} trialObj={} damping={}",
                iteration,
                Arrays.toString(parameters),
                objective,
                gradientNorm,
                Arrays.toString(step),
                Arrays.toString(trial),
                trialObjective,
                damping);
      if (Double.isFinite(trialObjective) && trialObjective < objective)
      {
        parameters = trial;
        objective = trialObjective;
        damping = Math.max(1e-6, damping / 10.0);
      }
      else
      {
        applyParameters(distribution, parameters, logDensity, firstPartials, secondPartials);
        damping *= 10.0;
        if (damping > 1e12)
        {
          break;
        }
      }
    }

    return new EstimateResult(parameters, maxIterations, (gradientNorm / Math.max(1, observations.length)) < tolerance, objective, gradientNorm);
  }

  private static void applyParameters(Distribution distribution, double[] parameters, RealFunction logDensity, RealFunction[] firstPartials, RealFunction[][] secondPartials)
  {
    distribution.setParameters(parameters);
    logDensity.invalidateCache();
    for (RealFunction partial : firstPartials)
    {
      partial.invalidateCache();
    }
    for (RealFunction[] row : secondPartials)
    {
      for (RealFunction partial : row)
      {
        partial.invalidateCache();
      }
    }
  }

  private static double negativeLogLikelihood(Distribution distribution, double[] observations, int bits)
  {
    return negativeLogLikelihoodOfCurrentState(distribution.logDensityFunction(), observations, bits);
  }

  private static double negativeLogLikelihoodOfCurrentState(RealFunction logDensity, double[] observations, int bits)
  {
    double result = 0.0;
    try ( Real input = new Real(); Real output = new Real())
    {
      for (double observation : observations)
      {
        input.set(observation);
        logDensity.evaluate(input, 1, bits, output);
        result -= output.doubleValue();
      }
    }
    return result;
  }

  private static double[] evaluateGradient(RealFunction[] partials, double[] observations, int bits)
  {
    double[] gradient = new double[partials.length];
    try ( Real input = new Real(); Real output = new Real())
    {
      for (double observation : observations)
      {
        input.set(observation);
        for (int i = 0; i < partials.length; i++)
        {
          partials[i].evaluate(input, 1, bits, output);
          gradient[i] += output.doubleValue();
        }
      }
    }
    return gradient;
  }

  private static double[][] evaluateHessian(RealFunction[][] secondPartials, double[] observations, int bits)
  {
    int count = secondPartials.length;
    double[][] hessian = new double[count][count];
    try ( Real input = new Real(); Real output = new Real())
    {
      for (double observation : observations)
      {
        input.set(observation);
        for (int i = 0; i < count; i++)
        {
          for (int j = 0; j < count; j++)
          {
            secondPartials[i][j].evaluate(input, 1, bits, output);
            hessian[i][j] += output.doubleValue();
          }
        }
      }
    }
    return hessian;
  }

  private static double[] solve(double[][] matrix, double[] vector)
  {
    int n = vector.length;
    double[][] work = new double[n][n + 1];
    for (int i = 0; i < n; i++)
    {
      System.arraycopy(matrix[i], 0, work[i], 0, n);
      work[i][n] = vector[i];
    }

    for (int pivot = 0; pivot < n; pivot++)
    {
      int best = pivot;
      double max = Math.abs(work[pivot][pivot]);
      for (int i = pivot + 1; i < n; i++)
      {
        double candidate = Math.abs(work[i][pivot]);
        if (candidate > max)
        {
          max = candidate;
          best = i;
        }
      }
      if (max < 1e-30)
      {
        throw new IllegalStateException("singular linear system");
      }
      if (best != pivot)
      {
        double[] tmpRow = work[pivot];
        work[pivot] = work[best];
        work[best] = tmpRow;
      }
      double pivotValue = work[pivot][pivot];
      for (int col = pivot; col <= n; col++)
      {
        work[pivot][col] /= pivotValue;
      }
      for (int row = 0; row < n; row++)
      {
        if (row == pivot)
        {
          continue;
        }
        double factor = work[row][pivot];
        if (factor == 0.0)
        {
          continue;
        }
        for (int col = pivot; col <= n; col++)
        {
          work[row][col] -= factor * work[pivot][col];
        }
      }
    }

    double[] solution = new double[n];
    for (int i = 0; i < n; i++)
    {
      solution[i] = work[i][n];
    }
    return solution;
  }

  private static double[][] addDiagonal(double[][] matrix, double damping)
  {
    double[][] result = new double[matrix.length][matrix.length];
    for (int i = 0; i < matrix.length; i++)
    {
      for (int j = 0; j < matrix.length; j++)
      {
        result[i][j] = matrix[i][j];
      }
      result[i][i] += damping;
    }
    return result;
  }

  private static double[] negate(double[] vector)
  {
    double[] result = new double[vector.length];
    for (int i = 0; i < vector.length; i++)
    {
      result[i] = -vector[i];
    }
    return result;
  }

  private static double[][] negate(double[][] matrix)
  {
    double[][] result = new double[matrix.length][matrix.length];
    for (int i = 0; i < matrix.length; i++)
    {
      for (int j = 0; j < matrix.length; j++)
      {
        result[i][j] = -matrix[i][j];
      }
    }
    return result;
  }

  private static double norm(double[] vector)
  {
    double sum = 0.0;
    for (double value : vector)
    {
      sum += value * value;
    }
    return Math.sqrt(sum);
  }

  private static void clipParameters(double[] parameters, Distribution distribution)
  {
    if (parameters.length != 2)
    {
      return;
    }
    parameters[0] = Math.max(1e-6, parameters[0]);
    parameters[1] = Math.max(1e-6, Math.min(1.0 - 1e-6, parameters[1]));
  }
}
