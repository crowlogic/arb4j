package arb.utensils;

import static arb.IntegerConstants.FLINT_BITS;

import arb.Float;
import arb.FloatInterval;
import arb.Magnitude;
import arb.Real;
import arb.RealRootInterval.RefinementResult;
import arb.RoundingMode;
import arb.arblib;
import arb.functions.real.RealFunction;

/**
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public class RootFindingTools
{

  public static RefinementResult calculateNewtonSteps(RealFunction f,
                                                      Real root,
                                                      Real convergenceRegion,
                                                      Float convergenceFactor,
                                                      int extraPrec,
                                                      int[] precs,
                                                      int iters)
  {
    int i;
    int workingPrecision;
    for (i = iters - 1; i >= 0; i--)
    {
      workingPrecision = precs[i] + extraPrec;
  
      if (!f.calculateNewtonStep(root, convergenceRegion, convergenceFactor, workingPrecision, root))
      {
        return RefinementResult.NoConvergence;
      }
    }
  
    return RefinementResult.Success;
  
  }

  public static int determineNewtonStepScalingPrecisions(Float convergenceFactor, int prec, int[] precs, int startPrec)
  {
    int iters;
    int padding = Math.max(0, Math.min(arblib.arf_abs_bound_lt_2exp_si(convergenceFactor), prec) + 5);
    precs[0] = prec + padding;
    iters    = 1;
    while ((iters < FLINT_BITS) && (precs[iters - 1] + padding > 2 * startPrec))
    {
      precs[iters] = (precs[iters - 1] / 2) + padding;
      iters++;
  
      if (iters == FLINT_BITS)
      {
        return -1;
      }
    }
    return iters;
  }

  public static boolean computeNewtonStep(RealFunction f,
                                          Real point,
                                          Real convergenceRegion,
                                          Float convergenceFactor,
                                          int prec,
                                          Real nextPoint)
  {
    try ( Magnitude err = new Magnitude(); Magnitude v = new Magnitude(); Real t = new Real();
          Real u = Real.newVector(2))
    {
      Magnitude xRadius = point.getRad();
      xRadius.pow(2, err);
      convergenceFactor.getMagnitude(v).mul(err, err);
  
      t.setMid(point.getMid());
      t.getRad().zero();
  
      f.evaluate(t.get(0), 2, prec, u);
      u.get(0).div(u.get(1), prec);
      t.get(0).sub(u.get(0), prec, u.get(0));
      Magnitude uRadius = u.getRad();
      uRadius.add(err, uRadius);
  
      if (convergenceRegion.contains(u) && uRadius.compareTo(xRadius) < 0)
      {
        nextPoint.get(0).swap(u);
        return true;
      }
      else
      {
        nextPoint.get(0).set(point);
        return false;
      }
    }
  }

  public static int calculatePartition(RealFunction realFunction,
                                       FloatInterval left,
                                       FloatInterval right,
                                       FloatInterval block,
                                       int prec)
  {
    try ( Real t = new Real(); Real m = new Real();)
    {
      Float u = m.getMid();
  
      /* Compute the midpoint */
      block.getA().add(block.getB(), prec, RoundingMode.Down, u).half(u);
  
      /* Evaluate the function at the midpoint so the sign can be returned */
      int sign = realFunction.evaluate(m, 1, prec, t).sign();
  
      /* split the interval at the midpoint */
      left.setA(block.getA());
      left.setB(u);
      right.setA(u);
      right.setB(block.getB());
  
      return sign;
    }
  }

  public static RefinementResult refineRootViaNewtonsMethod(RealFunction f,
                                                            Real root,
                                                            Real convergenceRegion,
                                                            Float convergenceFactor,
                                                            int extraPrec,
                                                            int prec)
  {
    int precs[] = new int[FLINT_BITS];
    int iters, startPrec = root.relAccuracyBits();
  
    if ((iters = determineNewtonStepScalingPrecisions(convergenceFactor, prec, precs, startPrec)) == -1)
    {
      return RefinementResult.ImpreciseInput;
    }
  
    return calculateNewtonSteps(f, root, convergenceRegion, convergenceFactor, extraPrec, precs, iters);
  }

}
