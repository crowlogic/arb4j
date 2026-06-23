package arb;

import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
import arb.documentation.TheArb4jLibrary;

/**
 * Fraction field of an integral domain ring, parameterized by the Java type
 * {@code T} of the domain's elements. Wraps FLINT's
 * {@code gr_ctx_init_gr_fraction}.
 *
 * <p>An element of {@code GenericFraction<T>} is a pair (numerator,
 * denominator) of {@code T}-typed values. The numerator and denominator
 * accessors return values of type {@code T}, matching the underlying
 * domain ring's element type, so the Java compiler enforces that the
 * caller never mixes a fraction over (say) {@link Complex} with a fraction
 * over {@link Real}.</p>
 *
 * <p>The wrapped C-level domain ring instance is passed to every operation
 * via the {@link #domain} field; FLINT requires it for arithmetic and for
 * cross-ring conversions. The Java generic {@code <T>} provides the
 * compile-time type-safety guarantee; the FLINT-side identity guarantee is
 * the {@link #domain} field.</p>
 *
 * @param <T> Java type of the domain ring's elements
 * @see BusinessSourceLicenseVersionOnePointOne © terms of the
 *      {@link TheArb4jLibrary}
 */
public final class GenericFraction<T> extends
                                  GenericRing
{
  /** The integral domain whose fraction field this is. */
  public final GenericRing domain;

  /**
   * Construct the fraction field of the supplied integral domain. The Java
   * type parameter {@code <T>} must match the domain's element type.
   */
  public GenericFraction(GenericRing domain)
  {
    super();
    this.domain = domain;
    arblib.gr_ctx_init_gr_fraction(this, domain, 0);
  }
}
