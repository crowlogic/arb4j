package arb.functions.real;

import static arb.utensils.Utensils.*;
import static java.lang.String.format;
import static java.lang.System.out;

import java.io.Closeable;
import java.util.stream.IntStream;

import arb.*;
import arb.Float;
import arb.FloatInterval.RootStatus;
import arb.RealRootInterval.RefinementResult;
import arb.functions.Function;
import arb.functions.complex.HolomorphicFunction;
import arb.utensils.Utensils;

/**
 * The RealFunction interface, a part of the arb.functions.real package, is
 * designed for working with {@link Real}-valued functions. It offers
 * functionality for performing root-related operations, such as root
 * refinement, evaluating convergence factors, and locating roots within
 * intervals. The interface extends {@link Function}<Real, Real> and includes
 * default implementations for various techniques, including Newton's method.
 */
public interface RealFunction extends
                              Function<Real, Real>,
                              Closeable,
                              AutoCloseable
{
  @Override
  default void close()
  {
  }

  public default RealFunction sub(RealFunction that)
  {
    return (x, order, bits, result) ->
    {
      try ( Real y = new Real();)
      {
        return this.evaluate(x, order, bits, result).sub(that.evaluate(x, order, bits, y), bits, result);
      }
    };
  }

  public default RealFunction add(RealFunction that)
  {
    return (x, order, bits, result) ->
    {
      try ( Real y = new Real();)
      {
        return this.evaluate(x, order, bits, result).add(that.evaluate(x, order, bits, y), bits, result);
      }
    };
  }

  public default RealFunction mul(RealFunction that)
  {
    return (x, order, bits, result) ->
    {
      try ( Real y = new Real();)
      {
        return this.evaluate(x, order, bits, result).mul(that.evaluate(x, order, bits, y), bits, result);
      }
    };
  }

  public default RealFunction div(RealFunction that)
  {
    return (x, order, bits, result) ->
    {
      try ( Real y = new Real();)
      {
        return this.evaluate(x, order, bits, result).div(that.evaluate(x, order, bits, y), bits, result);
      }
    };
  }

  /**
   * Default to 128 bits for this{@link #quantize(double, double, int, int)}
   * 
   * @param left
   * @param right
   * @param n
   * @return
   */
  public default RealDataSet quantize(double left, double right, int n)
  {
    return quantize(left, right, n, false, Double.SIZE);
  }

  /**
   * Default to parallel=false for
   * this{@link #quantize(double, double, int, boolean, int)}
   * 
   * @param left
   * @param right
   * @param n
   * @param bits
   * @return
   */
  public default RealDataSet quantize(double left, double right, int n, int bits)
  {
    return quantize(left, right, n, false, bits);
  }

  /**
   * double-convenience method for
   * this{@link #quantize(FloatInterval, int, int, Real, boolean)}
   * 
   * @param left
   * @param right
   * @param n
   * @param parallel if true then multiple threads are used
   * @param bits
   * @return
   */
  public default RealDataSet quantize(double left, double right, int n, boolean parallel, int bits)
  {
    try ( FloatInterval I = new FloatInterval(left,
                                              right);)
    {
      return quantize(I, bits, n, parallel);
    }
  }

  /**
   * Default to 128 bits for this{@link #quantize(double, double, int, int)}
   * 
   * @param left
   * @param right
   * @param n
   * @param parallel
   * @return
   */
  public default RealDataSet quantize(double left, double right, int n, boolean parallel)
  {
    try ( FloatInterval I = new FloatInterval(left,
                                              right);)
    {
      return quantize(I, 128, n, parallel);
    }
  }

  /**
   * Generate a {@link RealPartition} covering the specified interval and call
   * this{@link #evaluate(Real, int, int, Real)} at each of the n points of the
   * partition.
   * 
   * 
   * @param interval
   * @param bits
   * @param n
   * @param values
   * @param parallel TODO
   * @return values
   */
  public default RealDataSet quantize(FloatInterval interval, int bits, int n, boolean parallel)
  {
    RealDataSet sample = new RealDataSet(toString() + " over " + interval.left().toString(5) + ".."
                  + interval.right().toString(5),
                                         n);
    Real        values = sample.getRealYValues();

    try ( RealPartition mesh = interval.generateRealPartition(bits, false, sample.getRealXValues()))
    {
      IntStream range = IntStream.range(0, n);
      if (parallel)
      {
        range = range.parallel();
      }
      range.forEach(i -> evaluate(mesh.get(i), 1, bits, values.get(i)));
      return sample;
    }
  }

  /**
   * double wrapper for this{@link #evaluate(Real, int, int, Real)} which is
   * called with {@link Double#PRECISION} bits
   * 
   * @param t
   * @return the {@link Real#doubleValue()} applied to the result of the
   *         this{@link #evaluate(Real, int, int, Real)} method call
   */
  public default double eval(double t)
  {
    try ( var x = new Real(t))
    {
      return evaluate(x, 1, Double.PRECISION + 5, x).doubleValue(RoundingMode.Up);
    }
  }

  public default HolomorphicFunction asHolomorphicFunction()
  {
    return (z, order, prec, value) ->
    {
      assert z.im().isZero() : "the imaginary part of z should be zero but its not: z=" + z;
      value.im().zero();
      RealFunction.this.evaluate(z.re(), order, prec, value.re());
      return value;
    };
  }

  public boolean verbose = true;

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
    return computeNewtonStep(this, point, convergenceRegion, convergenceFactor, prec, nextPoint);
  }

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
    return refineRootViaNewtonsMethod(this, root, convergenceRegion, convergenceFactor, extraPrec, prec, verbose);
  }

  /**
   * Given an interval specified by convergenceRegion, evaluates a bound for
   * $C=sup{t,u}∈I(|f''(t)|/(2*|f'(t)|))$. The bound is obtained by calling
   * this{@link #evaluate(Real, int, int, Real)} directly. If this function is
   * ill-conditioned, then convergenceRegion which specifies the interval I may
   * need to be extremely precise in order to get an effectively finite bound for
   * C.
   * 
   * @param convergenceRegion the interval I
   * @param jet               Real 3-vector to hold the results [f,f',f''] from
   *                          calling this{@link #evaluate(Real, int, int, Real)}
   * @param prec
   * @param convergenceFactor
   * 
   * @return the convergenceFactor C after it has been assigned the result
   */
  public default Float
         getNewtonConvergenceFactor(Real convergenceRegion, Real jet, int prec, Float convergenceFactor)
  {
    assert jet.size() >= 3;
    arblib.arb_get_abs_ubound_arf(convergenceFactor,
                                  evaluate(convergenceRegion, 3, prec, jet).get(2)
                                                                           .div(jet.get(1), prec, jet)
                                                                           .mul2e(-1),
                                  prec);

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
   * @param bits     denotes the precision used to evaluate the function. It is
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
    return Utensils.calculatePartition(this, left, right, block, prec, verbose);
  }

  /**
   * 
   * @param t
   * @return the multiplicity of the root at the point t or 0 if there is no root
   *         there
   */
  public default int multiplicityOfRoot(Real t)
  {
    // assert false : "TODO: implement me in " + getClass();
    return 1;
  }

  /**
   * 
   * @return the first inverse branch, or the only one if there is only one, which
   *         is the case if the function is properly invertible
   */
  public default RealFunction inverse()
  {
    return inverse(0);
  }

  public default double integrate(double left, double right)
  {
    try ( Magnitude acceptableUncertainty = new Magnitude(1.0e-17); Real l = new Real(left);
          Real r = new Real(right); Real result = new Real())
    {
      IntegrationOptions opts = new IntegrationOptions();
      opts.verbose = true;
      return integrate(l, r, 64, acceptableUncertainty, opts, 128, result).doubleValue();
    }
  }

  /**
   * FIXME: there needs to be a sleeker alternative to specifying so many
   * parameters: create another integrate method that accepts a smaller set of
   * arguments and calls this one with a reasonable set of values
   * 
   * @param left
   * @param right
   * @param relativeAccuracyBitsGoal
   * @param absoluteErrorToleranceGoal
   * @param options
   * @param bits
   * @param res
   * @return
   */
  public default Real integrate(Real left,
                                Real right,
                                int relativeAccuracyBitsGoal,
                                Magnitude absoluteErrorToleranceGoal,
                                IntegrationOptions options,
                                int bits,
                                Real res)
  {
    return Integrators.integrate(this,
                                 left,
                                 right,
                                 relativeAccuracyBitsGoal,
                                 absoluteErrorToleranceGoal,
                                 options,
                                 bits,
                                 res);
  }
}