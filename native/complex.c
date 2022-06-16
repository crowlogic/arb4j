/**
 * Copyright ©2022 Stephen Crowley
 *
 * This file is part of Arb4j which is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License
 * (LGPL) as published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version. See *
 * <http://www.gnu.org/licenses/>.
 */
#ifndef SWIGJAVA
#define SWIGJAVA
#endif


/* -----------------------------------------------------------------------------
 *  This section contains generic SWIG labels for method/variable
 *  declarations/attributes, and other compiler dependent labels.
 * ----------------------------------------------------------------------------- */

/* template workaround for compilers that cannot correctly implement the C++ standard */
#ifndef SWIGTEMPLATEDISAMBIGUATOR
# if defined(__SUNPRO_CC) && (__SUNPRO_CC <= 0x560)
#  define SWIGTEMPLATEDISAMBIGUATOR template
# elif defined(__HP_aCC)
/* Needed even with `aCC -AA' when `aCC -V' reports HP ANSI C++ B3910B A.03.55 */
/* If we find a maximum version that requires this, the test would be __HP_aCC <= 35500 for A.03.55 */
#  define SWIGTEMPLATEDISAMBIGUATOR template
# else
#  define SWIGTEMPLATEDISAMBIGUATOR
# endif
#endif

/* inline attribute */
#ifndef SWIGINLINE
# if defined(__cplusplus) || (defined(__GNUC__) && !defined(__STRICT_ANSI__))
#   define SWIGINLINE inline
# else
#   define SWIGINLINE
# endif
#endif

/* attribute recognised by some compilers to avoid 'unused' warnings */
#ifndef SWIGUNUSED
# if defined(__GNUC__)
#   if !(defined(__cplusplus)) || (__GNUC__ > 3 || (__GNUC__ == 3 && __GNUC_MINOR__ >= 4))
#     define SWIGUNUSED __attribute__ ((__unused__))
#   else
#     define SWIGUNUSED
#   endif
# elif defined(__ICC)
#   define SWIGUNUSED __attribute__ ((__unused__))
# else
#   define SWIGUNUSED
# endif
#endif

#ifndef SWIG_MSC_UNSUPPRESS_4505
# if defined(_MSC_VER)
#   pragma warning(disable : 4505) /* unreferenced local function has been removed */
# endif
#endif

#ifndef SWIGUNUSEDPARM
# ifdef __cplusplus
#   define SWIGUNUSEDPARM(p)
# else
#   define SWIGUNUSEDPARM(p) p SWIGUNUSED
# endif
#endif

/* internal SWIG method */
#ifndef SWIGINTERN
# define SWIGINTERN static SWIGUNUSED
#endif

/* internal inline SWIG method */
#ifndef SWIGINTERNINLINE
# define SWIGINTERNINLINE SWIGINTERN SWIGINLINE
#endif

/* exporting methods */
#if defined(__GNUC__)
#  if (__GNUC__ >= 4) || (__GNUC__ == 3 && __GNUC_MINOR__ >= 4)
#    ifndef GCC_HASCLASSVISIBILITY
#      define GCC_HASCLASSVISIBILITY
#    endif
#  endif
#endif

#ifndef SWIGEXPORT
# if defined(_WIN32) || defined(__WIN32__) || defined(__CYGWIN__)
#   if defined(STATIC_LINKED)
#     define SWIGEXPORT
#   else
#     define SWIGEXPORT __declspec(dllexport)
#   endif
# else
#   if defined(__GNUC__) && defined(GCC_HASCLASSVISIBILITY)
#     define SWIGEXPORT __attribute__ ((visibility("default")))
#   else
#     define SWIGEXPORT
#   endif
# endif
#endif

/* calling conventions for Windows */
#ifndef SWIGSTDCALL
# if defined(_WIN32) || defined(__WIN32__) || defined(__CYGWIN__)
#   define SWIGSTDCALL __stdcall
# else
#   define SWIGSTDCALL
# endif
#endif

/* Deal with Microsoft's attempt at deprecating C standard runtime functions */
#if !defined(SWIG_NO_CRT_SECURE_NO_DEPRECATE) && defined(_MSC_VER) && !defined(_CRT_SECURE_NO_DEPRECATE)
# define _CRT_SECURE_NO_DEPRECATE
#endif

/* Deal with Microsoft's attempt at deprecating methods in the standard C++ library */
#if !defined(SWIG_NO_SCL_SECURE_NO_DEPRECATE) && defined(_MSC_VER) && !defined(_SCL_SECURE_NO_DEPRECATE)
# define _SCL_SECURE_NO_DEPRECATE
#endif

/* Deal with Apple's deprecated 'AssertMacros.h' from Carbon-framework */
#if defined(__APPLE__) && !defined(__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES)
# define __ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES 0
#endif

/* Intel's compiler complains if a variable which was never initialised is
 * cast to void, which is a common idiom which we use to indicate that we
 * are aware a variable isn't used.  So we just silence that warning.
 * See: https://github.com/swig/swig/issues/192 for more discussion.
 */
#ifdef __INTEL_COMPILER
# pragma warning disable 592
#endif


/* Fix for jlong on some versions of gcc on Windows */
#if defined(__GNUC__) && !defined(__INTEL_COMPILER)
  typedef long long __int64;
#endif

/* Fix for jlong on 64-bit x86 Solaris */
#if defined(__x86_64)
# ifdef _LP64
#   undef _LP64
# endif
#endif

#include <jni.h>
#include <stdlib.h>
#include <string.h>

/* Support for throwing Java exceptions */
typedef enum {
  SWIG_JavaOutOfMemoryError = 1,
  SWIG_JavaIOException,
  SWIG_JavaRuntimeException,
  SWIG_JavaIndexOutOfBoundsException,
  SWIG_JavaArithmeticException,
  SWIG_JavaIllegalArgumentException,
  SWIG_JavaNullPointerException,
  SWIG_JavaDirectorPureVirtual,
  SWIG_JavaUnknownError,
  SWIG_JavaIllegalStateException,
} SWIG_JavaExceptionCodes;

typedef struct {
  SWIG_JavaExceptionCodes code;
  const char *java_exception;
} SWIG_JavaExceptions_t;


/* Contract support */

#define SWIG_contract_assert(nullreturn, expr, msg) if (!(expr)) {SWIG_JavaThrowException(jenv, SWIG_JavaIllegalArgumentException, msg); return nullreturn; } else



#include <flint/fmpz.h>
#include <mpfr.h>
#include <flint/flint.h>
#include <arf.h>
#include <arb.h>
#include <acb.h>
#include <acb_calc.h>
#include <acb_elliptic.h>
#include <acb_poly.h>
#include <acb_dirichlet.h>
#include <dirichlet.h>
#include <acb_modular.h>

#include "color.h"
#ifndef size_t
#define size_t long unsigned int
#endif

extern JNIEnv* env;

jlong bufferAddress(jobject buffer)
{
  return (jlong)(*env)->GetDirectBufferAddress(env,buffer);
}

int
f_lemniscate(acb_ptr res, const acb_t z, void * param, slong order, slong prec)
{
       if (order > 1)
             flint_abort();  /* Would be needed for Taylor method. */

       //res=(√2*I*Cos[t])/(I + Sin[t])
       acb_t a,numerator,divisor;
       acb_init(a);
       acb_init(numerator);
       acb_init(divisor);

       acb_cos(a,z,prec);
       acb_mul_si(numerator, a, 2, prec);
       acb_sin(a,z,prec);
       acb_mul_onei(divisor, a);
       acb_neg(divisor,divisor);
       acb_add_ui(divisor,divisor,1,prec);
       acb_div(res,numerator,divisor,prec);

       acb_clear(a);
       acb_clear(numerator);
       acb_clear(divisor);

       return 0;
}


int
f_lemniscate_derivative(acb_ptr res, const acb_t z, void * param, slong order, slong prec)
{
  // numerator=2*(Sin[z]-I)
  // denominator=(Sin[z]+I)^2
  acb_t a,numerator,denominator;
  acb_init(a);
  acb_init(numerator);
  acb_init(denominator);
  acb_sin(a,z,prec);
  acb_set(numerator,a);
  arb_sub_ui(acb_imagref(numerator), acb_imagref(numerator), 1, prec);
  acb_mul_ui(numerator, numerator, 2, prec );
  acb_set(denominator,a);
  arb_add_ui(acb_imagref(denominator), acb_imagref(denominator), 1, prec);
  acb_pow_ui(denominator, denominator, 2, prec);
  acb_div( res, numerator, denominator, prec );
  acb_clear(a);
  acb_clear(numerator);
  acb_clear(denominator);
  return 0;
}

int
f_lemniscate_derivative_abs(acb_ptr res, const acb_t z, void * param, slong order, slong prec)
{
  int status = f_lemniscate_derivative(res,z,param,order,prec);
  if ( status == 0 )
  {
    acb_abs(acb_realref(res), res, prec);
    arb_zero(acb_imagref(res));
  }
  return status;
}

#ifdef __cplusplus
extern "C" {
#endif

SWIGEXPORT void JNICALL Java_arblib_arblibJNI_Complex_1real_1set(JNIEnv *jenv, jclass jcls, jlong jarg1, jobject jarg1_, jlong jarg2, jobject jarg2_) {
  acb_struct *arg1 = (acb_struct *) 0 ;
  arb_struct *arg2 = (arb_struct *) 0 ;

  (void)jenv;
  (void)jcls;
  (void)jarg1_;
  (void)jarg2_;
  arg1 = *(acb_struct **)&jarg1;
  arg2 = *(arb_struct **)&jarg2;
  if (arg1) (arg1)->real = *arg2;
}


SWIGEXPORT jlong JNICALL Java_arblib_arblibJNI_Complex_1real_1get(JNIEnv *jenv, jclass jcls, jlong jarg1, jobject jarg1_) {
  jlong jresult = 0 ;
  acb_struct *arg1 = (acb_struct *) 0 ;
  arb_struct *result = 0 ;

  (void)jenv;
  (void)jcls;
  (void)jarg1_;
  arg1 = *(acb_struct **)&jarg1;
  result = (arb_struct *)& ((arg1)->real);
  *(arb_struct **)&jresult = result;
  return jresult;
}


SWIGEXPORT void JNICALL Java_arblib_arblibJNI_Complex_1imag_1set(JNIEnv *jenv, jclass jcls, jlong jarg1, jobject jarg1_, jlong jarg2, jobject jarg2_) {
  acb_struct *arg1 = (acb_struct *) 0 ;
  arb_struct *arg2 = (arb_struct *) 0 ;

  (void)jenv;
  (void)jcls;
  (void)jarg1_;
  (void)jarg2_;
  arg1 = *(acb_struct **)&jarg1;
  arg2 = *(arb_struct **)&jarg2;
  if (arg1) (arg1)->imag = *arg2;
}


#ifdef __cplusplus
}
#endif

