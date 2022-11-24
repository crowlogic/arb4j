package arb.functions.real.dynamics;

import static java.lang.Math.abs;
import static java.lang.Math.pow;

import arb.Real;
import arb.exceptions.NotDifferentiableException;
import arb.functions.real.RealFunction;

/**
 * <code>t-f(t)/f'(t)</code>
 *
 * @author Isaac Newton
 * @author Stephen Crowley
 */
public class RealNewtonMap<F extends RealFunction> implements
                          RealDynamicalSystem
{
  public boolean verbose = false;

  /**
   * Iteratively invokes this{@link #evaluate(Real, int, int, Real)} specific
   * number of times
   * 
   * @param z
   * @param n
   * @param prec
   * @param w
   * @return the number to which the iteration converged, regardless of whether it
   *         converged or not
   */
  public Real iterate(Real _z, int n, int prec, Real w)
  {
    try ( Real z = new Real(_z))
    {
      for (int i = 0; i < n; i++)
      {

        evaluate(z, 2, prec, w);
        w.printPrecision = true;
        if (verbose)
        {
          System.out.println("w=" + w);
        }
        z.set(w);
        if (abs(w.get(1).doubleValue()) < pow(10, -30))
        {
          if (verbose)
          {
            System.out.println("Converged in " + (i + 1) + " steps...");
          }
          break;

        }
      }
    }

    return w;
  }

  public Real r;

  public RealNewtonMap(F f)
  {
    this.f = f;
  }

  public RealNewtonMap(F f, Real r)
  {
    this.f = f;
    this.r = r;
  }

  public F           f;

  final RealFunction diff = (t, order, prec, w) ->
                          {
                            try ( Real s = Real.newVector(3);)
                            {
                              f.evaluate(t, 3, prec, s);
                              // w = f(t)*f''(t)
                              Real numerator   = s.mul(s.get(2), prec, w);
                              // s[0] = f'(t)²
                              Real denominator = s.get(1).pow(2, prec, s.get(0));
                              // w = (f(t)*f''(t)) / (f'(t))²
                              numerator.div(denominator, prec, w);
                              evaluatePole(t, prec, w, true);
                              return w;
                            }
                          };

  protected Real evaluatePole(Real t, int prec, Real w, boolean b)
  {
    assert t != w;
    if (!w.isFinite())
    {
      if (b)
      {
        w.one().div(f.multiplicityOfRoot(t), prec);
      }
      else
      {
        w.zero();
      }
    }
    return w;
  }

  @Override
  public Real evaluate(Real z, int order, int prec, Real w)
  {
    assert order <= 2 : String.format("specified order %d is only implemented (in this version) up to order 2",
                                      order);
    assert w.size() >= order;
    try ( Real y = Real.newVector(3))
    {
      if (order >= 1)
      {
        f.evaluate(z, 2, prec, y).div(y.get(1), prec, w);
        evaluatePole(z, prec, w, false).tanh(prec, w);
        if (r != null)
        {
          w.mul(r, prec, w);
        }
        z.sub(w, prec, w);

        if (order >= 2)
        {
          diff.evaluate(z, 1, prec, w.get(1));

        }
      }
    }
    return w;
  }

  /**
   * @return (f(t)*f''(t))/(f'(t)^2)
   */
  @Override
  public RealFunction differential() throws NotDifferentiableException
  {
    return diff;
  }

  @Override
  public RealFunction inverse()
  {
    assert false : "todo";
    return null;
  }

}
