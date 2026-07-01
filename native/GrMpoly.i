/*
 * SWIG interface exposing FLINT's generic multivariate polynomial ring
 * (gr_mpoly) as JNI-bound arblib.* methods. The symbols are exported through
 * the ordinary SWIG/JNI bridge — the java.lang.foreign (FFM) path is not used.
 *
 * The operations are wrapped as thin arb4j_* helpers so that the FLINT
 * gr_ctx_t / gr_mpoly_ctx_t / gr_mpoly_t array-typedefs collapse to plain
 * struct pointers that SWIG maps to opaque handles, and so that the ball
 * coefficient types (arb_struct == Real, acb_struct == Complex) are passed
 * directly.
 */

%{
#include <arb.h>
#include <acb.h>
#include <string.h>
#include <flint/flint.h>
#include <flint/mpoly_types.h>
#include <flint/gr.h>
#include <flint/gr_mpoly.h>

/* Context objects (gr_ctx_struct is used for both the base ring and the
 * multivariate polynomial ring — gr_mpoly_ctx_struct is a typedef of it). */

static gr_ctx_struct * arb4j_ctx_alloc(void)
{
  return (gr_ctx_struct *) flint_calloc(1, sizeof(gr_ctx_struct));
}

static void arb4j_ctx_free(gr_ctx_struct * ctx)
{
  flint_free(ctx);
}

static void arb4j_ctx_init_real(gr_ctx_struct * ctx, slong prec)
{
  gr_ctx_init_real_arb(ctx, prec);
}

static void arb4j_ctx_init_complex(gr_ctx_struct * ctx, slong prec)
{
  gr_ctx_init_complex_acb(ctx, prec);
}

static void arb4j_ctx_clear(gr_ctx_struct * ctx)
{
  gr_ctx_clear(ctx);
}

static void arb4j_mpoly_ctx_init(gr_ctx_struct * ctx, gr_ctx_struct * base, slong nvars, int ord)
{
  gr_mpoly_ctx_init(ctx, base, nvars, (ordering_t) ord);
}

static void arb4j_mpoly_ctx_clear(gr_ctx_struct * ctx)
{
  gr_mpoly_ctx_clear(ctx);
}

static int arb4j_mpoly_ctx_set_gen_names(gr_ctx_struct * ctx, const char ** names)
{
  return gr_mpoly_ctx_set_gen_names(ctx, names);
}

/* Multivariate polynomials. */

static gr_mpoly_struct * arb4j_mpoly_alloc(void)
{
  return (gr_mpoly_struct *) flint_calloc(1, sizeof(gr_mpoly_struct));
}

static void arb4j_mpoly_free(gr_mpoly_struct * poly)
{
  flint_free(poly);
}

static void arb4j_mpoly_init(gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  gr_mpoly_init(poly, ctx);
}

static void arb4j_mpoly_clear(gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  gr_mpoly_clear(poly, ctx);
}

static int arb4j_mpoly_set(gr_mpoly_struct * dst, const gr_mpoly_struct * src, gr_ctx_struct * ctx)
{
  return gr_mpoly_set(dst, src, ctx);
}

static int arb4j_mpoly_set_si(gr_mpoly_struct * poly, long long value, gr_ctx_struct * ctx)
{
  return gr_mpoly_set_si(poly, value, ctx);
}

static int arb4j_mpoly_zero(gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  return gr_mpoly_zero(poly, ctx);
}

static int arb4j_mpoly_one(gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  return gr_mpoly_one(poly, ctx);
}

static int arb4j_mpoly_gen(gr_mpoly_struct * poly, slong var, gr_ctx_struct * ctx)
{
  return gr_mpoly_gen(poly, var, ctx);
}

static int arb4j_mpoly_is_zero(const gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  return (int) gr_mpoly_is_zero(poly, ctx);
}

static int arb4j_mpoly_is_one(const gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  return (int) gr_mpoly_is_one(poly, ctx);
}

static int arb4j_mpoly_is_gen(const gr_mpoly_struct * poly, slong var, gr_ctx_struct * ctx)
{
  return (int) gr_mpoly_is_gen(poly, var, ctx);
}

static int arb4j_mpoly_equal(const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx)
{
  return (int) gr_mpoly_equal(a, b, ctx);
}

static int arb4j_mpoly_add(gr_mpoly_struct * res, const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx)
{
  return gr_mpoly_add(res, a, b, ctx);
}

static int arb4j_mpoly_sub(gr_mpoly_struct * res, const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx)
{
  return gr_mpoly_sub(res, a, b, ctx);
}

static int arb4j_mpoly_mul(gr_mpoly_struct * res, const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx)
{
  return gr_mpoly_mul(res, a, b, ctx);
}

static int arb4j_mpoly_set_str(gr_mpoly_struct * poly, const char * str, gr_ctx_struct * ctx)
{
  return gr_set_str(poly, str, ctx);
}

static char * arb4j_mpoly_get_str(const gr_mpoly_struct * poly, gr_ctx_struct * ctx)
{
  char * flintString = NULL;
  char * result;
  if (gr_get_str(&flintString, poly, ctx) != GR_SUCCESS)
  {
    return NULL;
  }
  result = strdup(flintString);
  flint_free(flintString);
  return result;
}

static int arb4j_mpoly_set_coeff_si(gr_mpoly_struct * poly, long long coefficient, slong * exponents, gr_ctx_struct * ctx)
{
  return gr_mpoly_set_coeff_si_ui(poly, coefficient, (const ulong *) exponents, ctx);
}

static int arb4j_mpoly_set_coeff_real(gr_mpoly_struct * poly, const arb_struct * coefficient, slong * exponents, gr_ctx_struct * ctx)
{
  return gr_mpoly_set_coeff_scalar_ui(poly, (gr_srcptr) coefficient, (const ulong *) exponents, ctx);
}

static int arb4j_mpoly_set_coeff_complex(gr_mpoly_struct * poly, const acb_struct * coefficient, slong * exponents, gr_ctx_struct * ctx)
{
  return gr_mpoly_set_coeff_scalar_ui(poly, (gr_srcptr) coefficient, (const ulong *) exponents, ctx);
}

static int arb4j_mpoly_get_coeff_real(arb_struct * coefficient, const gr_mpoly_struct * poly, slong * exponents, gr_ctx_struct * ctx)
{
  return gr_mpoly_get_coeff_scalar_ui((gr_ptr) coefficient, poly, (const ulong *) exponents, ctx);
}

static int arb4j_mpoly_get_coeff_complex(acb_struct * coefficient, const gr_mpoly_struct * poly, slong * exponents, gr_ctx_struct * ctx)
{
  return gr_mpoly_get_coeff_scalar_ui((gr_ptr) coefficient, poly, (const ulong *) exponents, ctx);
}
%}

/* Map a Java String[] to a NULL-terminated const char** for the generator
 * name setter. */
%typemap(jni)    const char ** names "jobjectArray"
%typemap(jtype)  const char ** names "String[]"
%typemap(jstype) const char ** names "String[]"
%typemap(javain) const char ** names "$javainput"
%typemap(in)     const char ** names (jint nameCount)
{
  int i;
  nameCount = (*jenv)->GetArrayLength(jenv, $input);
  $1 = (char **) malloc((nameCount + 1) * sizeof(char *));
  for (i = 0; i < nameCount; i++)
  {
    jstring element = (jstring) (*jenv)->GetObjectArrayElement(jenv, $input, i);
    const char * utf = (*jenv)->GetStringUTFChars(jenv, element, 0);
    $1[i] = strdup(utf);
    (*jenv)->ReleaseStringUTFChars(jenv, element, utf);
    (*jenv)->DeleteLocalRef(jenv, element);
  }
  $1[nameCount] = NULL;
}
%typemap(freearg) const char ** names
{
  int i;
  if ($1)
  {
    for (i = 0; $1[i]; i++)
    {
      free($1[i]);
    }
    free($1);
  }
}

/* The returned C string is freshly strdup'd and must be released. */
%newobject arb4j_mpoly_get_str;

/* Wrap the two FLINT structs as properly named Java classes (never as opaque
 * SWIGTYPE_p_* handles). All members are hidden — these are handles whose
 * internals are managed entirely on the native side. */
%rename (GenericRing)                   gr_ctx_struct;
%rename (GenericMultivariatePolynomial) gr_mpoly_struct;

/* Hide every struct member: these are handles whose internals live entirely on
 * the native side, so no field accessors (and hence no SWIGTYPE_p_* helper
 * classes) are emitted. */
%rename("$ignore", %$isvariable) "";

typedef struct
{
  char          data[48];
  unsigned long which_ring;
  long          sizeof_elem;
  void *        methods;
  unsigned long size_limit;
}
gr_ctx_struct;

typedef struct
{
  void *          coeffData;
  unsigned long * exps;
  long            length;
  unsigned long   bits;
  long            coeffs_alloc;
  long            exps_alloc;
}
gr_mpoly_struct;

%rename("%s", %$isvariable) "";

/* SWIG-visible prototypes: these generate the arblib.arb4j_* JNI methods.
 * gr_ctx_struct maps to GenericRing and gr_mpoly_struct to
 * GenericMultivariatePolynomial. The slong* exponent parameters use the
 * global LongBuffer typemap declared in arb.i. */

gr_ctx_struct * arb4j_ctx_alloc(void);
void            arb4j_ctx_free(gr_ctx_struct * ctx);
void            arb4j_ctx_init_real(gr_ctx_struct * ctx, slong prec);
void            arb4j_ctx_init_complex(gr_ctx_struct * ctx, slong prec);
void            arb4j_ctx_clear(gr_ctx_struct * ctx);
void            arb4j_mpoly_ctx_init(gr_ctx_struct * ctx, gr_ctx_struct * base, slong nvars, int ord);
void            arb4j_mpoly_ctx_clear(gr_ctx_struct * ctx);
int             arb4j_mpoly_ctx_set_gen_names(gr_ctx_struct * ctx, const char ** names);

gr_mpoly_struct * arb4j_mpoly_alloc(void);
void              arb4j_mpoly_free(gr_mpoly_struct * poly);
void              arb4j_mpoly_init(gr_mpoly_struct * poly, gr_ctx_struct * ctx);
void              arb4j_mpoly_clear(gr_mpoly_struct * poly, gr_ctx_struct * ctx);
int               arb4j_mpoly_set(gr_mpoly_struct * dst, const gr_mpoly_struct * src, gr_ctx_struct * ctx);
int               arb4j_mpoly_set_si(gr_mpoly_struct * poly, long long value, gr_ctx_struct * ctx);
int               arb4j_mpoly_zero(gr_mpoly_struct * poly, gr_ctx_struct * ctx);
int               arb4j_mpoly_one(gr_mpoly_struct * poly, gr_ctx_struct * ctx);
int               arb4j_mpoly_gen(gr_mpoly_struct * poly, slong var, gr_ctx_struct * ctx);
int               arb4j_mpoly_is_zero(const gr_mpoly_struct * poly, gr_ctx_struct * ctx);
int               arb4j_mpoly_is_one(const gr_mpoly_struct * poly, gr_ctx_struct * ctx);
int               arb4j_mpoly_is_gen(const gr_mpoly_struct * poly, slong var, gr_ctx_struct * ctx);
int               arb4j_mpoly_equal(const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx);
int               arb4j_mpoly_add(gr_mpoly_struct * res, const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx);
int               arb4j_mpoly_sub(gr_mpoly_struct * res, const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx);
int               arb4j_mpoly_mul(gr_mpoly_struct * res, const gr_mpoly_struct * a, const gr_mpoly_struct * b, gr_ctx_struct * ctx);
int               arb4j_mpoly_set_str(gr_mpoly_struct * poly, const char * str, gr_ctx_struct * ctx);
char *            arb4j_mpoly_get_str(const gr_mpoly_struct * poly, gr_ctx_struct * ctx);
int               arb4j_mpoly_set_coeff_si(gr_mpoly_struct * poly, long long coefficient, slong * exponents, gr_ctx_struct * ctx);
int               arb4j_mpoly_set_coeff_real(gr_mpoly_struct * poly, const arb_struct * coefficient, slong * exponents, gr_ctx_struct * ctx);
int               arb4j_mpoly_set_coeff_complex(gr_mpoly_struct * poly, const acb_struct * coefficient, slong * exponents, gr_ctx_struct * ctx);
int               arb4j_mpoly_get_coeff_real(arb_struct * coefficient, const gr_mpoly_struct * poly, slong * exponents, gr_ctx_struct * ctx);
int               arb4j_mpoly_get_coeff_complex(acb_struct * coefficient, const gr_mpoly_struct * poly, slong * exponents, gr_ctx_struct * ctx);
