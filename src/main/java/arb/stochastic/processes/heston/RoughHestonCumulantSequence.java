package arb.stochastic.processes.heston;

import java.util.ArrayList;
import java.util.List;

import arb.Complex;
import arb.ComplexPolynomial;
import arb.Integer;
import arb.Real;
import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;
import arb.functions.complex.ComplexPolynomialNullaryFunction;
import arb.functions.integer.RealSequence;

/**
 * The cumulants of a Müntz-lattice model read off its cumulant generating
 * function Φ(v) = Σ_k d_k(v)·T^{kμ+1} as point-derivatives, never as indexed
 * coefficients:
 *
 * <pre>
 *   κ_m = Re( (−i)^m · Φ^{(m)}(0) ).
 * </pre>
 *
 * Φ is the already-formed {@link ComplexPolynomial}; its m-th derivative is the
 * ring operation {@code acb_poly_derivative} applied m times, and Φ^{(m)}(0) is
 * Horner point-evaluation ({@code acb_poly_evaluate}). No coefficient array is
 * ever accessed — the construction stays a ring/field operation throughout, per
 * crowlogic/arb4j#1022.
 *
 * @author Stephen Crowley ©2026
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class RoughHestonCumulantSequence implements
                                              RealSequence
{
  private final ComplexPolynomialNullaryFunction cgf;

  /**
   * The cumulant generating polynomial Φ and its successive derivatives
   * {@code [Φ, Φ', Φ'', …]}, formed once per parameter set and shared by
   * reference across every cumulant order m, every Edgeworth–Hermite order J,
   * and every strike. Φ = Σ_k T^{kμ+1}·d_k{k=0..∞} depends ONLY on the model
   * parameters and T — none of which vary while a single price (or its
   * ε-derivative) is accumulated — so the previous implementation, which called
   * {@code cgf.evaluate} on every κ(m) request, rebuilt the identical Σ over
   * k=0..∞ O(M·J) times per price (the dominant cost in a calibration profile).
   * Held until {@link #invalidateCache()} drops it on a parameter / maturity /
   * derivative-seed change (every such change routes through
   * {@code pricingContext.invalidateAllCaches()}, which invokes this method on
   * the registered κ/dκ sequences).
   */
  private final List<ComplexPolynomial>          derivatives = new ArrayList<>();

  /** Precision Φ and its chain currently hold; a request for more bits reforms. */
  private int                                    cachedBits  = -1;

  private final Complex                          origin      = new Complex();
  private final Complex                          value       = new Complex();

  public RoughHestonCumulantSequence(ComplexPolynomialNullaryFunction cgf)
  {
    this.cgf = cgf;
  }

  @Override
  public Real evaluate(Integer index, int order, int bits, Real result)
  {
    int m = index.getSignedValue();
    if (cachedBits < bits)
    {
      clearDerivatives();
      ComplexPolynomial Φ = new ComplexPolynomial();
      cgf.evaluate(bits, Φ);                              // form Φ once, as a ring element
      derivatives.add(Φ);
      cachedBits = bits;
    }
    while (derivatives.size() <= m)                       // extend the chain by one derivative
    {
      ComplexPolynomial derivative = new ComplexPolynomial();
      derivatives.get(derivatives.size() - 1).differentiate(cachedBits, derivative);
      derivatives.add(derivative);                        // acb_poly_derivative — ring op, no index
    }
    {
      origin.zero();
      derivatives.get(m).evaluate(origin, 1, bits, value); // Φ^{(m)}(0) by Horner — no coefficient read
      switch (m & 3)                                       // (−i)^m : 1, −i, −1, i
      {
      case 0:
        result.set(value.re());
        break;
      case 1:
        result.set(value.im());
        break;
      case 2:
        value.re().neg(result);
        break;
      default:
        value.im().neg(result);
        break;
      }
    }
    return result;
  }

  @Override
  public void invalidateCache()
  {
    clearDerivatives();
    cachedBits = -1;
  }

  @Override
  public void invalidateLocalCache()
  {
    // Φ depends only on this sequence's own inputs (the cgf), so the local
    // (non-propagating) invalidation drops it exactly as invalidateCache does —
    // this is the path Context.invalidateAllCaches() takes to reach κ/dκ.
    clearDerivatives();
    cachedBits = -1;
  }

  private void clearDerivatives()
  {
    for (ComplexPolynomial derivative : derivatives)
    {
      derivative.close();
    }
    derivatives.clear();
  }

  @Override
  public void close()
  {
    clearDerivatives();
    origin.close();
    value.close();
  }

  @Override
  public Class<Integer> domainType()
  {
    return Integer.class;
  }

  @Override
  public Class<Real> coDomainType()
  {
    return Real.class;
  }
}
