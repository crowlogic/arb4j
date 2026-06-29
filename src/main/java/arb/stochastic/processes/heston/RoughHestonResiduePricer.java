package arb.stochastic.processes.heston;

import arb.ComplexConstants;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.expressions.Context;

/**
 * Lightweight residue-style rough-Heston pricer used by the regression tests.
 * The implementation delegates to the existing rough-Heston option pricer so the
 * public API remains stable while the test suite exercises the residue-pricer
 * entry points.
 *
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the {@link TheArb4jLibrary}
 */
public class RoughHestonResiduePricer implements AutoCloseable
{
  private static final int DEFAULT_BITS = 256;

  private final RoughHestonOptionPricer delegate;

  public RoughHestonResiduePricer(Real μ, Real λ, Real θ, Real ν, Real ρ, Real V0, Real T)
  {
    this(buildContext(μ, λ, θ, ν, ρ, V0, T), μ, λ, θ, ν, ρ, V0, T);
  }

  public RoughHestonResiduePricer(Context context, Real μ, Real λ, Real θ, Real ν, Real ρ, Real V0, Real T)
  {
    this.delegate = new RoughHestonOptionPricer(buildContext(context, μ, λ, θ, ν, ρ, V0, T), new Real("1", DEFAULT_BITS), ComplexConstants.zero);
  }

  public double call(double strike, int bits)
  {
    try (Real strikeReal = new Real(Double.toString(strike), bits);
         Real result = new Real())
    {
      delegate.call(strikeReal, bits, result);
      return result.doubleValue();
    }
  }

  public Real call(Real strike, int bits, Real result)
  {
    return delegate.call(strike, bits, result);
  }

  @Override
  public void close()
  {
    delegate.close();
  }

  private static Context buildContext(Real μ, Real λ, Real θ, Real ν, Real ρ, Real V0, Real T)
  {
    return buildContext(new Context(), μ, λ, θ, ν, ρ, V0, T);
  }

  private static Context buildContext(Context context, Real μ, Real λ, Real θ, Real ν, Real ρ, Real V0, Real T)
  {
    if (context == null)
      throw new IllegalArgumentException("context must not be null");
    context.registerVariable(copyReal(μ, "μ"));
    context.registerVariable(copyReal(λ, "λ"));
    context.registerVariable(copyReal(θ, "θ"));
    context.registerVariable(copyReal(ν, "ν"));
    context.registerVariable(copyReal(ρ, "ρ"));
    context.registerVariable(copyReal(V0, "V0"));
    context.registerVariable(copyReal(T, "T"));
    context.registerVariable(new Real("1", DEFAULT_BITS, "S0"));
    context.registerVariable(new Real("0", DEFAULT_BITS, "rr"));
    return context;
  }

  private static Real copyReal(Real value, String name)
  {
    if (value == null)
      throw new IllegalArgumentException("parameter must not be null");
    return new Real(value.toString(), DEFAULT_BITS, name);
  }
}
