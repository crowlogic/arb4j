/*
 * SWIG bindings for FLINT's generic-ring layer.
 *
 *   gr_ctx_struct  →  arb.GenericRing            (the ring context)
 *   gr_poly_struct →  arb.GenericRingPolynomial  (polynomial over the ring)
 *
 * Renames are in arb.i; this file declares which gr_* C functions are exposed
 * to Java. SWIG generates the JNI thunks and Java wrappers automatically.
 */

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

%typemap(javaimports) gr_ctx_struct %{
  import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
  import arb.documentation.TheArb4jLibrary;
%}
%typemap(javafinalize) gr_ctx_struct ""

%typemap(javaimports) gr_poly_struct %{
  import arb.documentation.BusinessSourceLicenseVersionOnePointOne;
  import arb.documentation.TheArb4jLibrary;
%}
%typemap(javafinalize) gr_poly_struct ""

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
