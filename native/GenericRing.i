/*
 * SWIG bindings for FLINT's generic-ring layer.
 *
 *   gr_ctx_struct  →  arb.GenericRing            (the ring context)
 *   gr_poly_struct →  arb.GenericRingPolynomial  (polynomial over the ring)
 *
 * Renames are in arb.i; this file declares which gr_* C functions are exposed
 * to Java. SWIG generates the JNI thunks and Java wrappers automatically.
 */

/* IMPORTANT: javacode/javaimports/javafinalize typemaps must be declared
 * BEFORE the struct they decorate is parsed, otherwise SWIG silently ignores
 * them and emits a bare wrapper with no factory methods or ops. */

%typemap(javaimports) gr_ctx_struct %{
  import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
  import arb.documentation.TheArb4jLibrary;
%}
%typemap(javafinalize) gr_ctx_struct ""

%typemap(javacode) gr_ctx_struct %{
  static { System.loadLibrary("arblib"); }

  /**
   * ℂ via acb ball arithmetic at the requested working precision.
   * Wraps {@code gr_ctx_init_complex_acb}.
   *
   * @deprecated prefer {@code new GenericFraction<Complex>(...)} or other
   *             specifically-typed subclasses of {@link GenericRing} where
   *             the element type is encoded in Java generics.
   */
  public static GenericRing complexBalls(int prec)
  {
    GenericRing ctx = new GenericRing();
    arblib.gr_ctx_init_complex_acb(ctx, prec);
    return ctx;
  }

  /**
   * ℝ via arb ball arithmetic at the requested working precision.
   * Wraps {@code gr_ctx_init_real_arb}.
   */
  public static GenericRing realBalls(int prec)
  {
    GenericRing ctx = new GenericRing();
    arblib.gr_ctx_init_real_arb(ctx, prec);
    return ctx;
  }

  /**
   * The univariate polynomial ring {@code base[x]}. Wraps
   * {@code gr_ctx_init_gr_poly}.
   */
  public static GenericRing polynomialsOver(GenericRing base)
  {
    GenericRing ctx = new GenericRing();
    arblib.gr_ctx_init_gr_poly(ctx, base);
    return ctx;
  }

  /**
   * The fraction field of the supplied integral domain. Wraps
   * {@code gr_ctx_init_gr_fraction}.
   *
   * @deprecated prefer {@code new GenericFraction<T>(domain)} where the
   *             element type {@code T} is encoded in Java generics.
   */
  public static GenericRing fractionFieldOf(GenericRing domain)
  {
    GenericRing ctx = new GenericRing();
    arblib.gr_ctx_init_gr_fraction(ctx, domain, 0);
    return ctx;
  }

  /**
   * Copy the numerator of the single coefficient of a degree-0 polynomial
   * in {@code this} (which must be a fraction field whose domain is
   * {@code polynomialsOver(complexBalls(…))}) into {@code out}.
   */
  public ComplexPolynomial fractionNumerator(GenericRingPolynomial fractionPoly,
                                             ComplexPolynomial out)
  {
    SWIGTYPE_p_void elem = arblib.arblib_gr_poly_coeff0_ptr(fractionPoly);
    arblib.arblib_gr_fraction_numerator_acb_poly(out, elem, this);
    return out;
  }

  /**
   * Copy the denominator of the single coefficient of a degree-0 polynomial
   * in {@code this} (a fraction field over {@code polynomialsOver(complexBalls(…))})
   * into {@code out}.
   */
  public ComplexPolynomial fractionDenominator(GenericRingPolynomial fractionPoly,
                                               ComplexPolynomial out)
  {
    SWIGTYPE_p_void elem = arblib.arblib_gr_poly_coeff0_ptr(fractionPoly);
    arblib.arblib_gr_fraction_denominator_acb_poly(out, elem, this);
    return out;
  }
%}

%typemap(javaimports) gr_poly_struct %{
  import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
  import arb.documentation.TheArb4jLibrary;
%}
%typemap(javafinalize) gr_poly_struct ""

%typemap(javacode) gr_poly_struct %{
  static { System.loadLibrary("arblib"); }

  /**
   * Construct a fresh, initialised polynomial in the given ring.
   * Wraps {@code gr_poly_init}.
   */
  public static GenericRingPolynomial in(GenericRing ring)
  {
    GenericRingPolynomial p = new GenericRingPolynomial();
    arblib.gr_poly_init(p, ring);
    return p;
  }

  /** Set this polynomial to 0 in the given ring. */
  public GenericRingPolynomial zero(GenericRing ring)
  {
    arblib.gr_poly_zero(this, ring);
    return this;
  }

  /** Set this polynomial to 1 in the given ring. */
  public GenericRingPolynomial one(GenericRing ring)
  {
    arblib.gr_poly_one(this, ring);
    return this;
  }

  /** Set the n-th coefficient of this polynomial to the integer x. */
  public GenericRingPolynomial setCoeff(int n, int x, GenericRing ring)
  {
    arblib.gr_poly_set_coeff_si(this, n, x, ring);
    return this;
  }

  /**
   * Set the n-th coefficient of this polynomial to the value of an
   * {@link ComplexPolynomial} interpreted as an element of
   * {@code polynomialsOver(complexBalls(…))} — the supplied {@code domain}
   * ring — lifted into the ring of this polynomial via
   * {@code gr_set_other}.
   *
   * <p>This is the canonical way to lift a {@link ComplexPolynomial} into a
   * polynomial-over-fraction-field carrier: the conversion is done by FLINT
   * via the universal cross-ring set operation, no Java-side splice.</p>
   *
   * @param n              coefficient index
   * @param numerator      source value, an element of {@code domain}
   * @param domain         the source ring (must equal
   *                       {@code polynomialsOver(complexBalls(…))})
   * @param ring           the ring of {@code this}
   */
  public GenericRingPolynomial setCoeff(int n, ComplexPolynomial numerator, GenericRing domain, GenericRing ring)
  {
    SWIGTYPE_p_void src = new SWIGTYPE_p_void(ComplexPolynomial.getCPtr(numerator), false);
    arblib.arblib_gr_poly_set_coeff_from_other(this, n, src, domain, ring);
    return this;
  }

  /** Set this polynomial to {@code src} in the given ring. */
  public GenericRingPolynomial set(GenericRingPolynomial src, GenericRing ring)
  {
    arblib.gr_poly_set(this, src, ring);
    return this;
  }

  /** Negate this polynomial into {@code result}. */
  public GenericRingPolynomial neg(GenericRing ring, GenericRingPolynomial result)
  {
    arblib.gr_poly_neg(result, this, ring);
    return result;
  }

  /** {@code result = this + other}. */
  public GenericRingPolynomial add(GenericRingPolynomial other, GenericRing ring, GenericRingPolynomial result)
  {
    arblib.gr_poly_add(result, this, other, ring);
    return result;
  }

  /** {@code result = this - other}. */
  public GenericRingPolynomial sub(GenericRingPolynomial other, GenericRing ring, GenericRingPolynomial result)
  {
    arblib.gr_poly_sub(result, this, other, ring);
    return result;
  }

  /** {@code result = this * other}. */
  public GenericRingPolynomial mul(GenericRingPolynomial other, GenericRing ring, GenericRingPolynomial result)
  {
    arblib.gr_poly_mul(result, this, other, ring);
    return result;
  }

  /** {@code result = this / divisor} — valid only when the ring is a field
   * (e.g. {@link GenericRing#fractionFieldOf}) or the division is exact. */
  public GenericRingPolynomial div(GenericRingPolynomial divisor, GenericRing ring, GenericRingPolynomial result)
  {
    arblib.gr_poly_div(result, this, divisor, ring);
    return result;
  }

  /** {@code result = d(this)/dx}. */
  public GenericRingPolynomial derivative(GenericRing ring, GenericRingPolynomial result)
  {
    arblib.gr_poly_derivative(result, this, ring);
    return result;
  }

  /** Degree of this polynomial (= {@code length - 1}). */
  public int degree()
  {
    return Math.max(0, getLength() - 1);
  }
%}

/* Layout-mirroring struct declarations + length-1-array typedefs, identical
 * to the FLINT header. SWIG needs these so it can parse function signatures
 * involving gr_ctx_t / gr_poly_t / gr_vec_t. */

#define GR_CTX_STRUCT_DATA_BYTES (6 * sizeof(unsigned long))

typedef struct
{
    char data[GR_CTX_STRUCT_DATA_BYTES];
    unsigned long which_ring;
    slong sizeof_elem;
    void * methods;
    unsigned long size_limit;
}
gr_ctx_struct;

typedef gr_ctx_struct gr_ctx_t[1];

typedef void * gr_ptr;
typedef const void * gr_srcptr;

typedef struct
{
    gr_ptr coeffs;
    slong alloc;
    slong length;
}
gr_poly_struct;

typedef gr_poly_struct gr_poly_t[1];

typedef struct
{
    gr_ptr entries;
    slong alloc;
    slong length;
}
gr_vec_struct;

typedef gr_vec_struct gr_vec_t[1];

/* Ring-context constructors (from <flint/gr.h>) */
void gr_ctx_init_complex_acb(gr_ctx_t ctx, slong prec);
void gr_ctx_init_real_arb(gr_ctx_t ctx, slong prec);
void gr_ctx_init_gr_poly(gr_ctx_t ctx, gr_ctx_t base_ring);
void gr_ctx_init_gr_fraction(gr_ctx_t ctx, gr_ctx_t domain, int flags);

/* gr_ctx_clear is GR_INLINE in <flint/gr.h>; expose via a tiny stub in
   Functions.i if needed. For now, callers must not need to clear contexts. */

/* Polynomial lifecycle (from <flint/gr_poly.h>) */
void gr_poly_init(gr_poly_t poly, gr_ctx_t ctx);
void gr_poly_init2(gr_poly_t poly, slong len, gr_ctx_t ctx);
void gr_poly_clear(gr_poly_t poly, gr_ctx_t ctx);

/* Polynomial arithmetic. The WARN_UNUSED_RESULT-returning int variants
   propagate success/failure across rings (e.g. division in a ring where
   the divisor isn't a unit). */
int gr_poly_set(gr_poly_t res, const gr_poly_t src, gr_ctx_t ctx);
int gr_poly_zero(gr_poly_t poly, gr_ctx_t ctx);
int gr_poly_one(gr_poly_t poly, gr_ctx_t ctx);
int gr_poly_neg(gr_poly_t res, const gr_poly_t src, gr_ctx_t ctx);
int gr_poly_add(gr_poly_t res, const gr_poly_t poly1, const gr_poly_t poly2, gr_ctx_t ctx);
int gr_poly_sub(gr_poly_t res, const gr_poly_t poly1, const gr_poly_t poly2, gr_ctx_t ctx);
int gr_poly_mul(gr_poly_t res, const gr_poly_t poly1, const gr_poly_t poly2, gr_ctx_t ctx);
int gr_poly_div(gr_poly_t Q, const gr_poly_t A, const gr_poly_t B, gr_ctx_t ctx);
int gr_poly_derivative(gr_poly_t res, const gr_poly_t poly, gr_ctx_t ctx);

int gr_poly_set_coeff_si(gr_poly_t poly, slong n, slong x, gr_ctx_t ctx);
int gr_poly_set_coeff_fmpz(gr_poly_t poly, slong n, const fmpz_t x, gr_ctx_t ctx);

int gr_poly_evaluate(gr_ptr res, const gr_poly_t poly, gr_srcptr x, gr_ctx_t ctx);
int gr_poly_roots(gr_vec_t roots, gr_vec_t mult, const gr_poly_t poly, int flags, gr_ctx_t ctx);
