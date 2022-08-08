package arb.functions.real;

import static arb.utensils.Utilities.println;
import static java.lang.Math.max;
import static java.lang.String.format;
import static java.lang.System.out;
import java.lang.Integer;

import arb.*;
import arb.Float;
import arb.FloatInterval.RootStatus;
import arb.RealRootInterval.RefinementResult;
import arb.functions.Function;

/**
 * Interface which defines a function from ℝ -> ℝ where ℝ is the set of real
 * number
 */
@FunctionalInterface
public interface RealFunction extends
                              Function<Real, Real>
{

  public static final int FLINT_BITS = 64;
  public boolean          verbose    = false;

  /**
   * Performs one step of Newton's method. Should not usually be called directly
   * unless
   * {@link RealFunction#refineRootNewton(Real, Real, Float, int, int, boolean)}
   * fails to suit your needs
   * 
   * @param point
   * @param convergenceRegion the interval I
   * @param convergenceFactor
   * @param prec
   * @param nextPoint
   * 
   * @return C=the supremum of |f''(t)|/(2*|f'(t)| over {t,u}∈I
   */
  public default boolean
         calculateNewtonStep(Real point, Real convergenceRegion, Float convergenceFactor, int prec, Real nextPoint)
  {
    try ( Magnitude err = new Magnitude(); Magnitude v = new Magnitude(); Real t = new Real();
          Real u = Real.newVector(2))
    {
      Magnitude xRadius = point.getRad();
      xRadius.pow(2, err);
      convergenceFactor.getMagnitude(v).mul(err, err);

      t.setMid(point.getMid());
      t.getRad().zero();

      evaluate(t, 2, prec, u).div(u.get(1), prec, u);

      t.sub(u, prec, u);
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
  };

  /**
   * Refines the precision of a root. Should not be called directly unless
   * {@link RealRootInterval#refine(RealFunction, int, int, Real, Real, RealRootInterval, RealRootInterval, Float, boolean)}
   * fails to suit your needs
   * 
   * @param root
   * @param convergenceRegion
   * @param convergenceFactor
   * @param extraPrec
   * @param prec
   * @param verbose
   * @return a {@link RefinementResult} indicating the status
   */
  public default RefinementResult refineRootNewton(Real root,
                                                   Real convergenceRegion,
                                                   Float convergenceFactor,
                                                   int extraPrec,
                                                   int prec,
                                                   boolean verbose)
  {
    int precs[] = new int[FLINT_BITS];
    int i, iters, workingPrecision, startPrec;

    startPrec = arb.arb_rel_accuracy_bits(root);

    if (verbose)
    {
      System.out.format("Newton initial accuracy: %d\n", startPrec);
    }

    int padding = Math.max(0, Math.min(arb.arf_abs_bound_lt_2exp_si(convergenceFactor), prec) + 5);
    precs[0] = prec + padding;
    iters    = 1;
    while ((iters < FLINT_BITS) && (precs[iters - 1] + padding > 2 * startPrec))
    {
      precs[iters] = (precs[iters - 1] / 2) + padding;
      iters++;

      if (iters == FLINT_BITS)
      {
        return RefinementResult.ImpreciseInput;
      }
    }

    if (verbose)
    {
      System.out.println("iters=" + iters);
    }
    for (i = iters - 1; i >= 0; i--)
    {
      workingPrecision = precs[i] + extraPrec;

      if (verbose)
      {
        System.out.printf("Newton step: wp = %03d + %03d = %03d      r=%s digits=%s\n",
                          precs[i],
                          extraPrec,
                          workingPrecision,
                          root.toString(root.digits()),
                          root.digits());
      }

      if (!calculateNewtonStep(root, convergenceRegion, convergenceFactor, workingPrecision, root))
      {
        return RefinementResult.NoConvergence;
      }
    }

    return RefinementResult.Success;
  }

  /**
   * Given an interval specified by convergenceRegion, evaluates a bound for
   * $C=sup{t,u}∈I(|f''(t)|/(2*|f'(t)|))$. The bound is obtained by calling
   * this{@link #evaluate(Real, int, int, Real)} directly. If this function is
   * ill-conditioned, then convergenceRegion which specifies the interval I may
   * need to be extremely precise in order to get an effectively finite bound for
   * C.
   * 
   * @param convergenceRegion I
   * @param jet               Real 3-vector to hold the results [f,f',f''] from
   *                          calling this{@link #evaluate(Real, int, int, Real)}
   * @param prec
   * @param convergenceFactor
   * 
   * @return C
   */
  public default Float
         getNewtonConvergenceFactor(Real convergenceRegion, Real jet, int prec, Float convergenceFactor)
  {
    assert jet.size() >= 3;
    evaluate(convergenceRegion, 3, prec, jet).get(2).div(jet.get(1), prec, jet);
    arb.arb_mul_2exp_si(jet, jet, -1);
    arb.arb_get_abs_ubound_arf(convergenceFactor, jet, prec);

    return convergenceFactor;
  }

  /**
   * <code>
   * Rigorously locates single roots of this function on the interior of an interval.
   * 
   * {@link Roots} has the following properties: <br><br>
   * 
   * 1. The function has no roots on interval outside of the output subintervals.<br><br>
   * 
   * 2. Subintervals are sorted in increasing order (with no overlap except possibly starting and ending with the same point).<br><br>
   * 
   * 3. Subintervals with a flag of 1 contain exactly one (single) root.<br><br>
   * 
   * 4. Subintervals with any other flag may or may not contain roots.<br><br>
   * 
   * 5. If no flags other than 1 occur, all roots of the function on interval have been located.<br><br>
   *  
   * If there are output subintervals on which the existence or nonexistence of roots could not be determined, 
   * further searches on those subintervals may be attempted with possibly with increased precision and/or increased bounds for 
   * the breaking criteria. 
   * 
   * Note that roots of multiplicity higher than one and roots located exactly at endpoints cannot be located by this function.
   
   * The following breaking criteria are implemented:
   * At most maxdepth recursive subdivisions are attempted therefore the smallest details that can be distinguished are therefore 
   * about maxdepth times the width of interval. 
   * 
   * The total number of calls to this{@link #evaluate(Real, int, int, Real)} is thereby restricted to a small multiple of maxeval;
   * the actual count can be slightly higher depending on implementation details. 
   * </code>
   * 
   * NOTICE: it is assumed that subdivision points of interval can be represented
   * exactly as floating-point numbers in memory.
   * 
   * For instance, the following will not produce reliable results:
   * 1+/-2^(-10^(100))
   * 
   * @param interval the region with which to locate the roots
   * @param maxDepth Between 20 and 50 is usually sufficient for almost all
   *                 functions
   * @param maxEvals If the total number of tested subintervals exceeds maxeval,
   *                 the algorithm is terminated and any untested subintervals are
   *                 added to the output. Between 100 and 100000 is usually
   *                 sufficient.
   * @param maxFound The algorithm terminates if maxfound roots have been located.
   *                 In particular, setting maxfound to 1 can be used to locate
   *                 just one root of the function even if there are numerous
   *                 roots. To try to find all roots, LONG_MAX may be passed.
   * @param prec     denotes the precision used to evaluate the function. It is
   *                 possibly also used for some other arithmetic operations
   *                 performed internally by the algorithm. Note that it probably
   *                 does not make sense for maxdepth to exceed prec.
   * @return a new instance of {@link Roots}
   */
  public default Roots locateRoots(RootLocatorOptions config)
  {
    assert config.maxDepth > 1 : "you probably dont really want the max recursion limit to be less than 2";
    Roots            roots    = new Roots();
    int              asign, bsign;
    long             length   = 0, alloc = 0;
    RealRootInterval interval = config.interval;
    int              prec     = config.prec;

    if (verbose)
    {
      println(String.format("%s.locateRoots(options=%s)", this, config));
    }

    try ( Real m = new Real(); Real v = new Real();)
    {
      m.setMid(interval.getA());
      roots.evals++;
      asign = evaluate(m, 1, prec, v).sign();

      m.setMid(interval.getB());
      roots.evals++;
      bsign = evaluate(m, 1, prec, v).sign();
    }

    recursivelyLocateRoots(roots, interval, asign, bsign, 0, config);

    return roots;
  }

  /**
   * This function shouldn't usually be called directly unless
   * this{@link #locateRoots(RootLocatorOptions)} fails to suit your needs
   * 
   * @param found
   * @param root
   * @param asign
   * @param bsign
   * @param depth
   * @param config
   */
  public default void recursivelyLocateRoots(Roots found,
                                             RealRootInterval root,
                                             int asign,
                                             int bsign,
                                             int depth,
                                             RootLocatorOptions config)
  {
    if (verbose)
    {
      println(format("%s.recursivelyLocateRoots(found=%s, root=%s, asign=%d, bsign=%d, depth=%d)\n",
                     this,
                     found,
                     root,
                     asign,
                     bsign,
                     depth,
                     config));
    }
    try ( RealRootInterval realRootInterval = new RealRootInterval();)
    {
      realRootInterval.set(root);
      if (found.evals >= config.maxEvals || found.size() >= config.maxFound)
      {
        if (verbose)
        {
          println("the configured limit was hit at " + realRootInterval + " where the configuration is " + config
                        + " and currently at " + found);
        }
        found.add(realRootInterval);
      }
      else
      {
        RootStatus status = root.determineRootStatus(found, this, asign, bsign, config.prec);
        if (status == RootStatus.NoRoot)
        {
          realRootInterval.close();
          return;
        }

        if (status == RootStatus.RootLocated || depth >= config.maxDepth)
        {

          realRootInterval.status = status;
          if (verbose)
          {
            println("located root within the interval " + realRootInterval);
          }
          found.add(realRootInterval.set(root));
        }
        else
        {
          realRootInterval.close();
          if (!root.split(this, found, asign, bsign, depth, config))
          {
            out.println("Possible zero at midpoint of " + this);
          }
        }
      }
    }
  }

  /**
   * 
   * @param left  output
   * @param right output
   * @param block input: the interval to be partitioned
   * @param prec
   * @return the sign of this function evaluated at the midpoint of block with a
   *         zero radius of uncertainty
   */
  public default int calculatePartition(FloatInterval left, FloatInterval right, FloatInterval block, int prec)
  {
    try ( Real t = new Real(); Real m = new Real(); Float u = new Float();)
    {

      /* Compute the midpoint */
      arb.arf_add(u, block.getA(), block.getB(), Integer.MAX_VALUE, IntegerConstants.ARF_RND_DOWN);
      u.half(u);

      /* Evaluate the function at the midpoint so the sign can be returned */
      int sign = evaluate(m.set(u), 1, prec, t).sign();

      /* split the interval at the midpoint */
      left.setA(block.getA());
      left.setB(u);
      right.setA(u);
      right.setB(block.getB());

      if (verbose)
      {
        println(String.format("calculatePartition: u=%s sign=%s\n left=%s\n right=%s\n", u, sign, left, right));
      }

      return sign;
    }

  }

  /**
   * 
   * @param t
   * @return the multiplicity of the root at the point t or 0 if there is no root
   *         there
   */
  public default int multiplicityOfRoot(Real t)
  {
    assert false : "TODO: implement me in " + getClass();
    return 0;
  }

  /**
   * 
   * @return the first inverse branch, or the only one if there is only one, which
   *         is the case if the function is properly invertable
   */
  public default RealFunction inverse()
  {
    return inverse(0);
  }

}